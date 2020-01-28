
UPDATE public.transaction_categories SET tran_type_identifier='IE_VOID' WHERE tran_type_identifier='IE_PMT_TO_PROL_VOID';

DROP VIEW public.all_disbursements_transactions_view;

ALTER TABLE public.sched_e ALTER COLUMN memo_text TYPE VARCHAR(500);

CREATE OR REPLACE VIEW public.all_disbursements_transactions_view AS 
 SELECT sb.cmte_id,
    sb.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    sb.line_number,
    'sched_b'::text AS transaction_table,
    sb.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sb.transaction_type_identifier,
    sb.transaction_id,
    sb.back_ref_transaction_id,
    sb.back_ref_sched_name,
    sb.entity_id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying::text, 'CAN'::character varying::text]) THEN ((((initcap(e.last_name::text) || COALESCE(', '::text || initcap(e.first_name::text), ''::text)) || COALESCE(', '::text || initcap(e.middle_name::text), ''::text)) || COALESCE(', '::text || initcap(e.preffix::text), ''::text)) || COALESCE(', '::text || initcap(e.suffix::text), ''::text))::character varying
            ELSE e.entity_name
        END AS name,
    e.street_1,
    e.street_2,
    e.city,
    e.state,
    e.zip_code,
    e.occupation,
    e.employer,
    e.entity_type,
    sb.expenditure_date AS transaction_date,
    sb.expenditure_amount AS transaction_amount,
    COALESCE(sb.aggregate_amt, 0.0) AS aggregate_amt,
    sb.expenditure_purpose AS purpose_description,
    sb.memo_code,
    sb.memo_text,
    sb.election_code,
    sb.election_other_description,
    sb.delete_ind,
    sb.create_date,
    sb.last_update_date,
    sb.itemized_ind AS itemized,
    '/sb/schedB'::text AS api_call,
    'Schedule B'::text AS schedule,
    rt.category_type,
    sb.election_year,
    sb.beneficiary_cmte_id,
        CASE
            WHEN sb.delete_ind = 'Y'::bpchar THEN sb.last_update_date
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
        CASE
            WHEN sb.transaction_type_identifier::text = ANY (ARRAY['LOAN_OWN_TO_CMTE_OUT'::character varying::text, 'IK_OUT'::character varying::text, 'IK_BC_OUT'::character varying::text, 'PARTY_IK_OUT'::character varying::text, 'PARTY_IK_BC_OUT'::character varying::text, 'PAC_IK_OUT'::character varying::text, 'PAC_IK_BC_OUT'::character varying::text, 'IK_TRAN_OUT'::character varying::text, 'IK_TRAN_FEA_OUT'::character varying::text]) THEN false
            WHEN sb.back_ref_transaction_id IS NOT NULL AND (( SELECT csa.delete_ind
               FROM all_transactions_view csa
              WHERE csa.transaction_id::text = sb.back_ref_transaction_id::text)) = 'Y'::bpchar THEN false
            ELSE true
        END AS iseditable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = sb.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild
   FROM sched_b sb
     JOIN entity e ON e.entity_id::text = sb.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sb.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sb.cmte_id::text AND rp.report_id = sb.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
  WHERE sb.transaction_type_identifier::text <> ALL (ARRAY['LEVIN_VOTER_REG'::character varying::text, 'LEVIN_VOTER_ID'::character varying::text, 'LEVIN_GOTV'::character varying::text, 'LEVIN_GEN'::character varying::text, 'LEVIN_OTH_DISB'::character varying::text])
UNION
 SELECT se.cmte_id,
    se.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    se.line_number,
    'sched_e'::text AS transaction_table,
    NULL::character varying AS transaction_type,
    rt.tran_desc AS transaction_type_desc,
    se.transaction_type_identifier,
    se.transaction_id,
    se.back_ref_transaction_id,
    se.back_ref_sched_name,
    se.payee_entity_id AS entity_id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying::text, 'CAN'::character varying::text]) THEN ((((initcap(e.last_name::text) || COALESCE(', '::text || initcap(e.first_name::text), ''::text)) || COALESCE(', '::text || initcap(e.middle_name::text), ''::text)) || COALESCE(', '::text || initcap(e.preffix::text), ''::text)) || COALESCE(', '::text || initcap(e.suffix::text), ''::text))::character varying
            ELSE e.entity_name
        END AS name,
    e.street_1,
    e.street_2,
    e.city,
    e.state,
    e.zip_code,
    e.occupation,
    e.employer,
    e.entity_type,
    se.disbursement_date AS transaction_date,
    se.expenditure_amount AS transaction_amount,
    0.0 AS aggregate_amt,
    se.purpose AS purpose_description,
    se.memo_code,
    se.memo_text,
    se.election_code,
    se.election_other_desc AS election_other_description,
    se.delete_ind,
    se.create_date,
    se.last_update_date,
    NULL::character varying AS itemized,
    '/se/schedE'::text AS api_call,
    'Schedule E'::text AS schedule,
    rt.category_type,
    NULL::numeric AS election_year,
    NULL::character varying AS beneficiary_cmte_id,
        CASE
            WHEN se.delete_ind = 'Y'::bpchar THEN se.last_update_date
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
        CASE
            WHEN se.back_ref_transaction_id IS NOT NULL AND (( SELECT csa.delete_ind
               FROM all_transactions_view csa
              WHERE csa.transaction_id::text = se.back_ref_transaction_id::text)) = 'Y'::bpchar THEN false
            ELSE true
        END AS iseditable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = se.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild
   FROM sched_e se
     JOIN entity e ON e.entity_id::text = se.payee_entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = se.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = se.cmte_id::text AND rp.report_id = se.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
