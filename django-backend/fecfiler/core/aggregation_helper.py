import logging
import datetime
import requests

# from functools import lru_cache
from django.db import connection
from fecfiler.core.transaction_util import do_transaction

# from fecfiler.core.views import get_entities, NoOPError, superceded_report_id_list
# import datetime

logger = logging.getLogger(__name__)


def date_format(cvg_date):
    try:
        if cvg_date == None or cvg_date in ["none", "null", " ", ""]:
            return None
        cvg_dt = datetime.datetime.strptime(cvg_date, "%Y-%m-%d").date()
        return cvg_dt
    except:
        raise


def find_form_type(report_id, cmte_id):
    """
    load form type based on report_id and cmte_id
    """
    try:
        # handling cases where report_id is reported as 0
        if report_id in ["0", "0", 0]:
            return "F3X"
        # end of error handling
        with connection.cursor() as cursor:
            cursor.execute(
                """SELECT form_type FROM public.reports WHERE report_id = %s AND cmte_id = %s AND delete_ind is distinct from 'Y'""",
                [report_id, cmte_id],
            )
            form_types = cursor.fetchone()
        if cursor.rowcount == 0:
            raise Exception(
                "The Report ID: {} is either already deleted or does not exist in reports table".format(
                    report_id
                )
            )
        else:
            return form_types[0]
    except Exception as e:
        raise Exception("The form_type function is throwing an error:" + str(e))


def list_all_transactions_entity_sl(
    aggregate_start_date, aggregate_end_date, entity_id, cmte_id, levin_account_id
):
    """
    load all transactions for an entity within a time window
    return value: a list of transction_records [
       (contribution_amount, transaction_id, report_id, line_number, contribution_date),
       ....
    ]
    return items are sorted by contribution_date in ASC order
    """
    logger.debug(
        "fetching transactions for entity {} and levin acct {}".format(
            entity_id, levin_account_id
        )
    )
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                """
            SELECT t1.contribution_amount, 
                t1.transaction_id, 
                t1.report_id, 
                t1.line_number, 
                t1.contribution_date, 
                (SELECT t2.delete_ind FROM public.reports t2 WHERE t2.report_id = t1.report_id), 
                t1.memo_code, 
                t1.back_ref_transaction_id,
                t1.transaction_type_identifier
            FROM public.sched_a t1 
            WHERE entity_id = %s 
            AND cmte_id = %s 
            AND contribution_date >= %s 
            AND contribution_date <= %s
            AND levin_account_id = %s 
            AND delete_ind is distinct FROM 'Y' 
            ORDER BY contribution_date ASC, create_date ASC
            """,
                [
                    entity_id,
                    cmte_id,
                    aggregate_start_date,
                    aggregate_end_date,
                    levin_account_id,
                ],
            )
            transactions_list = cursor.fetchall()
        logger.debug("transaction list loaded.")
        return transactions_list
    except Exception as e:
        raise Exception(
            "The list_all_transactions_entity function is throwing an error: " + str(e)
        )


def put_sql_agg_amount_schedA(cmte_id, transaction_id, aggregate_amount):
    """
    update aggregate amount
    """
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                """UPDATE public.sched_a SET aggregate_amt = %s WHERE transaction_id = %s AND cmte_id = %s AND delete_ind is distinct from 'Y'""",
                [aggregate_amount, transaction_id, cmte_id],
            )
            if cursor.rowcount == 0:
                raise Exception(
                    "put_sql_agg_amount_schedA function: The Transaction ID: {} does not exist in schedA table".format(
                        transaction_id
                    )
                )
        logger.debug(
            "***put_sql_agg_amount_schedA done with:{}".format(aggregate_amount)
        )
    except Exception:
        raise


