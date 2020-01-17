DROP VIEW public.all_transactions_view CASCADE;

CREATE OR REPLACE VIEW public.all_transactions_view AS 
 SELECT sa.cmte_id,
    sa.report_id,
    'sched_a'::text AS transaction_table,
    sa.transaction_type_identifier,
    sa.transaction_id,
    sa.back_ref_transaction_id,
    sa.back_ref_sched_name,
    sa.entity_id,
    sa.contribution_date AS transaction_date,
    sa.contribution_amount AS transaction_amount,
    sa.memo_code,
    sa.delete_ind,
    sa.create_date,
    sa.last_update_date,
    sa.itemized_ind AS itemized,
    '/sa/schedA'::text AS api_call
   FROM sched_a sa
UNION ALL
 SELECT sb.cmte_id,
    sb.report_id,
    'sched_b'::text AS transaction_table,
    sb.transaction_type_identifier,
    sb.transaction_id,
    sb.back_ref_transaction_id,
    sb.back_ref_sched_name,
    sb.entity_id,
    sb.expenditure_date AS transaction_date,
    sb.expenditure_amount AS transaction_amount,
    sb.memo_code,
    sb.delete_ind,
    sb.create_date,
    sb.last_update_date,
    sb.itemized_ind AS itemized,
    '/sb/schedB'::text AS api_call
   FROM sched_b sb
UNION ALL
 SELECT sc.cmte_id,
    sc.report_id,
    'sched_c'::text AS transaction_table,
    sc.transaction_type_identifier,
    sc.transaction_id,
    sc.back_ref_transaction_id,
    sc.back_ref_sched_name,
    sc.entity_id,
    sc.loan_incurred_date AS transaction_date,
    sc.loan_balance AS transaction_amount,
    sc.memo_code,
    sc.delete_ind,
    sc.create_date,
    sc.last_update_date,
    NULL::character varying AS itemized,
    '/sc/schedC'::text AS api_call
   FROM sched_c sc
UNION ALL
 SELECT sc1.cmte_id,
    sc1.report_id,
    'sched_c1'::text AS transaction_table,
    sc1.transaction_type_identifier,
    sc1.transaction_id,
    sc1.back_ref_transaction_id,
    sc1.back_ref_sched_name,
    sc1.lender_entity_id AS entity_id,
    sc1.loan_incurred_date AS transaction_date,
    sc1.loan_amount AS transaction_amount,
    NULL::character varying AS memo_code,
    sc1.delete_ind,
    sc1.create_date,
    sc1.last_update_date,
    NULL::character varying AS itemized,
    '/sc/schedC1'::text AS api_call
   FROM sched_c1 sc1
UNION ALL
 SELECT sc2.cmte_id,
    sc2.report_id,
    'sched_c2'::text AS transaction_table,
    sc2.transaction_type_identifier,
    sc2.transaction_id,
    sc2.back_ref_transaction_id,
    sc2.back_ref_sched_name,
    sc2.guarantor_entity_id AS entity_id,
    NULL::date AS transaction_date,
    sc2.guaranteed_amount AS transaction_amount,
    NULL::character varying AS memo_code,
    sc2.delete_ind,
    sc2.create_date,
    sc2.last_update_date,
    NULL::character varying AS itemized,
    '/sc/schedC2'::text AS api_call
   FROM sched_c2 sc2
UNION ALL
 SELECT sd.cmte_id,
    sd.report_id,
    'sched_d'::text AS transaction_table,
    sd.transaction_type_identifier,
    sd.transaction_id,
    sd.back_ref_transaction_id,
    sd.back_ref_sched_name,
    sd.entity_id,
    NULL::date AS transaction_date,
    sd.incurred_amount AS transaction_amount,
    NULL::character varying AS memo_code,
    sd.delete_ind,
    sd.create_date,
    sd.last_update_date,
    NULL::text AS itemized,
    '/sd/schedD'::text AS api_call
   FROM sched_d sd
