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
    COALESCE(sa.aggregate_amt, 0.00) AS aggregate_amt,
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
            WHEN sa.transaction_type_identifier::text = ANY (ARRAY['LOAN_FROM_IND'::character varying::text, 'LOAN_FROM_BANK'::character varying::text]) THEN false
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
        END AS haschild,
        CASE
            WHEN NOT(rp.status IS NULL OR rp.status::text = 'Saved'::text) AND sa.transaction_type_identifier IN (
            'IND_REC_NON_CONT_ACC','IND_NP_CONVEN_ACC','IND_NP_HQ_ACC','IND_NP_RECNT_ACC','IND_RECNT_REC','INDV_REC',
            'JF_TRAN_PAC_MEMO','JF_TRAN_IND_MEMO','JF_TRAN_PARTY_MEMO','JF_TRAN_TRIB_MEMO','JF_TRAN_NP_RECNT_IND_MEMO',
            'JF_TRAN_NP_RECNT_PAC_MEMO','JF_TRAN_NP_RECNT_TRIB_MEMO','JF_TRAN_NP_CONVEN_IND_MEMO',
            'JF_TRAN_NP_CONVEN_PAC_MEMO','JF_TRAN_NP_CONVEN_TRIB_MEMO''JF_TRAN_NP_HQ_IND_MEMO','JF_TRAN_NP_HQ_PAC_MEMO',
            'JF_TRAN_NP_HQ_TRIB_MEMO') THEN true
            ELSE false
        END AS isreattributable
   FROM sched_a sa
     JOIN entity e ON e.entity_id::text = sa.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sa.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sa.cmte_id::text AND rp.report_id = sa.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
  WHERE sa.transaction_type_identifier::text <> ALL (ARRAY['LEVIN_PARTN_MEMO'::character varying::text, 'LEVIN_TRIB_REC'::character varying::text, 'LEVIN_PARTN_REC'::character varying::text, 'LEVIN_ORG_REC'::character varying::text, 'LEVIN_INDV_REC'::character varying::text, 'LEVIN_NON_FED_REC'::character varying::text, 'LEVIN_OTH_REC'::character varying::text, 'LEVIN_PAC_REC'::character varying::text]);


UPDATE public.transaction_categories SET tran_type=null, sched_type=null WHERE tran_type_identifier = 'REATT_FROM';


UPDATE public.due_dates SET due_date='2020-06-04', election_date='2020-06-14' WHERE 
report_type='12S' AND election_state='NC' AND election_date='2020-05-14' AND report_year='2020';