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
                'INDV_REC'::character varying::text,
                'PAR_CON'::character varying::text,
                'PAR_MEMO'::character varying::text,
                'REATT_FROM'::character varying::text,
                'REATT_TO'::character varying::text,
                'PARTN_REC'::character varying::text,
                'IK_REC'::character varying::text,
                'REATT_FROM'::character varying::text,
                'RET_REC'::character varying::text,
                'TRIB_REC'::character varying::text,
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



-- View: public.all_disbursements_transactions_view

DROP VIEW public.all_disbursements_transactions_view;

CREATE OR REPLACE VIEW public.all_disbursements_transactions_view
 AS
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
    sb.aggregation_ind,
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
            WHEN sb.redesignation_ind::text = 'A'::text THEN false
            WHEN sb.redesignation_ind::text = 'R'::text AND (( SELECT csa1.delete_ind
               FROM sched_b csa1
              WHERE csa1.transaction_id::text = sb.redesignation_id::text)) = 'Y'::bpchar THEN false
            WHEN sb.redesignation_ind::text = 'R'::text AND sb.delete_ind = 'Y'::bpchar AND (( SELECT csa2.redesignation_ind
               FROM sched_b csa2
              WHERE csa2.transaction_id::text = sb.redesignation_id::text)) IS NOT NULL THEN false
            ELSE true
        END AS iseditable,
        CASE
            WHEN sb.transaction_type_identifier::text = ANY (
                ARRAY[
                        'OPEXP'::character varying::text,
                        'OPEXP_CC_PAY'::character varying::text,
                        'OPEXP_STAF_REIM'::character varying::text,
                        'OPEXP_PMT_TO_PROL'::character varying::text,
                        'OPEXP_VOID'::character varying::text,
                        'OPEXP_HQ_ACC_OP_EXP_NP'::character varying::text,
                        'OPEXP_CONV_ACC_OP_EXP_NP'::character varying::text,
                        'OPEXP_DEBT'::character varying::text,
                        'OTH_DISB'::character varying::text,
                        'OTH_DISB_CC_PAY'::character varying::text,
                        'OTH_DISB_STAF_REIM'::character varying::text,
                        'OTH_DISB_PMT_TO_PROL'::character varying::text,
                        'OTH_DISB_RECNT'::character varying::text,
                        'OTH_DISB_NP_RECNT_ACC'::character varying::text,
                        'OTH_DISB_NC_ACC'::character varying::text,
                        'OTH_DISB_NC_ACC_CC_PAY'::character varying::text,
                        'OTH_DISB_NC_ACC_STAF_REIM'::character varying::text,
                        'OTH_DISB_NC_ACC_PMT_TO_PROL'::character varying::text,
                        'OTH_DISB_VOID'::character varying::text,
                        'REF_CONT_IND'::character varying::text,
                        'REF_CONT_IND_VOID'::character varying::text,
                        'FEA_100PCT_PAY'::character varying::text,
                        'FEA_CC_PAY'::character varying::text,
                        'FEA_STAF_REIM'::character varying::text,
                        'FEA_PAY_TO_PROL'::character varying::text,
                        'FEA_VOID'::character varying::text,
                        'FEA_100PCT_DEBT_PAY'::character varying::text
                    ]) 
                THEN true
            ELSE false
        END AS forceitemizable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = sb.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild,
        CASE
            WHEN sb.transaction_type_identifier::text = 'CONT_TO_CAN'::text AND sb.redesignation_ind IS NULL THEN true
            ELSE false
        END AS isredesignatable,
        CASE
            WHEN sb.redesignation_ind::text = 'R'::text THEN true
            ELSE false
        END AS "isRedesignation"
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
    se.aggregation_ind,
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
        NULL::bool AS forceitemizable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = se.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild,
    false AS isredesignatable,
    false AS "isRedesignation"
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
    sf.aggregation_ind,
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
        NULL::bool AS forceitemizable,
        CASE
            WHEN (( SELECT count(cs.transaction_id) AS count
               FROM all_transactions_view cs
              WHERE cs.back_ref_transaction_id::text = sf.transaction_id::text AND cs.delete_ind IS DISTINCT FROM 'Y'::bpchar)) <> 0 THEN true
            ELSE false
        END AS haschild,
    false AS isredesignatable,
    false AS "isRedesignation"
   FROM sched_f sf
     JOIN entity e ON e.entity_id::text = sf.payee_entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sf.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sf.cmte_id::text AND rp.report_id = sf.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text;

