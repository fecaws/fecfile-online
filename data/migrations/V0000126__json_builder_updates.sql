
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''INDV_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'INDV_REC'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''PARTN_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'PARTN_MEMO'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''IK_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'IK_REC'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''REATT_FROM'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'REATT_FROM'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''REATT_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'REATT_MEMO'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''RET_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'RET_REC'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''EAR_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'EAR_REC'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''CON_EAR_UNDEP'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'CON_EAR_UNDEP'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''CON_EAR_DEP'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'CON_EAR_DEP'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''IND_RECNT_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'IND_RECNT_REC'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''IND_NP_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'IND_NP_RECNT_ACC'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''IND_NP_HQ_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'IND_NP_HQ_ACC'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''IND_NP_CONVEN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'IND_NP_CONVEN_ACC'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''IND_REC_NON_CONT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'IND_REC_NON_CONT_ACC'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''JF_TRAN_IND_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'JF_TRAN_IND_MEMO'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_RECNT_IND_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'JF_TRAN_NP_RECNT_IND_MEMO'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_CONVEN_IND_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'JF_TRAN_NP_CONVEN_IND_MEMO'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_HQ_IND_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'JF_TRAN_NP_HQ_IND_MEMO'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''EAR_REC_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'EAR_REC_RECNT_ACC'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''EAR_REC_CONVEN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'EAR_REC_CONVEN_ACC'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                    UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                    t1.transaction_id AS "transactionId",
                    COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                    to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                    COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                    COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                    COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                    COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                    COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                    COALESCE(t2.occupation, '''') AS "contributorOccupation"
                    FROM public.sched_a t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''EAR_REC_HQ_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'EAR_REC_HQ_ACC'
                    AND form_type = 'F3X' AND sched_type = 'SA';

                    
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount",
                        COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.last_name, '''') AS "payeeLastName", COALESCE(t2.first_name, '''') AS "payeeFirstName",
                        COALESCE(t2.middle_name, '''') AS "payeeMiddleName", COALESCE(t2.preffix, '''') AS "payeePrefix", COALESCE(t2.suffix, '''') AS "payeeSuffix",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''IK_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''' WHERE tran_type_identifier = 'IK_OUT'
                        AND form_type = 'F3X' AND sched_type = 'SB';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount",
                        COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''IK_TRAN_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'IK_TRAN_OUT'
                        AND form_type = 'F3X' AND sched_type = 'SB';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount",
                        COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''IK_TRAN_FEA_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'IK_TRAN_FEA_OUT'
                        AND form_type = 'F3X' AND sched_type = 'SB';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        LEFT JOIN public.candidate_master t3 ON t3.cand_id = t1.beneficiary_cand_id
                        WHERE t1.transaction_type_identifier = ''CON_EAR_UNDEP_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'CON_EAR_UNDEP_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SB';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        LEFT JOIN public.candidate_master t3 ON t3.cand_id = t1.beneficiary_cand_id
                        WHERE t1.transaction_type_identifier = ''CON_EAR_DEP_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'CON_EAR_DEP_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SB';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        LEFT JOIN public.candidate_master t3 ON t3.cand_id = t1.beneficiary_cand_id
                        WHERE t1.transaction_type_identifier = ''PAC_CON_EAR_UNDEP_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_CON_EAR_UNDEP_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SB';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        LEFT JOIN public.candidate_master t3 ON t3.cand_id = t1.beneficiary_cand_id
                        WHERE t1.transaction_type_identifier = ''PAC_CON_EAR_DEP_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_CON_EAR_DEP_OUT'
                        AND form_type = 'F3X' AND sched_type = 'SB';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
                        COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PARTY_IK_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PARTY_IK_OUT'
                        AND form_type = 'F3X' AND sched_type = 'SB';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", t1.expenditure_amount AS "expenditureAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription", COALESCE(t1.category_code, '''') AS "categoryCode",
                        COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "payeeOrgName",
                        COALESCE(t2.street_1, '''') AS "payeeStreet1", COALESCE(t2.street_2, '''') AS "payeeStreet2", COALESCE(t2.city, '''') AS "payeeCity",
                        COALESCE(t2.state, '''') AS "payeeState", COALESCE(t2.zip_code, '''') AS "payeeZipCode"
                        FROM public.sched_b t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_IK_OUT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_IK_OUT'
                        AND form_type = 'F3X' AND sched_type = 'SB';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        WHERE t1.transaction_type_identifier = ''PARTN_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PARTN_REC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        WHERE t1.transaction_type_identifier = ''TRIB_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'TRIB_REC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        WHERE t1.transaction_type_identifier = ''TRIB_NP_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'TRIB_NP_RECNT_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        WHERE t1.transaction_type_identifier = ''TRIB_NP_HQ_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'TRIB_NP_HQ_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        WHERE t1.transaction_type_identifier = ''TRIB_NP_CONVEN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'TRIB_NP_CONVEN_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        WHERE t1.transaction_type_identifier = ''BUS_LAB_NON_CONT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'BUS_LAB_NON_CONT_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        WHERE t1.transaction_type_identifier = ''JF_TRAN_TRIB_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN_TRIB_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_RECNT_TRIB_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN_NP_RECNT_TRIB_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_CONVEN_TRIB_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN_NP_CONVEN_TRIB_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_HQ_TRIB_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN_NP_HQ_TRIB_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''EAR_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'EAR_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_CON_EAR_UNDEP'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_CON_EAR_UNDEP'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_CON_EAR_DEP'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_CON_EAR_DEP'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_EAR_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_EAR_REC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_EAR_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_EAR_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PARTY_IK_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PARTY_IK_REC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_IK_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_IK_REC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PARTY_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PARTY_REC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_REC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_NON_FED_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_NON_FED_REC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_NON_FED_RET'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_NON_FED_RET'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_RET'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_RET'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PARTY_RET'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PARTY_RET'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''TRAN'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'TRAN'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PARTY_RECNT_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PARTY_RECNT_REC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_RECNT_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_RECNT_REC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''TRIB_RECNT_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'TRIB_RECNT_REC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PARTY_NP_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PARTY_NP_RECNT_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_NP_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_NP_RECNT_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PARTY_NP_HQ_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PARTY_NP_HQ_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_NP_HQ_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_NP_HQ_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PARTY_NP_CONVEN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PARTY_NP_CONVEN_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''PAC_NP_CONVEN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'PAC_NP_CONVEN_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''OTH_CMTE_NON_CONT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'OTH_CMTE_NON_CONT_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''IK_TRAN'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'IK_TRAN'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''IK_TRAN_FEA'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'IK_TRAN_FEA'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''JF_TRAN'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''JF_TRAN_PARTY_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN_PARTY_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''JF_TRAN_PAC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN_PAC_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN_NP_RECNT_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_RECNT_PAC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN_NP_RECNT_PAC_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_CONVEN_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN_NP_CONVEN_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_CONVEN_PAC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN_NP_CONVEN_PAC_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_HQ_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN_NP_HQ_ACC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''JF_TRAN_NP_HQ_PAC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'JF_TRAN_NP_HQ_PAC_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''EAR_REC_RECNT_ACC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'EAR_REC_RECNT_ACC_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''EAR_REC_CONVEN_ACC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'EAR_REC_CONVEN_ACC_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''EAR_REC_HQ_ACC_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'EAR_REC_HQ_ACC_MEMO'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
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
                        WHERE t1.transaction_type_identifier = ''OFFSET_TO_OPEX'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'OFFSET_TO_OPEX'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName", COALESCE(t2.last_name, '''') AS "contributorLastName", COALESCE(t2.first_name, '''') AS "contributorFirstName",
                        COALESCE(t2.middle_name, '''') AS "contributorMiddleName", COALESCE(t2.preffix, '''') AS "contributorPrefix", COALESCE(t2.suffix, '''') AS "contributorSuffix",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode", COALESCE(t2.employer, '''') AS "contributorEmployer",
                        COALESCE(t2.occupation, '''') AS "contributorOccupation"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''OTH_REC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'OTH_REC'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription", COALESCE(t1.election_code, '''') AS "electionCode",
                        COALESCE(t1.election_other_description, '''') AS "electionOtherDescription",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''REF_TO_OTH_CMTE'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'REF_TO_OTH_CMTE'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                        UPDATE public.tran_query_string SET query_string = '
                        SELECT COALESCE(t1.line_number, '''') AS "lineNumber", COALESCE(t1.transaction_type, '''') AS "transactionTypeCode", t1.transaction_type_identifier AS "transactionTypeIdentifier",
                        t1.transaction_id AS "transactionId",
                        COALESCE(t1.back_ref_transaction_id, '''') AS "backReferenceTransactionIdNumber", COALESCE(t1.back_ref_sched_name, '''') AS "backReferenceScheduleName",
                        to_char(t1.contribution_date,''MM/DD/YYYY'') AS "contributionDate", t1.contribution_amount AS "contributionAmount", COALESCE(t1.aggregate_amt, 0.0) AS "contributionAggregate",
                        COALESCE(t1.purpose_description, '''') AS "contributionPurposeDescription",  COALESCE(t1.donor_cmte_id, '''') AS "donorCommitteeId", COALESCE(t1.donor_cmte_name, '''') AS "donorCommitteeName",
                        COALESCE(t1.election_code, '''') AS "electionCode", COALESCE(t1.election_other_description, '''') AS "electionOtherDescription",
                        COALESCE(t1.memo_code, '''') AS "memoCode", COALESCE(t1.memo_text, '''') AS "memoDescription",
                        COALESCE(t2.entity_type, '''') AS "entityType", COALESCE(t2.entity_name, '''') AS "contributorOrgName",
                        COALESCE(t2.street_1, '''') AS "contributorStreet1", COALESCE(t2.street_2, '''') AS "contributorStreet2", COALESCE(t2.city, '''') AS "contributorCity",
                        COALESCE(t2.state, '''') AS "contributorState", COALESCE(t2.zip_code, '''') AS "contributorZipCode"
                        FROM public.sched_a t1
                        LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                        WHERE t1.transaction_type_identifier = ''REF_TO_FED_CAN'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                        (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                        ' WHERE tran_type_identifier = 'REF_TO_FED_CAN'
                        AND form_type = 'F3X' AND sched_type = 'SA';

                        
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP', '
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
                    WHERE t1.transaction_type_identifier = ''OPEXP'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_CC_PAY_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''OPEXP_CC_PAY_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_STAF_REIM', '
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
                    WHERE t1.transaction_type_identifier = ''OPEXP_STAF_REIM'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_STAF_REIM_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''OPEXP_STAF_REIM_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_PMT_TO_PROL_VOID', '
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
                    WHERE t1.transaction_type_identifier = ''OPEXP_PMT_TO_PROL_VOID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB', '
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
                    WHERE t1.transaction_type_identifier = ''OTH_DISB'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_CC_PAY_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_CC_PAY_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_STAF_REIM', '
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
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_STAF_REIM'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_STAF_REIM_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_STAF_REIM_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_HQ_ACC_OP_EXP_NP', '
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
                    WHERE t1.transaction_type_identifier = ''OPEXP_HQ_ACC_OP_EXP_NP'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_CONV_ACC_OP_EXP_NP', '
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
                    WHERE t1.transaction_type_identifier = ''OPEXP_CONV_ACC_OP_EXP_NP'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_NC_ACC', '
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
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_NC_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_NC_ACC_CC_PAY_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_NC_ACC_CC_PAY_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_NC_ACC_STAF_REIM', '
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
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_NC_ACC_STAF_REIM'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_NC_ACC_STAF_REIM_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_NC_ACC_STAF_REIM_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_NC_ACC_PMT_TO_PROL_VOID', '
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
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_NC_ACC_PMT_TO_PROL_VOID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_CC_PAY', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OPEXP_CC_PAY'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_PMT_TO_PROL', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OPEXP_PMT_TO_PROL'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_CC_PAY', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_CC_PAY'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_PMT_TO_PROL', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_PMT_TO_PROL'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_RECNT', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_RECNT'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_NP_RECNT_ACC', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_NP_RECNT_ACC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_NC_ACC_CC_PAY', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_NC_ACC_CC_PAY'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_NC_ACC_PMT_TO_PROL', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_NC_ACC_PMT_TO_PROL'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_HQ_ACC_TRIB_REF', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OPEXP_HQ_ACC_TRIB_REF'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_CONV_ACC_TRIB_REF', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OPEXP_CONV_ACC_TRIB_REF'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_NP_RECNT_TRIB_REF', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_NP_RECNT_TRIB_REF'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_PMT_TO_PROL_MEMO', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OPEXP_PMT_TO_PROL_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'REF_CONT_IND', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''REF_CONT_IND'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'REF_CONT_IND_VOID', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''REF_CONT_IND_VOID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_PMT_TO_PROL_MEMO', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_PMT_TO_PROL_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_NC_ACC_PMT_TO_PROL_MEMO', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_NC_ACC_PMT_TO_PROL_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_HQ_ACC_IND_REF', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OPEXP_HQ_ACC_IND_REF'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_CONV_ACC_IND_REF', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OPEXP_CONV_ACC_IND_REF'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_NP_RECNT_IND_REF', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_NP_RECNT_IND_REF'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'TRAN_TO_AFFI', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", 
                    COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''TRAN_TO_AFFI'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'CONT_TO_OTH_CMTE', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", 
                    COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''CONT_TO_OTH_CMTE'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'REF_CONT_PARTY', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", 
                    COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''REF_CONT_PARTY'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'REF_CONT_PARTY_VOID', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", 
                    COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''REF_CONT_PARTY_VOID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_HQ_ACC_REG_REF', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", 
                    COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OPEXP_HQ_ACC_REG_REF'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OPEXP_CONV_ACC_REG_REF', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", 
                    COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OPEXP_CONV_ACC_REG_REF'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'OTH_DISB_NP_RECNT_REG_REF', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
                    COALESCE(t1.beneficiary_cmte_id, '''') AS "beneficiaryCommitteeId", 
                    COALESCE(t1.beneficiary_cmte_name, '''') AS "beneficiaryCommitteeName",
                    COALESCE(t1.memo_code, '''') AS "memoCode", 
                    COALESCE(t1.memo_text, '''') AS "memoDescription"
                    FROM public.sched_b t1
                    LEFT JOIN public.entity t2 ON t2.entity_id = t1.entity_id
                    WHERE t1.transaction_type_identifier = ''OTH_DISB_NP_RECNT_REG_REF'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'REF_CONT_PAC', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
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
                    WHERE t1.transaction_type_identifier = ''REF_CONT_PAC'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'REF_CONT_NON_FED', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
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
                    WHERE t1.transaction_type_identifier = ''REF_CONT_NON_FED'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'CONT_TO_CAN', '
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
                    COALESCE(t1.election_code, '''') AS "electionCode", 
                    COALESCE(t1.election_other_description, '''') AS "electionOtherDescription",
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
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
                    WHERE t1.transaction_type_identifier = ''CONT_TO_CAN'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'CONT_TO_OTH_CMTE_VOID', '
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
                    COALESCE(t1.election_code, '''') AS "electionCode", 
                    COALESCE(t1.election_other_description, '''') AS "electionOtherDescription",
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
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
                    WHERE t1.transaction_type_identifier = ''CONT_TO_OTH_CMTE_VOID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'REF_CONT_PAC_VOID', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    t1.semi_annual_refund_bundled_amount AS "semiAnnualRefundedBundledAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
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
                    WHERE t1.transaction_type_identifier = ''REF_CONT_PAC_VOID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'REF_CONT_NON_FED_VOID', '
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
                    to_char(t1.expenditure_date,''MM/DD/YYYY'') AS "expenditureDate", 
                    t1.expenditure_amount AS "expenditureAmount",
                    t1.semi_annual_refund_bundled_amount AS "semiAnnualRefundedBundledAmount",
                    COALESCE(t1.expenditure_purpose, '''') AS "expenditurePurposeDescription",
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
                    WHERE t1.transaction_type_identifier = ''REF_CONT_NON_FED_VOID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'FEA_100PCT_PAY', '
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
                    WHERE t1.transaction_type_identifier = ''FEA_100PCT_PAY'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'FEA_PAY_TO_PROL', '
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
                    WHERE t1.transaction_type_identifier = ''FEA_PAY_TO_PROL'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'FEA_CC_PAY', '
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
                    WHERE t1.transaction_type_identifier = ''FEA_CC_PAY'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'FEA_CC_PAY_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''FEA_CC_PAY_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'FEA_STAF_REIM', '
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
                    WHERE t1.transaction_type_identifier = ''FEA_STAF_REIM'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'FEA_STAF_REIM_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''FEA_STAF_REIM_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'FEA_PAY_TO_PROL_VOID', '
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
                    WHERE t1.transaction_type_identifier = ''FEA_PAY_TO_PROL_VOID'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
                    INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'FEA_PAY_TO_PROL_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''FEA_PAY_TO_PROL_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');

                    