def update_aggregate_sl(datum):
    """
    helper function for updating private contribution line number based on aggrgate amount
    the aggregate amount is a contribution_date-based incremental update, the line number
    is updated accordingly:
    edit 1: check if the report corresponding to the transaction is deleted or not (delete_ind flag in reports table) 
            and only when it is NOT add contribution_amount to aggregate amount
    edit 2: updation of aggregate amount will roll to all transacctions irrespective of report id and report being filed
    edit 3: if back_ref_transaction_id is none, then check if memo_code is NOT 'X' and if it is not, add contribution_amount to aggregate amount; 
            if back_ref_transaction_id is NOT none, then add irrespective of memo_code, add contribution_amount to aggregate amount
    e.g.
    date, contribution_amount, aggregate_amount, line_number
    1/1/2018, 50, 50
    2/1/2018, 60, 110
    3/1/2018, 100, 210 (aggregate_amount > 200, transaction becomes itemized)
    """
    logger.debug("update sla aggregate with data {}".format(datum))
    try:
        # logger("update sla aggregate with data {}".format(datum))
        cmte_id = datum.get("cmte_id")
        report_id = datum.get("report_id")
        entity_id = datum.get("entity_id")
        levin_account_id = datum.get("levin_account_id")
        contribution_date = datum.get("contribution_date")
        child_flag_SB = False
        child_flag_SA = False
        itemization_value = 200
        # itemized_transaction_list = []
        # unitemized_transaction_list = []
        form_type = find_form_type(report_id, cmte_id)
        if isinstance(contribution_date, str):
            contribution_date = date_format(contribution_date)
        aggregate_start_date, aggregate_end_date = find_aggregate_date(
            form_type, contribution_date
        )
        # checking for child tranaction identifer for updating auto generated SB transactions
        # if transaction_type_identifier in AUTO_GENERATE_SCHEDB_PARENT_CHILD_TRANSTYPE_DICT:
        #     child_flag_SB = True
        #     child_transaction_type_identifier = AUTO_GENERATE_SCHEDB_PARENT_CHILD_TRANSTYPE_DICT.get(transaction_type_identifier)
        # checking for child tranaction identifer for updating auto generated SA transactions
        # if transaction_type_identifier in AUTO_GENERATE_SCHEDA_PARENT_CHILD_TRANSTYPE_DICT:
        #     child_flag_SA = True
        #     child_transaction_type_identifier = AUTO_GENERATE_SCHEDA_PARENT_CHILD_TRANSTYPE_DICT.get(transaction_type_identifier)
        # make sure transaction list comes back sorted by contribution_date ASC
        transactions_list = list_all_transactions_entity_sl(
            aggregate_start_date,
            aggregate_end_date,
            entity_id,
            cmte_id,
            levin_account_id,
        )
        print("transaction list:{}".format(transactions_list))
        # put field here
        #    for quick reference
        #      SELECT t1.contribution_amount, 0
        # t1.transaction_id, 1
        # t1.report_id, 2
        # t1.line_number, 3
        # t1.contribution_date, 4
        # (SELECT t2.delete_ind FROM public.reports t2 WHERE t2.report_id = t1.report_id), 5
        # t1.memo_code, 6
        # t1.back_ref_transaction_id,  7
        # t1.transaction_type_identifier  8
        aggregate_amount = 0
        # PAC_aggregate_amount = 0
        # HQ_aggregate_amount = 0
        # CO_aggregate_amount = 0
        # NPRE_aggregate_amount = 0
        # RE_aggregate_amount = 0
        # REMAIN_aggregate_amount = 0
        # committee_type = cmte_type(cmte_id)
        for transaction in transactions_list:
            # checking in reports table if the delete_ind flag is false for the corresponding report
            if transaction[5] != "Y":
                # checking if the back_ref_transaction_id is null or not.
                # If back_ref_transaction_id is none, checking if the transaction is a memo or not, using memo_code not equal to X.
                if transaction[7] != None or (
                    transaction[7] == None and transaction[6] != "X"
                ):
                    aggregate_amount += transaction[0]

                    # if (committee_type == 'PAC') and transaction[8] in PAC_AGGREGATE_TYPES_1:
                    #     PAC_aggregate_amount += transaction[0]
                    #     aggregate_amount = PAC_aggregate_amount
                    # elif (committee_type == 'PTY') and transaction[8] in PTY_AGGREGATE_TYPES_HQ:
                    #     HQ_aggregate_amount += transaction[0]
                    #     aggregate_amount = HQ_aggregate_amount
                    # elif (committee_type == 'PTY') and transaction[8] in PTY_AGGREGATE_TYPES_CO:
                    #     CO_aggregate_amount += transaction[0]
                    #     aggregate_amount = CO_aggregate_amount
                    # elif (committee_type == 'PTY') and transaction[8] in PTY_AGGREGATE_TYPES_NPRE:
                    #     NPRE_aggregate_amount += transaction[0]
                    #     aggregate_amount = NPRE_aggregate_amount
                    # elif (committee_type == 'PTY') and transaction[8] in PTY_AGGREGATE_TYPES_RE:
                    #     RE_aggregate_amount += transaction[0]
                    #     aggregate_amount = RE_aggregate_amount
                    # else:
                    #     REMAIN_aggregate_amount += transaction[0]
                    #     aggregate_amount = REMAIN_aggregate_amount
                # Removed report_id constraint as we have to modify aggregate amount irrespective of report_id
                # if str(report_id) == str(transaction[2]):
                if contribution_date <= transaction[4]:
                    transaction_id = transaction[1]
                    # line_number,itemized_ind = get_linenumber_itemization(transaction[8], aggregate_amount, itemization_value, transaction[3])
                    # put_sql_agg_amount_sl(cmte_id, transaction_id, aggregate_amount)
                    put_sql_agg_amount_schedA(cmte_id, transaction_id, aggregate_amount)

                # Updating aggregate amount to child auto generate sched A transactions
                # if child_flag_SA:
                #     child_SA_transaction_list = get_list_child_schedA(report_id, cmte_id, transaction[1])
                #     for child_SA_transaction in child_SA_transaction_list:
                #         put_sql_agg_amount_schedA(cmte_id, child_SA_transaction.get('transaction_id'), aggregate_amount)
                # #Updating aggregate amount to child auto generate sched B transactions
                # if child_flag_SB:
                #     child_SB_transaction_list = get_list_child_transactionId_schedB(cmte_id, transaction[1])
                #     for child_SB_transaction in child_SB_transaction_list:
                #         put_sql_agg_amount_schedB(cmte_id, child_SB_transaction[0], aggregate_amount)

    except Exception as e:
        raise Exception(
            "The update_aggregate_sl function is throwing an error: " + str(e)
        )


