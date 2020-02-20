DELETE FROM public.tran_query_string WHERE tran_type_identifier in ('ALLOC_H1','ALLOC_H2_RATIO');

INSERT INTO public.tran_query_string(form_type, sched_type, tran_type_identifier, query_string)
VALUES ('F3X', 'SH1', 'ALLOC_H1', '
                    SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
                    COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
                    COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
                    COALESCE(t1.transaction_id, '''') AS "transactionId",
                    COALESCE(t1.presidential_only::text, '''') AS "presidentialOnly",
                    COALESCE(t1.presidential_and_senate::text, '''') AS "presidentialAndSenate",
                    COALESCE(t1.senate_only::text, '''') AS "senateOnly",
                    COALESCE(t1.non_pres_and_non_senate::text, '''') AS "nonPresidentialAndNonSenate",
                    COALESCE(t1.federal_percent, 0.0) AS "federalPercent",
                    COALESCE(t1.non_federal_percent, 0.0) AS "nonFederalPercent",
                    COALESCE(t1.administrative::text, '''') AS "administrative",
                    COALESCE(t1.generic_voter_drive::text, '''') AS "genericVoterDrive",
                    COALESCE(t1.public_communications::text, '''') AS "publicCommunications"
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
                    COALESCE(t1.fundraising::text, '''') AS "fundraising",
                    COALESCE(t1.direct_cand_support::text, '''') AS "directCandidateSupport",
                    COALESCE(t1.ratio_code, '''') AS "ratioCode",
                    COALESCE(t1.federal_percent, 0.0) AS "federalPercent",
                    COALESCE(t1.non_federal_percent, 0.0) AS "nonFederalPercent"
                    FROM public.sched_h2 t1
                    WHERE t1.transaction_type_identifier = ''ALLOC_H2_RATIO'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y''
                    ');