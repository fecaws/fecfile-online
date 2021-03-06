DROP VIEW public.all_other_transactions_view;

CREATE OR REPLACE VIEW public.all_other_transactions_view AS 
 SELECT sa.cmte_id,
    sa.report_id,
    rp.report_type,
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
            WHEN e.delete_ind = 'Y'::bpchar THEN sa.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate
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
            WHEN e.delete_ind = 'Y'::bpchar THEN sb.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate
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
    rrt.rpt_type_desc AS report_desc,
    h1.line_number,
    'sched_h1'::text AS transaction_table,
    h1.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    h1.transaction_type_identifier,
    h1.transaction_id,
    NULL::character varying AS back_ref_transaction_id,
    NULL::character varying AS back_ref_sched_name,
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
    federal_percent AS transaction_amount,
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
    NULL::timestamp without time zone AS deleteddate
   FROM sched_h1 h1
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = h1.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = h1.cmte_id::text AND rp.report_id = h1.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
UNION
 SELECT h2.cmte_id,
    h2.report_id,
    rp.report_type,
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
    federal_percent AS transaction_amount,
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
    NULL::timestamp without time zone AS deleteddate
   FROM sched_h2 h2
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = h2.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = h2.cmte_id::text AND rp.report_id = h2.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
UNION
 SELECT h3.cmte_id,
    h3.report_id,
    rp.report_type,
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
    NULL::timestamp without time zone AS deleteddate
   FROM sched_h3 h3
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = h3.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = h3.cmte_id::text AND rp.report_id = h3.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
UNION
 SELECT h4.cmte_id,
    h4.report_id,
    rp.report_type,
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
            WHEN e.delete_ind = 'Y'::bpchar THEN h4.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate
   FROM sched_h4 h4
     JOIN entity e ON e.entity_id::text = h4.payee_entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = h4.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = h4.cmte_id::text AND rp.report_id = h4.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
UNION
 SELECT h5.cmte_id,
    h5.report_id,
    rp.report_type,
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
    NULL::timestamp without time zone AS deleteddate
   FROM sched_h5 h5
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = h5.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = h5.cmte_id::text AND rp.report_id = h5.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
UNION
 SELECT h6.cmte_id,
    h6.report_id,
    rp.report_type,
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
            WHEN e.delete_ind = 'Y'::bpchar THEN h6.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate
   FROM sched_h6 h6
     JOIN entity e ON e.entity_id::text = h6.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = h6.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = h6.cmte_id::text AND rp.report_id = h6.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text;

DROP VIEW public.all_receipts_transactions_view;

CREATE OR REPLACE VIEW public.all_receipts_transactions_view AS 
 SELECT sa.cmte_id,
    sa.report_id,
    rp.report_type,
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
    COALESCE(sa.aggregate_amt, '0.0') AS aggregate_amt,
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
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            WHEN sa.delete_ind = 'Y'::bpchar THEN sa.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate
   FROM sched_a sa
     JOIN entity e ON e.entity_id::text = sa.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sa.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sa.cmte_id::text AND rp.report_id = sa.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
  WHERE sa.transaction_type_identifier::text <> ALL (ARRAY['LEVIN_PARTN_MEMO'::character varying::text, 'LEVIN_TRIB_REC'::character varying::text, 'LEVIN_PARTN_REC'::character varying::text, 'LEVIN_ORG_REC'::character varying::text, 'LEVIN_INDV_REC'::character varying::text, 'LEVIN_NON_FED_REC'::character varying::text, 'LEVIN_OTH_REC'::character varying::text, 'LEVIN_PAC_REC'::character varying::text]);


DROP VIEW public.all_disbursements_transactions_view;

CREATE OR REPLACE VIEW public.all_disbursements_transactions_view AS 
 SELECT sb.cmte_id,
    sb.report_id,
    rp.report_type,
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
    COALESCE(sb.aggregate_amt, '0.0') AS aggregate_amt,
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
    rt.category_type,
    sb.election_year,
    sb.beneficiary_cmte_id,
        CASE
            WHEN e.delete_ind = 'Y'::bpchar THEN sb.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate
   FROM sched_b sb
     JOIN entity e ON e.entity_id::text = sb.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sb.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sb.cmte_id::text AND rp.report_id = sb.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
  WHERE sb.transaction_type_identifier::text <> ALL (ARRAY['LEVIN_VOTER_REG'::character varying::text, 'LEVIN_VOTER_ID'::character varying::text, 'LEVIN_GOTV'::character varying::text, 'LEVIN_GEN'::character varying::text, 'LEVIN_OTH_DISB'::character varying::text]);