def find_aggregate_date(form_type, contribution_date):
    """
    calculate aggregate start, end dates
    # TODO: do we need checking form_type here.
    """
    try:
        aggregate_start_date = None
        if form_type == "F3X":
            year = contribution_date.year
            aggregate_start_date = datetime.date(year, 1, 1)
            aggregate_end_date = datetime.date(year, 12, 31)
        return aggregate_start_date, aggregate_end_date
    except Exception as e:
        raise Exception(
            "The aggregate_start_date function is throwing an error: " + str(e)
        )


def get_transactions_election_and_office(start_date, end_date, data):
    """
    load all transactions by electtion code and office within the date range.
    - for president election: election_code + office
    - for senate electtion: election_code + office + state
    - for house: election_code + office + state + district

    when both dissemination_date and disbursement_date are available, 
    we take priority on dissemination_date 
    """
    _sql = ""
    _params = set([])
    cand_office = data.get("so_cand_office", data.get("cand_office"))
    if cand_office == "P":
        _sql = """
        SELECT  
                transaction_id, 
				expenditure_amount as transaction_amt,
				COALESCE(dissemination_date, disbursement_date) as transaction_dt
        FROM public.sched_e
        WHERE  
            cmte_id = %s
            AND COALESCE(dissemination_date, disbursement_date) >= %s
            AND COALESCE(dissemination_date, disbursement_date) <= %s
            AND election_code = %s
            AND delete_ind is distinct FROM 'Y' 
            ORDER BY transaction_dt ASC, create_date ASC;
        """
        _params = (data.get("cmte_id"), start_date, end_date, data.get("election_code"))
    elif cand_office == "S":
        _sql = """
        SELECT  
                transaction_id, 
				expenditure_amount as transaction_amt,
                COALESCE(dissemination_date, disbursement_date) as transaction_dt
        FROM public.sched_e
        WHERE  
            cmte_id = %s
            AND COALESCE(dissemination_date, disbursement_date) >= %s
            AND COALESCE(dissemination_date, disbursement_date) <= %s
            AND election_code = %s
            AND so_cand_state = %s
            AND delete_ind is distinct FROM 'Y' 
            ORDER BY transaction_dt ASC, create_date ASC; 
        """
        _params = (
            data.get("cmte_id"),
            start_date,
            end_date,
            data.get("election_code"),
            data.get("so_cand_state"),
        )
    elif cand_office == "H":
        _sql = """
        SELECT  
                transaction_id, 
				expenditure_amount as transaction_amt,
				COALESCE(dissemination_date, disbursement_date) as transaction_dt
        FROM public.sched_e
        WHERE  
            cmte_id = %s
            AND COALESCE(dissemination_date, disbursement_date) >= %s
            AND COALESCE(dissemination_date, disbursement_date) <= %s
            AND election_code = %s
            AND so_cand_state = %s
            AND so_cand_district = %s
            AND delete_ind is distinct FROM 'Y' 
            ORDER BY transaction_dt ASC, create_date ASC;  
        """
        _params = (
            data.get("cmte_id"),
            start_date,
            end_date,
            data.get("election_code"),
            data.get("so_cand_state"),
            data.get("so_cand_district"),
        )

    try:
        with connection.cursor() as cursor:
            cursor.execute(_sql, _params)
            transactions_list = cursor.fetchall()
        return transactions_list
    except Exception as e:
        raise Exception(
            "Getting transactions for election and office is throwing an error: "
            + str(e)
        )


def update_aggregate_on_transaction(
    cmte_id, report_id, transaction_id, aggregate_amount
):
    """
    update transaction with updated aggregate amount
    """
    # print(transaction_id)
    # print(aggregate_amount)
    try:
        _sql = """
        UPDATE public.sched_e
        SET calendar_ytd_amount= %s
        WHERE transaction_id = %s AND cmte_id = %s 
        AND delete_ind is distinct from 'Y'
        """
        do_transaction(_sql, (aggregate_amount, transaction_id, cmte_id))
    except Exception as e:
        raise Exception(
            """error on update aggregate amount
                        for transaction:{}""".format(
                transaction_id
            )
        )


