-- FNE-1803

-- View: public.all_receipts_transactions_view

DROP VIEW public.all_receipts_transactions_view;

CREATE OR REPLACE VIEW public.all_receipts_transactions_view
 AS
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
    sa.aggregation_ind,
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
            WHEN sa.reattribution_ind::text = 'A'::text THEN false
            WHEN sa.reattribution_ind::text = 'R'::text AND (( SELECT csa1.delete_ind
               FROM sched_a csa1
              WHERE csa1.transaction_id::text = sa.reattribution_id::text)) = 'Y'::bpchar THEN false
            WHEN sa.reattribution_ind::text = 'R'::text AND sa.delete_ind = 'Y'::bpchar AND (( SELECT csa2.reattribution_ind
               FROM sched_a csa2
              WHERE csa2.transaction_id::text = sa.reattribution_id::text)) IS NOT NULL THEN false
            ELSE true
        END AS iseditable,
        CASE
            WHEN sa.transaction_type_identifier::text = ANY (
                ARRAY[
                    'TRIB_REC'::character varying::text,
                    'IK_REC'::character varying::text,
                    'IK_BC_REC'::character varying::text,
                    'PARTN_MEMO'::character varying::text,
                    'BC_TO_IND_MEMO'::character varying::text,
                    'BC_TO_UNKN_MEMO'::character varying::text,
                    'INDV_REC'::character varying::text,
                    'PARTN_REC'::character varying::text,
                    'REATT_FROM'::character varying::text,
                    'REATT_TO'::character varying::text,
                    'RET_REC'::character varying::text,
                    'BC_TO_IND'::character varying::text,
                    'BC_TO_UNKN'::character varying::text,
                    'IND_NP_HQ_ACC'::character varying::text,
                    'TRIB_NP_HQ_ACC'::character varying::text,
                    'IND_NP_CONVEN_ACC'::character varying::text,
                    'TRIB_NP_CONVEN_ACC'::character varying::text,
                    'EAR_REC_RECNT_ACC'::character varying::text,
                    'EAR_REC_CONVEN_ACC'::character varying::text,
                    'EAR_REC_HQ_ACC'::character varying::text,
                    'IND_REC_NON_CONT_ACC'::character varying::text,
                    'BUS_LAB_NON_CONT_ACC'::character varying::text,
                    'OFFSET_TO_OPEX'::character varying::text,
                    'TRIB_NP_RECNT_ACC'::character varying::text,
                    'IND_NP_RECNT_ACC'::character varying::text,
                    'IND_RECNT_REC'::character varying::text,
                    'OTH_REC'::character varying::text,
                    'OTH_REC_DEBT'::character varying::text
                    ]) 
                THEN true
            ELSE false
        END AS forceitemizable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = sa.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild,
        CASE
            WHEN (sa.transaction_type_identifier::text = ANY (ARRAY['IND_REC_NON_CONT_ACC'::character varying::text, 'IND_NP_CONVEN_ACC'::character varying::text, 'IND_NP_HQ_ACC'::character varying::text, 'IND_NP_RECNT_ACC'::character varying::text, 'IND_RECNT_REC'::character varying::text, 'INDV_REC'::character varying::text, 'JF_TRAN_PAC_MEMO'::character varying::text, 'JF_TRAN_IND_MEMO'::character varying::text, 'JF_TRAN_PARTY_MEMO'::character varying::text, 'JF_TRAN_TRIB_MEMO'::character varying::text, 'JF_TRAN_NP_RECNT_IND_MEMO'::character varying::text, 'JF_TRAN_NP_RECNT_PAC_MEMO'::character varying::text, 'JF_TRAN_NP_RECNT_TRIB_MEMO'::character varying::text, 'JF_TRAN_NP_CONVEN_IND_MEMO'::character varying::text, 'JF_TRAN_NP_CONVEN_PAC_MEMO'::character varying::text, 'JF_TRAN_NP_CONVEN_TRIB_MEMO''JF_TRAN_NP_HQ_IND_MEMO'::character varying::text, 'JF_TRAN_NP_HQ_PAC_MEMO'::character varying::text, 'JF_TRAN_NP_HQ_TRIB_MEMO'::character varying::text])) AND sa.reattribution_ind IS NULL THEN true
            ELSE false
        END AS isreattributable,
        CASE
            WHEN sa.reattribution_ind::text = 'R'::text THEN true
            ELSE false
        END AS "isReattribution"
   FROM sched_a sa
     JOIN entity e ON e.entity_id::text = sa.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sa.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sa.cmte_id::text AND rp.report_id = sa.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
  WHERE sa.transaction_type_identifier::text <> ALL (ARRAY['LEVIN_PARTN_MEMO'::character varying::text, 'LEVIN_TRIB_REC'::character varying::text, 'LEVIN_PARTN_REC'::character varying::text, 'LEVIN_ORG_REC'::character varying::text, 'LEVIN_INDV_REC'::character varying::text, 'LEVIN_NON_FED_REC'::character varying::text, 'LEVIN_OTH_REC'::character varying::text, 'LEVIN_PAC_REC'::character varying::text]);

