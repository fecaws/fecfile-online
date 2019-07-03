
update public.dynamic_form_fields set field_type = 'checkbox' where field_db_name='memo_code';
update public.dynamic_form_fields set field_type = 'textarea', class_name = 'col col-md-5', height = '135px', width = '400px' where field_db_name='memo_text';
update public.dynamic_form_fields set field_type = 'textarea', class_name = 'col col-md-5', height = '135px', width = '400px' where field_db_name='purpose_description';

update public.dynamic_form_fields set field_type = 'text' where field_db_name='contribution_aggregate';
update public.dynamic_form_fields set field_type = 'text' where field_db_name='contribution_amount';

update public.dynamic_form_fields set field_section = 'Amount Section', field_section_order = 5 where field_db_name='memo_code';
update public.dynamic_form_fields set field_section = 'Memo Section', field_section_order = 7 where field_db_name='purpose_description';