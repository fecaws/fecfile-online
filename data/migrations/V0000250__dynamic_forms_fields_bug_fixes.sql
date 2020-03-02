UPDATE public.transaction_categories SET tran_type='Credit Card Payment for Independent Expenditure' 
WHERE tran_type_identifier = 'IE_CC_PAY';

UPDATE public.transaction_categories SET tran_type='Staff Reimbursement for Independent Expenditure' 
WHERE tran_type_identifier = 'IE_STAF_REIM';

UPDATE public.transaction_categories SET tran_type='Payment to Payroll for Independent Expenditure' 
WHERE tran_type_identifier = 'IE_PMT_TO_PROL';

UPDATE public.transaction_categories SET tran_type='Credit Card Payment for Coordinated Party Expenditure' 
WHERE tran_type_identifier = 'COEXP_CC_PAY';

UPDATE public.transaction_categories SET tran_type='Staff Reimbursement for Coordinated Party Expenditure' 
WHERE tran_type_identifier = 'COEXP_STAF_REIM';

UPDATE public.transaction_categories SET tran_type='Payment to Payroll for Coordinated Party Expenditure' 
WHERE tran_type_identifier = 'COEXP_PMT_PROL';

UPDATE public.transaction_categories SET tran_type='Void of Independent Expenditure', sched_type='sched_e'
WHERE tran_type_identifier='IE_PMT_TO_PROL_VOID';

UPDATE public.transaction_categories SET tran_type='Void of Coordinated Party Expenditure', sched_type='sched_f'
WHERE tran_type_identifier='COEXP_PMT_PROL_VOID';

UPDATE public.transaction_categories SET tran_type='Credit Card Payment for Operating Expenditure' 
WHERE tran_type_identifier = 'OPEXP_CC_PAY';

UPDATE public.transaction_categories SET tran_type='Staff Reimbursement for Operating Expenditure' 
WHERE tran_type_identifier = 'OPEXP_STAF_REIM';

UPDATE public.transaction_categories SET tran_type='Payment to Payroll for Operating Expenditure' 
WHERE tran_type_identifier = 'OPEXP_PMT_TO_PROL';

UPDATE public.transaction_categories SET tran_type='Void of Operating Expenditure' 
WHERE tran_type_identifier = 'OPEXP_VOID';

UPDATE public.transaction_categories SET tran_type=null, sched_type=null
WHERE tran_type_identifier='OPEXP_DEBT';

UPDATE public.dynamic_form_fields SET seperator=true WHERE field_db_name = 'entity_name' AND 
transaction_type in ('ALLOC_FEA_CC_PAY', 'OTH_DISB_NC_ACC_CC_PAY', 'OTH_DISB_NC_ACC_PMT_TO_PROL', 
'OTH_DISB_CC_PAY', 'OTH_DISB_PMT_TO_PROL', 'ALLOC_EXP_CC_PAY', 'OPEXP_CC_PAY', 'OPEXP_PMT_TO_PROL',
'IE_CC_PAY', 'IE_PMT_TO_PROL');

UPDATE public.dynamic_form_fields SET field_type='hidden', field_html_type='hidden', field_is_hidden='t'
WHERE field_db_name='entity_type' AND transaction_type in ('COEXP_CC_PAY', 'COEXP_PMT_PROL', 'ALLOC_EXP_PMT_TO_PROL');

UPDATE public.dynamic_form_fields SET field_value = 'IND' WHERE field_db_name= 'entity_type' AND 
transaction_type = 'OPEXP_STAF_REIM';

UPDATE public.dynamic_form_fields SET field_value = 'ORG' WHERE field_db_name= 'entity_type' AND 
transaction_type = 'OPEXP';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'OPEXP_STAF_REIM', field_label, 'Reimbursement: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'IE_STAF_REIM', field_label, 'Reimbursement: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'FEA_STAF_REIM', field_label, 'Reimbursement: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_FEA_STAF_REIM', field_label, 'Reimbursement: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_EXP_STAF_REIM', field_label, 'Reimbursement: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'OTH_DISB_STAF_REIM', field_label, 'Reimbursement: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'COEXP_STAF_REIM', field_label, 'Reimbursement: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'OPEXP_HQ_ACC_REG_REF', field_label, 'Headquarters: Refund', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

UPDATE public.dynamic_form_fields SET field_value='Reimbursement: See Below' 
WHERE transaction_type='OTH_DISB_NC_ACC_STAF_REIM' AND field_db_name='pretext';

UPDATE public.dynamic_form_fields SET field_value='Payroll: See Below' 
WHERE transaction_type='OTH_DISB_NC_ACC_PMT_TO_PROL' AND field_db_name='pretext'; 

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'OPEXP_PMT_TO_PROL', field_label, 'Payroll: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'FEA_PAY_TO_PROL', field_label, 'Payroll: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_EXP_PMT_TO_PROL', field_label, 'Payroll: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'OTH_DISB_PMT_TO_PROL', field_label, 'Payroll: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'COEXP_PMT_PROL', field_label, 'Payroll: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'IE_PMT_TO_PROL', field_label, 'Payroll: See Below', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP_HQ_ACC_TRIB_REF' AND field_db_name='pretext';