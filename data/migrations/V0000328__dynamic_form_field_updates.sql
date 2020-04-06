UPDATE public.ref_transaction_types SET line_num='11A' WHERE tran_identifier in ('PAC_NON_FED_RET', 'PAC_NON_FED_REC');

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, 
            field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'PARTY_RET', field_label, 'Bounced', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       '26', field_section, '9',
       field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type='IK_TRAN' AND field_db_name='pretext';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, 
            field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'PAC_RET', field_label, 'Bounced', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       '26', field_section, '9',
       field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type='IK_TRAN' AND field_db_name='pretext';


INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, 
            field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'RET_REC', field_label, 'Bounced', 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       '26', field_section, '9',
       field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type='IK_TRAN' AND field_db_name='pretext';
