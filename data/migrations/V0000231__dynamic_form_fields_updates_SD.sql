INSERT INTO public.dynamic_form_fields(
    form_type, transaction_type, field_label, field_value, 
    field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
    field_is_readonly, field_validation, field_infoicon, field_info, 
    field_order, field_section, field_section_order, create_date, 
    last_update_date, field_db_name, class_name, height, width, scroll, 
    seperator, transaction_type_desc, field_input_group, field_input_icon, 
    child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
SELECT form_type, 'DEBT_BY_VENDOR', field_label, field_value, 
field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
field_is_readonly, field_validation, field_infoicon, field_info, 
field_order, field_section, field_section_order, create_date, 
last_update_date, field_db_name, class_name, height, width, scroll, 
seperator, transaction_type_desc, field_input_group, field_input_icon, 
child_form, form_sub_title, toggle, entity_group, entity_id_mapping
FROM public.dynamic_form_fields WHERE transaction_type='DEBT_TO_VENDOR';

UPDATE public.dynamic_form_fields SET field_value = 'DEBT_BY_VENDOR'
WHERE transaction_type = 'DEBT_BY_VENDOR' AND field_db_name = 'transaction_type_identifier';

UPDATE public.transaction_categories SET tran_type_identifier = 'DEBT_BY_VENDOR' WHERE category_type='Loans and Debts' 
AND sub_category_type='Debts Owed to the Committee' AND tran_type_identifier = 'DEBT_TO_VENDOR';

INSERT INTO public.transaction_categories(
            form_type, category_type, category_type_info, category_type_info_icon, 
            category_order, sub_category_type, sub_category_type_info, sub_category_type_info_icon, 
            sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
            tran_type_info, tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, 
            sub_tran_type_order, sub_tran_type_info, sub_tran_type_info_icon, 
            tran_type_identifier, tran_sub_type_identifier, 
            cmte_type_category, is_functional, sched_type)
    SELECT form_type, category_type, category_type_info, category_type_info_icon, 
       category_order, 'Schedule L - Summary', 'Schedule L - Summary', sub_category_type_info_icon, 
       '10', 'Schedule L - Summary', tran_type_line_num, tran_type_order, 
       tran_type_info, tran_type_info_icon, 'L_SUM', sub_tran_type_line_num, 
       sub_tran_type_order, sub_tran_type_info, sub_tran_type_info_icon, 
       'L_SUM', tran_sub_type_identifier, 
       cmte_type_category, is_functional, sched_type
  FROM public.transaction_categories WHERE category_type='Other' AND sub_category_type_info='Schedule L-A Entry';

INSERT INTO public.ref_transaction_types(
            ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, 
            tran_desc, parent_tran_id, auto_generate, category_type)
    SELECT '161', form_type, sched_type, line_num, tran_code, 'DEBT_BY_VENDOR', 
       'Debt by Vendor', parent_tran_id, auto_generate, category_type
  FROM public.ref_transaction_types WHERE tran_identifier = 'DEBT_TO_VENDOR';