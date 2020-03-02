UPDATE public.tran_query_string SET query_string = '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
COALESCE(t1.transaction_id, '''') AS "transactionId",
COALESCE(t2.entity_type, '''') AS "entityType",
COALESCE(t2.entity_name, '''') AS "lenderOrganizationName",
COALESCE(t2.last_name, '''') AS "lenderLastName",
COALESCE(t2.first_name, '''') AS "lenderFirstName",
COALESCE(t2.middle_name, '''') AS "lenderMiddleName",
COALESCE(t2.preffix, '''') AS "lenderPrefix",
COALESCE(t2.suffix, '''') AS "lenderSuffix",
COALESCE(t2.street_1, '''') AS "lenderStreet1",
COALESCE(t2.street_2, '''') AS "lenderStreet2",
COALESCE(t2.city, '''') AS "lenderCity",
COALESCE(t2.state, '''') AS "lenderState",
COALESCE(t2.zip_code, '''') AS "lenderZipCode",
COALESCE(t1.election_code, '''') AS "electionCode",
COALESCE(t1.election_other_description, '''') AS "electionOtherDescription",
COALESCE(t1.loan_amount_original, 0.0) AS "loanAmountOriginal",
COALESCE(t1.loan_payment_to_date, 0.0) AS "loanPaymentToDate",
COALESCE(t1.loan_balance, 0.0) AS "loanBalance",
COALESCE(to_char(t1.loan_incurred_date,''MM/DD/YYYY''), '''') AS "loanIncurredDate",
COALESCE(to_char(t1.loan_due_date,''MM/DD/YYYY''), '''') AS "loanDueDate",
COALESCE(t1.loan_intrest_rate, ''0.0'') AS "loanInterestRate",
COALESCE(t1.is_loan_secured, '''') AS "isLoanSecured",
COALESCE(t1.lender_cmte_id, '''') AS "lenderCommitteeId",
COALESCE(t1.lender_cand_id, '''') AS "lenderCandidateId",
COALESCE(t1.lender_cand_last_name, '''') AS "lenderCandidateLastName",
COALESCE(t1.lender_cand_first_name, '''') AS "lenderCandidateFirstName",
COALESCE(t1.lender_cand_middle_name, '''') AS "lenderCandidateMiddleName",
COALESCE(t1.lender_cand_prefix, '''') AS "lenderCandidatePrefix",
COALESCE(t1.lender_cand_suffix, '''') AS "lenderCandidateSuffix",
COALESCE(t1.lender_cand_office, '''') AS "lenderCandidateOffice",
COALESCE(t1.lender_cand_state, '''') AS "lenderCandidateState",
COALESCE(t1.lender_cand_district, 0) AS "lenderCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode",
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_c t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LOANS_OWED_BY_CMTE'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y''
' WHERE tran_type_identifier = 'LOANS_OWED_BY_CMTE'
                    AND form_type = 'F3X' AND sched_type = 'SC';

DELETE FROM public.tran_query_string WHERE tran_type_identifier='ALLOC_FEA_DISB_DEBT';

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH6', 'ALLOC_FEA_DISB_DEBT', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
t1.transaction_type_identifier AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber",
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t2.entity_type, '''') AS "entityType",
COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
COALESCE(t2.last_name, '''') AS "payeeLastName",
COALESCE(t2.first_name, '''') AS "payeeFirstName",
COALESCE(t2.middle_name, '''') AS "payeeMiddleName",
COALESCE(t2.preffix, '''') AS "payeePrefix",
COALESCE(t2.suffix, '''') AS "payeeSuffix",
COALESCE(t2.street_1, '''') AS "payeeStreet1",
COALESCE(t2.street_2, '''') AS "payeeStreet2",
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState",
COALESCE(t2.zip_code, '''') AS "payeeZipCode",
COALESCE(t1.account_event_identifier, '''') AS "accountEventIdentifier",
COALESCE(to_char(t1.expenditure_date,''MM/DD/YYYY''), '''') AS "expenditureDate",
COALESCE(t1.total_fed_levin_amount, 0.0) AS "totalFedLevinAmount",
COALESCE(t1.federal_share, 0.0) AS "federalShare",
COALESCE(t1.levin_share, 0.0) AS "levinShare",
COALESCE(t1.activity_event_total_ytd, 0.0) AS "activityEventTotalYTD",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.activity_event_type, '''') AS "activityEventType",
COALESCE(t1.memo_code, '''') AS "memoCode",
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_h6 t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''ALLOC_FEA_DISB_DEBT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

UPDATE public.tran_query_string SET query_string = '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",  
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
COALESCE(t2.last_name, '''') AS "payeeLastName", 
COALESCE(t2.first_name, '''') AS "payeeFirstName",
COALESCE(t2.middle_name, '''') AS "payeeMiddleName", 
COALESCE(t2.preffix, '''') AS "payeePrefix", 
COALESCE(t2.suffix, '''') AS "payeeSuffix",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode",
COALESCE(t1.election_code, '''') AS "electionCode", 
COALESCE(t1.election_other_desc, '''') AS "electionOtherDescription",
COALESCE(to_char(t1.dissemination_date, ''MM/DD/YYYY''), '''') AS "disseminationDate",
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(to_char(t1.disbursement_date,''MM/DD/YYYY''), '''') AS "disbursementDate",
COALESCE(t1.calendar_ytd_amount, 0.0) AS "calendarYTDPerElectionForOffice",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.support_oppose_code, '''') AS "support/opposeCode",
COALESCE(t1.so_cand_id, '''') AS "candidateId",
COALESCE(t1.so_cand_last_name, '''') AS "candidateLastName", 
COALESCE(t1.so_cand_first_name, '''') AS "candidateFirstName", 
COALESCE(t1.so_cand_middle_name, '''') AS "candidateMiddleName", 
COALESCE(t1.so_cand_prefix, '''') AS "candidatePrefix",
COALESCE(t1.so_cand_suffix, '''') AS "candidateSuffix",
COALESCE(t1.so_cand_office, '''') AS "candidateOffice",
COALESCE(t1.so_cand_state, '''') AS "candidateState",
COALESCE(t1.so_cand_district, '''') AS "candidateDistrict",
COALESCE(t3.last_name, '''') AS "completingLastName", 
COALESCE(t3.first_name, '''') AS "completingFirstName",
COALESCE(t3.middle_name, '''') AS "completingMiddleName", 
COALESCE(t3.preffix, '''') AS "completingPrefix", 
COALESCE(t3.suffix, '''') AS "completingSuffix",
COALESCE(to_char(t1.date_signed,''MM/DD/YYYY''), '''') AS "dateSigned",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_e t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
LEFT JOIN public.entity t3 ON t3.entity_id = t1.completing_entity_id
WHERE t1.transaction_type_identifier = ''IE'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
' WHERE tran_type_identifier = 'IE'
                    AND form_type = 'F3X' AND sched_type = 'SE';

UPDATE public.tran_query_string SET query_string = '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",  
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
COALESCE(t2.last_name, '''') AS "payeeLastName", 
COALESCE(t2.first_name, '''') AS "payeeFirstName",
COALESCE(t2.middle_name, '''') AS "payeeMiddleName", 
COALESCE(t2.preffix, '''') AS "payeePrefix", 
COALESCE(t2.suffix, '''') AS "payeeSuffix",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode",
COALESCE(t1.election_code, '''') AS "electionCode", 
COALESCE(t1.election_other_desc, '''') AS "electionOtherDescription",
COALESCE(to_char(t1.dissemination_date, ''MM/DD/YYYY''), '''') AS "disseminationDate",
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(to_char(t1.disbursement_date,''MM/DD/YYYY''), '''') AS "disbursementDate",
COALESCE(t1.calendar_ytd_amount, 0.0) AS "calendarYTDPerElectionForOffice",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.support_oppose_code, '''') AS "support/opposeCode",
COALESCE(t1.so_cand_id, '''') AS "candidateId",
COALESCE(t1.so_cand_last_name, '''') AS "candidateLastName", 
COALESCE(t1.so_cand_first_name, '''') AS "candidateFirstName", 
COALESCE(t1.so_cand_middle_name, '''') AS "candidateMiddleName", 
COALESCE(t1.so_cand_prefix, '''') AS "candidatePrefix",
COALESCE(t1.so_cand_suffix, '''') AS "candidateSuffix",
COALESCE(t1.so_cand_office, '''') AS "candidateOffice",
COALESCE(t1.so_cand_state, '''') AS "candidateState",
COALESCE(t1.so_cand_district, '''') AS "candidateDistrict",
COALESCE(t3.last_name, '''') AS "completingLastName", 
COALESCE(t3.first_name, '''') AS "completingFirstName",
COALESCE(t3.middle_name, '''') AS "completingMiddleName", 
COALESCE(t3.preffix, '''') AS "completingPrefix", 
COALESCE(t3.suffix, '''') AS "completingSuffix",
COALESCE(to_char(t1.date_signed,''MM/DD/YYYY''), '''') AS "dateSigned",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_e t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
LEFT JOIN public.entity t3 ON t3.entity_id = t1.completing_entity_id
WHERE t1.transaction_type_identifier = ''IE_CC_PAY_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
' WHERE tran_type_identifier = 'IE_CC_PAY_MEMO'
                    AND form_type = 'F3X' AND sched_type = 'SE';

UPDATE public.tran_query_string SET query_string = '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",  
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
COALESCE(t2.last_name, '''') AS "payeeLastName", 
COALESCE(t2.first_name, '''') AS "payeeFirstName",
COALESCE(t2.middle_name, '''') AS "payeeMiddleName", 
COALESCE(t2.preffix, '''') AS "payeePrefix", 
COALESCE(t2.suffix, '''') AS "payeeSuffix",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode",
COALESCE(t1.election_code, '''') AS "electionCode", 
COALESCE(t1.election_other_desc, '''') AS "electionOtherDescription",
COALESCE(to_char(t1.dissemination_date, ''MM/DD/YYYY''), '''') AS "disseminationDate",
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(to_char(t1.disbursement_date,''MM/DD/YYYY''), '''') AS "disbursementDate",
COALESCE(t1.calendar_ytd_amount, 0.0) AS "calendarYTDPerElectionForOffice",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.support_oppose_code, '''') AS "support/opposeCode",
COALESCE(t1.so_cand_id, '''') AS "candidateId",
COALESCE(t1.so_cand_last_name, '''') AS "candidateLastName", 
COALESCE(t1.so_cand_first_name, '''') AS "candidateFirstName", 
COALESCE(t1.so_cand_middle_name, '''') AS "candidateMiddleName", 
COALESCE(t1.so_cand_prefix, '''') AS "candidatePrefix",
COALESCE(t1.so_cand_suffix, '''') AS "candidateSuffix",
COALESCE(t1.so_cand_office, '''') AS "candidateOffice",
COALESCE(t1.so_cand_state, '''') AS "candidateState",
COALESCE(t1.so_cand_district, '''') AS "candidateDistrict",
COALESCE(t3.last_name, '''') AS "completingLastName", 
COALESCE(t3.first_name, '''') AS "completingFirstName",
COALESCE(t3.middle_name, '''') AS "completingMiddleName", 
COALESCE(t3.preffix, '''') AS "completingPrefix", 
COALESCE(t3.suffix, '''') AS "completingSuffix",
COALESCE(to_char(t1.date_signed,''MM/DD/YYYY''), '''') AS "dateSigned",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_e t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
LEFT JOIN public.entity t3 ON t3.entity_id = t1.completing_entity_id
WHERE t1.transaction_type_identifier = ''IE_STAF_REIM_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
' WHERE tran_type_identifier = 'IE_STAF_REIM_MEMO'
                    AND form_type = 'F3X' AND sched_type = 'SE';

UPDATE public.tran_query_string SET query_string = '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",  
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
COALESCE(t2.last_name, '''') AS "payeeLastName", 
COALESCE(t2.first_name, '''') AS "payeeFirstName",
COALESCE(t2.middle_name, '''') AS "payeeMiddleName", 
COALESCE(t2.preffix, '''') AS "payeePrefix", 
COALESCE(t2.suffix, '''') AS "payeeSuffix",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode",
COALESCE(t1.election_code, '''') AS "electionCode", 
COALESCE(t1.election_other_desc, '''') AS "electionOtherDescription",
COALESCE(to_char(t1.dissemination_date, ''MM/DD/YYYY''), '''') AS "disseminationDate",
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(to_char(t1.disbursement_date,''MM/DD/YYYY''), '''') AS "disbursementDate",
COALESCE(t1.calendar_ytd_amount, 0.0) AS "calendarYTDPerElectionForOffice",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.support_oppose_code, '''') AS "support/opposeCode",
COALESCE(t1.so_cand_id, '''') AS "candidateId",
COALESCE(t1.so_cand_last_name, '''') AS "candidateLastName", 
COALESCE(t1.so_cand_first_name, '''') AS "candidateFirstName", 
COALESCE(t1.so_cand_middle_name, '''') AS "candidateMiddleName", 
COALESCE(t1.so_cand_prefix, '''') AS "candidatePrefix",
COALESCE(t1.so_cand_suffix, '''') AS "candidateSuffix",
COALESCE(t1.so_cand_office, '''') AS "candidateOffice",
COALESCE(t1.so_cand_state, '''') AS "candidateState",
COALESCE(t1.so_cand_district, '''') AS "candidateDistrict",
COALESCE(t3.last_name, '''') AS "completingLastName", 
COALESCE(t3.first_name, '''') AS "completingFirstName",
COALESCE(t3.middle_name, '''') AS "completingMiddleName", 
COALESCE(t3.preffix, '''') AS "completingPrefix", 
COALESCE(t3.suffix, '''') AS "completingSuffix",
COALESCE(to_char(t1.date_signed,''MM/DD/YYYY''), '''') AS "dateSigned",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_e t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
LEFT JOIN public.entity t3 ON t3.entity_id = t1.completing_entity_id
WHERE t1.transaction_type_identifier = ''IE_VOID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
' WHERE tran_type_identifier = 'IE_VOID'
                    AND form_type = 'F3X' AND sched_type = 'SE';

UPDATE public.tran_query_string SET query_string = '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",  
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
COALESCE(t2.last_name, '''') AS "payeeLastName", 
COALESCE(t2.first_name, '''') AS "payeeFirstName",
COALESCE(t2.middle_name, '''') AS "payeeMiddleName", 
COALESCE(t2.preffix, '''') AS "payeePrefix", 
COALESCE(t2.suffix, '''') AS "payeeSuffix",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode",
COALESCE(t1.election_code, '''') AS "electionCode", 
COALESCE(t1.election_other_desc, '''') AS "electionOtherDescription",
COALESCE(to_char(t1.dissemination_date, ''MM/DD/YYYY''), '''') AS "disseminationDate",
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(to_char(t1.disbursement_date,''MM/DD/YYYY''), '''') AS "disbursementDate",
COALESCE(t1.calendar_ytd_amount, 0.0) AS "calendarYTDPerElectionForOffice",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.support_oppose_code, '''') AS "support/opposeCode",
COALESCE(t1.so_cand_id, '''') AS "candidateId",
COALESCE(t1.so_cand_last_name, '''') AS "candidateLastName", 
COALESCE(t1.so_cand_first_name, '''') AS "candidateFirstName", 
COALESCE(t1.so_cand_middle_name, '''') AS "candidateMiddleName", 
COALESCE(t1.so_cand_prefix, '''') AS "candidatePrefix",
COALESCE(t1.so_cand_suffix, '''') AS "candidateSuffix",
COALESCE(t1.so_cand_office, '''') AS "candidateOffice",
COALESCE(t1.so_cand_state, '''') AS "candidateState",
COALESCE(t1.so_cand_district, '''') AS "candidateDistrict",
COALESCE(t3.last_name, '''') AS "completingLastName", 
COALESCE(t3.first_name, '''') AS "completingFirstName",
COALESCE(t3.middle_name, '''') AS "completingMiddleName", 
COALESCE(t3.preffix, '''') AS "completingPrefix", 
COALESCE(t3.suffix, '''') AS "completingSuffix",
COALESCE(to_char(t1.date_signed,''MM/DD/YYYY''), '''') AS "dateSigned",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_e t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
LEFT JOIN public.entity t3 ON t3.entity_id = t1.completing_entity_id
WHERE t1.transaction_type_identifier = ''IE_B4_DISSE_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
' WHERE tran_type_identifier = 'IE_B4_DISSE_MEMO'
                    AND form_type = 'F3X' AND sched_type = 'SE';