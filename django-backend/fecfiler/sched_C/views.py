from django.shortcuts import render
import datetime
import json
import logging
import os
from decimal import Decimal

import requests
from django.conf import settings
from django.db import connection
from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from fecfiler.core.views import (NoOPError, check_null_value, check_report_id,
                                 date_format, delete_entities, get_entities,
                                 post_entities, put_entities, remove_entities,
                                 undo_delete_entities)
from fecfiler.sched_A.views import (get_next_transaction_id, 
                                    get_list_child_schedA,
                                    post_schedA)
from fecfiler.sched_D.views import do_transaction
from fecfiler.sched_B.views import get_list_child_schedB, post_schedB
from fecfiler.core.transaction_util import (
    get_line_number_trans_type,
    get_sched_c1_child_transactions,
    get_sched_c2_child_transactions,
    get_sched_c2_child,
    get_sched_c1_child,
)

# Create your views here.
logger = logging.getLogger(__name__)

# TODO: need to back_ref_transaction_id for c1 and c2
# both pointing to a sched_c item - need to code to enforce this after the db update is done
MANDATORY_FIELDS_SCHED_C2 = ['cmte_id', 'report_id', 'transaction_id']
MANDATORY_FIELDS_SCHED_C1 = [
    'cmte_id', 
    'report_id',
    'transaction_type_identifier', 
    'transaction_id'
    ]
MANDATORY_FIELDS_SCHED_C = [
    'cmte_id', 
    'report_id',
    'transaction_type_identifier', 
    'transaction_id',
    ]

API_CALL_SC = {'api_call':'/sc/schedC'}
API_CALL_SA = {'api_call':'/sa/schedA'}
API_CALL_SB = {'api_call':'/sb/schedB'}
API_CALL_SC1 = {'api_call':'/sc/schedC1'}
API_CALL_SC2 = {'api_call':'/sc/schedC2'}
# need to generate auto sched_a items when a loan is made by a committee
AUTO_SCHED_A_MAP = { 
    'LOAN_FROM_IND' : 'LOAN_FROM_IND_REC',
    'LOAN_FROM_BANK' : 'LOAN_FROM_BANK_REC',
    }

# need to generate auto sched_b item when 
AUTO_SCHED_B_MAP = {
    'LOAN_OWN_TO_CMTE' : 'LOAN_OWN_TO_CMTE_OUT',
}

def check_transaction_id(transaction_id):
    if not (transaction_id[0:2] == "SC"):
        raise Exception(
            'The Transaction ID: {} is not in the specified format.' +
            'Transaction IDs start with SD characters'.format(transaction_id))
    return transaction_id


def check_mandatory_fields_SC(data):
    """
    validate mandatory fields for sched_c item
    """
    try:
        errors = []
        for field in MANDATORY_FIELDS_SCHED_C:
            if not(field in data and check_null_value(data.get(field))):
                errors.append(field)
        if errors:
            raise Exception(
                'The following mandatory fields are required in order to save data to schedA table: {}'.format(','.join(errors)))
    except:
        raise


def schedC_sql_dict(data):
    """
    filter out valid fileds for sched_c
    """
    valid_fields = [
            # 'line_number',
            # 'transaction_type',
            'transaction_type_identifier',
            'entity_id',
            'election_code',
            'election_other_description',
            'loan_amount_original',
            'loan_payment_to_date',
            'loan_balance',
            'loan_incurred_date',
            'loan_due_date',
            'loan_intrest_rate',
            'is_loan_secured',
            'is_personal_funds',
            'lender_cmte_id',
            'lender_cand_id',
            'lender_cand_last_name',
            'lender_cand_first_name',
            'lender_cand_middle_name',
            'lender_cand_prefix',
            'lender_cand_suffix',
            'lender_cand_office',
            'lender_cand_state',
            'lender_cand_district',
            'memo_code',
            'memo_text',
            'entity_type',   # entity data after this line 
            'entity_name', 
            'first_name', 
            'last_name', 
            'middle_name',
            'preffix', 
            'suffix', 
            'street_1', 
            'street_2', 
            'city', 
            'state', 
            'zip_code', 
            'occupation', 
            'employer', 
            'ref_cand_cmte_id',
            'cand_office',
            'cand_office_state',
            'cand_office_district',
            'cand_election_year',
    ]
    try:
        datum =  { k: v for k, v in data.items() if k in valid_fields }
        # TODO: disable this line for now and wait for db update
        datum['line_number'], datum['transaction_type'] = get_line_number_trans_type(
            data.get('transaction_type_identifier'))
        datum['transaction_type'] = ''

        #no need to have dummy data   
        # datum['line_number'] = 'DUMMY'
        # datum['transaction_type'] = 'DUMMY'
        
        return datum

    except:
        raise Exception('invalid request data.')


def put_schedC(data):
    """
    update sched_c item
    here we are assuming entity_id are always referencing something already in our DB
    """
    try:
        check_mandatory_fields_SC(data)
        # save entity first
        if 'entity_id' in data:
            get_data = {
                'cmte_id': data.get('cmte_id'),
                'entity_id': data.get('entity_id')
            }

            # need this update for FEC entity
            if get_data['entity_id'].startswith('FEC'):
                get_data['cmte_id'] = 'C00000000'
            old_entity = get_entities(get_data)[0]
            new_entity = put_entities(data)
            rollback_flag = True
        else:
            new_entity = post_entities(data)
            rollback_flag = False

        # continue to save transaction
        entity_id = new_entity.get('entity_id')
        # print('post_scheda {}'.format(entity_id))
        data['entity_id'] = entity_id

        #save entity first

        #check_transaction_id(data.get('transaction_id'))
        try:
            # rollback_data = get_schedC(data)
            put_sql_schedC(data)

        except Exception as e:
            # rollback entity data
                        # remove entiteis if saving sched_a fails
            if rollback_flag:
                entity_data = put_entities(old_entity)
            else:
                get_data = {
                    'cmte_id': data.get('cmte_id'),
                    'entity_id': entity_id
                }
                remove_entities(get_data)
            # put_sql_schedC(rollback_data)
            raise Exception(
                'The put_sql_schedC function is throwing an error: ' + str(e))
        return data
    except:
        raise


def put_sql_schedC(data):
    """
    uopdate a schedule_c item
    """
    _sql = """UPDATE public.sched_c
              SET transaction_type = %s,
                  transaction_type_identifier = %s,
                  entity_id = %s,
                  election_code = %s,
                  election_other_description = %s,
                  loan_amount_original = %s,
                  loan_payment_to_date = %s,
                  loan_balance = %s,
                  loan_incurred_date = %s,
                  loan_due_date = %s,
                  loan_intrest_rate = %s,
                  is_loan_secured = %s,
                  is_personal_funds = %s,
                  lender_cmte_id = %s,
                  lender_cand_id = %s,
                  lender_cand_last_name = %s,
                  lender_cand_first_name = %s,
                  lender_cand_middle_name = %s,
                  lender_cand_prefix = %s,
                  lender_cand_suffix = %s,
                  lender_cand_office = %s,
                  lender_cand_state = %s,
                  lender_cand_district = %s,
                  memo_code = %s,
                  memo_text = %s,
                  last_update_date = %s
              WHERE transaction_id = %s AND report_id = %s AND cmte_id = %s 
              AND delete_ind is distinct from 'Y';
        """
    _v = (
            data.get('transaction_type'),
            data.get('transaction_type_identifier'),
            data.get('entity_id'),
            data.get('election_code'),
            data.get('election_other_description'),
            data.get('loan_amount_original'),
            data.get('loan_payment_to_date'),
            data.get('loan_balance'), #adding loan_balance as loan_amount_original
            data.get('loan_incurred_date'),
            data.get('loan_due_date'), 
            data.get('loan_intrest_rate'),
            data.get('is_loan_secured'),
            data.get('is_personal_funds'),
            data.get('lender_cmte_id'),
            data.get('lender_cand_id'),
            data.get('lender_cand_last_name'),
            data.get('lender_cand_first_name'),
            data.get('lender_cand_middle_name'),
            data.get('lender_cand_prefix'),
            data.get('lender_cand_suffix'),
            data.get('lender_cand_office'),
            data.get('lender_cand_state'),
            data.get('lender_cand_district'),
            data.get('memo_code'),
            data.get('memo_text'),
            datetime.datetime.now(),
            data.get('transaction_id'),
            data.get('report_id'),
            data.get('cmte_id'),
          )
    do_transaction(_sql, _v)


