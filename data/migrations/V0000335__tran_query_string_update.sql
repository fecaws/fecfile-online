INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
                    VALUES ('F3X', 'SB', 'PAC_CON_EAR_DEP_MEMO', '
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
                    WHERE t1.transaction_type_identifier = ''PAC_CON_EAR_DEP_MEMO'' AND t1.report_id = %s AND t1.cmte_id = %s AND (t1.back_ref_transaction_id = %s OR
                    (t1.back_ref_transaction_id IS NULL AND %s IS NULL)) AND t1.delete_ind is distinct from ''Y''
                    ');