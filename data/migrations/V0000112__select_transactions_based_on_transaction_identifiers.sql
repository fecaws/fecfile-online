INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'INDV_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''INDV_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PARTN_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PARTN_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'IK_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''IK_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'REATT_FROM', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''REATT_FROM'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'REATT_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''REATT_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'RET_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''RET_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'EAR_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''EAR_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'CON_EAR_UNDEP', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''CON_EAR_UNDEP'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'CON_EAR_DEP', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''CON_EAR_DEP'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'IND_RECNT_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''IND_RECNT_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'IND_NP_RECNT_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''IND_NP_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'IND_NP_HQ_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''IND_NP_HQ_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'IND_NP_CONVEN_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''IND_NP_CONVEN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'IND_REC_NON_CONT_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''IND_REC_NON_CONT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_IND_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_IND_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_NP_RECNT_IND_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_RECNT_IND_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_NP_CONVEN_IND_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_CONVEN_IND_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_NP_HQ_IND_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_HQ_IND_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'EAR_REC_RECNT_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''EAR_REC_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'EAR_REC_CONVEN_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''EAR_REC_CONVEN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'EAR_REC_HQ_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''EAR_REC_HQ_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'IK_OUT', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "payeeLastName", COALESCE(t2.first_name, '''') AS "payeeFirstName",
COALESCE(t2.middle_name, '''') AS "payeeMiddleName", COALESCE(t2.preffix, '''') AS "payeePrefix", COALESCE(t2.suffix, '''') AS "payeeSuffix",
COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZip"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''IK_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'IK_TRAN_OUT', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZip"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''IK_TRAN_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'IK_TRAN_FEA_OUT', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZip"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''IK_TRAN_FEA_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'CON_EAR_UNDEP_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.election_code, '''') AS "electionCode", COALESCE(t1.election_other_description, '''') AS "electionOtherDescription",
COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
COALESCE(t1.beneficiary_cand_id, '''') AS "beneficiaryCandidateId",
COALESCE(t3.cand_last_name, '''') AS "beneficiaryCandidateLastName", 
COALESCE(t3.cand_first_name, '''') AS "beneficiaryCandidateFirstName", 
COALESCE(t3.cand_middle_name, '''') AS "beneficiaryCandidateMiddleName", 
COALESCE(t3.cand_prefix, '''') AS "beneficiaryCandidatePrefix",
COALESCE(t3.cand_suffix, '''') AS "beneficiaryCandidateSuffix",
COALESCE(t3.cand_office, '''') AS "beneficiaryCandidateOffice",
COALESCE(t3.cand_office_state, '''') AS "beneficiaryCandidateState",
COALESCE(t3.cand_office_district, '''') AS "beneficiaryCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZip"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
LEFT JOIN public.candidate_master t3 ON t3.cand_id = t3.beneficiary_cand_id
WHERE t1.transaction_type_identifier = ''CON_EAR_UNDEP_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'CON_EAR_DEP_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.election_code, '''') AS "electionCode", COALESCE(t1.election_other_description, '''') AS "electionOtherDescription",
COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
COALESCE(t1.beneficiary_cand_id, '''') AS "beneficiaryCandidateId",
COALESCE(t3.cand_last_name, '''') AS "beneficiaryCandidateLastName", 
COALESCE(t3.cand_first_name, '''') AS "beneficiaryCandidateFirstName", 
COALESCE(t3.cand_middle_name, '''') AS "beneficiaryCandidateMiddleName", 
COALESCE(t3.cand_prefix, '''') AS "beneficiaryCandidatePrefix",
COALESCE(t3.cand_suffix, '''') AS "beneficiaryCandidateSuffix",
COALESCE(t3.cand_office, '''') AS "beneficiaryCandidateOffice",
COALESCE(t3.cand_office_state, '''') AS "beneficiaryCandidateState",
COALESCE(t3.cand_office_district, '''') AS "beneficiaryCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZip"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
LEFT JOIN public.candidate_master t3 ON t3.cand_id = t3.beneficiary_cand_id
WHERE t1.transaction_type_identifier = ''CON_EAR_DEP_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'PAC_CON_EAR_UNDEP_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.election_code, '''') AS "electionCode", COALESCE(t1.election_other_description, '''') AS "electionOtherDescription",
COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
COALESCE(t1.beneficiary_cand_id, '''') AS "beneficiaryCandidateId",
COALESCE(t3.cand_last_name, '''') AS "beneficiaryCandidateLastName", 
COALESCE(t3.cand_first_name, '''') AS "beneficiaryCandidateFirstName", 
COALESCE(t3.cand_middle_name, '''') AS "beneficiaryCandidateMiddleName", 
COALESCE(t3.cand_prefix, '''') AS "beneficiaryCandidatePrefix",
COALESCE(t3.cand_suffix, '''') AS "beneficiaryCandidateSuffix",
COALESCE(t3.cand_office, '''') AS "beneficiaryCandidateOffice",
COALESCE(t3.cand_office_state, '''') AS "beneficiaryCandidateState",
COALESCE(t3.cand_office_district, '''') AS "beneficiaryCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZip"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
LEFT JOIN public.candidate_master t3 ON t3.cand_id = t3.beneficiary_cand_id
WHERE t1.transaction_type_identifier = ''PAC_CON_EAR_UNDEP_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'PAC_CON_EAR_DEP_OUT', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.election_code, '''') AS "electionCode", COALESCE(t1.election_other_description, '''') AS "electionOtherDescription",
COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
COALESCE(t1.beneficiary_cand_id, '''') AS "beneficiaryCandidateId",
COALESCE(t3.cand_last_name, '''') AS "beneficiaryCandidateLastName", 
COALESCE(t3.cand_first_name, '''') AS "beneficiaryCandidateFirstName", 
COALESCE(t3.cand_middle_name, '''') AS "beneficiaryCandidateMiddleName", 
COALESCE(t3.cand_prefix, '''') AS "beneficiaryCandidatePrefix",
COALESCE(t3.cand_suffix, '''') AS "beneficiaryCandidateSuffix",
COALESCE(t3.cand_office, '''') AS "beneficiaryCandidateOffice",
COALESCE(t3.cand_office_state, '''') AS "beneficiaryCandidateState",
COALESCE(t3.cand_office_district, '''') AS "beneficiaryCandidateDistrict",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZip"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
LEFT JOIN public.candidate_master t3 ON t3.cand_id = t3.beneficiary_cand_id
WHERE t1.transaction_type_identifier = ''PAC_CON_EAR_DEP_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'PARTY_IK_OUT', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZip"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PARTY_IK_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'PAC_IK_OUT', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZip"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_IK_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PARTN_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PARTN_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'TRIB_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''TRIB_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'TRIB_NP_RECNT_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''TRIB_NP_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'TRIB_NP_HQ_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''TRIB_NP_HQ_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'TRIB_NP_CONVEN_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''TRIB_NP_CONVEN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'BUS_LAB_NON_CONT_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''BUS_LAB_NON_CONT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_TRIB_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_TRIB_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_NP_RECNT_TRIB_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_RECNT_TRIB_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_NP_CONVEN_TRIB_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_CONVEN_TRIB_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_NP_HQ_TRIB_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_HQ_TRIB_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'EAR_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''EAR_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_CON_EAR_UNDEP', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_CON_EAR_UNDEP'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_CON_EAR_DEP', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_CON_EAR_DEP'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_EAR_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_EAR_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_EAR_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_EAR_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PARTY_IK_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PARTY_IK_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_IK_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_IK_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PARTY_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PARTY_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_NON_FED_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_NON_FED_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_NON_FED_RET', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_NON_FED_RET'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_RET', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_RET'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PARTY_RET', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PARTY_RET'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'TRAN', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''TRAN'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PARTY_RECNT_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PARTY_RECNT_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_RECNT_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_RECNT_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'TRIB_RECNT_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''TRIB_RECNT_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PARTY_NP_RECNT_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PARTY_NP_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_NP_RECNT_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_NP_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PARTY_NP_HQ_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PARTY_NP_HQ_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_NP_HQ_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_NP_HQ_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PARTY_NP_CONVEN_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PARTY_NP_CONVEN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'PAC_NP_CONVEN_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''PAC_NP_CONVEN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'OTH_CMTE_NON_CONT_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''OTH_CMTE_NON_CONT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'IK_TRAN', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''IK_TRAN'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'IK_TRAN_FEA', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''IK_TRAN_FEA'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_PARTY_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_PARTY_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_PAC_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_PAC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_NP_RECNT_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_NP_RECNT_PAC_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_RECNT_PAC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_NP_CONVEN_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_CONVEN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_NP_CONVEN_PAC_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_CONVEN_PAC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_NP_HQ_ACC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_HQ_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'JF_TRAN_NP_HQ_PAC_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_HQ_PAC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'EAR_REC_RECNT_ACC_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''EAR_REC_RECNT_ACC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'EAR_REC_CONVEN_ACC_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''EAR_REC_CONVEN_ACC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'EAR_REC_HQ_ACC_MEMO', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''EAR_REC_HQ_ACC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'OFFSET_TO_OPEX', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''OFFSET_TO_OPEX'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'OTH_REC', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''OTH_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'REF_TO_OTH_CMTE', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.election_code, '''') AS "electionCode", 
COALESCE(t1.election_other_description, '''') AS "electionOtherDescription",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''REF_TO_OTH_CMTE'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'REF_TO_FED_CAN', 'SELECT t1.line_number AS "lineNumber", t1.transaction_type AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription",  COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName", 
COALESCE(t1.election_code, '''') AS "electionCode", COALESCE(t1.election_other_description, '''') AS "electionOtherDescription",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZip"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''REF_TO_FED_CAN'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');