UNION ALL
 SELECT se.cmte_id,
    se.report_id,
    'sched_e'::text AS transaction_table,
    se.transaction_type_identifier,
    se.transaction_id,
    se.back_ref_transaction_id,
    se.back_ref_sched_name,
    se.payee_entity_id AS entity_id,
    se.disbursement_date AS transaction_date,
    se.expenditure_amount AS transaction_amount,
    se.memo_code,
    se.delete_ind,
    se.create_date,
    se.last_update_date,
    NULL::text AS itemized,
    '/se/schedE'::text AS api_call
   FROM sched_e se
UNION ALL
 SELECT sf.cmte_id,
    sf.report_id,
    'sched_f'::text AS transaction_table,
    sf.transaction_type_identifier,
    sf.transaction_id,
    sf.back_ref_transaction_id,
    sf.back_ref_sched_name,
    sf.payee_entity_id AS entity_id,
    sf.expenditure_date AS transaction_date,
    sf.expenditure_amount AS transaction_amount,
    sf.memo_code,
    sf.delete_ind,
    sf.create_date,
    sf.last_update_date,
    NULL::text AS itemized,
    '/sf/schedF'::text AS api_call
   FROM sched_f sf
UNION ALL
 SELECT sh1.cmte_id,
    sh1.report_id,
    'sched_h1'::text AS transaction_table,
    sh1.transaction_type_identifier,
    sh1.transaction_id,
    sh1.back_ref_transaction_id,
    sh1.back_ref_sched_name,
    NULL::character varying AS entity_id,
    NULL::date AS transaction_date,
    NULL::numeric AS transaction_amount,
    NULL::character varying AS memo_code,
    sh1.delete_ind,
    sh1.create_date,
    sh1.last_update_date,
    NULL::text AS itemized,
    '/sh1/schedH1'::text AS api_call
   FROM sched_h1 sh1
UNION ALL
 SELECT sh2.cmte_id,
    sh2.report_id,
    'sched_h2'::text AS transaction_table,
    sh2.transaction_type_identifier,
    sh2.transaction_id,
    sh2.back_ref_transaction_id,
    sh2.back_ref_sched_name,
    NULL::character varying AS entity_id,
    NULL::date AS transaction_date,
    NULL::numeric AS transaction_amount,
    NULL::character varying AS memo_code,
    sh2.delete_ind,
    sh2.create_date,
    sh2.last_update_date,
    NULL::text AS itemized,
    '/sh2/schedH2'::text AS api_call
   FROM sched_h2 sh2
UNION ALL
 SELECT sh3.cmte_id,
    sh3.report_id,
    'sched_h3'::text AS transaction_table,
    sh3.transaction_type_identifier,
    sh3.transaction_id,
    sh3.back_ref_transaction_id,
    sh3.back_ref_sched_name,
    NULL::character varying AS entity_id,
    sh3.receipt_date AS transaction_date,
    sh3.transferred_amount AS transaction_amount,
    sh3.memo_code,
    sh3.delete_ind,
    sh3.create_date,
    sh3.last_update_date,
    NULL::text AS itemized,
    '/sh3/schedH3'::text AS api_call
   FROM sched_h3 sh3
UNION ALL
 SELECT sh4.cmte_id,
    sh4.report_id,
    'sched_h4'::text AS transaction_table,
    sh4.transaction_type_identifier,
    sh4.transaction_id,
    sh4.back_ref_transaction_id,
    sh4.back_ref_sched_name,
    sh4.payee_entity_id AS entity_id,
    sh4.expenditure_date AS transaction_date,
    sh4.total_amount AS transaction_amount,
    sh4.memo_code,
    sh4.delete_ind,
    sh4.create_date,
    sh4.last_update_date,
    NULL::text AS itemized,
    '/sh4/schedH4'::text AS api_call
   FROM sched_h4 sh4
UNION ALL
 SELECT sh5.cmte_id,
    sh5.report_id,
    'sched_h5'::text AS transaction_table,
    sh5.transaction_type_identifier,
    sh5.transaction_id,
    sh5.back_ref_transaction_id,
    sh5.back_ref_sched_name,
    NULL::character varying AS entity_id,
    sh5.receipt_date AS transaction_date,
    sh5.total_amount_transferred AS transaction_amount,
    sh5.memo_code,
    sh5.delete_ind,
    sh5.create_date,
    sh5.last_update_date,
    NULL::text AS itemized,
    '/sh5/schedH5'::text AS api_call
   FROM sched_h5 sh5
