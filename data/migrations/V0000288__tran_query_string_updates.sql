DELETE FROM public.tran_query_string WHERE tran_type_identifier in ('LEVIN_VOTER_REG', 'LEVIN_VOTER_ID', 'LEVIN_GOTV', 'LEVIN_GEN', 'LEVIN_OTH_DISB', 'IK_TRAN_OUT', 'IK_TRAN_FEA_OUT', 'CON_EAR_UNDEP_MEMO', 'CON_EAR_DEP_MEMO',
                    'PAC_CON_EAR_UNDEP_MEMO', 'PAC_CON_EAR_DEP_OUT', 'PARTY_IK_OUT', 'PAC_IK_OUT');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'LEVIN_VOTER_REG', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
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
COALESCE(t2.zip_code, '''') AS "payeeZipCode"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_VOTER_REG'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'LEVIN_VOTER_ID', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
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
COALESCE(t2.zip_code, '''') AS "payeeZipCode"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_VOTER_ID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'LEVIN_GOTV', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
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
COALESCE(t2.zip_code, '''') AS "payeeZipCode"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_GOTV'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'LEVIN_GEN', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
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
COALESCE(t2.zip_code, '''') AS "payeeZipCode"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_GEN'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'LEVIN_OTH_DISB', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
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
COALESCE(t2.zip_code, '''') AS "payeeZipCode"
FROM public.sched_b t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LEVIN_OTH_DISB'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'IK_TRAN_OUT', '
	SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount",
                        COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''IK_TRAN_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'IK_TRAN_FEA_OUT', '
	SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount",
                        COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''IK_TRAN_FEA_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'CON_EAR_UNDEP_MEMO', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
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
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        LEFT JOIN public.candidate_master t3 ON t3.cand_id = t1.beneficiary_cand_id
                        WHERE t1.transaction_type_identifier = ''CON_EAR_UNDEP_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'CON_EAR_DEP_MEMO', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
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
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        LEFT JOIN public.candidate_master t3 ON t3.cand_id = t1.beneficiary_cand_id
                        WHERE t1.transaction_type_identifier = ''CON_EAR_DEP_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'PAC_CON_EAR_UNDEP_MEMO', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
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
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        LEFT JOIN public.candidate_master t3 ON t3.cand_id = t1.beneficiary_cand_id
                        WHERE t1.transaction_type_identifier = ''PAC_CON_EAR_UNDEP_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'PAC_CON_EAR_DEP_OUT', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
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
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        LEFT JOIN public.candidate_master t3 ON t3.cand_id = t1.beneficiary_cand_id
                        WHERE t1.transaction_type_identifier = ''PAC_CON_EAR_DEP_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'PARTY_IK_OUT', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
                        COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PARTY_IK_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'PAC_IK_OUT', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
                        COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrganizationName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_IK_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');