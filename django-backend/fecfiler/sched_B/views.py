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

from fecfiler.core.views import (
    NoOPError,
    check_null_value,
    check_report_id,
    date_format,
    delete_entities,
    get_entities,
    post_entities,
    put_entities,
    remove_entities,
    undo_delete_entities,
    save_cand_entity,
    superceded_report_id_list,
)
from fecfiler.core.transaction_util import (
    get_line_number_trans_type,
    get_sched_b_transactions,
    transaction_exists,
    update_parent_purpose,
    update_sched_d_parent,
    update_sched_c_parent,
)

logger = logging.getLogger(__name__)


# semi_annual_refund_bundled_amount remmoed from ths list but is still needed
# you need to pass in a valid decimal value: this is valid until db change happens
list_mandatory_fields_schedB = [
    "report_id",
    "expenditure_date",
    "expenditure_amount",
    "transaction_type_identifier",
    "entity_type",
]

# a list of transactions with negative transaction_amount
NEGATIVE_TRANSACTIONS = [
    "OPEXP_VOID",
    "CONT_TO_OTH_CMTE_VOID",
    "OTH_DISB_NC_ACC_PMT_TO_PROL_VOID",
    "FEA_100PCT_PAY_VOID",
    "REF_CONT_IND_VOID",
    "REF_CONT_PARTY_VOID",
    "REF_CONT_PAC_VOID",
    "REF_CONT_NON_FED_VOID",
]

# for child transactions, we'll validate parent_id exists in the db
# TODO: later on chagne it to load this list from DB
CHILD_PARENT_SB_SB_TRANSACTIONS = {
    "OTH_DISB_CC_PAY_MEMO": ("OTH_DISB_CC_PAY", "sched_b"),
    "OTH_DISB_STAF_REIM_MEMO": ("OTH_DISB_STAF_REIM", "sched_b"),
    "OTH_DISB_PMT_TO_PROL_MEMO": ("OTH_DISB_PMT_TO_PROL", "sched_b"),
    "OTH_DISB_NC_ACC_CC_PAY_MEMO": ("OTH_DISB_NC_ACC_CC_PAY", "sched_b"),
    "OTH_DISB_NC_ACC_STAF_REIM_MEMO": ("OTH_DISB_NC_ACC_STAF_REIM", "sched_b"),
    "OTH_DISB_NC_ACC_PMT_TO_PROL_MEMO": ("OTH_DISB_NC_ACC_PMT_TO_PROL", "sched_b"),
    "FEA_PAY_TO_PROL_MEMO": ("FEA_PAY_TO_PROL", "sched_b"),
    "FEA_CC_PAY_MEMO": ("FEA_CC_PAY", "sched_b"),
    "FEA_STAF_REIM_MEMO": ("FEA_STAF_REIM", "sched_b"),
    "CONT_REDESIG_MEMO": ("CONT_REDESIG", "sched_b"),
}

CHILD_SCHEDB_AUTO_UPDATE_PARENT_SCHEDA_DICT = {
    "IK_OUT": "IK_REC" ,
    "IK_BC_OUT": "IK_BC_REC",
    "PARTY_IK_OUT": "PARTY_IK_REC",
    "PARTY_IK_BC_OUT": "PARTY_IK_BC_REC",
    "PAC_IK_OUT": "PAC_IK_REC",
    "PAC_IK_BC_OUT": "PAC_IK_BC_REC",
    "IK_TRAN_OUT": "IK_TRAN",
    "IK_TRAN_FEA_OUT": "IK_TRAN_FEA"
}
EARMARK_SB_CHILD_LIST = [
    "CON_EAR_DEP_MEMO",
    "CON_EAR_UNDEP_MEMO",
    "PAC_CON_EAR_DEP_MEMO",
    "PAC_CON_EAR_UNDEP_MEMO",
]

# a list of treansaction types for sched_l(levin funds report) disbursments
SCHED_L_B_TRAN_TYPES = [
    "LEVIN_VOTER_ID",
    "LEVIN_GOTV",
    "LEVIN_GEN",
    "LEVIN_OTH_DISB",
    "LEVIN_VOTER_REG",
]

SCHED_D_CHILD_LIST = ['OTH_DISB_DEBT', 'OPEXP_DEBT']
SCHED_C_CHILD_LIST = ['LOAN_REPAY_MADE']

# adding election_year field needed by front end
REQT_ELECTION_YR = ""

# To avoid circular reference adding sched_a function
def put_sql_schedA_from_schedB(cmte_id, report_id, line_number, transaction_type, transaction_id, back_ref_transaction_id, back_ref_sched_name, entity_id, contribution_date, contribution_amount, purpose_description, memo_code, memo_text, election_code, election_other_description, donor_cmte_id, donor_cmte_name, transaction_type_identifier):
    """
    uopdate a schedule_a item
    """
    try:
        with connection.cursor() as cursor:
            # Insert data into schedA table
            cursor.execute("""UPDATE public.sched_a SET line_number = %s, transaction_type = %s, back_ref_transaction_id = %s, back_ref_sched_name = %s, entity_id = %s, contribution_date = %s, contribution_amount = %s, purpose_description = %s, memo_code = %s, memo_text = %s, election_code = %s, election_other_description = %s, donor_cmte_id = %s, donor_cmte_name = %s, transaction_type_identifier = %s WHERE transaction_id = %s AND report_id = %s AND cmte_id = %s AND delete_ind is distinct from 'Y'""",
                           [line_number, transaction_type, back_ref_transaction_id, back_ref_sched_name, entity_id, contribution_date, contribution_amount, purpose_description, memo_code, memo_text, election_code, election_other_description, donor_cmte_id, donor_cmte_name, transaction_type_identifier, transaction_id, report_id, cmte_id])
            if (cursor.rowcount == 0):
                raise Exception(
                    'The Transaction ID: {} does not exist in schedA table'.format(transaction_id))
    except Exception:
        raise


