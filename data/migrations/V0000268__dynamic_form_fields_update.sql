DELETE FROM public.tran_query_string WHERE tran_type_identifier='IE_B4_DISSE';

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SE', 'IE_B4_DISSE', '
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
WHERE t1.transaction_type_identifier = ''IE_B4_DISSE'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
');