DELETE FROM public.tran_query_string WHERE tran_type_identifier in ('TRAN_FROM_LEVIN_ACC', 'TRAN_FROM_NON_FED_ACC');


INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SH5', 'TRAN_FROM_LEVIN_ACC', '
                    SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
                    COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
                    COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
                    COALESCE(t1.transaction_id, '''') AS "transactionId",
                    COALESCE(t1.account_name, '''') AS "accountName",
                    COALESCE(to_char(t1.receipt_date,''MM/DD/YYYY''), '''') AS "receiptDate",
                    COALESCE(t1.total_amount_transferred, 0.0) AS "totalAmountTransferred",
                    COALESCE(t1.voter_registration_amount, 0.0) AS "voterRegistrationAmount",
                    COALESCE(t1.voter_id_amount, 0.0) AS "voterIdAmount",
                    COALESCE(t1.gotv_amount, 0.0) AS "gotvAmount",
                    COALESCE(t1.generic_campaign_amount, 0.0) AS "genericCampaignAmount"
                    FROM public.sched_h5 t1
                    WHERE t1.transaction_type_identifier = ''TRAN_FROM_LEVIN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y''
                    ');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SH3', 'TRAN_FROM_NON_FED_ACC', '
                    SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
                    COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
                    COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
                    COALESCE(t1.transaction_id, '''') AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber",
                    COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    COALESCE(t1.account_name, '''') AS "accountName",
                    COALESCE(t1.activity_event_type, '''') AS "activityEventType",
                    COALESCE(t1.activity_event_name, '''') AS "activityEventName",
                    COALESCE(to_char(t1.receipt_date,''MM/DD/YYYY''), '''') AS "receiptDate",
                    COALESCE(t1.total_amount_transferred, 0.0) AS "totalAmountTransferred",
                    COALESCE(t1.transferred_amount, 0.0) AS "transferredAmount"
                    FROM public.sched_h3 t1
                    WHERE t1.transaction_type_identifier = ''TRAN_FROM_NON_FED_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y''
                    ');