def validate_sc_data(data):
    """
    validate sc json data
    """
    check_mandatory_fields_SC(data)
    # check_data_types(data)

def auto_generate_sched_a(data):
    """
    auto generate a sched_a transaction when a loan is made:
    1. need to check the auto_map
    2. map the fields from sched_c to sched_a
    3. create a sched_a and make it a child of sched_c( fill in back_ref fields)

    Q1: do we need to update the aggregate_amt and update line_number
    """
    logger.debug('auto_generate_sched_a with data:{}'.format(data))
    field_mapper = {
        "contribution_date" : "loan_incurred_date",
        "contribution_amount" : "loan_amount_original",
    }
    # set up parent
    data['back_ref_transaction_id'] = data['transaction_id']
    # get a new sched_a id
    
    data['transaction_id'] = get_next_transaction_id('SA')
    # fill in purpose - hardcoded - TODO: confirm on this
    data['purpose_description'] = 'Loan received: {}'.format(
        data.get('transaction_type_identifier')
        )
    # update transaction type and line num
    data['transaction_type_identifier'] = AUTO_SCHED_A_MAP.get(
        data['transaction_type_identifier']
        )
    # TODO: will enable this when db update done
    # data['line_number'], data['transaction_type'] = get_line_number_trans_type(
    #     data.get('transaction_type_identifier')
    #     )
    for _f in field_mapper:
        data[_f] = data.get(field_mapper.get(_f))
    # TODO: not sure we need to return child data or not
    logger.debug('save a auto sched_a item with loan data:{}'.format(data))
    post_schedA(data)

def auto_generate_sched_b(data):
    """
    auto generate a sched_b transaction when a loan is made:
    1. need to check the auto_map
    2. map the fields from sched_c to sched_b
    3. create a sched_b and make it a child of sched_c( fill in back_ref fields)
    """
    logger.debug('auto_generate_sched_b with data:{}'.format(data))
    field_mapper = {
        "expenditure_date" : "loan_incurred_date",
        "expenditure_amount" : "loan_amount_original",
    }
    # set up parent
    data['back_ref_transaction_id'] = data['transaction_id']
    # get a new sched_a id
    
    data['transaction_id'] = get_next_transaction_id('SB')
    # fill in purpose - hardcoded - TODO: confirm on this
    data['expenditure_purpose'] = 'Loan out: {}'.format(
        data.get('transaction_type_identifier')
        )
    # update transaction type and line num
    data['transaction_type_identifier'] = AUTO_SCHED_A_MAP.get(
        data['transaction_type_identifier']
        )
    # TODO: will enable this when db update done
    # data['line_number'], data['transaction_type'] = get_line_number_trans_type(
    #     data.get('transaction_type_identifier')
    #     )
    for _f in field_mapper:
        data[_f] = data.get(field_mapper.get(_f))
    # TODO: not sure we need to return child data or not
    logger.debug('save a auto sched_a item with loan data:{}'.format(data))
    post_schedB(data)

def remove_sql_schedC(transaction_id, report_id, cmte_id):
    """
    sql and db access for removing sched_c item
    """
    try:
        with connection.cursor() as cursor:

            # UPDATE delete_ind flag on a single row from Sched_A table
            cursor.execute("""
            DELETE FROM public.sched_c 
            WHERE transaction_id = %s 
            AND report_id = %s 
            AND cmte_id = %s""", 
            [transaction_id, report_id, cmte_id])
            if (cursor.rowcount == 0):
                raise Exception(
                    """The Transaction ID: {} is either already deleted
                    or does not exist in schedC table""".format(transaction_id))
    except Exception:
        raise


def remove_schedC(data):
    """
    helper function for removing a sched_c item
    """
    try:
        cmte_id = data.get('cmte_id')
        report_id = data.get('report_id')
        transaction_id = check_transaction_id(data.get('transaction_id'))
        remove_sql_schedC(transaction_id, report_id, cmte_id)
    except:
        raise

def post_schedC(data):
    """
    function for handling POST request for sc, need to:
    1. save entity
    1. generatye new transaction_id
    2. validate data
    3. save sched_c
    4. generate child transaction if necessary
    5. if fails, do clean up: rollback saved data
    """
    try:
        # save entity first
        if 'entity_id' in data:
            get_data = {
                'cmte_id': data.get('cmte_id'),
                'entity_id': data.get('entity_id')
            }

            # need this update for FEC entity
            if get_data['entity_id'].startswith('FEC'):
                get_data['cmte_id'] = 'C00000000'
            old_entity = get_entities(get_data)[0]
            new_entity = put_entities(data)
            rollback_flag = True
        else:
            new_entity = post_entities(data)
            rollback_flag = False

        # continue to save transaction
        entity_id = new_entity.get('entity_id')
        # print('post_scheda {}'.format(entity_id))
        data['entity_id'] = entity_id
        new_transaction_id = get_next_transaction_id('SC')
        data['transaction_id'] = new_transaction_id
        # TODO: this is a temp change for new loan only. need further discussion
        # data['loan_balance'] = data['loan_amount_original']
        logger.info('validating sched_c request data...')
        validate_sc_data(data)
        try:
            logger.info('saving sched_c item...')
            post_sql_schedC(data)
            try:
                if data['transaction_type_identifier'] in AUTO_SCHED_A_MAP:
                    logger.info('auto-generating a sched_a transaction...')
                    auto_generate_sched_a(data)
                if data['transaction_type_identifier'] in AUTO_SCHED_B_MAP:
                    logger.info('auto-generating a sched_b transaction...')
                    auto_generate_sched_b(data)
            except Exception as e:
                # remove sched_a if autogeneration fails
                remove_schedC(data)
                raise Exception('auto generation failed on sched C: ' + str(e))
        except Exception as e:
            # remove entiteis if saving sched_a fails
            if rollback_flag:
                entity_data = put_entities(old_entity)
            else:
                get_data = {
                    'cmte_id': data.get('cmte_id'),
                    'entity_id': entity_id
                }
                remove_entities(get_data)
            raise Exception(
                'The post_sql_schedC function is throwing an error: ' + str(e))
        # reset data transaction_id, it will be used loading the data again
        data['transaction_id'] = new_transaction_id
        # return get_schedC(data)
        return data
    except:
        raise

def post_sql_schedC(data):
    """
    db transaction for creating new sched_c item
    """
    logger.debug('post_sql_schedC with data:{}'.format(data))
    try:
        _sql = """
        INSERT INTO public.sched_c (
            cmte_id,
            report_id,
            line_number,
            transaction_type,
            transaction_type_identifier,
            transaction_id,
            entity_id,
            election_code,
            election_other_description,
            loan_amount_original,
            loan_payment_to_date,
            loan_balance,
            loan_incurred_date,
            loan_due_date,
            loan_intrest_rate,
            is_loan_secured,
            is_personal_funds,
            lender_cmte_id,
            lender_cand_id,
            lender_cand_last_name,
            lender_cand_first_name,
            lender_cand_middle_name,
            lender_cand_prefix,
            lender_cand_suffix,
            lender_cand_office,
            lender_cand_state,
            lender_cand_district,
            memo_code,
            memo_text,
            create_date)
            VALUES({});
            """.format(','.join(['%s']*30))
        logger.debug('sql:{}'.format(_sql))

        _v = (
            data.get('cmte_id'),
            data.get('report_id'),
            data.get('line_number'),
            data.get('transaction_type'),
            data.get('transaction_type_identifier'),
            data.get('transaction_id'),
            data.get('entity_id'),
            data.get('election_code'),
            data.get('election_other_description'),
            data.get('loan_amount_original'),
            data.get('loan_payment_to_date'),
            data.get('loan_balance'),
            data.get('loan_incurred_date'),
            data.get('loan_due_date'),
            data.get('loan_intrest_rate'),
            data.get('is_loan_secured'),
            data.get('is_personal_funds'),
            data.get('lender_cmte_id'),
            data.get('lender_cand_id'),
            data.get('lender_cand_last_name'),
            data.get('lender_cand_first_name'),
            data.get('lender_cand_middle_name'),
            data.get('lender_cand_prefix'),
            data.get('lender_cand_suffix'),
            data.get('lender_cand_office'),
            data.get('lender_cand_state'),
            data.get('lender_cand_district'),
            data.get('memo_code'),
            data.get('memo_text'),
            datetime.datetime.now()
        )
        logger.debug('values:{}'.format(_v))
        with connection.cursor() as cursor:
            # Insert data into schedD table
            cursor.execute(_sql, _v)
    except Exception:
        raise


