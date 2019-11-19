INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-A', 'LEVIN_INDV_REC', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.contribution_date,''MM/DD/YYYY''), '''') AS "contributionDate", 
t1.contribution_amount AS "contributionAmount", 
COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", 
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.last_name, '''') AS "contributorLastName", 
COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", 
COALESCE(t2.preffix, '''') AS "contributorPrefix", 
COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", 
COALESCE(t2.street_2, '''') AS "contributorStreet2", 
COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", 
COALESCE(t2.zip_code, '''') AS "contributorZipCode", 
COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_INDV_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-A', 'LEVIN_PARTN_MEMO', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.contribution_date,''MM/DD/YYYY''), '''') AS "contributionDate", 
t1.contribution_amount AS "contributionAmount", 
COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", 
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.last_name, '''') AS "contributorLastName", 
COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", 
COALESCE(t2.preffix, '''') AS "contributorPrefix", 
COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", 
COALESCE(t2.street_2, '''') AS "contributorStreet2", 
COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", 
COALESCE(t2.zip_code, '''') AS "contributorZipCode", 
COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_PARTN_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-A', 'LEVIN_ORG_REC', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.contribution_date,''MM/DD/YYYY''), '''') AS "contributionDate", 
t1.contribution_amount AS "contributionAmount", 
COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", 
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType",
COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", 
COALESCE(t2.street_2, '''') AS "contributorStreet2", 
COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", 
COALESCE(t2.zip_code, '''') AS "contributorZipCode", 
COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_ORG_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-A', 'LEVIN_PARTN_REC', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.contribution_date,''MM/DD/YYYY''), '''') AS "contributionDate", 
t1.contribution_amount AS "contributionAmount", 
COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", 
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType",
COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", 
COALESCE(t2.street_2, '''') AS "contributorStreet2", 
COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", 
COALESCE(t2.zip_code, '''') AS "contributorZipCode"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_PARTN_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-A', 'LEVIN_TRIB_REC', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.contribution_date,''MM/DD/YYYY''), '''') AS "contributionDate", 
t1.contribution_amount AS "contributionAmount", 
COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", 
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType",
COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", 
COALESCE(t2.street_2, '''') AS "contributorStreet2", 
COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", 
COALESCE(t2.zip_code, '''') AS "contributorZipCode"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_TRIB_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-A', 'LEVIN_PAC_REC', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.contribution_date,''MM/DD/YYYY''), '''') AS "contributionDate", 
t1.contribution_amount AS "contributionAmount", 
COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", 
COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", 
COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType",
COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", 
COALESCE(t2.street_2, '''') AS "contributorStreet2", 
COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", 
COALESCE(t2.zip_code, '''') AS "contributorZipCode"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_PAC_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-A', 'LEVIN_NON_FED_REC', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.contribution_date,''MM/DD/YYYY''), '''') AS "contributionDate", 
t1.contribution_amount AS "contributionAmount", 
COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", 
COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", 
COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType",
COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", 
COALESCE(t2.street_2, '''') AS "contributorStreet2", 
COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", 
COALESCE(t2.zip_code, '''') AS "contributorZipCode"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_NON_FED_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-A', 'LEVIN_OTH_REC', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.contribution_date,''MM/DD/YYYY''), '''') AS "contributionDate", 
t1.contribution_amount AS "contributionAmount", 
COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", 
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType",
COALESCE(t2.entity_name, '''') AS "contributorOrgName", 
COALESCE(t2.last_name, '''') AS "contributorLastName", 
COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", 
COALESCE(t2.preffix, '''') AS "contributorPrefix", 
COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", 
COALESCE(t2.street_2, '''') AS "contributorStreet2", 
COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", 
COALESCE(t2.zip_code, '''') AS "contributorZipCode"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_OTH_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-B', 'LEVIN_VOTER_REG', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.expenditure_date,''MM/DD/YYYY''), '''') AS "expenditureDate", 
t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", 
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.last_name, '''') AS "payeeLastName", 
COALESCE(t2.first_name, '''') AS "payeeFirstName",
COALESCE(t2.middle_name, '''') AS "payeeMiddleName", 
COALESCE(t2.preffix, '''') AS "payeePrefix", 
COALESCE(t2.suffix, '''') AS "payeeSuffix",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_VOTER_REG'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-B', 'LEVIN_VOTER_ID', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.expenditure_date,''MM/DD/YYYY''), '''') AS "expenditureDate", 
t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", 
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.last_name, '''') AS "payeeLastName", 
COALESCE(t2.first_name, '''') AS "payeeFirstName",
COALESCE(t2.middle_name, '''') AS "payeeMiddleName", 
COALESCE(t2.preffix, '''') AS "payeePrefix", 
COALESCE(t2.suffix, '''') AS "payeeSuffix",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_VOTER_ID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-B', 'LEVIN_GOTV', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.expenditure_date,''MM/DD/YYYY''), '''') AS "expenditureDate", 
t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", 
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.last_name, '''') AS "payeeLastName", 
COALESCE(t2.first_name, '''') AS "payeeFirstName",
COALESCE(t2.middle_name, '''') AS "payeeMiddleName", 
COALESCE(t2.preffix, '''') AS "payeePrefix", 
COALESCE(t2.suffix, '''') AS "payeeSuffix",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_GOTV'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-B', 'LEVIN_GEN', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.expenditure_date,''MM/DD/YYYY''), '''') AS "expenditureDate", 
t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", 
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.last_name, '''') AS "payeeLastName", 
COALESCE(t2.first_name, '''') AS "payeeFirstName",
COALESCE(t2.middle_name, '''') AS "payeeMiddleName", 
COALESCE(t2.preffix, '''') AS "payeePrefix", 
COALESCE(t2.suffix, '''') AS "payeeSuffix",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_GEN'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL-B', 'LEVIN_OTH_DISB', 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.expenditure_date,''MM/DD/YYYY''), '''') AS "expenditureDate", 
t1.expenditure_amount AS "expenditureAmount",
COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", 
COALESCE(t1.category_code, '''') AS "categoryCode",
COALESCE(t1.memo_code, '''') AS "memoCode", 
COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", 
COALESCE(t2.entity_name, '''') AS "payeeOrgName",
COALESCE(t2.last_name, '''') AS "payeeLastName", 
COALESCE(t2.first_name, '''') AS "payeeFirstName",
COALESCE(t2.middle_name, '''') AS "payeeMiddleName", 
COALESCE(t2.preffix, '''') AS "payeePrefix", 
COALESCE(t2.suffix, '''') AS "payeeSuffix",
COALESCE(t2.street_1, '''') AS "payeeStreet1", 
COALESCE(t2.street_2, '''') AS "payeeStreet2", 
COALESCE(t2.city, '''') AS "payeeCity",
COALESCE(t2.state, '''') AS "payeeState", 
COALESCE(t2.zip_code, '''') AS "payeeZipCode"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_OTH_DISB'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''');

DELETE FROM tran_query_string WHERE tran_type_identifier = 'DEBT_TO_VENDOR';

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
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''DEBT_TO_VENDOR'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SL', 'SCHED_L_SUM', '
SELECT t1.transaction_type_identifier AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
t1.record_id AS "recordId",
COALESCE(t1.account_name, '''') AS "accountName", 
COALESCE(to_char(t1.cvg_from_date,''MM/DD/YYYY''), '''') AS "coverageFromDate",
COALESCE(to_char(t1.cvg_end_date,''MM/DD/YYYY''), '''') AS "coverageThroughDate",
COALESCE(t1.item_receipts, 0.0) AS "itemizedReceiptsFromPersons", 
COALESCE(t1.unitem_receipts, 0.0) AS "unitemizedReceiptsFromPersons", 
COALESCE(t1.total_c_receipts, 0.0) AS "totalReceiptsFromPersons", 
COALESCE(t1.other_receipts, 0.0) AS "otherReceipts", 
COALESCE(t1.total_receipts, 0.0) AS "totalReceipts", 
COALESCE(t1.voter_reg_disb_amount, 0.0) AS "voterRegistrationDisbursements", 
COALESCE(t1.voter_id_disb_amount, 0.0) AS "voterIdDisbursements", 
COALESCE(t1.gotv_disb_amount, 0.0) AS "gotvDisbursements", 
COALESCE(t1.generic_campaign_disb_amount, 0.0) AS "genericCampaignDisbursements", 
COALESCE(t1.total_disb_sub, 0.0) AS "totalSubDisbursements", 
COALESCE(t1.other_disb, 0.0) AS "otherDisbursements", 
COALESCE(t1.total_disb, 0.0) AS "totalDisbursements", 
COALESCE(t1.coh_bop, 0.0) AS "beginningCashOnHand", 
COALESCE(t1.receipts, 0.0) AS "receipts", 
COALESCE(t1.subtotal, 0.0) AS "subtotal", 
COALESCE(t1.disbursements, 0.0) AS "disbursements", 
COALESCE(t1.coh_cop, 0.0) AS "endingCashOnHand",       
COALESCE(t1.item_receipts_ytd, 0.0) AS "itemizedReceiptsFromPersonsYTD", 
COALESCE(t1.unitem_receipts_ytd, 0.0) AS "unitemizedReceiptsFromPersonsYTD", 
COALESCE(t1.total_c_receipts_ytd, 0.0) AS "totalReceiptsFromPersonsYTD", 
COALESCE(t1.other_receipts_ytd, 0.0) AS "otherReceiptsYTD", 
COALESCE(t1.total_receipts_ytd, 0.0) AS "totalReceiptsYTD", 
COALESCE(t1.voter_reg_disb_amount_ytd, 0.0) AS "voterRegistrationDisbursementsYTD", 
COALESCE(t1.voter_id_disb_amount_ytd, 0.0) AS "voterIdDisbursementsYTD", 
COALESCE(t1.gotv_disb_amount_ytd, 0.0) AS "gotvDisbursementsYTD", 
COALESCE(t1.generic_campaign_disb_amount_ytd, 0.0) AS "genericCampaignDisbursementsYTD", 
COALESCE(t1.total_disb_sub_ytd, 0.0) AS "totalSubDisbursementsYTD", 
COALESCE(t1.other_disb_ytd, 0.0) AS "otherDisbursementsYTD", 
COALESCE(t1.total_disb_ytd, 0.0) AS "totalDisbursementsYTD", 
COALESCE(t1.coh_coy, 0.0) AS "beginningCashOnHandYTD", 
COALESCE(t1.receipts_ytd, 0.0) AS "receiptsYTD", 
COALESCE(t1.sub_total_ytd, 0.0) AS "subtotalYTD", 
COALESCE(t1.disbursements_ytd, 0.0) AS "disbursementsYTD", 
COALESCE(t1.coh_cop_ytd, 0.0) AS "endingCashOnHandYTD"
FROM public.sched_l t1
WHERE t1.transaction_type_identifier = ''SCHED_L_SUM'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y''
');

