INSERT INTO public.due_dates (report_type, cvg_start_date, cvg_end_date, due_date, election_state, election_district,
election_date, office_sought, fec_election_id, regular_special_report_ind, report_year)
VALUES ('12R','2020-04-12','2020-04-20','2020-04-30','NC','03','2020-05-04','H','2732','S','2020'),
('12S','2020-05-17','2020-05-26','2020-05-04','NC','03','2020-05-14','H','2733','S','2020'),
('12S','2020-05-30','2020-06-10','2020-06-20','NC','09','2020-06-22','H','2734','S','2020'),
('12S','2020-06-12','2020-06-20','2020-06-30','PA','12','2020-07-06','H','2735','S','2020'),
('30S','2020-06-12','2020-07-20','2020-07-30','PA','12','2020-07-04','H','2736','S','2020');

UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
                    COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
                    COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
                    COALESCE(t1.transaction_id, '''') AS "transactionId",
                    COALESCE(t1.presidential_only, false) AS "presidentialOnly",
                    COALESCE(t1.presidential_and_senate, false) AS "presidentialAndSenate",
                    COALESCE(t1.senate_only, false) AS "senateOnly",
                    COALESCE(t1.non_pres_and_non_senate, false) AS "nonPresidentialAndNonSenate",
                    COALESCE(t1.federal_percent, 0.0) AS "federalPercent",
                    COALESCE(t1.non_federal_percent, 0.0) AS "nonFederalPercent",
                    COALESCE(t1.administrative, false) AS "administrative",
                    COALESCE(t1.generic_voter_drive, false) AS "genericVoterDrive",
                    COALESCE(t1.public_communications, false) AS "publicCommunications"
                    FROM public.sched_h1 t1
                    WHERE t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y'''
    WHERE form_type = 'F3X' AND sched_type = 'SH1' AND tran_type_identifier= 'ALLOC_H1';

                    
UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
                    COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
                    COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
                    COALESCE(t1.transaction_id, '''') AS "transactionId",
                    COALESCE(t1.activity_event_name, '''') AS "activityEventName",
                    COALESCE(t1.fundraising, false) AS "fundraising",
                    COALESCE(t1.direct_cand_support, false) AS "directCandidateSupport",
                    COALESCE(t1.ratio_code, '''') AS "ratioCode",
                    COALESCE(t1.federal_percent, 0.0) AS "federalPercent",
                    COALESCE(t1.non_federal_percent, 0.0) AS "nonFederalPercent"
                    FROM public.sched_h2 t1
                    WHERE t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y'''
    WHERE form_type = 'F3X' AND sched_type = 'SH2' AND tran_type_identifier= 'ALLOC_H2_RATIO';