def get_schedC(data):
    """
    load sched_c data based on cmte_id, report_id and transaction_id
    """
    try:
        cmte_id = data.get('cmte_id')
        report_id = data.get('report_id')
        if 'transaction_id' in data:
            transaction_id = check_transaction_id(data.get('transaction_id'))
            forms_obj = get_list_schedC(report_id, cmte_id, transaction_id)
            logger.debug('getting all sched_a childs...')
            childA_forms_obj = get_list_child_schedA(
                report_id, cmte_id, transaction_id)
            for obj in childA_forms_obj:
                obj.update(API_CALL_SA)
            logger.debug('getting all sched_b childs...')
            childB_forms_obj = get_list_child_schedB(
                report_id, cmte_id, transaction_id)
            for obj in childB_forms_obj:
                obj.update(API_CALL_SB)
            logger.debug('getting all sched_c1 childs...')
            childC1_forms_obj = get_sched_c1_child_transactions(
                report_id, cmte_id, transaction_id)
            # print(childC1_forms_obj)
            for obj in childC1_forms_obj:
                obj.update(API_CALL_SC1)
            logger.debug('getting all sched_c2 childs...')
            childC2_forms_obj = get_sched_c2_child_transactions(
                report_id, cmte_id, transaction_id)
            # print(childC2_forms_obj)
            for obj in childC2_forms_obj:
                obj.update(API_CALL_SC2)

            child_forms_obj = (
                childA_forms_obj + 
                childB_forms_obj + 
                childC1_forms_obj + 
                childC2_forms_obj
                )
            # for obj in childB_forms_obj:
            #     obj.update({'api_call':''})
            if len(child_forms_obj) > 0:
                forms_obj[0]['child'] = child_forms_obj
        else:
            forms_obj = get_list_all_schedC(report_id, cmte_id)
        return forms_obj
    except:
        raise


def get_list_all_schedC(report_id, cmte_id):

    try:
        with connection.cursor() as cursor:
            # GET single row from schedA table
            _sql = """SELECT json_agg(t) FROM ( SELECT
            cmte_id,
            report_id,
            line_number,
            transaction_type,
            transaction_type_identifier,
            transaction_id,
            entity_id,
            election_code,
            election_other_description,
            loan_amount_original,
            loan_payment_to_date,
            loan_balance,
            loan_incurred_date,
            loan_due_date,
            loan_intrest_rate,
            is_loan_secured,
            is_personal_funds,
            lender_cmte_id,
            lender_cand_id,
            lender_cand_last_name,
            lender_cand_first_name,
            lender_cand_middle_name,
            lender_cand_prefix,
            lender_cand_suffix,
            lender_cand_office,
            lender_cand_state,
            lender_cand_district,
            memo_code,
            memo_text,
            last_update_date
            FROM public.sched_c
            WHERE report_id = %s AND cmte_id = %s
            AND delete_ind is distinct from 'Y') t
            """
            cursor.execute(_sql, (report_id, cmte_id))
            schedC_list = cursor.fetchone()[0]
            if schedC_list is None:
                raise NoOPError('No sched_c1 transaction found for report_id {} and cmte_id: {}'.format(
                    report_id, cmte_id))
            merged_list = []
            for item in schedC_list:
                entity_id = item.get("entity_id")
                data = {"entity_id": entity_id, "cmte_id": cmte_id}
                entity_list = get_entities(data)
                dictEntity = entity_list[0]
                # cand_entity = {}
                # if item.get("beneficiary_cand_entity_id"):
                #     cand_data = {
                #         "entity_id": item.get("beneficiary_cand_entity_id"),
                #         "cmte_id": cmte_id,
                #     }
                #     cand_entity = get_entities(cand_data)[0]
                #     cand_entity = candify_it(cand_entity)

                merged_dict = {**item, **dictEntity}
                merged_list.append(merged_dict)
                # merged_list.append(dictC2)
        return merged_list
    except Exception:
        raise


def get_list_schedC(report_id, cmte_id, transaction_id):
    """
    note: we are not loading loans based on report_id as loan
    is not tied to report id for reporting purpose
    """

    try:
        with connection.cursor() as cursor:
            # GET single row from schedA table
            _sql = """SELECT json_agg(t) FROM ( SELECT
            cmte_id,
            report_id,
            line_number,
            transaction_type,
            transaction_type_identifier,
            transaction_id,
            entity_id,
            election_code,
            election_other_description,
            loan_amount_original,
            loan_payment_to_date,
            loan_balance,
            loan_incurred_date,
            loan_due_date,
            loan_intrest_rate,
            is_loan_secured,
            is_personal_funds,
            lender_cmte_id,
            lender_cand_id,
            lender_cand_last_name,
            lender_cand_first_name,
            lender_cand_middle_name,
            lender_cand_prefix,
            lender_cand_suffix,
            lender_cand_office,
            lender_cand_state,
            lender_cand_district,
            memo_code,
            memo_text,
            last_update_date
            FROM public.sched_c
            WHERE cmte_id = %s AND transaction_id = %s
            AND delete_ind is distinct from 'Y') t
            """
            cursor.execute(_sql, (cmte_id, transaction_id))
            schedC_list = cursor.fetchone()[0]
            if schedC_list is None:
                raise NoOPError('No sched_c transaction found for transaction_id {}'.format(
                    transaction_id))
            merged_list = []
            for item in schedC_list:
                entity_id = item.get("entity_id")
                data = {"entity_id": entity_id, "cmte_id": cmte_id}
                entity_list = get_entities(data)
                dictEntity = entity_list[0]
                # cand_entity = {}
                # if item.get("beneficiary_cand_entity_id"):
                #     cand_data = {
                #         "entity_id": item.get("beneficiary_cand_entity_id"),
                #         "cmte_id": cmte_id,
                #     }
                #     cand_entity = get_entities(cand_data)[0]
                #     cand_entity = candify_it(cand_entity)
                merged_dict = {**item, **dictEntity}
                merged_list.append(merged_dict)
                # merged_list.append(dictC)
        return merged_list
    except Exception:
        raise


def delete_schedC(data):
    """
    function for handling delete request for sc
    """
    try:
        # check_mandatory_fields_SC2(data)
        delete_sql_schedC(data.get('cmte_id'), data.get(
            'report_id'), data.get('transaction_id'))
    except Exception as e:
        raise


def delete_sql_schedC(cmte_id, report_id, transaction_id):
    """
    do delete sql transaction
    """
    _sql = """UPDATE public.sched_c
            SET delete_ind = 'Y' 
            WHERE transaction_id = %s AND report_id = %s AND cmte_id = %s
        """
    _v = (transaction_id, report_id, cmte_id)
    do_transaction(_sql, _v)