def update_aggregate_se(data):
    """
    update related se aggrgate amount

    """
    try:
        # itemization_value = 200
        cmte_id = data.get("cmte_id")
        report_id = data.get("report_id")
        form_type = find_form_type(report_id, cmte_id)
        # dissemination_date take priority
        if data.get("dissemination_date"):
            trans_dt = date_format(data.get("dissemination_date"))
        else:
            trans_dt = date_format(data.get("disbursement_date"))

        # if isinstance(contribution_date, str):
        # contribution_date = date_format(contribution_date)
        aggregate_start_date, aggregate_end_date = find_aggregate_date(
            form_type, trans_dt
        )
        # checking for child tranaction identifer for updating auto generated SB transactions
        # if transaction_type_identifier in AUTO_GENERATE_SCHEDB_PARENT_CHILD_TRANSTYPE_DICT.keys():
        #     child_flag = True
        #     child_transaction_type_identifier = AUTO_GENERATE_SCHEDB_PARENT_CHILD_TRANSTYPE_DICT.get(transaction_type_identifier)
        # make sure transaction list comes back sorted by contribution_date ASC
        # transactions_list = list_all_transactions_entity(
        #     aggregate_start_date,
        #     aggregate_end_date,
        #     transaction_type_identifier,
        #     entity_id,
        #     cmte_id,
        # )
        transaction_list = get_transactions_election_and_office(
            aggregate_start_date, aggregate_end_date, data
        )
        aggregate_amount = 0
        for transaction in transaction_list:
            aggregate_amount += transaction[1]
            logger.debug(
                "update aggregate amount for transaction:{}".format(transaction[0])
            )
            logger.debug("current aggregate amount:{}".format(aggregate_amount))
            update_aggregate_on_transaction(
                cmte_id, report_id, transaction[0], aggregate_amount
            )
            # # checking in reports table if the delete_ind flag is false for the corresponding report
            # if transaction[5] != 'Y':
            #     # checking if the back_ref_transaction_id is null or not.
            #     # If back_ref_transaction_id is none, checking if the transaction is a memo or not, using memo_code not equal to X.
            #     if (transaction[7]!= None or (transaction[7] == None and transaction[6] != 'X')):
            #         aggregate_amount += transaction[0]
            #     # Removed report_id constraint as we have to modify aggregate amount irrespective of report_id
            #     # if str(report_id) == str(transaction[2]):
            #     if contribution_date <= transaction[4]:
            #         line_number = get_linenumber_itemization(transaction_type_identifier, aggregate_amount, itemization_value, transaction[3])
            #         put_sql_linenumber_schedA(cmte_id, line_number, transaction[1], entity_id, aggregate_amount)

            #     #Updating aggregate amount to child auto generate sched B transactions
            #     if child_flag:
            #         child_SB_transaction_list = get_list_child_transactionId_schedB(cmte_id, transaction[1])
            #         for child_SB_transaction in child_SB_transaction_list:
            #             put_sql_agg_amount_schedB(cmte_id, child_SB_transaction[0], aggregate_amount)

    except Exception as e:
        raise Exception(
            "The update aggregate amount for sched_e is throwing an error: " + str(e)
        )


def load_schedE(cmte_id, report_id, transaction_id):
    """
    get one sched_e item with tran_id
    """
    try:
        with connection.cursor() as cursor:
            # GET single row from schedA table
            _sql = """SELECT json_agg(t) FROM ( SELECT
            cmte_id,
            report_id,
            transaction_type_identifier,
            transaction_id,
            back_ref_transaction_id,
            back_ref_sched_name,
            payee_entity_id,
            election_code,
            election_other_desc,
            dissemination_date,
            expenditure_amount,
            disbursement_date,
            calendar_ytd_amount,
            purpose,
            category_code,
            payee_cmte_id,
            support_oppose_code,
            so_cand_id,
            so_cand_last_name,
            so_cand_first_name,
            so_cand_middle_name,
            so_cand_prefix,
            so_cand_suffix,
            so_cand_office,
            so_cand_district,
            so_cand_state,
            completing_entity_id,
            date_signed,
            memo_code,
            memo_text,
            line_number,
            create_date, 
            last_update_date
            FROM public.sched_e
            WHERE cmte_id = %s
            AND report_id = %s
            AND transaction_id = %s) t 
            """
            # if is_back_ref:
            #     _sql = _sql + """ AND back_ref_transaction_id = %s) t"""
            # else:
            #     _sql = _sql + """ AND transaction_id = %s) t"""
            cursor.execute(_sql, (cmte_id, report_id, transaction_id))
            schedE_list = cursor.fetchone()[0]
            if schedE_list is None:
                raise Exception(
                    "No sched_e transaction found for transaction_id {}".format(
                        transaction_id
                    )
                )
            return schedE_list
        #     merged_list = []
        #     if schedE_list:
        #         for dictE in schedE_list:
        #             merged_list.append(dictE)
        # return merged_list
    except Exception:
        raise


def get_election_year(office_sought, election_state, election_district):
    try:
        if office_sought == "P":
            param_string = "&office_sought={}".format(office_sought)
            add_year = 4
        elif office_sought == "S":
            param_string = "&office_sought={}&election_state={}".format(
                office_sought, election_state
            )
            add_year = 6
        elif office_sought == "H":
            param_string = "&office_sought={}&election_state={}&election_district={}".format(
                office_sought, election_state, election_district
            )
            add_year = 2
        else:
            raise Exception("office_sought can only take P,S,H values")
        i = 1
        results = []
        election_year_list = []
        while True:
            ab = requests.get(
                "https://api.open.fec.gov/v1/election-dates/?sort=-election_date&api_key=50nTHLLMcu3XSSzLnB0hax2Jg5LFniladU5Yf25j&page={}&per_page=100&sort_hide_null=false&sort_nulls_last=false{}".format(
                    i, param_string
                )
            )
            results = results + ab.json()["results"]
            if (
                i == ab.json()["pagination"]["pages"]
                or ab.json()["pagination"]["pages"] == 0
            ):
                break
            else:
                i += 1
        logger.debug("count of FEC election dates API:" + str(len(results)))
        for result in results:
            if result["election_year"] not in election_year_list:
                election_year_list.append(result["election_year"])
        if election_year_list:
            election_year_list.sort(reverse=True)
            if election_year_list[0] + add_year >= datetime.datetime.now().year:
                election_year_list.insert(0, election_year_list[0] + add_year)
        return election_year_list
    except Exception as e:
        logger.debug(e)
        raise Exception(
            "The get_election_year function is throwing an error: " + str(e)
        )


