INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SD', 'DEBT_TO_VENDOR', '
SELECT COALESCE(t1.line_num, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t2.entity_type, '''') AS "entityType",
COALESCE(t2.entity_name, '''') AS "creditorOrganizationName",
COALESCE(t2.last_name, '''') AS "creditorLastName", 
COALESCE(t2.first_name, '''') AS "creditorFirstName",
COALESCE(t2.middle_name, '''') AS "creditorMiddleName", 
COALESCE(t2.preffix, '''') AS "creditorPrefix", 
COALESCE(t2.suffix, '''') AS "creditorSuffix",
COALESCE(t2.street_1, '''') AS "creditorStreet1", 
COALESCE(t2.street_2, '''') AS "creditorStreet2", 
COALESCE(t2.city, '''') AS "creditorCity",
COALESCE(t2.state, '''') AS "creditorState", 
COALESCE(t2.zip_code, '''') AS "creditorZipCode",
COALESCE(t1.purpose, '''') AS "purposeOfDebtOrObligation",
COALESCE(t1.beginning_balance, 0.0) AS "beginningBalance",
COALESCE(t1.incurred_amount, 0.0) AS "incurredAmount",
COALESCE(t1.payment_amount, 0.0) AS "paymentAmount",
COALESCE(t1.balance_at_close, 0.0) AS "balanceAtClose"
FROM public.sched_d t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.creditor_entity_id
WHERE t1.transaction_type_identifier = ''DEBT_TO_VENDOR'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'OPEXP_DEBT', '
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
to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''OPEXP_DEBT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'FEA_100PCT_DEBT_PAY', '
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
COALESCE(t1.election_code, '''') AS "electionCode", 
COALESCE(t1.election_other_description, '''') AS "electionOtherDescription",
to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", 
COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
COALESCE(t1.beneficiary_cand_id, '''') AS "beneficiaryCandidateId",
COALESCE(t3.cand_last_name, '''') AS "beneficiaryCandidateLastName", 
COALESCE(t3.cand_first_name, '''') AS "beneficiaryCandidateFirstName", 
COALESCE(t3.cand_middle_name, '''') AS "beneficiaryCandidateMiddleName", 
COALESCE(t3.cand_prefix, '''') AS "beneficiaryCandidatePrefix",
COALESCE(t3.cand_suffix, '''') AS "beneficiaryCandidateSuffix",
COALESCE(t3.cand_office, '''') AS "beneficiaryCandidateOffice",
COALESCE(t3.cand_office_state, '''') AS "beneficiaryCandidateState",
COALESCE(t3.cand_office_district, '''') AS "beneficiaryCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
LEFT JOIN public.candidate_master t3 ON t3.cand_id = t1.beneficiary_cand_id
WHERE t1.transaction_type_identifier = ''FEA_100PCT_DEBT_PAY'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'OTH_DISB_DEBT', '
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
to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''OTH_DISB_DEBT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SH4', 'ALLOC_EXP_DEBT', '
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
COALESCE(t1.activity_event_identifier, '''') AS "accountEventIdentifier",
COALESCE(to_char(t1.expenditure_date,''MM/DD/YYYY''), '''') AS "expenditureDate",
COALESCE(t1.total_amount, 0.0) AS "totalFedNonfedAmount",
COALESCE(t1.fed_share_amount, 0.0) AS "federalShare",
COALESCE(t1.non_fed_share_amount, 0.0) AS "nonfederalShare",
COALESCE(t1.activity_event_amount_ytd, 0.0) AS "activityEventTotalYTD",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.activity_event_type, '''') AS "activityEventType",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_h4 t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
WHERE t1.transaction_type_identifier = ''ALLOC_EXP_DEBT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SH6', 'ALLOC_FEC_DISB_DEBT', '
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
COALESCE(t1.account_event_identifier, '''') AS "accountOrEventIdentifier",
COALESCE(to_char(t1.expenditure_date,''MM/DD/YYYY''), '''') AS "expenditureDate",
COALESCE(t1.total_fed_levin_amount, 0.0) AS "totalFedOrLevinAmount",
COALESCE(t1.federal_share, 0.0) AS "federalShare",
COALESCE(t1.levin_share, 0.0) AS "levinShare",
COALESCE(t1.activity_event_total_ytd, 0.0) AS "activityOrEventTotalYTD",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.activity_event_type, '''') AS "activityorEventType",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_h6 t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''ALLOC_FEC_DISB_DEBT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SE', 'IE', '
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
COALESCE(t1.so_cand_fist_name, '''') AS "candidateFirstName", 
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
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SE', 'IE_CC_PAY_MEMO', '
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
COALESCE(t1.so_cand_fist_name, '''') AS "candidateFirstName", 
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
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SE', 'IE_STAF_REIM_MEMO', '
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
COALESCE(t1.so_cand_fist_name, '''') AS "candidateFirstName", 
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
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SE', 'IE_VOID', '
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
COALESCE(t1.so_cand_fist_name, '''') AS "candidateFirstName", 
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
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SE', 'IE_B4_DISSE_MEMO', '
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
COALESCE(t1.so_cand_fist_name, '''') AS "candidateFirstName", 
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
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SE', 'IE_CC_PAY', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode",
COALESCE(t1.election_code, '''') AS "electionCode",
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
COALESCE(t1.so_cand_fist_name, '''') AS "candidateFirstName", 
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
WHERE t1.transaction_type_identifier = ''IE_CC_PAY'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SE', 'IE_PMT_TO_PROL', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode",
COALESCE(t1.election_code, '''') AS "electionCode",
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
COALESCE(t1.so_cand_fist_name, '''') AS "candidateFirstName", 
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
WHERE t1.transaction_type_identifier = ''IE_PMT_TO_PROL'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SE', 'IE_STAF_REIM', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t2.entity_type, '''') AS "entityType",
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
COALESCE(t1.so_cand_fist_name, '''') AS "candidateFirstName", 
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
WHERE t1.transaction_type_identifier = ''IE_STAF_REIM'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SE', 'IE_PMT_TO_PROL_MEMO', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t2.entity_type, '''') AS "entityType",
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
COALESCE(t1.so_cand_fist_name, '''') AS "candidateFirstName", 
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
WHERE t1.transaction_type_identifier = ''IE_PMT_TO_PROL_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SF', 'COEXP_PARTY', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",  
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t1.coordinated_exp_ind, '''') AS "coordinateExpenditure",
COALESCE(t1.designating_cmte_id, '''') AS "designatingCommitteeId",
COALESCE(t1.designating_cmte_name, '''') AS "designatingCommitteeName",
COALESCE(t1.subordinate_cmte_id, '''') AS "subordinateCommitteeId",
COALESCE(t1.subordinate_cmte_name, '''') AS "subordinateCommitteeName",
COALESCE(t1.subordinate_cmte_street_1, '''') AS "subordinateCommitteeStreet1",
COALESCE(t1.subordinate_cmte_street_2, '''') AS "subordinateCommitteeStreet2",
COALESCE(t1.subordinate_cmte_city, '''') AS "subordinateCommitteeCity",
COALESCE(t1.subordinate_cmte_state, '''') AS "subordinateCommitteeState",
COALESCE(t1.subordinate_cmte_zip,  '''') AS "subordinateCommitteeZipCode",
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
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(t1.aggregate_general_elec_exp, 0.0) AS "aggregateGeneralElectionExpended",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.payee_cand_id, '''') AS "candidateId",
COALESCE(t1.payee_cand_last_name, '''') AS "payeeCandidateLastName", 
COALESCE(t1.payee_cand_fist_name, '''') AS "payeeCandidateFirstName", 
COALESCE(t1.payee_cand_middle_name, '''') AS "payeeCandidateMiddleName", 
COALESCE(t1.payee_cand_prefix, '''') AS "payeeCandidatePrefix",
COALESCE(t1.payee_cand_suffix, '''') AS "payeeCandidateSuffix",
COALESCE(t1.payee_cand_office, '''') AS "payeeCandidateOffice",
COALESCE(t1.payee_cand_state, '''') AS "payeeCandidateState",
COALESCE(t1.payee_cand_district, '''') AS "payeeCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_f t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
WHERE t1.transaction_type_identifier = ''COEXP_PARTY'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SF', 'COEXP_PARTY_DEBT', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",  
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t1.coordinated_exp_ind, '''') AS "coordinateExpenditure",
COALESCE(t1.designating_cmte_id, '''') AS "designatingCommitteeId",
COALESCE(t1.designating_cmte_name, '''') AS "designatingCommitteeName",
COALESCE(t1.subordinate_cmte_id, '''') AS "subordinateCommitteeId",
COALESCE(t1.subordinate_cmte_name, '''') AS "subordinateCommitteeName",
COALESCE(t1.subordinate_cmte_street_1, '''') AS "subordinateCommitteeStreet1",
COALESCE(t1.subordinate_cmte_street_2, '''') AS "subordinateCommitteeStreet2",
COALESCE(t1.subordinate_cmte_city, '''') AS "subordinateCommitteeCity",
COALESCE(t1.subordinate_cmte_state, '''') AS "subordinateCommitteeState",
COALESCE(t1.subordinate_cmte_zip,  '''') AS "subordinateCommitteeZipCode",
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
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(t1.aggregate_general_elec_exp, 0.0) AS "aggregateGeneralElectionExpended",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.payee_cand_id, '''') AS "candidateId",
COALESCE(t1.payee_cand_last_name, '''') AS "payeeCandidateLastName", 
COALESCE(t1.payee_cand_fist_name, '''') AS "payeeCandidateFirstName", 
COALESCE(t1.payee_cand_middle_name, '''') AS "payeeCandidateMiddleName", 
COALESCE(t1.payee_cand_prefix, '''') AS "payeeCandidatePrefix",
COALESCE(t1.payee_cand_suffix, '''') AS "payeeCandidateSuffix",
COALESCE(t1.payee_cand_office, '''') AS "payeeCandidateOffice",
COALESCE(t1.payee_cand_state, '''') AS "payeeCandidateState",
COALESCE(t1.payee_cand_district, '''') AS "payeeCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_f t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
WHERE t1.transaction_type_identifier = ''COEXP_PARTY_DEBT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SF', 'COEXP_CC_PAY', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",  
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t1.coordinated_exp_ind, '''') AS "coordinateExpenditure",
COALESCE(t1.designating_cmte_id, '''') AS "designatingCommitteeId",
COALESCE(t1.designating_cmte_name, '''') AS "designatingCommitteeName",
COALESCE(t1.subordinate_cmte_id, '''') AS "subordinateCommitteeId",
COALESCE(t1.subordinate_cmte_name, '''') AS "subordinateCommitteeName",
COALESCE(t1.subordinate_cmte_street_1, '''') AS "subordinateCommitteeStreet1",
COALESCE(t1.subordinate_cmte_street_2, '''') AS "subordinateCommitteeStreet2",
COALESCE(t1.subordinate_cmte_city, '''') AS "subordinateCommitteeCity",
COALESCE(t1.subordinate_cmte_state, '''') AS "subordinateCommitteeState",
COALESCE(t1.subordinate_cmte_zip,  '''') AS "subordinateCommitteeZipCode",
COALESCE(t2.entity_type, '''') AS "entityType",
COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode",
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(t1.aggregate_general_elec_exp, 0.0) AS "aggregateGeneralElectionExpended",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.payee_cand_id, '''') AS "candidateId",
COALESCE(t1.payee_cand_last_name, '''') AS "payeeCandidateLastName", 
COALESCE(t1.payee_cand_fist_name, '''') AS "payeeCandidateFirstName", 
COALESCE(t1.payee_cand_middle_name, '''') AS "payeeCandidateMiddleName", 
COALESCE(t1.payee_cand_prefix, '''') AS "payeeCandidatePrefix",
COALESCE(t1.payee_cand_suffix, '''') AS "payeeCandidateSuffix",
COALESCE(t1.payee_cand_office, '''') AS "payeeCandidateOffice",
COALESCE(t1.payee_cand_state, '''') AS "payeeCandidateState",
COALESCE(t1.payee_cand_district, '''') AS "payeeCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_f t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
WHERE t1.transaction_type_identifier = ''COEXP_CC_PAY'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SF', 'COEXP_PMT_PROL', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",  
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t1.coordinated_exp_ind, '''') AS "coordinateExpenditure",
COALESCE(t1.designating_cmte_id, '''') AS "designatingCommitteeId",
COALESCE(t1.designating_cmte_name, '''') AS "designatingCommitteeName",
COALESCE(t1.subordinate_cmte_id, '''') AS "subordinateCommitteeId",
COALESCE(t1.subordinate_cmte_name, '''') AS "subordinateCommitteeName",
COALESCE(t1.subordinate_cmte_street_1, '''') AS "subordinateCommitteeStreet1",
COALESCE(t1.subordinate_cmte_street_2, '''') AS "subordinateCommitteeStreet2",
COALESCE(t1.subordinate_cmte_city, '''') AS "subordinateCommitteeCity",
COALESCE(t1.subordinate_cmte_state, '''') AS "subordinateCommitteeState",
COALESCE(t1.subordinate_cmte_zip,  '''') AS "subordinateCommitteeZipCode",
COALESCE(t2.entity_type, '''') AS "entityType",
COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode",
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(t1.aggregate_general_elec_exp, 0.0) AS "aggregateGeneralElectionExpended",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.payee_cand_id, '''') AS "candidateId",
COALESCE(t1.payee_cand_last_name, '''') AS "payeeCandidateLastName", 
COALESCE(t1.payee_cand_fist_name, '''') AS "payeeCandidateFirstName", 
COALESCE(t1.payee_cand_middle_name, '''') AS "payeeCandidateMiddleName", 
COALESCE(t1.payee_cand_prefix, '''') AS "payeeCandidatePrefix",
COALESCE(t1.payee_cand_suffix, '''') AS "payeeCandidateSuffix",
COALESCE(t1.payee_cand_office, '''') AS "payeeCandidateOffice",
COALESCE(t1.payee_cand_state, '''') AS "payeeCandidateState",
COALESCE(t1.payee_cand_district, '''') AS "payeeCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_f t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
WHERE t1.transaction_type_identifier = ''COEXP_PMT_PROL'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SF', 'COEXP_CC_PAY_MEMO', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t1.coordinated_exp_ind, '''') AS "coordinateExpenditure",
COALESCE(t1.designating_cmte_id, '''') AS "designatingCommitteeId",
COALESCE(t1.designating_cmte_name, '''') AS "designatingCommitteeName",
COALESCE(t1.subordinate_cmte_id, '''') AS "subordinateCommitteeId",
COALESCE(t1.subordinate_cmte_name, '''') AS "subordinateCommitteeName",
COALESCE(t1.subordinate_cmte_street_1, '''') AS "subordinateCommitteeStreet1",
COALESCE(t1.subordinate_cmte_street_2, '''') AS "subordinateCommitteeStreet2",
COALESCE(t1.subordinate_cmte_city, '''') AS "subordinateCommitteeCity",
COALESCE(t1.subordinate_cmte_state, '''') AS "subordinateCommitteeState",
COALESCE(t1.subordinate_cmte_zip,  '''') AS "subordinateCommitteeZipCode",
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
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(t1.aggregate_general_elec_exp, 0.0) AS "aggregateGeneralElectionExpended",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.payee_cand_id, '''') AS "candidateId",
COALESCE(t1.payee_cand_last_name, '''') AS "payeeCandidateLastName", 
COALESCE(t1.payee_cand_fist_name, '''') AS "payeeCandidateFirstName", 
COALESCE(t1.payee_cand_middle_name, '''') AS "payeeCandidateMiddleName", 
COALESCE(t1.payee_cand_prefix, '''') AS "payeeCandidatePrefix",
COALESCE(t1.payee_cand_suffix, '''') AS "payeeCandidateSuffix",
COALESCE(t1.payee_cand_office, '''') AS "payeeCandidateOffice",
COALESCE(t1.payee_cand_state, '''') AS "payeeCandidateState",
COALESCE(t1.payee_cand_district, '''') AS "payeeCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_f t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
WHERE t1.transaction_type_identifier = ''COEXP_CC_PAY_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SF', 'COEXP_STAF_REIM_MEMO', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t1.coordinated_exp_ind, '''') AS "coordinateExpenditure",
COALESCE(t1.designating_cmte_id, '''') AS "designatingCommitteeId",
COALESCE(t1.designating_cmte_name, '''') AS "designatingCommitteeName",
COALESCE(t1.subordinate_cmte_id, '''') AS "subordinateCommitteeId",
COALESCE(t1.subordinate_cmte_name, '''') AS "subordinateCommitteeName",
COALESCE(t1.subordinate_cmte_street_1, '''') AS "subordinateCommitteeStreet1",
COALESCE(t1.subordinate_cmte_street_2, '''') AS "subordinateCommitteeStreet2",
COALESCE(t1.subordinate_cmte_city, '''') AS "subordinateCommitteeCity",
COALESCE(t1.subordinate_cmte_state, '''') AS "subordinateCommitteeState",
COALESCE(t1.subordinate_cmte_zip,  '''') AS "subordinateCommitteeZipCode",
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
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(t1.aggregate_general_elec_exp, 0.0) AS "aggregateGeneralElectionExpended",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.payee_cand_id, '''') AS "candidateId",
COALESCE(t1.payee_cand_last_name, '''') AS "payeeCandidateLastName", 
COALESCE(t1.payee_cand_fist_name, '''') AS "payeeCandidateFirstName", 
COALESCE(t1.payee_cand_middle_name, '''') AS "payeeCandidateMiddleName", 
COALESCE(t1.payee_cand_prefix, '''') AS "payeeCandidatePrefix",
COALESCE(t1.payee_cand_suffix, '''') AS "payeeCandidateSuffix",
COALESCE(t1.payee_cand_office, '''') AS "payeeCandidateOffice",
COALESCE(t1.payee_cand_state, '''') AS "payeeCandidateState",
COALESCE(t1.payee_cand_district, '''') AS "payeeCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_f t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
WHERE t1.transaction_type_identifier = ''COEXP_STAF_REIM_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SF', 'COEXP_PARTY_VOID', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t1.coordinated_exp_ind, '''') AS "coordinateExpenditure",
COALESCE(t1.designating_cmte_id, '''') AS "designatingCommitteeId",
COALESCE(t1.designating_cmte_name, '''') AS "designatingCommitteeName",
COALESCE(t1.subordinate_cmte_id, '''') AS "subordinateCommitteeId",
COALESCE(t1.subordinate_cmte_name, '''') AS "subordinateCommitteeName",
COALESCE(t1.subordinate_cmte_street_1, '''') AS "subordinateCommitteeStreet1",
COALESCE(t1.subordinate_cmte_street_2, '''') AS "subordinateCommitteeStreet2",
COALESCE(t1.subordinate_cmte_city, '''') AS "subordinateCommitteeCity",
COALESCE(t1.subordinate_cmte_state, '''') AS "subordinateCommitteeState",
COALESCE(t1.subordinate_cmte_zip,  '''') AS "subordinateCommitteeZipCode",
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
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(t1.aggregate_general_elec_exp, 0.0) AS "aggregateGeneralElectionExpended",
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.payee_cand_id, '''') AS "candidateId",
COALESCE(t1.payee_cand_last_name, '''') AS "payeeCandidateLastName", 
COALESCE(t1.payee_cand_fist_name, '''') AS "payeeCandidateFirstName", 
COALESCE(t1.payee_cand_middle_name, '''') AS "payeeCandidateMiddleName", 
COALESCE(t1.payee_cand_prefix, '''') AS "payeeCandidatePrefix",
COALESCE(t1.payee_cand_suffix, '''') AS "payeeCandidateSuffix",
COALESCE(t1.payee_cand_office, '''') AS "payeeCandidateOffice",
COALESCE(t1.payee_cand_state, '''') AS "payeeCandidateState",
COALESCE(t1.payee_cand_district, '''') AS "payeeCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_f t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
WHERE t1.transaction_type_identifier = ''COEXP_PARTY_VOID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SF', 'COEXP_STAF_REIM', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t1.coordinated_exp_ind, '''') AS "coordinateExpenditure",
COALESCE(t1.designating_cmte_id, '''') AS "designatingCommitteeId",
COALESCE(t1.designating_cmte_name, '''') AS "designatingCommitteeName",
COALESCE(t1.subordinate_cmte_id, '''') AS "subordinateCommitteeId",
COALESCE(t1.subordinate_cmte_name, '''') AS "subordinateCommitteeName",
COALESCE(t1.subordinate_cmte_street_1, '''') AS "subordinateCommitteeStreet1",
COALESCE(t1.subordinate_cmte_street_2, '''') AS "subordinateCommitteeStreet2",
COALESCE(t1.subordinate_cmte_city, '''') AS "subordinateCommitteeCity",
COALESCE(t1.subordinate_cmte_state, '''') AS "subordinateCommitteeState",
COALESCE(t1.subordinate_cmte_zip,  '''') AS "subordinateCommitteeZipCode",
COALESCE(t2.entity_type, '''') AS "entityType",
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
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(t1.aggregate_general_elec_exp, 0.0) AS "aggregateGeneralElectionExpended", 
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.payee_cand_id, '''') AS "candidateId",
COALESCE(t1.payee_cand_last_name, '''') AS "payeeCandidateLastName", 
COALESCE(t1.payee_cand_fist_name, '''') AS "payeeCandidateFirstName", 
COALESCE(t1.payee_cand_middle_name, '''') AS "payeeCandidateMiddleName", 
COALESCE(t1.payee_cand_prefix, '''') AS "payeeCandidatePrefix",
COALESCE(t1.payee_cand_suffix, '''') AS "payeeCandidateSuffix",
COALESCE(t1.payee_cand_office, '''') AS "payeeCandidateOffice",
COALESCE(t1.payee_cand_state, '''') AS "payeeCandidateState",
COALESCE(t1.payee_cand_district, '''') AS "payeeCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_f t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
WHERE t1.transaction_type_identifier = ''COEXP_STAF_REIM'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SF', 'COEXP_PMT_PROL_MEMO', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t1.coordinated_exp_ind, '''') AS "coordinateExpenditure",
COALESCE(t1.designating_cmte_id, '''') AS "designatingCommitteeId",
COALESCE(t1.designating_cmte_name, '''') AS "designatingCommitteeName",
COALESCE(t1.subordinate_cmte_id, '''') AS "subordinateCommitteeId",
COALESCE(t1.subordinate_cmte_name, '''') AS "subordinateCommitteeName",
COALESCE(t1.subordinate_cmte_street_1, '''') AS "subordinateCommitteeStreet1",
COALESCE(t1.subordinate_cmte_street_2, '''') AS "subordinateCommitteeStreet2",
COALESCE(t1.subordinate_cmte_city, '''') AS "subordinateCommitteeCity",
COALESCE(t1.subordinate_cmte_state, '''') AS "subordinateCommitteeState",
COALESCE(t1.subordinate_cmte_zip,  '''') AS "subordinateCommitteeZipCode",
COALESCE(t2.entity_type, '''') AS "entityType",
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
COALESCE(t1.expenditure_amount, 0.0) AS "expenditureAmount",
COALESCE(t1.aggregate_general_elec_exp, 0.0) AS "aggregateGeneralElectionExpended", 
COALESCE(t1.purpose, '''') AS "expenditurePurposeDescription",
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.payee_cmte_id, '''') AS "payeeCommitteeId",
COALESCE(t1.payee_cand_id, '''') AS "candidateId",
COALESCE(t1.payee_cand_last_name, '''') AS "payeeCandidateLastName", 
COALESCE(t1.payee_cand_fist_name, '''') AS "payeeCandidateFirstName", 
COALESCE(t1.payee_cand_middle_name, '''') AS "payeeCandidateMiddleName", 
COALESCE(t1.payee_cand_prefix, '''') AS "payeeCandidatePrefix",
COALESCE(t1.payee_cand_suffix, '''') AS "payeeCandidateSuffix",
COALESCE(t1.payee_cand_office, '''') AS "payeeCandidateOffice",
COALESCE(t1.payee_cand_state, '''') AS "payeeCandidateState",
COALESCE(t1.payee_cand_district, '''') AS "payeeCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription"
FROM public.sched_f t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.payee_entity_id
WHERE t1.transaction_type_identifier = ''COEXP_PMT_PROL_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');