UNION ALL
 SELECT sh6.cmte_id,
    sh6.report_id,
    'sched_h6'::text AS transaction_table,
    sh6.transaction_type_identifier,
    sh6.transaction_id,
    sh6.back_ref_transaction_id,
    sh6.back_ref_sched_name,
    sh6.entity_id,
    sh6.expenditure_date AS transaction_date,
    sh6.total_fed_levin_amount AS transaction_amount,
    sh6.memo_code,
    sh6.delete_ind,
    sh6.create_date,
    sh6.last_update_date,
    NULL::text AS itemized,
    '/sh6/schedH6'::text AS api_call
   FROM sched_h6 sh6
UNION ALL
 SELECT sl.cmte_id,
    sl.report_id,
    'sched_l'::text AS transaction_table,
    sl.transaction_type_identifier,
    sl.transaction_id,
    NULL::character varying AS back_ref_transaction_id,
    NULL::character varying AS back_ref_sched_name,
    NULL::character varying AS entity_id,
    NULL::date AS transaction_date,
    sl.coh_cop AS transaction_amount,
    NULL::character varying AS memo_code,
    sl.delete_ind,
    sl.create_date,
    sl.last_update_date,
    NULL::text AS itemized,
    '/sl/schedL'::text AS api_call
   FROM sched_l sl;

CREATE OR REPLACE VIEW public.all_receipts_transactions_view AS 
 SELECT sa.cmte_id,
    sa.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    sa.line_number,
    'sched_a'::text AS transaction_table,
    sa.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sa.transaction_type_identifier,
    sa.transaction_id,
    sa.back_ref_transaction_id,
    sa.back_ref_sched_name,
    sa.entity_id,
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
    sa.contribution_date AS transaction_date,
    sa.contribution_amount AS transaction_amount,
    COALESCE(sa.aggregate_amt, 0.0) AS aggregate_amt,
    sa.purpose_description,
    sa.memo_code,
    sa.memo_text,
    sa.election_code,
    sa.election_other_description,
    sa.delete_ind,
    sa.create_date,
    sa.last_update_date,
    sa.itemized_ind AS itemized,
    '/sa/schedA'::text AS api_call,
    rt.category_type,
        CASE
            WHEN sa.delete_ind = 'Y'::bpchar THEN sa.last_update_date
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
        CASE
            WHEN sa.transaction_type_identifier::text = ANY (ARRAY['LOAN_FROM_IND'::character varying, 'LOAN_FROM_BANK'::character varying]::text[]) THEN false
            WHEN sa.back_ref_transaction_id IS NOT NULL AND (( SELECT csa.delete_ind
               FROM all_transactions_view csa
              WHERE csa.transaction_id::text = sa.back_ref_transaction_id::text)) = 'Y'::bpchar THEN false
            ELSE true
        END AS iseditable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = sa.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild
   FROM sched_a sa
     JOIN entity e ON e.entity_id::text = sa.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sa.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sa.cmte_id::text AND rp.report_id = sa.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
  WHERE sa.transaction_type_identifier::text <> ALL (ARRAY['LEVIN_PARTN_MEMO'::character varying::text, 'LEVIN_TRIB_REC'::character varying::text, 'LEVIN_PARTN_REC'::character varying::text, 'LEVIN_ORG_REC'::character varying::text, 'LEVIN_INDV_REC'::character varying::text, 'LEVIN_NON_FED_REC'::character varying::text, 'LEVIN_OTH_REC'::character varying::text, 'LEVIN_PAC_REC'::character varying::text]);


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

