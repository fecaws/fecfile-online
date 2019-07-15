update public.dynamic_form_fields set field_label = REGEXP_REPLACE(field_label, 'Contributor ', '', 'g') where form_type = 'F3X';
update public.dynamic_form_fields set class_name = 'col-md-4' where form_type = 'F3X' and class_name = 'col col-md-3';
update public.dynamic_form_fields set class_name = 'col col-md-6' where form_type = 'F3X' and field_db_name = 'street_1' or field_db_name = 'street_2';	

INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, 
	field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, 
	field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, 
	last_update_date, field_db_name) VALUES (26, 'F3X', 'Individual Receipt', 'Contributor Information', '', NULL, 'fieldset', 
	'fieldset', 'false', 'false', 'false', '', 'false', '', 1, 'Name Section 1', 1, '2019-07-15', '2019-07-15', 'fieldset');	