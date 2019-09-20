DROP VIEW public.all_transactions_view;

ALTER TABLE public.sched_d
    RENAME creditor_entity_id TO entity_id;

ALTER TABLE public.sched_d
    ALTER COLUMN entity_id TYPE character varying (20) COLLATE pg_catalog."default";


CREATE OR REPLACE VIEW public.all_transactions_view AS
 SELECT sa.cmte_id,
    sa.report_id,
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
        CASE
            WHEN sa.aggregate_amt >= 0::numeric AND sa.aggregate_amt <= 200::numeric AND (sa.memo_code::text <> 'X'::text OR sa.memo_code IS NULL) THEN 'U'::text
            WHEN sa.aggregate_amt > 200::numeric THEN 'I'::text
            ELSE ''::text
        END AS itemized,
    '/sa/schedA'::text AS api_call
   FROM sched_a sa
     JOIN entity e ON e.entity_id::text = sa.entity_id::text
     LEFT JOIN ref_transaction_types rt ON rt.tran_identifier::text = sa.transaction_type_identifier::text
UNION ALL
 SELECT sb.cmte_id,
    sb.report_id,
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
    NULL::text AS itemized,
    '/sb/schedB'::text AS api_call
   FROM sched_b sb
     JOIN entity e ON e.entity_id::text = sb.entity_id::text
     LEFT JOIN ref_transaction_types rt ON rt.tran_identifier::text = sb.transaction_type_identifier::text
UNION ALL
 SELECT sd.cmte_id,
    sd.report_id,
    sd.line_num,
    'sched_d'::text AS transaction_table,
    sd.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sd.transaction_type_identifier,
    sd.transaction_id,
    ''::text as back_ref_transaction_id,
    ''::text as back_ref_sched_name,
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
    null AS transaction_date,
    incurred_amount AS transaction_amount,
    null AS aggregate_amt,
    sd.purpose AS purpose_description,
    ''::text as memo_code,
    ''::text as memo_text,
    ''::text as election_code,
    ''::text as election_other_description,
    sd.delete_ind,
    sd.create_date,
    sd.last_update_date,
    NULL::text AS itemized,
    '/sd/schedD'::text AS api_call
   FROM sched_d sd
     JOIN entity e ON e.entity_id::text = sd.entity_id::text
     LEFT JOIN ref_transaction_types rt ON rt.tran_identifier::text = sd.transaction_type_identifier::text;
	   