CREATE OR REPLACE VIEW public.all_loans_debts_transactions_view AS 
 SELECT sc.cmte_id,
    sc.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    sc.line_number,
    'sched_c'::text AS transaction_table,
    sc.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sc.transaction_type_identifier,
    sc.transaction_id,
    sc.entity_id,
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
    sc.loan_amount_original AS loan_amount,
    sc.loan_payment_to_date,
    sc.loan_incurred_date,
    sc.loan_due_date,
    0 AS loan_beginning_balance,
    0 AS loan_incurred_amt,
    0 AS loan_payment_amt,
    sc.loan_balance AS loan_closing_balance,
    ''::text AS purpose_description,
    sc.memo_code,
    sc.memo_text,
    sc.delete_ind,
    sc.create_date,
    sc.last_update_date,
    NULL::text AS itemized,
    '/sc/schedC'::text AS api_call,
    rt.category_type,
        CASE
            WHEN sc.delete_ind = 'Y'::bpchar THEN sc.last_update_date
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
    true AS iseditable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = sc.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild
   FROM sched_c sc
     JOIN entity e ON e.entity_id::text = sc.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sc.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sc.cmte_id::text AND rp.report_id = sc.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
UNION
 SELECT sd.cmte_id,
    sd.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    sd.line_num AS line_number,
    'sched_d'::text AS transaction_table,
    sd.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sd.transaction_type_identifier,
    sd.transaction_id,
    sd.entity_id,
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
    0 AS loan_amount,
    0 AS loan_payment_to_date,
    NULL::date AS loan_incurred_date,
    NULL::date AS loan_due_date,
    sd.beginning_balance AS loan_beginning_balance,
    sd.incurred_amount AS loan_incurred_amt,
    sd.payment_amount AS loan_payment_amt,
    sd.balance_at_close AS loan_closing_balance,
    sd.purpose AS purpose_description,
    ''::text AS memo_code,
    ''::text AS memo_text,
    sd.delete_ind,
    sd.create_date,
    sd.last_update_date,
    NULL::text AS itemized,
    '/sd/schedD'::text AS api_call,
    rt.category_type,
        CASE
            WHEN sd.delete_ind = 'Y'::bpchar THEN sd.last_update_date
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
    true AS iseditable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = sd.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild
   FROM sched_d sd
     JOIN entity e ON e.entity_id::text = sd.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sd.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sd.cmte_id::text AND rp.report_id = sd.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text;

CREATE OR REPLACE VIEW public.all_other_transactions_view AS 
 SELECT sa.cmte_id,
    sa.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    sa.line_number,
    'sched_a'::text AS transaction_table,
    sa.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sa.transaction_type_identifier,
    sa.transaction_id,
    sa.back_ref_transaction_id,
    sa.back_ref_sched_name,
    sa.entity_id,
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
    sa.contribution_date AS transaction_date,
    sa.contribution_amount AS transaction_amount,
    sa.aggregate_amt,
    sa.purpose_description,
    sa.memo_code,
    sa.memo_text,
    sa.election_code,
    sa.election_other_description,
    sa.delete_ind,
    sa.create_date,
    sa.last_update_date,
    sa.itemized_ind AS itemized,
    '/sa/schedA'::text AS api_call,
    'Schedule L-A'::text AS schedule,
    NULL::text AS activity_event_identifier,
    rt.category_type,
        CASE
            WHEN sa.delete_ind = 'Y'::bpchar THEN sa.last_update_date
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
    NULL::character varying AS ratio_code,
        CASE
            WHEN sa.back_ref_transaction_id IS NOT NULL AND (( SELECT csa.delete_ind
               FROM all_transactions_view csa
              WHERE csa.transaction_id::text = sa.back_ref_transaction_id::text)) = 'Y'::bpchar THEN false
            ELSE true
        END AS iseditable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = sa.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild
   FROM sched_a sa
     JOIN entity e ON e.entity_id::text = sa.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sa.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sa.cmte_id::text AND rp.report_id = sa.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
  WHERE sa.transaction_type_identifier::text = ANY (ARRAY['LEVIN_PARTN_MEMO'::character varying::text, 'LEVIN_TRIB_REC'::character varying::text, 'LEVIN_PARTN_REC'::character varying::text, 'LEVIN_ORG_REC'::character varying::text, 'LEVIN_INDV_REC'::character varying::text, 'LEVIN_NON_FED_REC'::character varying::text, 'LEVIN_OTH_REC'::character varying::text, 'LEVIN_PAC_REC'::character varying::text])