def get_next_transaction_id(trans_char):
    """
    query the db for next transarion id
    """
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                """SELECT public.get_next_transaction_id(%s)""", [trans_char]
            )
            transaction_ids = cursor.fetchone()
            transaction_id = transaction_ids[0]
        return transaction_id
    except Exception:
        raise


def check_transaction_id(transaction_id):
    """
    make sure transaction_id start with 'SB'
    """
    try:
        transaction_type_list = ["SB", "LB"]
        transaction_type = transaction_id[0:2]
        if not (transaction_type in transaction_type_list):
            raise Exception(
                "The Transaction ID: {} is not in the specified format. Transaction IDs start with SB characters".format(
                    transaction_id
                )
            )
        return transaction_id
    except Exception:
        raise


def check_type_list(data):
    """
    make sure child transaction data is in a list
    """
    try:
        if not type(data) is list:
            raise Exception(
                """
                The child transactions have to be sent in as an array or list. 
                Input received: {}""".format(
                    data
                )
            )
        else:
            return data
    except:
        raise


def check_decimal(value):
    """
    check value is decimal data
    """
    try:
        check_value = Decimal(value)
        return value
    except Exception as e:
        raise Exception(
            """
            Invalid Input: Expecting a decimal value like 18.11, 24.07. 
            Input received: {}""".format(
                value
            )
        )


def check_mandatory_fields_SB(data, list_mandatory_fields):
    """
    verify madatory fields with SB transaction
    """
    try:
        error = []
        for field in list_mandatory_fields:
            if not (field in data and check_null_value(data.get(field))):
                error.append(field)
        if len(error) > 0:
            string = ""
            for x in error:
                string = string + x + ", "
            string = string[0:-2]
            raise Exception(
                """The following mandatory fields are required in order to 
                save data to schedB table: {}""".format(
                    string
                )
            )
    except:
        raise


def post_sql_schedB(
    cmte_id,
    report_id,
    line_number,
    transaction_type,
    transaction_id,
    back_ref_transaction_id,
    back_ref_sched_name,
    entity_id,
    expenditure_date,
    expenditure_amount,
    semi_annual_refund_bundled_amount,
    expenditure_purpose,
    category_code,
    memo_code,
    memo_text,
    election_code,
    election_other_description,
    beneficiary_cmte_id,
    beneficiary_cand_id,
    other_name,
    other_street_1,
    other_street_2,
    other_city,
    other_state,
    other_zip,
    nc_soft_account,
    transaction_type_identifier,
    beneficiary_cand_office,
    beneficiary_cand_state,
    beneficiary_cand_district,
    beneficiary_cmte_name,
    beneficiary_cand_last_name,
    beneficiary_cand_first_name,
    beneficiary_cand_middle_name,
    beneficiary_cand_prefix,
    beneficiary_cand_suffix,
    aggregate_amt,
    beneficiary_cand_entity_id,
    levin_account_id
):
    """
    db transaction for post a db transaction
    """
    try:
        with connection.cursor() as cursor:
            # Insert data into schedB table
            cursor.execute(
                """INSERT INTO public.sched_b (
                    cmte_id, 
                    report_id, 
                    line_number, 
                    transaction_type, 
                    transaction_id, 
                    back_ref_transaction_id, 
                    back_ref_sched_name, 
                    entity_id, 
                    expenditure_date, 
                    expenditure_amount, 
                    semi_annual_refund_bundled_amount, 
                    expenditure_purpose, 
                    category_code, 
                    memo_code, 
                    memo_text, 
                    election_code, 
                    election_other_description, 
                    beneficiary_cmte_id, 
                    beneficiary_cand_id, 
                    other_name, 
                    other_street_1, 
                    other_street_2, 
                    other_city, 
                    other_state, 
                    other_zip, 
                    nc_soft_account, 
                    transaction_type_identifier,                     
                    beneficiary_cand_office,
                    beneficiary_cand_state,
                    beneficiary_cand_district,
                    beneficiary_cmte_name,
                    beneficiary_cand_last_name,
                    beneficiary_cand_first_name,
                    beneficiary_cand_middle_name,
                    beneficiary_cand_prefix,
                    beneficiary_cand_suffix,
                    aggregate_amt,
                    beneficiary_cand_entity_id,
                    levin_account_id,
                    last_update_date,
                    create_date
                )
                VALUES ("""
                + ",".join(["%s"] * 41)
                + ")",
                [
                    cmte_id,
                    report_id,
                    line_number,
                    transaction_type,
                    transaction_id,
                    back_ref_transaction_id,
                    back_ref_sched_name,
                    entity_id,
                    expenditure_date,
                    expenditure_amount,
                    semi_annual_refund_bundled_amount,
                    expenditure_purpose,
                    category_code,
                    memo_code,
                    memo_text,
                    election_code,
                    election_other_description,
                    beneficiary_cmte_id,
                    beneficiary_cand_id,
                    other_name,
                    other_street_1,
                    other_street_2,
                    other_city,
                    other_state,
                    other_zip,
                    nc_soft_account,
                    transaction_type_identifier,
                    beneficiary_cand_office,
                    beneficiary_cand_state,
                    beneficiary_cand_district,
                    beneficiary_cmte_name,
                    beneficiary_cand_last_name,
                    beneficiary_cand_first_name,
                    beneficiary_cand_middle_name,
                    beneficiary_cand_prefix,
                    beneficiary_cand_suffix,
                    aggregate_amt,
                    beneficiary_cand_entity_id,
                    levin_account_id,
                    datetime.datetime.now(),
                    datetime.datetime.now()
                ],
            )
    except Exception:
        raise


def get_list_all_schedB(report_id, cmte_id):
    """
    get a list of all transactions with the same cmte_id and report_id
    """
    return get_sched_b_transactions(report_id, cmte_id)


def get_list_schedB(report_id, cmte_id, transaction_id):
    """
    get sched_b item for this transaction_id
    """
    return get_sched_b_transactions(report_id, cmte_id, transaction_id=transaction_id)