def agg_dates(cmte_id, beneficiary_cand_id, expenditure_date):
    try:
        start_date = None
        end_date = None
        with connection.cursor() as cursor:
            cursor.execute(
                """SELECT json_agg(t) FROM (SELECT e.cand_office, e.cand_office_state, e.cand_office_district FROM public.entity e 
                WHERE e.cmte_id in ('C00000000') 
                AND substr(e.ref_cand_cmte_id,1,1) != 'C' AND e.ref_cand_cmte_id = %s AND e.delete_ind is distinct from 'Y') as t""",
                [beneficiary_cand_id],
            )
            # print(cursor.query)
            cand = cursor.fetchone()[0]
            logger.debug("Candidate Office Data: " + str(cand))
        if cand:
            cand = cand[0]
            if cand["cand_office"] == "H":
                add_year = 1
                if not (cand["cand_office_state"] and cand["cand_office_district"]):
                    raise Exception(
                        "The candidate details for candidate Id: {} are missing: office state and district".format(
                            beneficiary_cand_id
                        )
                    )
            elif cand["cand_office"] == "S":
                add_year = 5
                if not cand["cand_office_state"]:
                    raise Exception(
                        "The candidate details for candidate Id: {} are missing: office state".format(
                            beneficiary_cand_id
                        )
                    )
                cand["cand_office_district"] = None
            elif cand["cand_office"] == "P":
                add_year = 3
                cand["cand_office_state"] = None
                cand["cand_office_district"] = None
            else:
                raise Exception(
                    "The candidate id: {} does not belong to either Senate, House or Presidential office. Kindly check cand_office in entity table for details".format(
                        beneficiary_cand_id
                    )
                )
        else:
            raise Exception(
                "The candidate Id: {} is not present in the entity table.".format(
                    beneficiary_cand_id
                )
            )
        election_year_list = get_election_year(
            cand["cand_office"], cand["cand_office_state"], cand["cand_office_district"]
        )
        logger.debug("Election years based on FEC API:" + str(election_year_list))
        expenditure_year = (
            datetime.datetime.strptime(expenditure_date, "%m/%d/%Y").date().year
        )
        if len(election_year_list) >= 2:
            for i, val in enumerate(election_year_list):
                if i == len(election_year_list) - 2:
                    break
                if (
                    election_year_list[i + 1] < expenditure_year
                    and expenditure_year <= election_year_list[i]
                ):
                    end_date = datetime.date(election_year_list[i], 12, 31)
                    start_year = election_year_list[i] - add_year
                    start_date = datetime.date(start_year, 1, 1)
        if not end_date:
            if datetime.datetime.now().year % 2 == 1:
                end_year = datetime.datetime.now().year + add_year
                end_date = datetime.date(end_year, 12, 31)
                start_date = datetime.date(datetime.datetime.now().year, 1, 1)
            else:
                end_date = datetime.date(datetime.datetime.now().year, 12, 31)
                start_year = datetime.datetime.now().year - add_year
                start_date = datetime.date(start_year, 1, 1)
        return start_date, end_date
    except Exception as e:
        logger.debug(e)
        raise Exception("The agg_dates function is throwing an error: " + str(e))


def get_SF_transactions_candidate(start_date, end_date, beneficiary_cand_id):
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                """SELECT json_agg(t) FROM (SELECT t1.transaction_id, t1.expenditure_date, t1.expenditure_amount, 
                t1.aggregate_general_elec_exp, t1.memo_code FROM public.sched_f t1 WHERE t1.payee_cand_id = %s AND t1.expenditure_date >= %s AND 
                t1.expenditure_date <= %s AND t1.delete_ind is distinct FROM 'Y' 
                AND (SELECT t2.delete_ind FROM public.reports t2 WHERE t2.report_id = t1.report_id) is distinct FROM 'Y'
                ORDER BY t1.expenditure_date ASC, t1.create_date ASC) t""",
                [beneficiary_cand_id, start_date, end_date],
            )
            if cursor.rowcount == 0:
                transaction_list = []
            else:
                transaction_list = cursor.fetchall()[0][0]
        logger.debug(transaction_list)
        return transaction_list
    except Exception as e:
        logger.debug(e)
        raise Exception(
            "The get_SF_transactions_candidate function is throwing an error: " + str(e)
        )


def update_aggregate_sf(cmte_id, beneficiary_cand_id, expenditure_date):
    try:
        aggregate_amount = 0.0
        # expenditure_date = datetime.datetime.strptime(expenditure_date, '%Y-%m-%d').date()
        cvg_start_date, cvg_end_date = agg_dates(
            cmte_id, beneficiary_cand_id, expenditure_date
        )
        transaction_list = get_SF_transactions_candidate(
            cvg_start_date, cvg_end_date, beneficiary_cand_id
        )
        for transaction in transaction_list:
            if transaction["memo_code"] != "X":
                aggregate_amount += float(transaction["expenditure_amount"])
            if transaction["expenditure_date"] >= expenditure_date:
                put_aggregate_SF(aggregate_amount, transaction["transaction_id"])
    except Exception as e:
        logger.debug(e)
        raise Exception(
            "The update_aggregate_general_elec_exp API is throwing an error: " + str(e)
        )