UNION
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
    sb.aggregate_amt,
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
    'Schedule L-B'::text AS schedule,
    NULL::text AS activity_event_identifier,
    rt.category_type,
        CASE
            WHEN sb.delete_ind = 'Y'::bpchar THEN sb.last_update_date
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
    NULL::character varying AS ratio_code,
        CASE
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
  WHERE sb.transaction_type_identifier::text = ANY (ARRAY['LEVIN_VOTER_REG'::character varying::text, 'LEVIN_VOTER_ID'::character varying::text, 'LEVIN_GOTV'::character varying::text, 'LEVIN_GEN'::character varying::text, 'LEVIN_OTH_DISB'::character varying::text])
UNION
 SELECT h1.cmte_id,
    h1.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    h1.line_number,
    'sched_h1'::text AS transaction_table,
    h1.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    h1.transaction_type_identifier,
    h1.transaction_id,
    h1.back_ref_transaction_id,
    h1.back_ref_sched_name,
    NULL::character varying AS entity_id,
    NULL::character varying AS name,
    NULL::character varying AS street_1,
    NULL::character varying AS street_2,
    NULL::character varying AS city,
    NULL::character varying AS state,
    NULL::character varying AS zip_code,
    NULL::character varying AS occupation,
    NULL::character varying AS employer,
    NULL::character varying AS entity_type,
    NULL::date AS transaction_date,
    NULL::numeric AS transaction_amount,
    NULL::numeric AS aggregate_amt,
    NULL::character varying AS purpose_description,
    NULL::character varying AS memo_code,
    NULL::character varying AS memo_text,
    NULL::character varying AS election_code,
    NULL::character varying AS election_other_description,
    h1.delete_ind,
    h1.create_date,
    h1.last_update_date,
    NULL::character varying AS itemized,
    '/sh1/schedH1'::text AS api_call,
    'Schedule H1'::text AS schedule,
    NULL::text AS activity_event_identifier,
    rt.category_type,
        CASE
            WHEN h1.delete_ind = 'Y'::bpchar THEN h1.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
    NULL::character varying AS ratio_code,
    true AS iseditable,
    false AS haschild
   FROM sched_h1 h1
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = h1.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = h1.cmte_id::text AND rp.report_id = h1.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
UNION
 SELECT h2.cmte_id,
    h2.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    h2.line_number,
    'sched_h2'::text AS transaction_table,
    h2.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    h2.transaction_type_identifier,
    h2.transaction_id,
    NULL::character varying AS back_ref_transaction_id,
    NULL::character varying AS back_ref_sched_name,
    NULL::character varying AS entity_id,
    h2.activity_event_name AS name,
    NULL::character varying AS street_1,
    NULL::character varying AS street_2,
    NULL::character varying AS city,
    NULL::character varying AS state,
    NULL::character varying AS zip_code,
    NULL::character varying AS occupation,
    NULL::character varying AS employer,
    NULL::character varying AS entity_type,
    NULL::date AS transaction_date,
    NULL::numeric AS transaction_amount,
    NULL::numeric AS aggregate_amt,
    NULL::character varying AS purpose_description,
    NULL::character varying AS memo_code,
    NULL::character varying AS memo_text,
    NULL::character varying AS election_code,
    NULL::character varying AS election_other_description,
    h2.delete_ind,
    h2.create_date,
    h2.last_update_date,
    NULL::character varying AS itemized,
    '/sh2/schedH2'::text AS api_call,
    'Schedule H2'::text AS schedule,
    NULL::text AS activity_event_identifier,
    rt.category_type,
        CASE
            WHEN h2.delete_ind = 'Y'::bpchar THEN h2.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
    h2.ratio_code,
    true AS iseditable,
    false AS haschild
   FROM sched_h2 h2
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = h2.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = h2.cmte_id::text AND rp.report_id = h2.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
UNION
 SELECT h3.cmte_id,
    h3.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    h3.line_number,
    'sched_h3'::text AS transaction_table,
    h3.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    h3.transaction_type_identifier,
    h3.transaction_id,
    h3.back_ref_transaction_id,
    h3.back_ref_sched_name,
    NULL::character varying AS entity_id,
    h3.account_name AS name,
    NULL::character varying AS street_1,
    NULL::character varying AS street_2,
    NULL::character varying AS city,
    NULL::character varying AS state,
    NULL::character varying AS zip_code,
    NULL::character varying AS occupation,
    NULL::character varying AS employer,
    NULL::character varying AS entity_type,
    h3.receipt_date AS transaction_date,
    h3.transferred_amount AS transaction_amount,
    NULL::numeric AS aggregate_amt,
    NULL::character varying AS purpose_description,
    h3.memo_code,
    h3.memo_text,
    NULL::character varying AS election_code,
    NULL::character varying AS election_other_description,
    h3.delete_ind,
    h3.create_date,
    h3.last_update_date,
    NULL::character varying AS itemized,
    '/sh3/schedH3'::text AS api_call,
    'Schedule H3'::text AS schedule,
    h3.activity_event_name AS activity_event_identifier,
    rt.category_type,
        CASE
            WHEN h3.delete_ind = 'Y'::bpchar THEN h3.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
    NULL::character varying AS ratio_code,
    true AS iseditable,
    false AS haschild
   FROM sched_h3 h3
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = h3.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = h3.cmte_id::text AND rp.report_id = h3.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
     WHERE h3.back_ref_transaction_id is not NULL