def get_list_child_schedB(report_id, cmte_id, transaction_id):
    """
    get all children sched_b items:
    back_ref_transaction_id == transaction_id
    """
    return get_sched_b_transactions(
        report_id, cmte_id, back_ref_transaction_id=transaction_id
    )


def get_list_child_transactionId_schedB(cmte_id, transaction_id):
    """
    get all children sched_b items:
    back_ref_transaction_id == transaction_id
    """
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                """SELECT transaction_id
                FROM public.sched_b 
                WHERE cmte_id = %s 
                AND back_ref_transaction_id = %s 
                AND delete_ind is distinct from 'Y'""",
                [cmte_id, transaction_id],
            )
            transactions_list = cursor.fetchall()
        return transactions_list
    except Exception as e:
        raise Exception(
            "The get_list_child_transactionId_schedB function is throwing an error: "
            + str(e)
        )


def put_sql_agg_amount_schedB(cmte_id, transaction_id, aggregate_amount):
    """
    update aggregate amount
    """
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                """UPDATE public.sched_b SET aggregate_amt = %s WHERE transaction_id = %s AND cmte_id = %s AND delete_ind is distinct from 'Y'""",
                [aggregate_amount, transaction_id, cmte_id],
            )
            if cursor.rowcount == 0:
                raise Exception(
                    "put_sql_agg_amount_schedB function: The Transaction ID: {} does not exist in schedB table".format(
                        transaction_id
                    )
                )
    except Exception:
        raise


def put_sql_schedB(
    cmte_id,
    report_id,
    line_number,
    transaction_type,
    transaction_id,
    back_ref_transaction_id,
    back_ref_sched_name,
    entity_id,
    expenditure_date,
    expenditure_amount,
    semi_annual_refund_bundled_amount,
    expenditure_purpose,
    category_code,
    memo_code,
    memo_text,
    election_code,
    election_other_description,
    beneficiary_cmte_id,
    beneficiary_cand_id,
    other_name,
    other_street_1,
    other_street_2,
    other_city,
    other_state,
    other_zip,
    nc_soft_account,
    transaction_type_identifier,
    beneficiary_cand_office,
    beneficiary_cand_state,
    beneficiary_cand_district,
    beneficiary_cmte_name,
    beneficiary_cand_last_name,
    beneficiary_cand_first_name,
    beneficiary_cand_middle_name,
    beneficiary_cand_prefix,
    beneficiary_cand_suffix,
    aggregate_amt,
    beneficiary_cand_entity_id,
    levin_account_id,
):
    """
    db transaction for saving current sched_b item
    """
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                """UPDATE public.sched_b SET 
                            line_number = %s, 
                            transaction_type = %s, 
                            back_ref_transaction_id = %s, 
                            back_ref_sched_name = %s, 
                            entity_id = %s, 
                            expenditure_date = %s, 
                            expenditure_amount = %s, 
                            semi_annual_refund_bundled_amount = %s, 
                            expenditure_purpose = %s, 
                            category_code = %s, 
                            memo_code = %s, 
                            memo_text = %s, 
                            election_code = %s, 
                            election_other_description = %s, 
                            beneficiary_cmte_id = %s, 
                            beneficiary_cand_id = %s, 
                            other_name = %s, 
                            other_street_1 = %s, 
                            other_street_2 = %s, 
                            other_city = %s, 
                            other_state = %s, 
                            other_zip = %s, 
                            nc_soft_account = %s, 
                            transaction_type_identifier = %s, 
                            beneficiary_cand_office = %s,
                            beneficiary_cand_state = %s,
                            beneficiary_cand_district = %s,
                            beneficiary_cmte_name = %s,
                            beneficiary_cand_last_name = %s,
                            beneficiary_cand_first_name = %s,
                            beneficiary_cand_middle_name = %s,
                            beneficiary_cand_prefix = %s,
                            beneficiary_cand_suffix = %s,
                            aggregate_amt = %s,
                            beneficiary_cand_entity_id = %s,
                            levin_account_id = %s,
                            last_update_date = %s
                    WHERE transaction_id = %s 
                    AND report_id = %s 
                    AND cmte_id = %s 
                    AND delete_ind is distinct from 'Y'
                """,
                [
                    line_number,
                    transaction_type,
                    back_ref_transaction_id,
                    back_ref_sched_name,
                    entity_id,
                    expenditure_date,
                    expenditure_amount,
                    semi_annual_refund_bundled_amount,
                    expenditure_purpose,
                    category_code,
                    memo_code,
                    memo_text,
                    election_code,
                    election_other_description,
                    beneficiary_cmte_id,
                    beneficiary_cand_id,
                    other_name,
                    other_street_1,
                    other_street_2,
                    other_city,
                    other_state,
                    other_zip,
                    nc_soft_account,
                    transaction_type_identifier,
                    beneficiary_cand_office,
                    beneficiary_cand_state,
                    beneficiary_cand_district,
                    beneficiary_cmte_name,
                    beneficiary_cand_last_name,
                    beneficiary_cand_first_name,
                    beneficiary_cand_middle_name,
                    beneficiary_cand_prefix,
                    beneficiary_cand_suffix,
                    aggregate_amt,
                    beneficiary_cand_entity_id,
                    levin_account_id,
                    datetime.datetime.now(),
                    transaction_id,
                    report_id,
                    cmte_id,
                ],
            )
            if cursor.rowcount == 0:
                raise Exception(
                    "The Transaction ID: {} does not exist in schedB table".format(
                        transaction_id
                    )
                )
    except Exception:
        raise


def delete_sql_schedB(transaction_id, report_id, cmte_id):
    """
    db transaction for deleting current item
    """
    try:
        with connection.cursor() as cursor:

            # UPDATE delete_ind flag on a single row from Sched_B table
            cursor.execute(
                """
                UPDATE public.sched_b 
                SET delete_ind = 'Y' 
                WHERE transaction_id = %s 
                AND report_id = %s 
                AND cmte_id = %s 
                AND delete_ind is distinct from 'Y'
                """,
                [transaction_id, report_id, cmte_id],
            )
            if cursor.rowcount == 0:
                raise Exception(
                    "The Transaction ID: {} is either already deleted or does not exist in schedB table".format(
                        transaction_id
                    )
                )
    except Exception:
        raise


