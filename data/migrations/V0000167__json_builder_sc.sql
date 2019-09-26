INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SC', 'LOANS_OWED_BY_CMTE', '
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
COALESCE(t1.loan_due_date,''MM/DD/YYYY'') AS "loanDueDate",
COALESCE(t1.loan_intrest_rate, ''0.0'') AS "loanInterestRate",
COALESCE(t1.is_loan_secured, '''') AS "isLoanSecured",
COALESCE(t1.lender_cmte_id, '''') AS "lenderCommitteeId",
COALESCE(t1.lender_cand_id, '''') AS "candidateId",
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
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SC', 'LOANS_OWED_TO_CMTE', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
COALESCE(t1.transaction_id, '''') AS "transactionId",
COALESCE(t1.loan_amount_original, 0.0) AS "loanAmountOriginal",
COALESCE(t1.loan_payment_to_date, 0.0) AS "loanPaymentToDate",
COALESCE(t1.loan_balance, 0.0) AS "loanBalance",
COALESCE(to_char(t1.loan_incurred_date,''MM/DD/YYYY''), '''') AS "loanIncurredDate",
COALESCE(t1.loan_due_date,''MM/DD/YYYY'') AS "loanDueDate",
COALESCE(t1.loan_intrest_rate, ''0.0'') AS "loanInterestRate",
COALESCE(t1.is_loan_secured, '''') AS "isLoanSecured",
COALESCE(t1.lender_cmte_id, '''') AS "lenderCommitteeId",
COALESCE(t1.lender_cand_id, '''') AS "candidateId",
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
WHERE t1.transaction_type_identifier = ''LOANS_OWED_TO_CMTE'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y''
');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'LOAN_FROM_IND', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
COALESCE(t1.transaction_id, '''') AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(to_char(t1.contribution_date,''MM/DD/YYYY''), '''') AS "contributionDate", 
COALESCE(t1.contribution_amount, 0.0) AS "contributionAmount", 
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
COALESCE(t2.zip_code, '''') AS "contributorZipCode"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LOAN_FROM_IND'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SC1', 'SC1', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", 
COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", 
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
COALESCE(t1.transaction_id, '''') AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t2.entity_name, '''') AS "lenderOrganizationName",
COALESCE(t2.street_1, '''') AS "lenderStreet1",
COALESCE(t2.street_2, '''') AS "lenderStreet2",
COALESCE(t2.city, '''') AS "lenderCity",
COALESCE(t2.state, '''') AS "lenderState",
COALESCE(t2.zip_code, '''') AS "lenderZipCode",
COALESCE(t1.loan_amount, 0.0) AS "loanAmount",
COALESCE(t1.loan_intrest_rate, ''0.0'') AS "loanInterestRate",
COALESCE(to_char(t1.loan_incurred_date,''MM/DD/YYYY''), '''') AS "loanIncurredDate",
COALESCE(to_char(t1.loan_due_date,''MM/DD/YYYY''), '''') AS "loanDueDate",
COALESCE(t1.is_loan_restructured, ''N'') AS "isLoanRestructured",
COALESCE(to_char(t1.original_loan_date,''MM/DD/YYYY''), '''') AS "originalLoanDate",
COALESCE(t1.credit_amount_this_draw, 0.0) AS "creditAmountThisDraw",
COALESCE(t1.total_outstanding_balance, 0.0) AS "totalOutstandingBalance",
COALESCE(t1.other_parties_liable, ''N'') AS "otherPartiesLiable",
COALESCE(t1.pledged_collateral_ind, ''N'') AS "pledgedCollateralIndicator",
COALESCE(t1.pledge_collateral_desc, '''') AS "pledgeCollateralDescription",
COALESCE(t1.pledge_collateral_amount, 0.0) AS "pledgeCollateralAmount",
COALESCE(t1.perfected_intrest_ind, '''') AS "perfectedInterestIndicator",
COALESCE(t1.future_income_ind, '''') AS "futureIncomeIndicator",
COALESCE(t1.future_income_desc, '''') AS "futureIncomeDescription",
COALESCE(t1.future_income_estimate, 0.0) AS "futureIncomeEstimate",
COALESCE(to_char(t1.depository_account_established_date,''MM/DD/YYYY''), '''') AS "depositoryAccountEstablishedDate",
COALESCE(t1.depository_account_location, '''') AS "depositoryAccountLocation",
COALESCE(t1.depository_account_street_1, '''') AS "depositoryAccountStreet1",
COALESCE(t1.depository_account_street_2, '''') AS "depositoryAccountStreet2",
COALESCE(t1.depository_account_city, '''') AS "depositoryAccountCity",
COALESCE(t1.depository_account_state, '''') AS "depositoryAccountState",
COALESCE(t1.depository_account_zip, '''') AS "depositoryAccountZipCode",
COALESCE(to_char(t1.depository_account_auth_date,''MM/DD/YYYY''), '''') AS "depositoryAccountAuthorizedDate",
COALESCE(t1.basis_of_loan_desc, '''') AS "basisOfLoanDescription",
COALESCE(t3.last_name, '''') AS "treasurerLastName",
COALESCE(t3.first_name, '''') AS "treasurerFirstName",
COALESCE(t3.middle_name, '''') AS "treasurerMiddleName",
COALESCE(t3.preffix, '''') AS "treasurerPrefix",
COALESCE(t3.suffix, '''') AS "treasurerSuffix",
COALESCE(to_char(t1.treasurer_signed_date,''MM/DD/YYYY''), '''') AS "treasurerSignedDate", 
COALESCE(t4.last_name, '''') AS "authorizedLastName",
COALESCE(t4.first_name, '''') AS "authorizedFirstName",
COALESCE(t4.middle_name, '''') AS "authorizedMiddleName",
COALESCE(t4.preffix, '''') AS "authorizedPrefix",
COALESCE(t4.suffix, '''') AS "authorizedSuffix",
COALESCE(t1.authorized_entity_title, '''') AS "authorizedTitle",
COALESCE(to_char(t1.authorized_signed_date,''MM/DD/YYYY''), '''') AS "authorizedSignedDate"                        
FROM public.sched_c1 t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.lender_entity_id
LEFT JOIN public.entity t3 ON t3.entity_id = t1.treasurer_entity_id
LEFT JOIN public.entity t4 ON t4.entity_id = t1.authorized_entity_id
WHERE t1.transaction_type_identifier = ''SC1'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SC2', 'SC2', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
COALESCE(t1.transaction_id, '''') AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
COALESCE(t2.last_name, '''') AS "lastName", 
COALESCE(t2.first_name, '''') AS "firstName",
COALESCE(t2.middle_name, '''') AS "middleName", 
COALESCE(t2.preffix, '''') AS "preffix", 
COALESCE(t2.suffix, '''') AS "suffix",
COALESCE(t2.street_1, '''') AS "street1", 
COALESCE(t2.street_2, '''') AS "street2", 
COALESCE(t2.city, '''') AS "city",
COALESCE(t2.state, '''') AS "state", 
COALESCE(t2.zip_code, '''') AS "zipCode",
COALESCE(t2.employer, '''') AS "employer",
COALESCE(t2.occupation, '''') AS "occupation",
COALESCE(t1.guaranteed_amount, 0.0) AS "guaranteedAmount"
FROM public.sched_c2 t1
LEFT JOIN public.entity t2 ON t1.guarantor_entity_id = t2.entity_id
WHERE t1.transaction_type_identifier = ''SC2'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'LOANS_MADE', '
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
WHERE t1.transaction_type_identifier = ''LOANS_MADE'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SB', 'LOAN_REPAY_MADE', '
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
WHERE t1.transaction_type_identifier = ''LOAN_REPAY_MADE'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'LOAN_REPAY_RCVD', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LOAN_REPAY_RCVD'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'LOAN_FROM_BANK', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''LOAN_FROM_BANK'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');



