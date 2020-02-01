UPDATE public.tran_query_string SET tran_type_identifier = 'ALLOC_FEA_DISB_DEBT', query_string = 'SELECT COALESCE(t1.line_number, '') AS "lineNumber", 
COALESCE(t1.transaction_type, '') AS "transactionTypeCode", 
t1.transaction_type_identifier AS "transactionTypeIdentifier", 
t1.transaction_id AS "transactionId",
COALESCE(t1.back_ref_transaction_id, '') AS "backReferenceTransactionIdNumber", 
COALESCE(t1.back_ref_sched_name, '') AS "backReferenceScheduleName",                    
COALESCE(t2.entity_type, '') AS "entityType",
COALESCE(t2.entity_name, '') AS "payeeOrganizationName",
COALESCE(t2.last_name, '') AS "payeeLastName", 
COALESCE(t2.first_name, '') AS "payeeFirstName",
COALESCE(t2.middle_name, '') AS "payeeMiddleName", 
COALESCE(t2.preffix, '') AS "payeePrefix", 
COALESCE(t2.suffix, '') AS "payeeSuffix",
COALESCE(t2.street_1, '') AS "payeeStreet1", 
COALESCE(t2.street_2, '') AS "payeeStreet2", 
COALESCE(t2.city, '') AS "payeeCity",
COALESCE(t2.state, '') AS "payeeState", 
COALESCE(t2.zip_code, '') AS "payeeZipCode",
COALESCE(t1.account_event_identifier, '') AS "accountOrEventIdentifier",
COALESCE(to_char(t1.expenditure_date,"MM/DD/YYYY"), '') AS "expenditureDate",
COALESCE(t1.total_fed_levin_amount, 0.0) AS "totalFedOrLevinAmount",
COALESCE(t1.federal_share, 0.0) AS "federalShare",
COALESCE(t1.levin_share, 0.0) AS "levinShare",
COALESCE(t1.activity_event_total_ytd, 0.0) AS "activityOrEventTotalYTD",
COALESCE(t1.expenditure_purpose, '') AS "expenditurePurposeDescription",
COALESCE(t1.category_code, '') AS "categoryCode",
COALESCE(t1.activity_event_type, '') AS "activityorEventType",
COALESCE(t1.memo_code, '') AS "memoCode", 
COALESCE(t1.memo_text, '') AS "memoDescription"
FROM public.sched_h6 t1
LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
WHERE t1.transaction_type_identifier = "ALLOC_FEA_DISB_DEBT" AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
(t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from "Y"'
WHERE form_type = 'F3X' AND sched_type = 'SH6' AND tran_type_identifier= 'ALLOC_FEC_DISB_DEBT';