def delete_parent_child_link_sql_schedB(transaction_id, report_id, cmte_id):
    """
    db transaction for deleting all child transactions
    """
    try:
        with connection.cursor() as cursor:

            # UPDATE back_ref_transaction_id value to null in sched_b table
            value = None
            cursor.execute(
                """UPDATE public.sched_b SET back_ref_transaction_id = %s WHERE back_ref_transaction_id = %s AND report_id = %s AND cmte_id = %s AND delete_ind is distinct from 'Y'""",
                [value, transaction_id, report_id, cmte_id],
            )
    except Exception:
        raise


# not sure this function will ever be used - will implement this later
def post_cand_entity(data):
    """
    create a new entity
    """
    return save_cand_entity(data, new=True)


def put_cand_entity(data):
    """
    save/update an existing candiate entity
    """
    return save_cand_entity(data)


def post_schedB(datum):
    """
    create and save current sched_b item
    """
    try:
        check_mandatory_fields_SB(datum, list_mandatory_fields_schedB)
        logger.debug("...mandatory check done.")
        if "entity_id" in datum:
            get_data = {
                "cmte_id": datum.get("cmte_id"),
                "entity_id": datum.get("entity_id"),
            }
            if get_data["entity_id"].startswith("FEC"):
                get_data["cmte_id"] = "C00000000"
            prev_entity_list = get_entities(get_data)
            entity_data = put_entities(datum)
        else:
            entity_data = post_entities(datum)
        logger.debug("...entity saved")
        logger.debug("***datum:{}".format(datum))
        if datum.get("beneficiary_cand_entity_id"):
            logger.debug("saving cand data...")
            # get_data = {
            #     "cmte_id": datum.get("cmte_id"),
            #     "entity_id": datum.get("entity_id"),
            # }
            # prev_entity_list = get_entities(get_data)
            cand_data = put_cand_entity(datum)
            datum["beneficiary_cand_entity_id"] = cand_data.get("entity_id")
            logger.debug(
                "cand data saved with entity_id:{}".format(cand_data.get("entity_id"))
            )
        # else:
        #     cand_data = post_cand_entity(datum)
        entity_id = entity_data.get("entity_id")
        datum["entity_id"] = entity_id
        # datum["beneficiary_cand_entity_id"] = cand_data.get("entity_id")
        if datum.get("transaction_type_identifier") in SCHED_L_B_TRAN_TYPES:
            trans_char = "LB" # for sched_l transactions
        else:
            trans_char = "SB"
        transaction_id = get_next_transaction_id(trans_char)
        datum["transaction_id"] = transaction_id

        #checking if beneficiary cmte id exists then copying entity name to beneficiary committee name as they both are the same
        if 'beneficiary_cmte_id' in datum and datum.get('beneficiary_cmte_id') not in ['', ' ', None, 'none', 'null', 'None']:
          datum['beneficiary_cmte_name'] = datum.get('entity_name')
        try:
            post_sql_schedB(
                datum.get("cmte_id"),
                datum.get("report_id"),
                datum.get("line_number"),
                datum.get("transaction_type"),
                transaction_id,
                datum.get("back_ref_transaction_id"),
                datum.get("back_ref_sched_name"),
                entity_id,
                datum.get("expenditure_date"),
                datum.get("expenditure_amount"),
                datum.get("semi_annual_refund_bundled_amount"),
                datum.get("expenditure_purpose"),
                datum.get("category_code"),
                datum.get("memo_code"),
                datum.get("memo_text"),
                datum.get("election_code"),
                datum.get("election_other_description"),
                datum.get("beneficiary_cmte_id"),
                datum.get("beneficiary_cand_id"),
                datum.get("other_name"),
                datum.get("other_street_1"),
                datum.get("other_street_2"),
                datum.get("other_city"),
                datum.get("other_state"),
                datum.get("other_zip"),
                datum.get("nc_soft_account"),
                datum.get("transaction_type_identifier"),
                datum.get("beneficiary_cand_office"),
                datum.get("beneficiary_cand_state"),
                datum.get("beneficiary_cand_district"),
                datum.get("beneficiary_cmte_name"),
                datum.get("beneficiary_cand_last_name"),
                datum.get("beneficiary_cand_first_name"),
                datum.get("beneficiary_cand_middle_name"),
                datum.get("beneficiary_cand_prefix"),
                datum.get("beneficiary_cand_suffix"),
                datum.get("aggregate_amt"),
                datum.get("beneficiary_cand_entity_id"),
                datum.get("levin_account_id"),
            )
            logger.debug('payment transaction saved.')
            if datum.get('transaction_type_identifier') in SCHED_D_CHILD_LIST:
                update_sched_d_parent(
                    datum.get('cmte_id'),
                    datum.get('back_ref_transaction_id'),
                    datum.get('expenditure_amount')
                    )
            if datum.get('transaction_type_identifier') in SCHED_C_CHILD_LIST:
                update_sched_c_parent(
                    datum.get('cmte_id'),
                    datum.get('back_ref_transaction_id'),
                    datum.get('expenditure_amount')
                )
        except Exception as e:
            if "entity_id" in datum:
                entity_data = put_entities(prev_entity_list[0])
            else:
                get_data = {"cmte_id": datum.get(cmte_id), "entity_id": entity_id}
                remove_entities(get_data)
            raise Exception(
                "The post_sql_schedB function is throwing an error: " + str(e)
            )
        logger.debug("sched_b transaction saved successfully.")
        return datum
    except:
        raise


