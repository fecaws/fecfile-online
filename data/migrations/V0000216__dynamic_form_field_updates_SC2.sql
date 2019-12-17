
DELETE FROM public.dynamic_form_fields WHERE transaction_type='SC2';

INSERT INTO public.dynamic_form_fields(
    form_type, transaction_type, field_label, field_value, 
    field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
    field_is_readonly, field_validation, field_infoicon, field_info, 
    field_order, field_section, field_section_order, create_date, 
    last_update_date, field_db_name, class_name, height, width, scroll, 
    seperator, transaction_type_desc, field_input_group, field_input_icon, 
    child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
SELECT form_type, 'SC2', field_label, field_value, 
field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
field_is_readonly, field_validation, field_infoicon, field_info, 
field_order, field_section, field_section_order, create_date, 
last_update_date, field_db_name, class_name, height, width, scroll, 
seperator, null, field_input_group, field_input_icon, 
child_form, form_sub_title, toggle, entity_group, entity_id_mapping
FROM public.dynamic_form_fields WHERE transaction_type = 'LEVIN_PARTN_MEMO' 
AND field_db_name in ('last_name','first_name','middle_name','prefix','suffix','street_1',
	'street_2','city','state','zip_code', 'employer', 'occupation', 'contribution_amount');

UPDATE public.dynamic_form_fields SET seperator=false, field_section_order='3', field_order='6' WHERE field_db_name = 'employer' AND transaction_type='SC2';
UPDATE public.dynamic_form_fields SET seperator=false, field_section_order='3', field_order='7' WHERE field_db_name = 'occupation' AND transaction_type='SC2';
UPDATE public.dynamic_form_fields SET seperator=false, field_section_order='4', field_order='8' WHERE field_db_name = 'street_1' AND transaction_type='SC2';
UPDATE public.dynamic_form_fields SET seperator=false, field_section_order='4', field_order='9' WHERE field_db_name = 'street_2' AND transaction_type='SC2';
UPDATE public.dynamic_form_fields SET seperator=false, field_section_order='5', field_order='10' WHERE field_db_name = 'city' AND transaction_type='SC2';
UPDATE public.dynamic_form_fields SET seperator=false, field_section_order='5', field_order='11' WHERE field_db_name = 'state' AND transaction_type='SC2';
UPDATE public.dynamic_form_fields SET seperator=false, field_section_order='5', field_order='12' WHERE field_db_name = 'zip_code' AND transaction_type='SC2';
UPDATE public.dynamic_form_fields SET field_label='Amount Guaranteed', seperator=false, field_section_order='6', field_order='13' WHERE field_db_name = 'contribution_amount' AND transaction_type='SC2';
UPDATE public.dynamic_form_fields SET seperator=false WHERE field_db_name = 'prefix' AND transaction_type='SC2';
UPDATE public.dynamic_form_fields SET seperator=false WHERE field_db_name = 'suffix' AND transaction_type='SC2';

INSERT INTO public.dynamic_form_fields(
    form_type, transaction_type, field_label, field_value, 
    field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
    field_is_readonly, field_validation, field_infoicon, field_info, 
    field_order, field_section, field_section_order, create_date, 
    last_update_date, field_db_name, class_name, height, width, scroll, 
    seperator, transaction_type_desc, field_input_group, field_input_icon, 
    child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
SELECT form_type, 'SC2', field_label, field_value, 
field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
field_is_readonly, field_validation, field_infoicon, field_info, 
field_order, field_section, field_section_order, create_date, 
last_update_date, field_db_name, class_name, height, width, scroll, 
seperator, null, field_input_group, field_input_icon, 
child_form, form_sub_title, toggle, entity_group, entity_id_mapping
FROM public.dynamic_form_fields WHERE transaction_type = 'INDV_REC' 
AND field_db_name in ('entity_type','api_call','entity_id','transaction_type_identifier',
	'back_ref_transaction_id','back_ref_sched_name','transaction_id');

UPDATE public.dynamic_form_fields SET field_value='/sc/schedC2' WHERE field_db_name = 'api_call' AND transaction_type='SC2';
UPDATE public.dynamic_form_fields SET field_value='SC2' WHERE field_db_name = 'transaction_type_identifier' AND transaction_type='SC2';
