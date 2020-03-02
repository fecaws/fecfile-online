DELETE FROM public.tran_query_string WHERE tran_type_identifier in ('DEBT_BY_VENDOR','DEBT_TO_VENDOR');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SD', 'DEBT_BY_VENDOR', '
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
WHERE t1.transaction_type_identifier = ''DEBT_BY_VENDOR'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');

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
WHERE t1.transaction_type_identifier = ''DEBT_TO_VENDOR'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SA', 'OTH_REC_DEBT', '
SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription",
COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName", COALESCE(t2.last_name, '''') AS "contributorLastName",
COALESCE(t2.first_name, '''') AS"contributorFirstName",
COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
COALESCE(t2.occupation, '''') AS "contributorOccupation"
FROM public.sched_a t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = ''OTH_REC_DEBT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');