def put_aggregate_SF(aggregate_general_elec_exp, transaction_id):
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                "UPDATE public.sched_f SET aggregate_general_elec_exp = %s WHERE transaction_id = %s",
                [aggregate_general_elec_exp, transaction_id],
            )
            if cursor.rowcount == 0:
                raise Exception(
                    "The Transaction ID: {} does not exist in schedF table".format(
                        transaction_id
                    )
                )
    except Exception as e:
        logger.debug(e)
        raise Exception("The put_aggregate_SF function is throwing an error: " + str(e))


def load_schedF(cmte_id, report_id, transaction_id):
    try:
        with connection.cursor() as cursor:
            # GET single row from schedA table
            _sql = """SELECT json_agg(t) FROM ( SELECT
            sf.cmte_id,
            sf.report_id,
            sf.transaction_type_identifier,
            sf.transaction_id, 
            sf.back_ref_transaction_id,
            sf.back_ref_sched_name,
            sf.coordinated_exp_ind,
            sf.designating_cmte_id,
            sf.designating_cmte_name,
            sf.subordinate_cmte_id,
            sf.subordinate_cmte_name,
            sf.subordinate_cmte_street_1,
            sf.subordinate_cmte_street_2,
            sf.subordinate_cmte_city,
            sf.subordinate_cmte_state,
            sf.subordinate_cmte_zip,
            sf.payee_entity_id as entity_id,
            sf.expenditure_date,
            sf.expenditure_amount,
            sf.aggregate_general_elec_exp,
            sf.purpose,
            sf.category_code,
            sf.payee_cmte_id,
            sf.payee_cand_id as beneficiary_cand_id,
            sf.payee_cand_last_name as cand_last_name,
            sf.payee_cand_fist_name as cand_first_name,
            sf.payee_cand_middle_name as cand_middle_name,
            sf.payee_cand_prefix as cand_prefix,
            sf.payee_cand_suffix as cand_suffix,
            sf.payee_cand_office as cand_office,
            sf.payee_cand_state as cand_office_state,
            sf.payee_cand_district as cand_office_district,
            sf.memo_code,
            sf.memo_text,
            sf.delete_ind,
            sf.create_date,
            sf.last_update_date,
            (SELECT DISTINCT ON (e.ref_cand_cmte_id) e.entity_id 
            FROM public.entity e WHERE e.entity_id not in (select ex.entity_id from excluded_entity ex where ex.cmte_id = sf.cmte_id) 
                        AND substr(e.ref_cand_cmte_id,1,1) != 'C' AND e.ref_cand_cmte_id = sf.payee_cand_id AND e.delete_ind is distinct from 'Y'
                        ORDER BY e.ref_cand_cmte_id DESC, e.entity_id DESC) AS beneficiary_cand_entity_id
            FROM public.sched_f sf
            WHERE sf.report_id = %s AND sf.cmte_id = %s AND sf.transaction_id = %s
            ) t
            """
            cursor.execute(_sql, (report_id, cmte_id, transaction_id))
            schedF_list = cursor.fetchone()[0]
            if schedF_list is None:
                raise Exception(
                    "No sched_f transaction found for transaction_id {}".format(
                        transaction_id
                    )
                )
            return schedF_list
            # merged_list = []
        #     for dictF in schedF_list:
        #         entity_id = dictF.get("entity_id")
        #         data = {"entity_id": entity_id, "cmte_id": cmte_id}
        #         entity_list = get_entities(data)
        #         dictEntity = entity_list[0]
        #         del dictEntity["cand_office"]
        #         del dictEntity["cand_office_state"]
        #         del dictEntity["cand_office_district"]
        #         merged_dict = {**dictF, **dictEntity}
        #         merged_list.append(merged_dict)
        # return merged_list
    except Exception:
        raise


def load_schedH6(cmte_id, report_id, transaction_id):
    try:
        with connection.cursor() as cursor:
            # GET single row from schedH6 table
            _sql = """SELECT json_agg(t) FROM ( SELECT
            cmte_id,
            report_id,
            line_number,
            transaction_type_identifier,
            transaction_type,
            transaction_id ,
            back_ref_transaction_id,
            back_ref_sched_name,
            entity_id,
            account_event_identifier,
            expenditure_date,
            total_fed_levin_amount,
            federal_share,
            levin_share,
            activity_event_total_ytd,
            expenditure_purpose,
            category_code,
            activity_event_type,
            memo_code,
            memo_text,
            create_date,
            last_update_date
            FROM public.sched_h6
            WHERE report_id = %s AND cmte_id = %s AND transaction_id = %s
            ) t
            """
            cursor.execute(_sql, (report_id, cmte_id, transaction_id))
            schedH6_list = cursor.fetchone()[0]
            if schedH6_list is None:
                raise Exception(
                    "No sched_H6 transaction found for transaction_id {}".format(
                        transaction_id
                    )
                )
            return schedH6_list
        #     merged_list = []
        #     for tran in schedH6_list:
        #         entity_id = tran.get("entity_id")
        #         q_data = {"entity_id": entity_id, "cmte_id": cmte_id}
        #         dictEntity = get_entities(q_data)[0]
        #         merged_list.append({**tran, **dictEntity})
        # return merged_list
    except Exception:
        raise