UNION
 SELECT sf.cmte_id,
    sf.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    sf.line_number,
    'sched_f'::text AS transaction_table,
    sf.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sf.transaction_type_identifier,
    sf.transaction_id,
    sf.back_ref_transaction_id,
    sf.back_ref_sched_name,
    sf.payee_entity_id AS entity_id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying::text, 'CAN'::character varying::text]) THEN ((((initcap(e.last_name::text) || COALESCE(', '::text || initcap(e.first_name::text), ''::text)) || COALESCE(', '::text || initcap(e.middle_name::text), ''::text)) || COALESCE(', '::text || initcap(e.preffix::text), ''::text)) || COALESCE(', '::text || initcap(e.suffix::text), ''::text))::character varying
            ELSE e.entity_name
        END AS name,
    e.street_1,
    e.street_2,
    e.city,
    e.state,
    e.zip_code,
    e.occupation,
    e.employer,
    e.entity_type,
    sf.expenditure_date AS transaction_date,
    sf.expenditure_amount AS transaction_amount,
    0.0 AS aggregate_amt,
    sf.purpose AS purpose_description,
    sf.memo_code,
    sf.memo_text,
    NULL::character varying AS election_code,
    NULL::character varying AS election_other_description,
    sf.delete_ind,
    sf.create_date,
    sf.last_update_date,
    NULL::character varying AS itemized,
    '/sf/schedF'::text AS api_call,
    'Schedule F'::text AS schedule,
    rt.category_type,
    NULL::numeric AS election_year,
    NULL::character varying AS beneficiary_cmte_id,
        CASE
            WHEN sf.delete_ind = 'Y'::bpchar THEN sf.last_update_date
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
        CASE
            WHEN sf.back_ref_transaction_id IS NOT NULL AND (( SELECT csa.delete_ind
               FROM all_transactions_view csa
              WHERE csa.transaction_id::text = sf.back_ref_transaction_id::text)) = 'Y'::bpchar THEN false
            ELSE true
        END AS iseditable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = sf.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild
   FROM sched_f sf
     JOIN entity e ON e.entity_id::text = sf.payee_entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sf.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sf.cmte_id::text AND rp.report_id = sf.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text;

UPDATE public.ref_transaction_types SET parent_tran_id='160' WHERE tran_identifier='IE_B4_DISSE_MEMO';

UPDATE public.ref_transaction_types SET parent_tran_id=null WHERE tran_identifier='IE';

UPDATE public.ref_transaction_types SET tran_identifier='IE_B4_DISSE' WHERE tran_identifier='IE_B4_DISSE_MEMO';

DELETE FROM public.dynamic_form_fields WHERE transaction_type='IE_B4_DISSE';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
	SELECT form_type, 'IE_B4_DISSE', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type='IE';

UPDATE public.dynamic_form_fields SET field_value = 'IE_B4_DISSE' WHERE field_db_name='transaction_type_identifier' 
AND transaction_type='IE_B4_DISSE';

UPDATE public.dynamic_form_fields SET field_validation='dollarAmountNegative' WHERE field_db_name IN ('expenditure_amount', 'total_amount') AND transaction_type IN (
'OPEXP_VOID','CONT_VOID','IE_VOID','COEXP_PARTY_VOID','OTH_DISB_VOID','FEA_VOID','REF_CONT_IND_VOID',
'REF_CONT_NON_FED_VOID','REF_CONT_PARTY_VOID','REF_CONT_PAC_VOID','ALLOC_FEA_VOID','ALLOC_EXP_VOID');

UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
                    COALESCE(t1.transaction_type, '''') AS "transactionTypeCode",
                    COALESCE(t1.transaction_type_identifier, '''') AS "transactionTypeIdentifier",
                    COALESCE(t1.transaction_id, '''') AS "transactionId",
                    COALESCE(t1.presidential_only, '''') AS "presidentialOnly",
                    COALESCE(t1.presidential_and_senate, '''') AS "presidentialAndSenate",
                    COALESCE(t1.senate_only, '''') AS "senateOnly",
                    COALESCE(t1.non_pres_and_non_senate, '''') AS "nonPresidentialAndNonSenate",
                    COALESCE(t1.federal_percent, 0.0) AS "federalPercent",
                    COALESCE(t1.non_federal_percent, 0.0) AS "nonFederalPercent",
                    COALESCE(t1.administrative, '''') AS "administrative",
                    COALESCE(t1.generic_voter_drive, '''') AS "genericVoterDrive",
                    COALESCE(t1.public_communications, '''') AS "publicCommunications"
                    FROM public.sched_h1 t1
                    WHERE t1.report_id = %s AND t1.delete_ind is distinct from ''Y'''
    WHERE form_type = 'F3X' AND sched_type = 'SH1' AND tran_type_identifier= 'ALLOC_H1';

                    
UPDATE public.tran_query_string SET query_string = 'SELECT COALESCE(t1.line_number, '''') AS "lineNumber",
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
                    WHERE t1.transaction_type_identifier = ''{}'' AND t1.report_id = %s AND t1.cmte_id = %s AND t1.delete_ind is distinct from ''Y'''
    WHERE form_type = 'F3X' AND sched_type = 'SH2' AND tran_type_identifier= 'ALLOC_H2_RATIO';