def get_schedB(data):
    """
    db transaction for loading a sched_b item
    """
    try:
        cmte_id = data.get("cmte_id")
        report_id = data.get("report_id")
        flag = False
        if "transaction_id" in data:
            try:
                transaction_id = data.get("transaction_id")
                check_transaction_id(transaction_id)
                flag = True
            except Exception:
                flag = False

        if flag:
            forms_obj = get_list_schedB(report_id, cmte_id, transaction_id)
            # adding hard-coded api call info to get object details
            for obj in forms_obj:
                obj.update({"api_call": "/sb/schedB"})
                obj.update({"election_year": REQT_ELECTION_YR})
            child_forms_obj = get_list_child_schedB(report_id, cmte_id, transaction_id)
            for obj in child_forms_obj:
                obj.update({"api_call": "/sb/schedB"})
                obj.update({"election_year": REQT_ELECTION_YR})
            if len(child_forms_obj) > 0:
                forms_obj[0]["child"] = child_forms_obj
        else:
            forms_obj = get_list_all_schedB(report_id, cmte_id)
            for obj in forms_obj:
                obj.update({"api_call": "/sb/schedB"})
                obj.update({"election_year": REQT_ELECTION_YR})
        return forms_obj

    except:
        raise


# TODO: need to add beneficiary fields

def get_existing_expenditure(cmte_id, transaction_id):
    """
    fetch existing close balance in the db for current transaction
    """
    _sql = """
    select expenditure_amount
    from public.sched_b
    where cmte_id = %s
    and transaction_id = %s
    """
    _v = (cmte_id, transaction_id)
    try:
        with connection.cursor() as cursor:
            cursor.execute(_sql, _v)
            return cursor.fetchone()[0]
    except:
        raise
    



def put_schedB(datum):
    """
    save and update a sched_b item
    """
    try:
        check_mandatory_fields_SB(datum, list_mandatory_fields_schedB)
        transaction_id = datum.get("transaction_id")
        check_transaction_id(transaction_id)
        flag = False
        if "entity_id" in datum:
            flag = True
            get_data = {
                "cmte_id": datum.get("cmte_id"),
                "entity_id": datum.get("entity_id"),
            }
            if get_data["entity_id"].startswith("FEC"):
                get_data["cmte_id"] = "C00000000"
            prev_entity_list = get_entities(get_data)
            entity_data = put_entities(datum)
        else:
            entity_data = post_entities(datum)
        if datum.get("beneficiary_cand_entity_id"):
            # get_data = {
            #     "cmte_id": datum.get("cmte_id"),
            #     "entity_id": datum.get("entity_id"),
            # }
            # prev_entity_list = get_entities(get_data)
            cand_data = put_cand_entity(datum)
            datum["beneficiary_cand_entity_id"] = cand_data.get("entity_id")
        # else:
        #     cand_data = post_cand_entity(datum)
        entity_id = entity_data.get("entity_id")
        datum["entity_id"] = entity_id
        # datum["beneficiary_cand_entity_id"] = cand_data.get("entity_id")
        # entity_id = entity_data.get("entity_id")
        # datum["entity_id"] = entity_id

        #checking if beneficiary cmte id exists then copying entity name to beneficiary committee name as they both are the same
        if 'beneficiary_cmte_id' in datum and datum.get('beneficiary_cmte_id') not in ['', ' ', None, 'none', 'null', 'None']:
          datum['beneficiary_cmte_name'] = datum.get('entity_name')
        try:
            if datum.get('transaction_type_identifier') in (SCHED_D_CHILD_LIST + SCHED_C_CHILD_LIST):
                existing_exp = get_existing_expenditure(
                    datum.get('cmte_id'),
                    datum.get('transaction_id')
                )
            put_sql_schedB(
                datum.get("cmte_id"),
                datum.get("report_id"),
                datum.get("line_number"),
                datum.get("transaction_type"),
                transaction_id,
                datum.get("back_ref_transaction_id"),
                datum.get("back_ref_sched_name"),
                entity_id,
                datum.get("expenditure_date"),
                datum.get("expenditure_amount"),
                datum.get("semi_annual_refund_bundled_amount"),
                datum.get("expenditure_purpose"),
                datum.get("category_code"),
                datum.get("memo_code"),
                datum.get("memo_text"),
                datum.get("election_code"),
                datum.get("election_other_description"),
                datum.get("beneficiary_cmte_id"),
                datum.get("beneficiary_cand_id"),
                datum.get("other_name"),
                datum.get("other_street_1"),
                datum.get("other_street_2"),
                datum.get("other_city"),
                datum.get("other_state"),
                datum.get("other_zip"),
                datum.get("nc_soft_account"),
                datum.get("transaction_type_identifier"),
                datum.get("beneficiary_cand_office"),
                datum.get("beneficiary_cand_state"),
                datum.get("beneficiary_cand_district"),
                datum.get("beneficiary_cmte_name"),
                datum.get("beneficiary_cand_last_name"),
                datum.get("beneficiary_cand_first_name"),
                datum.get("beneficiary_cand_middle_name"),
                datum.get("beneficiary_cand_prefix"),
                datum.get("beneficiary_cand_suffix"),
                datum.get("aggregate_amt"),
                datum.get("beneficiary_cand_entity_id"),
                datum.get("levin_account_id"),
            )
            logger.debug('sched_b data saved.')
            
            # need to update parent sched_d data if sched_d payment made
            if datum.get('transaction_type_identifier') in SCHED_D_CHILD_LIST:
                logger.debug('existing exp:{}'.format(existing_exp))
                if float(existing_exp) != float(datum.get('expenditure_amount')):
                    update_sched_d_parent(
                        datum.get('cmte_id'),
                        datum.get('back_ref_transaction_id'),
                        datum.get('expenditure_amount'),
                        existing_exp
                    )            
                
            if datum.get('transaction_type_identifier') in SCHED_C_CHILD_LIST:
                logger.debug('existing exp:{}'.format(existing_exp))
                if float(existing_exp) != float(datum.get('expenditure_amount')):
                    update_sched_c_parent(
                        datum.get('cmte_id'),
                        datum.get('back_ref_transaction_id'),
                        datum.get('expenditure_amount'),
                        existing_exp
                    )
            
            if datum.get('transaction_type_identifier') in CHILD_SCHEDB_AUTO_UPDATE_PARENT_SCHEDA_DICT.keys():
                transaction_data = get_list_schedA_from_schedB(datum.get("report_id"), datum.get("cmte_id"), datum.get("back_ref_transaction_id"))[0]
                transaction_data['entity_id'] = entity_id 
                transaction_data['contribution_date'] = datum.get('expenditure_date') 
                transaction_data['contribution_amount'] = datum.get('expenditure_amount')
                transaction_data['election_code'] = datum.get('election_code')
                transaction_data['election_other_description'] = datum.get('election_other_description')
                transaction_data['donor_cmte_id'] = datum.get('beneficiary_cmte_id')
                transaction_data['donor_cmte_name'] = datum.get('beneficiary_cmte_name')
                put_sql_schedA_from_schedB(transaction_data.get('cmte_id'), transaction_data.get('report_id'), transaction_data.get('line_number'), transaction_data.get('transaction_type'), transaction_data.get('transaction_id'), transaction_data.get('back_ref_transaction_id'), transaction_data.get('back_ref_sched_name'), entity_id, transaction_data.get('contribution_date'), transaction_data.get(
                'contribution_amount'), transaction_data.get('purpose_description'), transaction_data.get('memo_code'), transaction_data.get('memo_text'), transaction_data.get('election_code'), transaction_data.get('election_other_description'), transaction_data.get('donor_cmte_id'), transaction_data.get('donor_cmte_name'), transaction_data.get('transaction_type_identifier'))
        except Exception as e:
            if flag:
                entity_data = put_entities(prev_entity_list[0])
            else:
                get_data = {"cmte_id": datum.get("cmte_id"), "entity_id": entity_id}
                remove_entities(get_data)
            raise Exception(
                "The put_sql_schedB function is throwing an error: " + str(e)
            )
        return datum
    except:
        raise