def load_schedH4(cmte_id, report_id, transaction_id):
    try:
        logger.debug(
            "loading h4 item with cmte_id {}, report_id {}, transaction_id {}".format(
                cmte_id, report_id, transaction_id
            )
        )
        with connection.cursor() as cursor:
            # GET single row from schedH4 table
            _sql = """SELECT json_agg(t) FROM ( SELECT
            cmte_id,
            report_id,
            transaction_type_identifier,
            transaction_id,
            back_ref_transaction_id,
            back_ref_sched_name,
            payee_entity_id,
            activity_event_identifier,
            expenditure_date,
            fed_share_amount,
            non_fed_share_amount,
            total_amount,
            activity_event_amount_ytd,
            purpose,
            category_code,
            activity_event_type,
            memo_code,
            memo_text,
            line_number,
            transaction_type,
            create_date,
            last_update_date
            FROM public.sched_h4
            WHERE report_id = %s AND cmte_id = %s AND transaction_id = %s
            ) t
            """
            cursor.execute(_sql, (report_id, cmte_id, transaction_id))
            tran_list = cursor.fetchone()[0]
            if not tran_list:
                raise Exception(
                    "No sched_H4 transaction found for transaction_id {}".format(
                        transaction_id
                    )
                )
        #     merged_list = []
        #     for tran in tran_list:
        #         entity_id = tran.get("payee_entity_id")
        #         q_data = {"entity_id": entity_id, "cmte_id": cmte_id}
        #         dictEntity = get_entities(q_data)[0]
        #         merged_list.append({**tran, **dictEntity})
        # return merged_list[0]
        return tran_list
    except Exception:
        raise


def update_activity_event_amount_ytd_h4(data):
    """
    aggregate and update 'activity_event_amount_ytd' for all h4 transactions
    if event_identifier is provided, will do event-based aggregation;
    else will do event_type-based aggregation
    """
    try:

        logger.debug("updating ytd amount:")
        # make sure transaction list comes back sorted by contribution_date ASC
        expenditure_dt = date_format(data.get("expenditure_date"))
        aggregate_start_date = datetime.date(expenditure_dt.year, 1, 1)
        aggregate_end_date = datetime.date(expenditure_dt.year, 12, 31)
        if data.get("activity_event_identifier"):
            transactions_list = list_all_transactions_event_identifier_h4(
                aggregate_start_date,
                aggregate_end_date,
                data.get("activity_event_identifier"),
                data.get("cmte_id"),
            )
        else:
            transactions_list = list_all_transactions_event_type_h4(
                aggregate_start_date,
                aggregate_end_date,
                data.get("activity_event_type"),
                data.get("cmte_id"),
            )
        aggregate_amount = 0
        for transaction in transactions_list:
            aggregate_amount += transaction[0]
            transaction_id = transaction[1]
            update_transaction_ytd_amount_h4(
                data.get("cmte_id"), transaction_id, aggregate_amount
            )

    except Exception as e:
        raise Exception(
            "The update_activity_event_amount_ytd function is throwing an error: "
            + str(e)
        )


def list_all_transactions_event_type_h4(start_dt, end_dt, activity_event_type, cmte_id):
    """
    load all transactions with the specified activity event type
    need to check
    """
    logger.debug(
        "load ttransactionsransactions with activity_event_type:{}".format(
            activity_event_type
        )
    )
    # logger.debug('load ttransactionsransactions with start:{}, end {}'.format(start_dt, end_dt))
    # logger.debug('load ttransactionsransactions with cmte-id:{}'.format(cmte_id))
    _sql = """
            SELECT t1.total_amount, 
                t1.transaction_id
            FROM public.sched_h4 t1 
            WHERE activity_event_type = %s 
            AND cmte_id = %s
            AND expenditure_date >= %s
            AND expenditure_date <= %s 
            AND back_ref_transaction_id is null
            AND delete_ind is distinct FROM 'Y' 
            ORDER BY expenditure_date ASC, create_date ASC
    """
    # .format(activity_event_type, cmte_id, start_dt, end_dt)
    logger.debug(_sql)
    try:
        with connection.cursor() as cursor:
            cursor.execute(_sql, (activity_event_type, cmte_id, start_dt, end_dt))
            # , [
            #         activity_event_type,
            #         cmte_id,
            #         start_dt,
            #         end_dt,
            #     ])
            transactions_list = cursor.fetchall()
            logger.debug("transaction fetched:{}".format(transactions_list))
        return transactions_list
    except Exception as e:
        raise Exception(
            "The list_all_transactions_event_type function is throwing an error: "
            + str(e)
        )


def update_transaction_ytd_amount_h4(cmte_id, transaction_id, aggregate_amount):

    """
    update h4 ytd amount
    """
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                """ UPDATE public.sched_h4
                    SET activity_event_amount_ytd = %s 
                    WHERE transaction_id = %s AND cmte_id = %s AND delete_ind is distinct from 'Y'
                    """,
                [aggregate_amount, transaction_id, cmte_id],
            )
            if cursor.rowcount == 0:
                raise Exception(
                    "Error: The Transaction ID: {} does not exist in schedH4 table".format(
                        transaction_id
                    )
                )
    except Exception:
        raise


