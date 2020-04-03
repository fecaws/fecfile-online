-- FNE-2216
-- update sched_d and sched_c editable

-- View: public.all_loans_debts_transactions_view

DROP VIEW public.all_loans_debts_transactions_view;

CREATE OR REPLACE VIEW public.all_loans_debts_transactions_view AS
 SELECT sc.cmte_id,
    sc.report_id,
    rp.form_type,
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
        CASE
            WHEN rp.delete_ind = 'Y'::bpchar THEN rp.delete_ind
            ELSE sc.delete_ind
        END AS delete_ind,
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
        CASE
            WHEN rp.delete_ind = 'Y'::bpchar THEN false
            WHEN sc.back_ref_transaction_id is not NULL THEN false
            ELSE true
        END AS iseditable,
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
    rp.form_type,
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
        CASE
            WHEN rp.delete_ind = 'Y'::bpchar THEN rp.delete_ind
            ELSE sd.delete_ind
        END AS delete_ind,
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
        CASE
            WHEN rp.delete_ind = 'Y'::bpchar THEN false
            WHEN sd.back_ref_transaction_id is not NULL THEN false
            ELSE true
        END AS iseditable,
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