def delete_schedB(data):
    """
    delete current sched_b item
    """
    try:
        cmte_id = data.get("cmte_id")
        report_id = data.get("report_id")
        transaction_id = data.get("transaction_id")
        check_transaction_id(transaction_id)
        delete_sql_schedB(transaction_id, report_id, cmte_id)
        # delete_parent_child_link_sql_schedB(transaction_id, report_id, cmte_id)
    except:
        raise


def validate_negative_transaction(data):
    """
    validate transaction amount if negative transaction encounterred.
    """
    if data.get("transaction_type_identifier") in NEGATIVE_TRANSACTIONS:
        if not float(data.get("expenditure_amount")) < 0:
            raise Exception("current transaction amount need to be negative!")


def parent_transaction_exists(tran_id, sched_tp):
    """
    check if parent transaction exists
    """
    return transaction_exists(tran_id, sched_tp)


def validate_parent_transaction_exist(data):
    """
    validate parent transaction exsit if saving a child transaction
    """
    if data.get("transaction_type_identifier") in CHILD_PARENT_SB_SB_TRANSACTIONS:
        if not data.get("back_ref_transaction_id"):
            raise Exception("Error: parent transaction id missing.")
        elif not parent_transaction_exists(
            data.get("back_ref_transaction_id"),
            CHILD_PARENT_SB_SB_TRANSACTIONS.get(
                data.get("transaction_type_identifier")
            )[1],
        ):
            raise Exception("Error: parent transaction not found.")
        else:
            pass


def schedB_sql_dict(data):
    """
    build a formulated data dictionary based on loaded 
    json and validate some field data
    """
    try:
        validate_negative_transaction(data)
        validate_parent_transaction_exist(data)
        datum = {
            "line_number": data.get("line_number"),
            "transaction_type": data.get("transaction_type"),
            "transaction_type_identifier": data.get("transaction_type_identifier"),
            "back_ref_sched_name": data.get("back_ref_sched_name"),
            "expenditure_date": date_format(data.get("expenditure_date")),
            "expenditure_amount": check_decimal(data.get("expenditure_amount", None)),
            # "semi_annual_refund_bundled_amount": check_decimal(
            #     data.get("semi_annual_refund_bundled_amount", 0)
            # ),
            "expenditure_purpose": data.get("expenditure_purpose"),
            "category_code": data.get("category_code"),
            "memo_code": data.get("memo_code"),
            "memo_text": data.get("memo_text"),
            "election_code": data.get("election_code"),
            "election_other_description": data.get("election_other_description"),
            "beneficiary_cmte_id": data.get("beneficiary_cmte_id"),
            "beneficiary_cand_id": data.get("beneficiary_cand_id"),
            "other_name": data.get("other_name"),
            "other_street_1": data.get("other_street_1"),
            "other_street_2": data.get("other_street_2"),
            "other_city": data.get("other_city"),
            "other_state": data.get("other_state"),
            "other_zip": data.get("other_zip"),
            "nc_soft_account": data.get("nc_soft_account"),
            "beneficiary_cand_entity_id": data.get("beneficiary_cand_entity_id"),
            "beneficiary_cand_office": data.get("beneficiary_cand_office"),
            "beneficiary_cand_state": data.get("beneficiary_cand_state"),
            "beneficiary_cand_district": data.get("beneficiary_cand_district"),
            "beneficiary_cmte_name": data.get("beneficiary_cmte_name"),
            "beneficiary_cand_last_name": data.get("beneficiary_cand_last_name"),
            "beneficiary_cand_first_name": data.get("beneficiary_cand_first_name"),
            "beneficiary_cand_middle_name": data.get("beneficiary_cand_middle_name"),
            "beneficiary_cand_prefix": data.get("beneficiary_cand_prefix"),
            "beneficiary_cand_suffix": data.get("beneficiary_cand_suffix"),
            # "aggregate_amt": check_decimal(data.get("aggregate_amt", None)),
            "entity_type": data.get("entity_type"),
            "entity_name": data.get("entity_name"),
            "first_name": data.get("first_name"),
            "last_name": data.get("last_name"),
            "middle_name": data.get("middle_name"),
            "preffix": data.get("prefix"),
            "suffix": data.get("suffix"),
            "street_1": data.get("street_1"),
            "street_2": data.get("street_2"),
            "city": data.get("city"),
            "state": data.get("state"),
            "zip_code": data.get("zip_code"),
            "occupation": data.get("occupation"),
            "employer": data.get("employer"),
            "ref_cand_cmte_id": data.get("ref_cand_cmte_id"),
            "back_ref_transaction_id": data.get("back_ref_transaction_id"),
            # cand_entity_data
            "cand_office": data.get("cand_office"),
            "cand_office_state": data.get("cand_office_state"),
            "cand_office_district": data.get("cand_office_district"),
            # "beneficiary_cmte_name": data.get("beneficiary_cmte_name"),
            "cand_last_name": data.get("cand_last_name"),
            "cand_first_name": data.get("cand_first_name"),
            "cand_middle_name": data.get("cand_middle_name"),
            "cand_prefix": data.get("cand_prefix"),
            "cand_suffix": data.get("cand_suffix"),
            "cand_street_1": data.get("cand_street_1"),
            "cand_street_2": data.get("cand_street_2"),
            "cand_city": data.get("cand_city"),
            "cand_state": data.get("cand_state"),
            "cand_zip_code": data.get("cand_zip_code"),
            # levin transaction
            "levin_account_id": data.get("levin_account_id"),
        }
        if "aggregate_amt" in data and check_decimal(data.get("aggregate_amt")):
            datum["aggregate_amt"] = data.get("aggregate_amt")

        if "semi_annual_refund_bundled_amount" in data and check_decimal(
            data.get("semi_annual_refund_bundled_amount")
        ):
            datum["semi_annual_refund_bundled_amount"] = data.get(
                "semi_annual_refund_bundled_amount"
            )

        if "entity_id" in data and check_null_value(data.get("entity_id")):
            datum["entity_id"] = data.get("entity_id")
        datum["line_number"], datum["transaction_type"] = get_line_number_trans_type(
            data.get("transaction_type_identifier")
        )
        return datum
    except:
        raise


