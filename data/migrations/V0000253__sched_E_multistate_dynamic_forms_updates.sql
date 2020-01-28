update dynamic_form_fields set class_name='col col-md-3', field_order='37' where transaction_type like 'IE_MULTI' and field_type != 'hidden' and field_label = 'Memo Text';

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)

VALUES

 ('F3X','IE_MULTI','Memo Text States',null,
            400,'text','input','f','f',
            't','alphaNumeric','t','Request language from RAD',
            36,'Memo Section',15,'2019-08-14',
            '2019-08-14','memo_text_states','col col-md-4','30px','380px','t',
            'f',null,'f',null,
            'f',null,'f',null,'entity_id');
			
update dynamic_form_fields set field_is_required = 'false' where transaction_type = 'IE_MULTI' and field_db_name = 'memo_text'