@api_view(['POST', 'GET', 'DELETE', 'PUT'])
def schedC(request):
    """
    sched_c1 api supporting POST, GET, DELETE, PUT
    """

    print("request obj =", request)

    # create new sched_c1 transaction
    if request.method == 'POST':
        logger.debug('POST request received.')
        try:
            cmte_id = request.user.username
            if not('report_id' in request.data):
                raise Exception('Missing Input: Report_id is mandatory')
            # handling null,none value of report_id
            if not (check_null_value(request.data.get('report_id'))):
                report_id = "0"
            else:
                report_id = check_report_id(request.data.get('report_id'))
            # end of handling
            datum = schedC_sql_dict(request.data)
            datum['report_id'] = report_id
            datum['cmte_id'] = cmte_id
            logger.debug('data before saving to db:{}'.format(datum))
            if 'transaction_id' in request.data and check_null_value(
                    request.data.get('transaction_id')):
                datum['transaction_id'] = check_transaction_id(
                    request.data.get('transaction_id'))
                data = put_schedC(datum)
            else:
                # print(datum)
                data = post_schedC(datum)
            # Associating child transactions to parent and storing them to DB

            output = get_schedC(data)
            return JsonResponse(output[0], status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response("The schedC API - POST is throwing an exception: "
                            + str(e), status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'GET':
        try:
            data = {
                'cmte_id': request.user.username
            }
            if 'report_id' in request.query_params and check_null_value(request.query_params.get('report_id')):
                data['report_id'] = check_report_id(
                    request.query_params.get('report_id'))
            else:
                raise Exception('Missing Input: report_id is mandatory')
            if 'transaction_id' in request.query_params and check_null_value(request.query_params.get('transaction_id')):
                data['transaction_id'] = check_transaction_id(
                    request.query_params.get('transaction_id'))
            datum = get_schedC(data)
            return JsonResponse(datum, status=status.HTTP_200_OK, safe=False)
        except NoOPError as e:
            logger.debug(e)
            forms_obj = []
            return JsonResponse(forms_obj, status=status.HTTP_204_NO_CONTENT, safe=False)
        except Exception as e:
            logger.debug(e)
            return Response("The schedC API - GET is throwing an error: " + str(e), status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        try:
            data = {
                'cmte_id': request.user.username
            }
            if 'report_id' in request.data and check_null_value(request.data.get('report_id')):
                data['report_id'] = check_report_id(
                    request.data.get('report_id'))
            else:
                raise Exception('Missing Input: report_id is mandatory')
            if 'transaction_id' in request.data and check_null_value(request.data.get('transaction_id')):
                data['transaction_id'] = check_transaction_id(
                    request.data.get('transaction_id'))
            else:
                raise Exception('Missing Input: transaction_id is mandatory')
            delete_schedC(data)
            return Response("The Transaction ID: {} has been successfully deleted".format(data.get('transaction_id')), status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response("The schedC API - DELETE is throwing an error: " + str(e), status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'PUT':
        try:
            datum = schedC_sql_dict(request.data)
            if 'transaction_id' in request.data and check_null_value(request.data.get('transaction_id')):
                datum['transaction_id'] = request.data.get('transaction_id')
            else:
                raise Exception('Missing Input: transaction_id is mandatory')

            if not('report_id' in request.data):
                raise Exception('Missing Input: Report_id is mandatory')
            # handling null,none value of report_id
            if not (check_null_value(request.data.get('report_id'))):
                report_id = "0"
            else:
                report_id = check_report_id(request.data.get('report_id'))
            # end of handling
            datum['report_id'] = report_id
            datum['cmte_id'] = request.user.username

            # if 'entity_id' in request.data and check_null_value(request.data.get('entity_id')):
            #     datum['entity_id'] = request.data.get('entity_id')
            # if request.data.get('transaction_type') in CHILD_SCHED_B_TYPES:
            #     data = put_schedB(datum)
            #     output = get_schedB(data)
            # else:
            data = put_schedC(datum)
            # output = get_schedA(data)
            return JsonResponse(data, status=status.HTTP_201_CREATED)
        except Exception as e:
            logger.debug(e)
            return Response("The schedC API - PUT is throwing an error: " + str(e), status=status.HTTP_400_BAD_REQUEST)

    else:
        raise NotImplementedError


@api_view(['GET'])
def get_outstanding_loans(request):
    """
    Get all loans with an outstanding balance
    this api is used to enable the sched_c summary page
    need to return:
    1. name/bank (this is the entity name)
    2. original loan
    3. cumulative payemnt to date
    4. outstanding balance
    5. due date
    adding transaction_types to get transaction_type specific loans
    valid ransction_type values:
    LOANS_OWED_BY_CMTE
    LOANS_OWED_TO_CMTE
    """
    valid_transaction_types = [
        'LOANS_OWED_BY_CMTE',
        'LOANS_OWED_TO_CMTE',
    ]
    logger.debug('POST request received.')
    try:
        cmte_id = request.user.username
        if 'transaction_type_identifier' in request.query_params:
            tran_type = request.query_params.get('transaction_type_identifier')
            if not tran_type in valid_transaction_types: 
                raise Exception('Error: invalid transaction types.')
            _sql = """
                SELECT Json_agg(t) 
                FROM   (SELECT 
                            e.entity_name,
                            e.entity_type, 
                            e.last_name,
                            e.first_name,
                            e.middle_name,
                            e.preffix,
                            e.suffix, 
                            c.transaction_id,
                            c.loan_amount_original, 
                            c.loan_payment_to_date, 
                            c.loan_balance, 
                            c.loan_due_date,
                            c.transaction_type_identifier 
                        FROM   public.sched_c c, 
                            public.entity e 
                        WHERE c.cmte_id = %s
                        AND c.transaction_type_identifier = %s
                        AND c.entity_id = e.entity_id 
                        AND c.loan_balance > 0
                        ) t
            """
            with connection.cursor() as cursor:
                cursor.execute(_sql, [cmte_id, tran_type])
                json_result = cursor.fetchone()[0] 
            
        else:
            _sql = """
                SELECT Json_agg(t) 
                    FROM   (SELECT 
                                e.entity_name,
                                e.entity_type, 
                                e.last_name,
                                e.first_name,
                                e.middle_name,
                                e.preffix,
                                e.suffix, 
                                c.transaction_id,
                                c.loan_amount_original, 
                                c.loan_payment_to_date, 
                                c.loan_balance, 
                                c.loan_due_date,
                                c.transaction_type_identifier
                            FROM   public.sched_c c, 
                                public.entity e 
                            WHERE c.cmte_id = %s
                            AND c.entity_id = e.entity_id 
                            AND c.loan_balance > 0
                            ) t
                """
            with connection.cursor() as cursor:
                cursor.execute(_sql, [cmte_id])
                json_result = cursor.fetchone()[0] 

        if not json_result:
            return Response([], status=status.HTTP_200_OK)
        else:
            for tran in json_result:
                transaction_id = tran.get('transaction_id')
                childC1_forms_obj = get_sched_c1_child(
                    cmte_id, transaction_id)
                # print(childC1_forms_obj)
                for obj in childC1_forms_obj:
                    obj.update(API_CALL_SC1)
                logger.debug('getting all sched_c2 childs...')
                childC2_forms_obj = get_sched_c2_child(
                    cmte_id, transaction_id)
                # print(childC2_forms_obj)
                for obj in childC2_forms_obj:
                    obj.update(API_CALL_SC2)
                child_tran = childC1_forms_obj + childC2_forms_obj
                if child_tran:
                    tran['child'] = child_tran
            return Response(json_result, status=status.HTTP_200_OK)

    except:
        raise



"""
start of sched_C1
"""

def schedC1_sql_dict(data):
    valid_fields = [
            # 'line_number',
            # 'transaction_type',
            'transaction_type_identifier',
            'lender_entity_id',
            'loan_amount',
            'loan_intrest_rate',
            'loan_incurred_date',
            'loan_due_date',
            'is_loan_restructured',
            'original_loan_date',
            'credit_amount_this_draw',
            'total_outstanding_balance',
            'other_parties_liable',
            'pledged_collateral_ind',
            'pledge_collateral_desc',
            'pledge_collateral_amount',
            'perfected_intrest_ind',
            'future_income_ind',
            'future_income_desc',
            'future_income_estimate',
            'depository_account_established_date',
            'depository_account_location',
            'depository_account_street_1',
            'depository_account_street_2',
            'depository_account_city',
            'depository_account_state',
            'depository_account_zip',
            'depository_account_auth_date',
            'basis_of_loan_desc',
            'treasurer_entity_id',
            'treasurer_signed_date',
            'authorized_entity_id',
            'authorized_entity_title',
            'authorized_signed_date',
    ]
    try:
        datum =  {k: v for k, v in data.items() if k in valid_fields}
        datum['line_number'], datum['transaction_type'] = get_line_number_trans_type(
            data.get('transaction_type_identifier'))
        datum['line_number'] = 'DUMMY'
        datum['transaction_type'] = 'DUMMY'
        return datum
    except:
        raise Exception('invalid request data.')

def check_mandatory_fields_SC1(data):
    """
    validate mandatory fields for sched_a item
    """
    try:
        errors = []
        for field in MANDATORY_FIELDS_SCHED_C1:
            if not(field in data and check_null_value(data.get(field))):
                errors.append(field)
        # if len(error) > 0:
        if errors:
            # string = ""
            # for x in error:
            #     string = string + x + ", "
            # string = string[0:-2]
            raise Exception(
                'The following mandatory fields are required in order to save data to schedA table: {}'.format(','.join(errors)))
    except:
        raise


def put_schedC1(data):
    """
    update sched_c1 item
    here we are assuming lender_entoty_id are always referencing something already in our DB
    """
    try:
        check_mandatory_fields_SC1(data)
        # transaction_id = check_transaction_id(data.get('transaction_id'))
        try:
            put_sql_schedC1(data)
        except Exception as e:
            raise Exception(
                'The put_sql_schedC1 function is throwing an error: ' + str(e))
        return data
    except:
        raise
    
def put_sql_schedC1(data):    
    """
    uopdate a schedule_c2 item
    """
    _sql = """UPDATE public.sched_c1
              SET
                line_number = %s,
                transaction_type = %s,
                transaction_type_identifier = %s,
                lender_entity_id = %s,
                loan_amount = %s,
                loan_intrest_rate = %s,
                loan_incurred_date = %s,
                loan_due_date = %s,
                is_loan_restructured = %s,
                original_loan_date = %s,
                credit_amount_this_draw = %s,
                total_outstanding_balance = %s,
                other_parties_liable = %s,
                pledged_collateral_ind = %s,
                pledge_collateral_desc = %s,
                pledge_collateral_amount=%s,
                perfected_intrest_ind=%s,
                future_income_ind=%s,
                future_income_desc=%s,
                future_income_estimate=%s,
                depository_account_established_date=%s,
                depository_account_location=%s,
                depository_account_street_1=%s,
                depository_account_street_2=%s,
                depository_account_city=%s,
                depository_account_state=%s,
                depository_account_zip=%s,
                depository_account_auth_date=%s,
                basis_of_loan_desc=%s,
                treasurer_entity_id =%s,
                treasurer_signed_date=%s,
                authorized_entity_id=%s,
                authorized_entity_title = %s,
                authorized_signed_date = %s,
                last_update_date = %s
              WHERE transaction_id = %s AND report_id = %s AND cmte_id = %s AND delete_ind is distinct from 'Y'
        """
    _v = (
            data.get('line_number'),
            data.get('transaction_type'),
            data.get('transaction_type_identifier', ''),
            data.get('lender_entity_id', ''),
            data.get('loan_amount', None),
            data.get('loan_intrest_rate', ''),
            data.get('loan_incurred_date', None),
            data.get('loan_due_date', None),
            data.get('is_loan_restructured', ''),
            data.get('original_loan_date', None),
            data.get('credit_amount_this_draw', None),
            data.get('total_outstanding_balance', None),
            data.get('other_parties_liable', ''),
            data.get('pledged_collateral_ind', ''),
            data.get('pledge_collateral_desc', ''),
            data.get('pledge_collateral_amount', None),
            data.get('perfected_intrest_ind', ''),
            data.get('future_income_ind', ''),
            data.get('future_income_desc', ''),
            data.get('future_income_estimate', None),
            data.get('depository_account_established_date', None),
            data.get('depository_account_location', ''),
            data.get('depository_account_street_1', ''),
            data.get('depository_account_street_2', ''),
            data.get('depository_account_city', ''),
            data.get('depository_account_state', ''),
            data.get('depository_account_zip', ''),
            data.get('depository_account_auth_date', None),
            data.get('basis_of_loan_desc', ''),
            data.get('treasurer_entity_id', ''),
            data.get('treasurer_signed_date', None),
            data.get('authorized_entity_id', ''),
            data.get('authorized_entity_title', ''),
            data.get('authorized_signed_date', None),
            datetime.datetime.now(),
            data.get('transaction_id'),
            data.get('report_id'),
            data.get('cmte_id'),
          )
    do_transaction(_sql, _v)



def validate_sc1_data(data):
    """
    check madatory fields for now
    """
    check_mandatory_fields_SC1(data)


def post_schedC1(data):
    """
    function for handling POST request for sc1, need to:
    1. generatye new transaction_id
    2. validate data
    3. save data to db
    """
    try:
        # check_mandatory_fields_SA(datum, MANDATORY_FIELDS_SCHED_A)
        data['transaction_id'] = get_next_transaction_id('SC')
        validate_sc1_data(data)
        try:
            post_sql_schedC1(data)
        except Exception as e:
            raise Exception(
                'The post_sql_schedC1 function is throwing an error: ' + str(e))
        return data
    except:
        raise


def post_sql_schedC1(data):
    try:
        _sql = """
        INSERT INTO public.sched_c1 (
            cmte_id,
            report_id,
            line_number,
            transaction_type,
            transaction_type_identifier,
            transaction_id,
            lender_entity_id,
            loan_amount,
            loan_intrest_rate,
            loan_incurred_date,
            loan_due_date,
            is_loan_restructured,
            original_loan_date,
            credit_amount_this_draw,
            total_outstanding_balance,
            other_parties_liable,
            pledged_collateral_ind,
            pledge_collateral_desc,
            pledge_collateral_amount,
            perfected_intrest_ind,
            future_income_ind,
            future_income_desc,
            future_income_estimate,
            depository_account_established_date,
            depository_account_location,
            depository_account_street_1,
            depository_account_street_2,
            depository_account_city,
            depository_account_state,
            depository_account_zip,
            depository_account_auth_date,
            basis_of_loan_desc,
            treasurer_entity_id,
            treasurer_signed_date,
            authorized_entity_id,
            authorized_entity_title,
            authorized_signed_date,
            create_date)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        """
        _v = (
            data.get('cmte_id'),
            data.get('report_id'),
            data.get('line_number'),
            data.get('transaction_type'),
            data.get('transaction_type_identifier', ''),
            data.get('transaction_id', ''),
            data.get('lender_entity_id', ''),
            data.get('loan_amount', None),
            data.get('loan_intrest_rate', ''),
            data.get('loan_incurred_date', None),
            data.get('loan_due_date', None),
            data.get('is_loan_restructured', ''),
            data.get('original_loan_date', None),
            data.get('credit_amount_this_draw', None),
            data.get('total_outstanding_balance', None),
            data.get('other_parties_liable', ''),
            data.get('pledged_collateral_ind', ''),
            data.get('pledge_collateral_desc', ''),
            data.get('pledge_collateral_amount', None),
            data.get('perfected_intrest_ind', ''),
            data.get('future_income_ind', ''),
            data.get('future_income_desc', ''),
            data.get('future_income_estimate', None),
            data.get('depository_account_established_date', None),
            data.get('depository_account_location', ''),
            data.get('depository_account_street_1', ''),
            data.get('depository_account_street_2', ''),
            data.get('depository_account_city', ''),
            data.get('depository_account_state', ''),
            data.get('depository_account_zip', ''),
            data.get('depository_account_auth_date', None),
            data.get('basis_of_loan_desc', ''),
            data.get('treasurer_entity_id', ''),
            data.get('treasurer_signed_date', None),
            data.get('authorized_entity_id', ''),
            data.get('authorized_entity_title', ''),
            data.get('authorized_signed_date', None),
            datetime.datetime.now(),
        )
        with connection.cursor() as cursor:
            # Insert data into schedD table
            cursor.execute(_sql, _v)
    except Exception:
        raise

def get_schedC1(data):
    try:
        cmte_id = data.get('cmte_id')
        report_id = data.get('report_id')
        if 'transaction_id' in data:
            transaction_id = check_transaction_id(data.get('transaction_id'))
            forms_obj = get_list_schedC1(report_id, cmte_id, transaction_id)
        else:
            forms_obj = get_list_all_schedC1(report_id, cmte_id)
        return forms_obj
    except:
        raise

def get_list_all_schedC1(report_id, cmte_id):
    try:
        with connection.cursor() as cursor:
            # GET single row from schedA table
            _sql = """SELECT json_agg(t) FROM ( SELECT 
            cmte_id,
            report_id,
            line_number,
            transaction_type,
            transaction_type_identifier,
            transaction_id,
            lender_entity_id,
            loan_amount,
            loan_intrest_rate,
            loan_incurred_date,
            loan_due_date,
            is_loan_restructured,
            original_loan_date,
            credit_amount_this_draw,
            total_outstanding_balance,
            other_parties_liable,
            pledged_collateral_ind,
            pledge_collateral_desc,
            pledge_collateral_amount,
            perfected_intrest_ind,
            future_income_ind,
            future_income_desc,
            future_income_estimate,
            depository_account_established_date,
            depository_account_location,
            depository_account_street_1,
            depository_account_street_2,
            depository_account_city,
            depository_account_state,
            depository_account_zip,
            depository_account_auth_date,
            basis_of_loan_desc,
            treasurer_entity_id,
            treasurer_signed_date,
            authorized_entity_id,
            authorized_entity_title,
            authorized_signed_date,
            last_update_date
            FROM public.sched_c1
            WHERE report_id = %s AND cmte_id = %s
            AND delete_ind is distinct from 'Y') t
            """
            cursor.execute(_sql, (report_id, cmte_id))
            schedC2_list = cursor.fetchone()[0]
            if schedC2_list is None:
                raise NoOPError(
                    'No sched_c1 transaction found for report_id {} and cmte_id: {}'.format(report_id, cmte_id))
            merged_list = []
            for dictC2 in schedC2_list:
                merged_list.append(dictC2)
        return merged_list
    except Exception:
        raise 

def get_list_schedC1(report_id, cmte_id, transaction_id):
    try:
        with connection.cursor() as cursor:
            # GET single row from schedA table
            _sql = """SELECT json_agg(t) FROM ( SELECT 
            cmte_id,
            report_id,
            line_number,
            transaction_type,
            transaction_type_identifier,
            transaction_id,
            lender_entity_id,
            loan_amount,
            loan_intrest_rate,
            loan_incurred_date,
            loan_due_date,
            is_loan_restructured,
            original_loan_date,
            credit_amount_this_draw,
            total_outstanding_balance,
            other_parties_liable,
            pledged_collateral_ind,
            pledge_collateral_desc,
            pledge_collateral_amount,
            perfected_intrest_ind,
            future_income_ind,
            future_income_desc,
            future_income_estimate,
            depository_account_established_date,
            depository_account_location,
            depository_account_street_1,
            depository_account_street_2,
            depository_account_city,
            depository_account_state,
            depository_account_zip,
            depository_account_auth_date,
            basis_of_loan_desc,
            treasurer_entity_id,
            treasurer_signed_date,
            authorized_entity_id,
            authorized_entity_title,
            authorized_signed_date,
            last_update_date
            FROM public.sched_c1
            WHERE report_id = %s AND cmte_id = %s AND transaction_id = %s
            AND delete_ind is distinct from 'Y') t
            """
            cursor.execute(_sql, (report_id, cmte_id, transaction_id))
            schedC1_list = cursor.fetchone()[0]
            if not schedC1_list:
                raise NoOPError(
                    'No sched_c1 transaction found for transaction_id {}'.format(transaction_id))
            return schedC1_list
            # merged_list = []
            # for dictC1 in schedC1_list:
            #     merged_list.append(dictC1)
        # return merged_list
    except Exception:
        raise 


def delete_schedC1(data):
    """
    function for handling delete request for sc1
    """
    try:
        # check_mandatory_fields_SC2(data)
        delete_sql_schedC1(data.get('cmte_id'), data.get(
            'report_id'), data.get('transaction_id'))
    except Exception as e:
        raise


def delete_sql_schedC1(cmte_id, report_id, transaction_id):
    """
    do delete sql transaction
    """
    _sql = """UPDATE public.sched_c1
            SET delete_ind = 'Y' 
            WHERE transaction_id = %s AND report_id = %s AND cmte_id = %s
        """
    _v = (transaction_id, report_id, cmte_id)
    do_transaction(_sql, _v)


@api_view(['POST', 'GET', 'DELETE', 'PUT'])
def schedC1(request):
    """
    sched_c1 api supporting POST, GET, DELETE, PUT
    """

    # create new sched_c1 transaction
    if request.method == 'POST':
        try:
            cmte_id = request.user.username
            if not('report_id' in request.data):
                raise Exception('Missing Input: Report_id is mandatory')
            # handling null,none value of report_id
            if not (check_null_value(request.data.get('report_id'))):
                report_id = "0"
            else:
                report_id = check_report_id(request.data.get('report_id'))
            # end of handling
            # print(cmte_id)
            # print(report_id)
            datum = schedC1_sql_dict(request.data)
            datum['report_id'] = report_id
            datum['cmte_id'] = cmte_id
            # print(datum)
            if 'transaction_id' in request.data and check_null_value(
                    request.data.get('transaction_id')):
                datum['transaction_id'] = check_transaction_id(
                    request.data.get('transaction_id'))
                data = put_schedC1(datum)
            else:
                data = post_schedC1(datum)
            # Associating child transactions to parent and storing them to DB

            output = get_schedC1(data)
            return JsonResponse(output[0], status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response("The schedA API - POST is throwing an exception: "
                            + str(e), status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'GET':
        try:
            data = {
                'cmte_id': request.user.username
            }
            if 'report_id' in request.query_params and check_null_value(request.query_params.get('report_id')):
                data['report_id'] = check_report_id(
                    request.query_params.get('report_id'))
            else:
                raise Exception('Missing Input: report_id is mandatory')
            if 'transaction_id' in request.query_params and check_null_value(request.query_params.get('transaction_id')):
                data['transaction_id'] = check_transaction_id(
                    request.query_params.get('transaction_id'))
            datum = get_schedC1(data)
            return JsonResponse(datum, status=status.HTTP_200_OK, safe=False)
        except NoOPError as e:
            logger.debug(e)
            forms_obj = []
            return JsonResponse(forms_obj, status=status.HTTP_204_NO_CONTENT, safe=False)
        except Exception as e:
            logger.debug(e)
            return Response("The schedC2 API - GET is throwing an error: " + str(e), status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        try:
            data = {
                'cmte_id': request.user.username
            }
            if 'report_id' in request.data and check_null_value(request.data.get('report_id')):
                data['report_id'] = check_report_id(
                    request.data.get('report_id'))
            else:
                raise Exception('Missing Input: report_id is mandatory')
            if 'transaction_id' in request.data and check_null_value(request.data.get('transaction_id')):
                data['transaction_id'] = check_transaction_id(
                    request.data.get('transaction_id'))
            else:
                raise Exception('Missing Input: transaction_id is mandatory')
            delete_schedC1(data)
            return Response("The Transaction ID: {} has been successfully deleted".format(data.get('transaction_id')), status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response("The schedD API - DELETE is throwing an error: " + str(e), status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'PUT':
        try:
            datum = schedC1_sql_dict(request.data)
            if 'transaction_id' in request.data and check_null_value(request.data.get('transaction_id')):
                datum['transaction_id'] = request.data.get('transaction_id')
            else:
                raise Exception('Missing Input: transaction_id is mandatory')

            if not('report_id' in request.data):
                raise Exception('Missing Input: Report_id is mandatory')
            # handling null,none value of report_id
            if not (check_null_value(request.data.get('report_id'))):
                report_id = "0"
            else:
                report_id = check_report_id(request.data.get('report_id'))
            # end of handling
            datum['report_id'] = report_id
            datum['cmte_id'] = request.user.username

            # if 'entity_id' in request.data and check_null_value(request.data.get('entity_id')):
            #     datum['entity_id'] = request.data.get('entity_id')
            # if request.data.get('transaction_type') in CHILD_SCHED_B_TYPES:
            #     data = put_schedB(datum)
            #     output = get_schedB(data)
            # else:
            data = put_schedC1(datum)
            output = get_schedC1(data)
            return JsonResponse(data, status=status.HTTP_201_CREATED)
        except Exception as e:
            logger.debug(e)
            return Response("The schedA API - PUT is throwing an error: " + str(e), status=status.HTTP_400_BAD_REQUEST)

    else:
        raise NotImplementedError

"""
start of sched_C2
"""

def check_mandatory_fields_SC2(data):
    """
    validate mandatory fields for sched_a item
    """
    try:
        errors = []
        for field in MANDATORY_FIELDS_SCHED_C2:
            if not(field in data and check_null_value(data.get(field))):
                errors.append(field)
        # if len(error) > 0:
        if errors:
            # string = ""
            # for x in error:
            #     string = string + x + ", "
            # string = string[0:-2]
            raise Exception(
                'The following mandatory fields are required in order to save data to schedA table: {}'.format(','.join(errors)))
    except:
        raise


def put_schedC2(data):
    """update sched_c2 item
    here we are assuming guarantor_entoty_id are always referencing something already in our DB
    """
    try:
        check_mandatory_fields_SC2(data)
        transaction_id = check_transaction_id(data.get('transaction_id'))
        try:
            put_sql_schedC2(data)
        except Exception as e:
            raise Exception(
                'The put_sql_schedD function is throwing an error: ' + str(e))
        return data
    except:
        raise


def put_sql_schedC2(data):
    """
    uopdate a schedule_c2 item
    """
    _sql = """UPDATE public.sched_c2
            SET transaction_type_identifier = %s,
                guarantor_entity_id = %s,
                guaranteed_amount = %s,
                last_update_date = %s
            WHERE transaction_id = %s AND report_id = %s AND cmte_id = %s AND delete_ind is distinct from 'Y'
        """
    _v = (data.get('transaction_type_identifier', ''),
          data.get('guarantor_entity_id', ''),
          data.get('guaranteed_amount', ''),
          datetime.datetime.now(),
          data.get('transaction_id'),
          data.get('report_id'),
          data.get('cmte_id'),
          )
    do_transaction(_sql, _v)


def validate_sc2_data(data):
    """validate sc2 json data"""
    check_mandatory_fields_SC2(data)


def post_schedC2(data):
    """
    function for handling POST request, need to:
    1. generatye new transaction_id
    2. validate data
    3. save data to db
    """
    try:
        # check_mandatory_fields_SA(datum, MANDATORY_FIELDS_SCHED_A)
        data['transaction_id'] = get_next_transaction_id('SC')
        validate_sc2_data(data)

        # save entities rirst
        # if 'creditor_entity_id' in datum:
        #     get_data = {
        #         'cmte_id': datum.get('cmte_id'),
        #         'entity_id': datum.get('creditor_entity_id')
        #     }
        #     prev_entity_list = get_entities(get_data)
        #     entity_data = put_entities(datum)
        # else:
        #     entity_data = post_entities(datum)

        # continue to save transaction
        # creditor_entity_id = entity_data.get('creditor_entity_id')
        # datum['creditor_entity_id'] = creditor_entity_id
        # datum['line_number'] = disclosure_rules(datum.get('line_number'), datum.get('report_id'), datum.get('transaction_type'), datum.get('contribution_amount'), datum.get('contribution_date'), entity_id, datum.get('cmte_id'))
        # trans_char = "SD"
        # transaction_id = get_next_transaction_id(trans_char)
        # datum['transaction_id'] = transaction_id
        try:
            post_sql_schedC2(data)
        except Exception as e:
            # if 'creditor_entity_id' in datum:
            #     entity_data = put_entities(prev_entity_list[0])
            # else:
            #     get_data = {
            #         'cmte_id': datum.get('cmte_id'),
            #         'entity_id': creditor_entity_id
            #     }
            #     remove_entities(get_data)
            raise Exception(
                'The post_sql_schedC2 function is throwing an error: ' + str(e))
        # update line number based on aggregate amount info
        # update_linenumber_aggamt_transactions_SA(datum.get('contribution_date'), datum.get(
        #     'transaction_type'), entity_id, datum.get('cmte_id'), datum.get('report_id'))
        return data
    except:
        raise


def post_sql_schedC2(data):
    try:
        _sql = """
        INSERT INTO public.sched_c2 (cmte_id,
                                    report_id,
                                    transaction_type_identifier,
                                    transaction_id,
                                    guarantor_entity_id,
                                    guaranteed_amount,
                                    create_date)
        VALUES (%s,%s,%s,%s,%s,%s,%s)
        """
        _v = (
            data.get('cmte_id', ''),
            data.get('report_id', ''),
            data.get('transaction_type_identifier', ''),
            data.get('transaction_id', ''),
            data.get('guarantor_entity_id', ''),
            data.get('guaranteed_amount', ''),
            datetime.datetime.now(),
        )
        with connection.cursor() as cursor:
            # Insert data into schedD table
            cursor.execute(_sql, _v)
    except Exception:
        raise


def get_schedC2(data):
    try:
        cmte_id = data.get('cmte_id')
        report_id = data.get('report_id')
        if 'transaction_id' in data:
            transaction_id = check_transaction_id(data.get('transaction_id'))
            forms_obj = get_list_schedC2(report_id, cmte_id, transaction_id)
        else:
            forms_obj = get_list_all_schedC2(report_id, cmte_id)
        return forms_obj
    except:
        raise


def delete_schedC2(data):
    """
    function for handling delete request for sc2
    """
    try:
        check_mandatory_fields_SC2(data)
        delete_sql_schedC2(data.get('cmte_id'), data.get(
            'report_id'), data.get('transaction_id'))
    except Exception as e:
        raise


def delete_sql_schedC2(cmte_id, report_id, transaction_id):
    _sql = """UPDATE public.sched_c2
            SET delete_ind = 'Y' 
            WHERE transaction_id = %s AND report_id = %s AND cmte_id = %s
        """
    _v = (transaction_id, report_id, cmte_id)
    do_transaction(_sql, _v)


def get_list_all_schedC2(report_id, cmte_id):
    try:
        with connection.cursor() as cursor:
            # GET single row from schedA table
            _sql = """SELECT json_agg(t) FROM ( SELECT cmte_id,
            report_id,
            transaction_type_identifier,
            transaction_id,
            guarantor_entity_id,
            guaranteed_amount,
            last_update_date
            FROM public.sched_c2
            WHERE report_id = %s AND cmte_id = %s
            AND delete_ind is distinct from 'Y') t
            """
            cursor.execute(_sql, (report_id, cmte_id))
            schedC2_list = cursor.fetchone()[0]
            if schedC2_list is None:
                raise NoOPError(
                    'No sched_c2 transaction found for report_id {} and cmte_id: {}'.format(report_id, cmte_id))
            merged_list = []
            for dictC2 in schedC2_list:
                merged_list.append(dictC2)
        return merged_list
    except Exception:
        raise


def get_list_schedC2(report_id, cmte_id, transaction_id):
    """
        cmte_id = models.CharField(max_length=9)
    report_id = models.BigIntegerField()
    transaction_type_identifier = models.CharField(
        max_length=12, blank=True, null=True)
    transaction_id = models.CharField(primary_key=True, max_length=20)
    guarantor_entity_id = models.CharField(
        max_length=20, blank=True, null=True)
    guaranteed_amount = models.DecimalField(
        max_digits=12, decimal_places=2, blank=True, null=True)
    delete_ind = models.CharField(max_length=1, blank=True, null=True)
    create_date = models.DateTimeField(blank=True, null=True)
    last_update_date = models.DateTimeField(blank=True, null=True)
    """

    try:
        with connection.cursor() as cursor:
            # GET single row from schedA table
            _sql = """SELECT json_agg(t) FROM ( SELECT cmte_id,
            report_id,
            transaction_type_identifier,
            transaction_id,
            guarantor_entity_id,
            guaranteed_amount,
            last_update_date
            FROM public.sched_c2
            WHERE report_id = %s AND cmte_id = %s AND transaction_id = %s
            AND delete_ind is distinct from 'Y') t
            """

            cursor.execute(_sql, (report_id, cmte_id, transaction_id))

            schedC2_list = cursor.fetchone()[0]

            if schedC2_list is None:
                raise NoOPError(
                    'The transaction id: {} does not exist or is deleted'.format(transaction_id))
            merged_list = []
            for dictC2 in schedC2_list:
                merged_list.append(dictC2)
        return merged_list
    except Exception:
        raise


def schedC2_sql_dict(data):
    valid_fields = [
        'transaction_type_identifier',
        'guarantor_entity_id',
        'guaranteed_amount',
    ]
    try:
        datum = {k: v for k, v in data.items() if k in valid_fields}
        datum['line_number'], datum['transaction_type'] = get_line_number_trans_type(
            data.get('transaction_type_identifier'))
        return datum
    except:
        raise Exception('invalid request data.')


# Create your views here.
#
@api_view(['POST', 'GET', 'DELETE', 'PUT'])
def schedC2(request):
    """
    sched_c2 api supporting POST, GET, DELETE, PUT
    """

    # create new sched_c2 transaction
    if request.method == 'POST':
        try:
            cmte_id = request.user.username
            if not('report_id' in request.data):
                raise Exception('Missing Input: Report_id is mandatory')
            # handling null,none value of report_id
            if not (check_null_value(request.data.get('report_id'))):
                report_id = "0"
            else:
                report_id = check_report_id(request.data.get('report_id'))
            # end of handling
            # print(cmte_id)
            # print(report_id)
            datum = schedC2_sql_dict(request.data)
            datum['report_id'] = report_id
            datum['cmte_id'] = cmte_id
            if 'transaction_id' in request.data and check_null_value(
                    request.data.get('transaction_id')):
                datum['transaction_id'] = check_transaction_id(
                    request.data.get('transaction_id'))
                data = put_schedC2(datum)
            else:
                # print(datum)
                data = post_schedC2(datum)
            # Associating child transactions to parent and storing them to DB

            output = get_schedC2(data)
            return JsonResponse(output[0], status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response("The schedA API - POST is throwing an exception: "
                            + str(e), status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'GET':
        try:
            data = {
                'cmte_id': request.user.username
            }
            if 'report_id' in request.data and check_null_value(request.data.get('report_id')):
                data['report_id'] = check_report_id(
                    request.data.get('report_id'))
            else:
                raise Exception('Missing Input: report_id is mandatory')
            if 'transaction_id' in request.data and check_null_value(request.data.get('transaction_id')):
                data['transaction_id'] = check_transaction_id(
                    request.data.get('transaction_id'))
            datum = get_schedC2(data)
            return JsonResponse(datum, status=status.HTTP_200_OK, safe=False)
        except NoOPError as e:
            logger.debug(e)
            forms_obj = []
            return JsonResponse(forms_obj, status=status.HTTP_204_NO_CONTENT, safe=False)
        except Exception as e:
            logger.debug(e)
            return Response("The schedC2 API - GET is throwing an error: " + str(e), status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        try:
            data = {
                'cmte_id': request.user.username
            }
            if 'report_id' in request.data and check_null_value(request.data.get('report_id')):
                data['report_id'] = check_report_id(
                    request.data.get('report_id'))
            else:
                raise Exception('Missing Input: report_id is mandatory')
            if 'transaction_id' in request.data and check_null_value(request.data.get('transaction_id')):
                data['transaction_id'] = check_transaction_id(
                    request.data.get('transaction_id'))
            else:
                raise Exception('Missing Input: transaction_id is mandatory')
            delete_schedC2(data)
            return Response("The Transaction ID: {} has been successfully deleted".format(data.get('transaction_id')), status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response("The schedC2 API - DELETE is throwing an error: " + str(e), status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'PUT':
        try:
            datum = schedC2_sql_dict(request.data)
            if 'transaction_id' in request.data and check_null_value(request.data.get('transaction_id')):
                datum['transaction_id'] = request.data.get('transaction_id')
            else:
                raise Exception('Missing Input: transaction_id is mandatory')

            if not('report_id' in request.data):
                raise Exception('Missing Input: Report_id is mandatory')
            # handling null,none value of report_id
            if not (check_null_value(request.data.get('report_id'))):
                report_id = "0"
            else:
                report_id = check_report_id(request.data.get('report_id'))
            # end of handling
            datum['report_id'] = report_id
            datum['cmte_id'] = request.user.username

            # if 'entity_id' in request.data and check_null_value(request.data.get('entity_id')):
            #     datum['entity_id'] = request.data.get('entity_id')
            # if request.data.get('transaction_type') in CHILD_SCHED_B_TYPES:
            #     data = put_schedB(datum)
            #     output = get_schedB(data)
            # else:
            data = put_schedC2(datum)
            # output = get_schedA(data)
            return JsonResponse(data, status=status.HTTP_201_CREATED)
        except Exception as e:
            logger.debug(e)
            return Response("The schedA API - PUT is throwing an error: " + str(e), status=status.HTTP_400_BAD_REQUEST)

    else:
        raise NotImplementedError


@api_view(['GET'])
def get_endorser_summary(request):
    """
    Get all loans with an outstanding balance
    this api is used to enable the sched_c summary page
    need to return:
    1. name/bank (this is the entity name)
    2. original loan
    3. cumulative payemnt to date
    4. outstanding balance
    5. due date
    """
    logger.debug('GET request received for endorser summary.')
    try:
        cmte_id = request.user.username
        if 'report_id' in request.query_params and check_null_value(request.query_params.get('report_id')):
                report_id = check_report_id(
                    request.query_params.get('report_id'))
        else:
            raise Exception('Missing Input: report_id is mandatory')
        # print(cmte_id)
        # print(report_id)
        _sql = """
        SELECT Json_agg(t) 
            FROM   (SELECT 
                        e.entity_name,
                        e.entity_type, 
                        e.last_name,
                        e.first_name,
                        e.middle_name,
                        e.preffix,
                        e.suffix, 
                        e.employer,
                        e.occupation,
                        c.transaction_id,
                        c.guaranteed_amount 
                    FROM   public.sched_c2 c, 
                        public.entity e 
                    WHERE c.cmte_id = %s
                    AND c.report_id = %s
                    AND c.guarantor_entity_id = e.entity_id 
                    AND c.delete_ind is distinct from 'Y' 
                    ) t
        """
        with connection.cursor() as cursor:
            cursor.execute(_sql, [cmte_id, report_id])
            json_result = cursor.fetchone()[0] 
            if not json_result:
                return Response([], status=status.HTTP_200_OK)
                # raise Exception('No endorser data found.')
            else:
                return Response(json_result, status=status.HTTP_200_OK)

    except:
        raise
