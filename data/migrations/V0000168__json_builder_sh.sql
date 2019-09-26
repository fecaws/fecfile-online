INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SH1', 'ALLOC_H1', '
                    SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
                    COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
                    COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
                    COALESCE(t1.transaction_id, '''') AS "transactionId",
                    COALESCE(t1.presidential_only, '''') AS "presidentialOnly",
                    COALESCE(t1.presidential_and_senate, '''') AS "presidentialAndSenate",
                    COALESCE(t1.senate_only, '''') AS "senateOnly",
                    COALESCE(t1.non_pres_and_non_senate, '''') AS "nonPresidentialAndNonSenate",
                    COALESCE(t1.federal_percent, 0.0) AS "federalPercent",
                    COALESCE(t1.non_federal_percent, 0.0) AS "nonFederalPercent",
                    COALESCE(t1.adminstrative, '''') AS "adminstrative",
                    COALESCE(t1.generic_voter_drive, '''') AS "genericVoterDrive",
                    COALESCE(t1.public_communications, '''') AS "publicCommunications"
                    FROM public.sched_h1 t1
                    WHERE t1.transaction_type_identifier = ''ALLOC_H1'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y''
                    ');
INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SH2', 'ALLOC_H2_RATIO', '
                    SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
                    COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
                    COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
                    COALESCE(t1.transaction_id, '''') AS "transactionId",
                    COALESCE(t1.activity_event_name, '''') AS "activityEventName",
                    COALESCE(t1.fundraising, '''') AS "fundraising",
                    COALESCE(t1.direct_cand_support, '''') AS "directCandidateSupport",
                    COALESCE(t1.ratio_code, '''') AS "ratioCode",
                    COALESCE(t1.federal_percent, 0.0) AS "federalPercent",
                    COALESCE(t1.non_federal_percent, 0.0) AS "nonFederalPercent"
                    FROM public.sched_h2 t1
                    WHERE t1.transaction_type_identifier = ''ALLOC_H2_RATIO'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y''
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
                    COALESCE(t1.transferred_amount, 0.0) AS "transferredAmount",
                    COALESCE(t1.memo_code, '''') AS "memoCode",
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_h3 t1
                    WHERE t1.transaction_type_identifier = ''TRAN_FROM_NON_FED_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y''
                    ');
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
                    COALESCE(t1.generic_campaign_amount, 0.0) AS "genericCampaignAmount",
                    COALESCE(t1.memo_code, '''') AS "memoCode",
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_h5 t1
                    WHERE t1.transaction_type_identifier = ''TRAN_FROM_LEVIN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y''
                    ');

                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH4', 'ALLOC_EXP', '
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_EXP'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH4', 'ALLOC_EXP_CC_PAY_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_EXP_CC_PAY_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH4', 'ALLOC_EXP_STAF_REIM', '
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_EXP_STAF_REIM'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH4', 'ALLOC_EXP_STAF_REIM_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_EXP_STAF_REIM_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH4', 'ALLOC_EXP_PMT_TO_PROL', '
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_EXP_PMT_TO_PROL'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH4', 'ALLOC_EXP_VOID', '
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_EXP_VOID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH4', 'ALLOC_EXP_CC_PAY', '
                    SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
                    COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_EXP_CC_PAY'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH4', 'ALLOC_EXP_PMT_TO_PROL_MEMO', '
                    SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
                    COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_EXP_PMT_TO_PROL_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH6', 'ALLOC_FEA_DISB', '
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_FEA_DISB'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH6', 'ALLOC_FEA_CC_PAY_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_FEA_CC_PAY_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH6', 'ALLOC_FEA_STAF_REIM', '
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_FEA_STAF_REIM'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH6', 'ALLOC_FEA_STAF_REIM_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_FEA_STAF_REIM_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH6', 'ALLOC_FEA_VOID', '
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_FEA_VOID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SH6', 'ALLOC_FEA_CC_PAY', '
                    SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
                    COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
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
                    WHERE t1.transaction_type_identifier = ''ALLOC_FEA_CC_PAY'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
