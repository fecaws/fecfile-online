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