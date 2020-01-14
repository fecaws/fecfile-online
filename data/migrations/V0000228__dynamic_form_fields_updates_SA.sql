ALTER TABLE public.sched_a ALTER COLUMN transaction_type DROP not null;

DELETE FROM public.dynamic_form_fields WHERE transaction_type in ('REATT_FROM', 'REATT_MEMO');

INSERT INTO public.dynamic_form_fields(
    form_type, transaction_type, field_label, field_value, 
    field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
    field_is_readonly, field_validation, field_infoicon, field_info, 
    field_order, field_section, field_section_order, create_date, 
    last_update_date, field_db_name, class_name, height, width, scroll, 
    seperator, transaction_type_desc, field_input_group, field_input_icon, 
    child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
SELECT form_type, 'REATT_FROM', field_label, field_value, 
field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
field_is_readonly, field_validation, field_infoicon, field_info, 
field_order, field_section, field_section_order, create_date, 
last_update_date, field_db_name, class_name, height, width, scroll, 
seperator, transaction_type_desc, field_input_group, field_input_icon, 
child_form, form_sub_title, toggle, entity_group, entity_id_mapping
FROM public.dynamic_form_fields WHERE transaction_type='INDV_REC';

INSERT INTO public.dynamic_form_fields(
    form_type, transaction_type, field_label, field_value, 
    field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
    field_is_readonly, field_validation, field_infoicon, field_info, 
    field_order, field_section, field_section_order, create_date, 
    last_update_date, field_db_name, class_name, height, width, scroll, 
    seperator, transaction_type_desc, field_input_group, field_input_icon, 
    child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
SELECT form_type, 'REATT_MEMO', field_label, field_value, 
field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
field_is_readonly, field_validation, field_infoicon, field_info, 
field_order, field_section, field_section_order, create_date, 
last_update_date, field_db_name, class_name, height, width, scroll, 
seperator, 'Operating Expenditure', field_input_group, field_input_icon, 
child_form, form_sub_title, toggle, entity_group, entity_id_mapping
FROM public.dynamic_form_fields WHERE transaction_type='INDV_REC';

UPDATE public.dynamic_form_fields SET field_value = null WHERE field_db_name = 'transaction_type' AND transaction_type = 'REATT_FROM';

UPDATE public.dynamic_form_fields SET field_value = '15M' WHERE field_db_name = 'transaction_type' AND transaction_type = 'REATT_MEMO';

UPDATE public.dynamic_form_fields SET field_value = 'REATT_FROM' WHERE field_db_name = 'transaction_type_identifier' AND transaction_type = 'REATT_FROM';

UPDATE public.dynamic_form_fields SET field_value = 'REATT_MEMO' WHERE field_db_name = 'transaction_type_identifier' AND transaction_type = 'REATT_MEMO';

UPDATE public.dynamic_form_fields SET field_is_readonly=false WHERE field_db_name = 'memo_code' AND transaction_type in ('ALLOC_FEA_DISB', 
	'ALLOC_FEA_VOID', 'ALLOC_EXP', 'ALLOC_EXP_VOID');

UPDATE public.dynamic_form_fields SET field_value = null, field_is_hidden=true, field_type='hidden' WHERE field_db_name = 'memo_code' AND transaction_type in 
	('ALLOC_FEA_STAF_REIM', 'ALLOC_FEA_CC_PAY', 'ALLOC_EXP_CC_PAY', 'ALLOC_EXP_STAF_REIM', 'ALLOC_EXP_PMT_TO_PROL', 'PARTN_REC', 'REATT_FROM', 'JF_TRAN',
	'JF_TRAN_NP_RECNT_ACC',	'JF_TRAN_NP_CONVEN_ACC', 'JF_TRAN_NP_HQ_ACC', 'OPEXP_CC_PAY', 'OTH_DISB_CC_PAY', 'OTH_DISB_NC_ACC_CC_PAY', 'FEA_CC_PAY',
	'OPEXP_STAF_REIM', 'OTH_DISB_STAF_REIM', 'OTH_DISB_NC_ACC_STAF_REIM', 'FEA_STAF_REIM', 'OPEXP_PMT_TO_PROL', 'OTH_DISB_PMT_TO_PROL', 
	'OTH_DISB_NC_ACC_PMT_TO_PROL', 'FEA_PAY_TO_PROL'); 

UPDATE public.dynamic_form_fields SET field_value = 'X', field_is_readonly=true WHERE field_db_name = 'memo_code' AND transaction_type in (
'ALLOC_FEA_CC_PAY_MEMO', 'ALLOC_FEA_STAF_REIM_MEMO','ALLOC_EXP_CC_PAY_MEMO', 'ALLOC_EXP_STAF_REIM_MEMO', 'ALLOC_EXP_PMT_TO_PROL_MEMO',
'PARTN_MEMO', 'REATT_MEMO', 'JF_TRAN_PAC_MEMO', 'JF_TRAN_IND_MEMO', 'JF_TRAN_PARTY_MEMO', 'JF_TRAN_TRIB_MEMO',
'JF_TRAN_NP_CONVEN_IND_MEMO', 'JF_TRAN_NP_CONVEN_PAC_MEMO', 'JF_TRAN_NP_CONVEN_TRIB_MEMO', 'JF_TRAN_NP_RECNT_IND_MEMO', 'JF_TRAN_NP_RECNT_PAC_MEMO',
'JF_TRAN_NP_RECNT_TRIB_MEMO', 'JF_TRAN_NP_HQ_IND_MEMO', 'JF_TRAN_NP_HQ_PAC_MEMO', 'JF_TRAN_NP_HQ_TRIB_MEMO','OPEXP_CC_PAY_MEMO',
'OTH_DISB_NC_ACC_CC_PAY_MEMO', 'OTH_DISB_CC_PAY_MEMO', 'FEA_CC_PAY_MEMO','OTH_DISB_NC_ACC_STAF_REIM_MEMO', 'FEA_STAF_REIM_MEMO', 'OPEXP_STAF_REIM_MEMO', 
'OTH_DISB_STAF_REIM_MEMO', 'OTH_DISB_PMT_TO_PROL_MEMO', 'OTH_DISB_NC_ACC_PMT_TO_PROL_MEMO', 'FEA_PAY_TO_PROL_MEMO', 'OPEXP_PMT_TO_PROL_MEMO');


DROP VIEW public.all_loans_debts_transactions_view;

CREATE OR REPLACE VIEW public.all_loans_debts_transactions_view AS 
 SELECT sc.cmte_id,
    sc.report_id,
    rp.report_type,
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
        END AS deleteddate
   FROM sched_c sc
     JOIN entity e ON e.entity_id::text = sc.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sc.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sc.cmte_id::text AND rp.report_id = sc.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
UNION
 SELECT sd.cmte_id,
    sd.report_id,
    rp.report_type,
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
        END AS deleteddate
   FROM sched_d sd
     JOIN entity e ON e.entity_id::text = sd.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sd.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sd.cmte_id::text AND rp.report_id = sd.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text;
