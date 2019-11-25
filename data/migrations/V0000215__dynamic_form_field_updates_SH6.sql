UPDATE public.transaction_categories SET tran_type_identifier = 'ALLOC_H6_SUM' WHERE sub_tran_type = 'ALLOC_H6_SUM' AND sched_type='sched_h6' and category_type='Other';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_FEA_CC_PAY_MEMO', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, 'Operating Expenditure', field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE 
   field_db_name='memo_code' and transaction_type='PARTN_MEMO';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_FEA_STAF_REIM_MEMO', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, '10', create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, 'Operating Expenditure', field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE 
   field_db_name='memo_code' and transaction_type='PARTN_MEMO';