UNION
 SELECT h4.cmte_id,
    h4.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    h4.line_number,
    'sched_h4'::text AS transaction_table,
    h4.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    h4.transaction_type_identifier,
    h4.transaction_id,
    h4.back_ref_transaction_id,
    h4.back_ref_sched_name,
    h4.payee_entity_id AS entity_id,
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
    h4.expenditure_date AS transaction_date,
    h4.total_amount AS transaction_amount,
    NULL::numeric AS aggregate_amt,
    h4.purpose AS purpose_description,
    h4.memo_code,
    h4.memo_text,
    NULL::character varying AS election_code,
    NULL::character varying AS election_other_description,
    h4.delete_ind,
    h4.create_date,
    h4.last_update_date,
    NULL::character varying AS itemized,
    '/sh4/schedH4'::text AS api_call,
    'Schedule H4'::text AS schedule,
    h4.activity_event_identifier,
    rt.category_type,
        CASE
            WHEN h4.delete_ind = 'Y'::bpchar THEN h4.last_update_date
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
    NULL::character varying AS ratio_code,
        CASE
            WHEN h4.back_ref_transaction_id IS NOT NULL AND (( SELECT csa.delete_ind
               FROM all_transactions_view csa
              WHERE csa.transaction_id::text = h4.back_ref_transaction_id::text)) = 'Y'::bpchar THEN false
            ELSE true
        END AS iseditable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = h4.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild
   FROM sched_h4 h4
     JOIN entity e ON e.entity_id::text = h4.payee_entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = h4.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = h4.cmte_id::text AND rp.report_id = h4.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
UNION
 SELECT h5.cmte_id,
    h5.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    h5.line_number,
    'sched_h5'::text AS transaction_table,
    h5.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    h5.transaction_type_identifier,
    h5.transaction_id,
    NULL::character varying AS back_ref_transaction_id,
    NULL::character varying AS back_ref_sched_name,
    NULL::character varying AS entity_id,
    h5.account_name AS name,
    NULL::character varying AS street_1,
    NULL::character varying AS street_2,
    NULL::character varying AS city,
    NULL::character varying AS state,
    NULL::character varying AS zip_code,
    NULL::character varying AS occupation,
    NULL::character varying AS employer,
    NULL::character varying AS entity_type,
    h5.receipt_date AS transaction_date,
    h5.total_amount_transferred AS transaction_amount,
    NULL::numeric AS aggregate_amt,
    NULL::character varying AS purpose_description,
    h5.memo_code,
    h5.memo_text,
    NULL::character varying AS election_code,
    NULL::character varying AS election_other_description,
    h5.delete_ind,
    h5.create_date,
    h5.last_update_date,
    NULL::character varying AS itemized,
    '/sh5/schedH5'::text AS api_call,
    'Schedule H5'::text AS schedule,
    NULL::text AS activity_event_identifier,
    rt.category_type,
        CASE
            WHEN h5.delete_ind = 'Y'::bpchar THEN h5.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
    NULL::character varying AS ratio_code,
    true AS iseditable,
    false AS haschild
   FROM sched_h5 h5
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = h5.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = h5.cmte_id::text AND rp.report_id = h5.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
     WHERE h5.back_ref_transaction_id is not NULL
