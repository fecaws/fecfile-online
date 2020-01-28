
UPDATE public.transaction_categories SET tran_type_identifier='IE_VOID' WHERE tran_type_identifier='IE_PMT_TO_PROL_VOID';

ALTER TABLE public.sched_e ALTER COLUMN memo_text TYPE VARCHAR(500);

UPDATE public.ref_transaction_types SET parent_tran_id='160' WHERE tran_identifier='IE_B4_DISSE_MEMO';

UPDATE public.ref_transaction_types SET parent_tran_id=null WHERE tran_identifier='IE';

UPDATE public.ref_transaction_types SET tran_identifier='IE_B4_DISSE' WHERE tran_identifier='IE_B4_DISSE_MEMO';

DELETE FROM public.dynamic_form_fields WHERE transaction_type='IE_B4_DISSE';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
	SELECT form_type, 'IE_B4_DISSE', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
	FROM public.dynamic_form_fields WHERE transaction_type='IE';

UPDATE public.dynamic_form_fields SET field_value = 'IE_B4_DISSE' WHERE field_db_name='transaction_type_identifier' 
AND transaction_type='IE_B4_DISSE';