@api_view(["POST", "GET", "DELETE", "PUT"])
def schedB(request):
    """
    CRUD api for sched_b
    """
    global REQT_ELECTION_YR
    if request.method == "POST":
        if "election_year" in request.data:
            REQT_ELECTION_YR = request.data.get("election_year")
        if "election_year" in request.query_params:
            REQT_ELECTION_YR = request.query_params.get("election_year")
        try:
            cmte_id = request.user.username
            if not ("report_id" in request.data):
                raise Exception("Missing Input: Report_id is mandatory")
            if not('transaction_type_identifier' in request.data):
                raise Exception("Missing Input: transaction_type_identifier")
            # handling null,none value of report_id
            # TODO: can report_id be 0? what does it mean?
            if not (check_null_value(request.data.get("report_id"))):
                report_id = "0"
            else:
                report_id = check_report_id(request.data.get("report_id"))
            # end of handling
            datum = schedB_sql_dict(request.data)
            datum["report_id"] = report_id
            datum["cmte_id"] = cmte_id
            if "entity_id" in request.data and check_null_value(
                request.data.get("entity_id")
            ):
                datum["entity_id"] = request.data.get("entity_id")
            if "transaction_id" in request.data and check_null_value(
                request.data.get("transaction_id")
            ):
                datum["transaction_id"] = check_transaction_id(
                    request.data.get("transaction_id")
                )
                data = put_schedB(datum)
            else:
                data = post_schedB(datum)

            # Associating child transactions to parent and storing them to DB
            if "child" in request.data:
                children = check_type_list(request.data.get("child"))
                if len(children) > 0:
                    child_output = []
                    for child in children:
                        child_datum = schedB_sql_dict(child)
                        child_datum["back_ref_transaction_id"] = data.get(
                            "transaction_id"
                        )
                        child_datum["report_id"] = report_id
                        child_datum["cmte_id"] = cmte_id
                        if "entity_id" in child and check_null_value(
                            child.get("entity_id")
                        ):
                            child_datum["entity_id"] = child.get("entity_id")
                        if "transaction_id" in child and check_null_value(
                            child.get("transaction_id")
                        ):
                            child_datum["transaction_id"] = check_transaction_id(
                                child.get("transaction_id")
                            )
                            child_data = put_schedB(child_datum)
                        else:
                            child_data = post_schedB(child_datum)
            output = get_schedB(data)
            # for earmark child transaction: update parent transction  purpose_description
            if datum.get('transaction_type_identifier') in EARMARK_SB_CHILD_LIST:
                update_parent_purpose(datum)
            return JsonResponse(output[0], status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response(
                "The schedB API - POST is throwing an exception: " + str(e),
                status=status.HTTP_400_BAD_REQUEST,
            )

    # Get records from schedB table
    if request.method == "GET":
        if "election_year" in request.data:
            REQT_ELECTION_YR = request.data.get("election_year")
        if "election_year" in request.query_params:
            REQT_ELECTION_YR = request.query_params.get("election_year")

        try:
            data = {"cmte_id": request.user.username}
            if "report_id" in request.query_params and check_null_value(
                request.query_params.get("report_id")
            ):
                data["report_id"] = check_report_id(
                    request.query_params.get("report_id")
                )
            else:
                raise Exception("Missing Input: report_id is mandatory")
            if "transaction_id" in request.query_params and check_null_value(
                request.query_params.get("transaction_id")
            ):
                data["transaction_id"] = check_transaction_id(
                    request.query_params.get("transaction_id")
                )
            datum = get_schedB(data)
            # for obj in datum:
            #     obj.update({"api_call": "sb/schedB"})
            return JsonResponse(datum, status=status.HTTP_200_OK, safe=False)
        except NoOPError as e:
            logger.debug(e)
            forms_obj = []
            return JsonResponse(
                forms_obj, status=status.HTTP_204_NO_CONTENT, safe=False
            )
        except Exception as e:
            logger.debug(e)
            return Response(
                "The schedB API - GET is throwing an error: " + str(e),
                status=status.HTTP_400_BAD_REQUEST,
            )

    # Modify a single record from schedB table
    if request.method == "PUT":
        if "election_year" in request.data:
            REQT_ELECTION_YR = request.data.get("election_year")
        if "election_year" in request.query_params:
            REQT_ELECTION_YR = request.query_params.get("election_year")

        try:
            datum = schedB_sql_dict(request.data)

            if "transaction_id" in request.data and check_null_value(
                request.data.get("transaction_id")
            ):
                datum["transaction_id"] = check_transaction_id(
                    request.data.get("transaction_id")
                )
            else:
                raise Exception("Missing Input: transaction_id is mandatory")

            if not ("report_id" in request.data):
                raise Exception("Missing Input: Report_id is mandatory")
            # handling null,none value of report_id
            if not (check_null_value(request.data.get("report_id"))):
                report_id = "0"
            else:
                report_id = check_report_id(request.data.get("report_id"))
            # end of handling
            datum["report_id"] = report_id
            datum["back_ref_transaction_id"] = request.data.get(
                "back_ref_transaction_id"
            )
            datum["cmte_id"] = request.user.username

            if "entity_id" in request.data and check_null_value(
                request.data.get("entity_id")
            ):
                datum["entity_id"] = request.data.get("entity_id")

            data = put_schedB(datum)
            output = get_schedB(data)
            # for earmark child transaction: update parent transction  purpose_description
            if datum.get('transaction_type_identifier') in EARMARK_SB_CHILD_LIST:
                update_parent_purpose(datum)
            return JsonResponse(output[0], status=status.HTTP_201_CREATED)

        except Exception as e:
            logger.debug(e)
            return Response(
                "The schedB API - PUT is throwing an error: " + str(e),
                status=status.HTTP_400_BAD_REQUEST,
            )

    # Delete a single record from schedB table
    if request.method == "DELETE":

        try:
            data = {"cmte_id": request.user.username}
            if "report_id" in request.query_params and check_null_value(
                request.query_params.get("report_id")
            ):
                data["report_id"] = check_report_id(
                    request.query_params.get("report_id")
                )
            else:
                raise Exception("Missing Input: report_id is mandatory")
            if "transaction_id" in request.query_params and check_null_value(
                request.query_params.get("transaction_id")
            ):
                data["transaction_id"] = check_transaction_id(
                    request.query_params.get("transaction_id")
                )
            else:
                raise Exception("Missing Input: transaction_id is mandatory")
            delete_schedB(data)
            return Response(
                "The Transaction ID: {} has been successfully deleted".format(
                    data.get("transaction_id")
                ),
                status=status.HTTP_201_CREATED,
            )
        except Exception as e:
            logger.debug(e)
            return Response(
                "The schedB API - DELETE is throwing an error: " + str(e),
                status=status.HTTP_400_BAD_REQUEST,
            )

def get_list_schedA_from_schedB(report_id, cmte_id, transaction_id = None, include_deleted_trans_flag = False):

    try:
        with connection.cursor() as cursor:
            # GET single row from schedA table
            if transaction_id:
                if not include_deleted_trans_flag:
                    query_string = """SELECT cmte_id, report_id, line_number, transaction_type, transaction_id, back_ref_transaction_id, back_ref_sched_name, entity_id, contribution_date, contribution_amount, aggregate_amt AS "contribution_aggregate", purpose_description, memo_code, memo_text, election_code, election_other_description, create_date, donor_cmte_id, donor_cmte_name, transaction_type_identifier
                                    FROM public.sched_a WHERE report_id = %s AND cmte_id = %s AND transaction_id = %s AND delete_ind is distinct from 'Y'"""
                else:
                    query_string = """SELECT cmte_id, report_id, line_number, transaction_type, transaction_id, back_ref_transaction_id, back_ref_sched_name, entity_id, contribution_date, contribution_amount, aggregate_amt AS "contribution_aggregate", purpose_description, memo_code, memo_text, election_code, election_other_description, create_date, donor_cmte_id, donor_cmte_name, transaction_type_identifier
                                    FROM public.sched_a WHERE report_id = %s AND cmte_id = %s AND transaction_id = %s"""

                cursor.execute("""SELECT json_agg(t) FROM (""" + query_string +
                            """) t""", [report_id, cmte_id, transaction_id])
            else:
                if not include_deleted_trans_flag:
                    query_string = """SELECT entity_id, cmte_id, report_id, line_number, transaction_type, transaction_id, back_ref_transaction_id, back_ref_sched_name, contribution_date, contribution_amount, aggregate_amt AS "contribution_aggregate", purpose_description, memo_code, memo_text, election_code, election_other_description, create_date, donor_cmte_id, donor_cmte_name, transaction_type_identifier
                                FROM public.sched_a WHERE report_id = %s AND cmte_id = %s AND delete_ind is distinct from 'Y' ORDER BY transaction_id DESC"""
                else:
                    query_string = """SELECT entity_id, cmte_id, report_id, line_number, transaction_type, transaction_id, back_ref_transaction_id, back_ref_sched_name, contribution_date, contribution_amount, aggregate_amt AS "contribution_aggregate", purpose_description, memo_code, memo_text, election_code, election_other_description, create_date, donor_cmte_id, donor_cmte_name, transaction_type_identifier
                                FROM public.sched_a WHERE report_id = %s AND cmte_id = %s ORDER BY transaction_id DESC"""

                cursor.execute("""SELECT json_agg(t) FROM (""" +
                           query_string + """) t""", [report_id, cmte_id])           
            print(cursor.query)
            schedA_list = cursor.fetchone()[0]
            if not schedA_list:
                raise NoOPError(
                    'No transaction found for cmte_id {} and report_id {}'.format(cmte_id, report_id))
            merged_list = []
            for dictA in schedA_list:
                entity_id = dictA.get('entity_id')
                data = {
                    'entity_id': entity_id,
                    'cmte_id': cmte_id
                }
                entity_list = get_entities(data)
                dictEntity = entity_list[0]
                merged_dict = {**dictA, **dictEntity}
                merged_list.append(merged_dict)
        return merged_list
    except Exception:
        raise