UNION
 SELECT h6.cmte_id,
    h6.report_id,
    rp.report_type,
        CASE
            WHEN rp.status IS NULL OR rp.status::text = 'Saved'::text THEN 'Saved'::text
            ELSE 'Filed'::text
        END AS reportstatus,
    rrt.rpt_type_desc AS report_desc,
    h6.line_number,
    'sched_h6'::text AS transaction_table,
    h6.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    h6.transaction_type_identifier,
    h6.transaction_id,
    h6.back_ref_transaction_id,
    h6.back_ref_sched_name,
    h6.entity_id,
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
    h6.expenditure_date AS transaction_date,
    h6.total_fed_levin_amount AS transaction_amount,
    NULL::numeric AS aggregate_amt,
    h6.expenditure_purpose AS purpose_description,
    h6.memo_code,
    h6.memo_text,
    NULL::character varying AS election_code,
    NULL::character varying AS election_other_description,
    h6.delete_ind,
    h6.create_date,
    h6.last_update_date,
    NULL::character varying AS itemized,
    '/sh6/schedH6'::text AS api_call,
    'Schedule H6'::text AS schedule,
    h6.account_event_identifier AS activity_event_identifier,
    rt.category_type,
        CASE
            WHEN h6.delete_ind = 'Y'::bpchar THEN h6.last_update_date
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
    NULL::character varying AS ratio_code,
        CASE
            WHEN h6.back_ref_transaction_id IS NOT NULL AND (( SELECT csa.delete_ind
               FROM all_transactions_view csa
              WHERE csa.transaction_id::text = h6.back_ref_transaction_id::text)) = 'Y'::bpchar THEN false
            ELSE true
        END AS iseditable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = h6.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild
   FROM sched_h6 h6
     JOIN entity e ON e.entity_id::text = h6.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = h6.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = h6.cmte_id::text AND rp.report_id = h6.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text;

CREATE OR REPLACE VIEW public.all_contacts_view AS 
 SELECT e.cmte_id,
    e.entity_id AS id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying::text, 'CAN'::character varying::text]) THEN ((((initcap(e.last_name::text) || COALESCE(', '::text || initcap(e.first_name::text), ''::text)) || COALESCE(', '::text || initcap(e.middle_name::text), ''::text)) || COALESCE(', '::text || initcap(e.preffix::text), ''::text)) || COALESCE(', '::text || initcap(e.suffix::text), ''::text))::character varying
            ELSE e.entity_name
        END AS name,
    e.entity_type,
    e.street_1 AS street1,
    e.street_2 AS street2,
    e.city,
    e.state,
    e.zip_code AS zip,
    e.occupation,
    e.employer,
    e.cand_office AS candoffice,
    e.cand_office_state AS candofficestate,
    e.cand_office_district AS candofficedistrict,
    e.phone_number,
    e.ref_cand_cmte_id AS candcmteid,
    e.delete_ind AS deletedflag,
        CASE
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate,
    ( SELECT count('a') AS active_transactions_cnt
           FROM all_transactions_view atvw
          WHERE atvw.cmte_id::text = e.cmte_id::text AND atvw.entity_id::text = e.entity_id::text AND (atvw.delete_ind <> 'Y'::bpchar OR atvw.delete_ind IS NULL)) AS active_transactions_cnt
   FROM entity e
  ORDER BY e.last_update_date DESC;