def list_all_transactions_event_identifier_h4(
    start_dt, end_dt, activity_event_identifier, cmte_id
):
    """
    load all transactions with the specified activity event type
    need to check
    """
    logger.debug(
        "load ttransactionsransactions with activity_event_identifier:{}".format(
            activity_event_identifier
        )
    )
    # logger.debug('load ttransactionsransactions with start:{}, end {}'.format(start_dt, end_dt))
    # logger.debug('load ttransactionsransactions with cmte-id:{}'.format(cmte_id))
    _sql = """
            SELECT t1.total_amount, 
                t1.transaction_id
            FROM public.sched_h4 t1 
            WHERE activity_event_identifier = %s 
            AND cmte_id = %s
            AND expenditure_date >= %s
            AND expenditure_date <= %s 
            AND back_ref_transaction_id is null
            AND delete_ind is distinct FROM 'Y' 
            ORDER BY expenditure_date ASC, create_date ASC
    """
    # .format(activity_event_type, cmte_id, start_dt, end_dt)
    logger.debug(_sql)
    try:
        with connection.cursor() as cursor:
            cursor.execute(_sql, (activity_event_identifier, cmte_id, start_dt, end_dt))
            # , [
            #         activity_event_type,
            #         cmte_id,
            #         start_dt,
            #         end_dt,
            #     ])
            transactions_list = cursor.fetchall()
            logger.debug("transaction fetched:{}".format(transactions_list))
        return transactions_list
    except Exception as e:
        raise Exception(
            "The list_all_transactions_event_identifier function is throwing an error: "
            + str(e)
        )


def is_pac(cmte_id):
    _sql = """
    SELECT cmte_type_category
    FROM committee_master
    WHERE cmte_id = %s;
    """
    try:
        with connection.cursor() as cursor:
            cursor.execute(_sql, [cmte_id])
            if cursor.rowcount > 0:
                return cursor.fetchone()[0] == "PAC"
        return False
    except:
        raise


def update_activity_event_amount_ytd_h6(data):
    """
    aggregate and update 'activity_event_amount_ytd' for all h6 transactions
    """
    try:

        logger.debug("updating ytd amount h6:")
        # make sure transaction list comes back sorted by contribution_date ASC
        expenditure_dt = date_format(data.get("expenditure_date"))
        aggregate_start_date = datetime.date(expenditure_dt.year, 1, 1)
        aggregate_end_date = datetime.date(expenditure_dt.year, 12, 31)
        transactions_list = list_all_transactions_event_type_h6(
            aggregate_start_date,
            aggregate_end_date,
            data.get("activity_event_type"),
            data.get("cmte_id"),
        )
        aggregate_amount = 0
        for transaction in transactions_list:
            aggregate_amount += transaction[0]
            transaction_id = transaction[1]
            update_transaction_ytd_amount_h6(
                data.get("cmte_id"), transaction_id, aggregate_amount
            )
    except Exception as e:
        raise Exception(
            "The update_activity_event_amount_ytd function is throwing an error: "
            + str(e)
        )


def list_all_transactions_event_type_h6(start_dt, end_dt, activity_event_type, cmte_id):
    """
    load all transactions with the specified activity event type
    need to check
    """
    logger.debug(
        "load transactions with activity_event_type:{}".format(activity_event_type)
    )
    # logger.debug('load ttransactionsransactions with start:{}, end {}'.format(start_dt, end_dt))
    # logger.debug('load ttransactionsransactions with cmte-id:{}'.format(cmte_id))
    _sql = """
            SELECT t1.total_fed_levin_amount, 
                t1.transaction_id
            FROM public.sched_h6 t1 
            WHERE activity_event_type = %s 
            AND cmte_id = %s
            AND expenditure_date >= %s
            AND expenditure_date <= %s 
            AND back_ref_transaction_id is null
            AND delete_ind is distinct FROM 'Y' 
            ORDER BY expenditure_date ASC, create_date ASC
    """
    # .format(activity_event_type, cmte_id, start_dt, end_dt)
    # logger.debug(_sql)
    try:
        with connection.cursor() as cursor:
            cursor.execute(_sql, (activity_event_type, cmte_id, start_dt, end_dt))
            # , [
            #         activity_event_type,
            #         cmte_id,
            #         start_dt,
            #         end_dt,
            #     ])
            transactions_list = cursor.fetchall()
            logger.debug("transaction fetched:{}".format(transactions_list))
        return transactions_list
    except Exception as e:
        raise Exception(
            "The list_all_transactions_event_type function is throwing an error: "
            + str(e)
        )


def update_transaction_ytd_amount_h6(cmte_id, transaction_id, aggregate_amount):

    """
    update h4 ytd amount
    """
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                """ UPDATE public.sched_h6
                    SET activity_event_total_ytd = %s 
                    WHERE transaction_id = %s AND cmte_id = %s AND delete_ind is distinct from 'Y'
                    """,
                [aggregate_amount, transaction_id, cmte_id],
            )
            if cursor.rowcount == 0:
                raise Exception(
                    "Error: The Transaction ID: {} does not exist in sched_h6 table".format(
                        transaction_id
                    )
                )
    except Exception:
        raise

