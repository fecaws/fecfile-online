
update public.dynamic_form_fields set field_section = 'Name Section 1', field_section_order = 1 where field_db_name='middle_name';

update public.dynamic_form_fields set field_order = 1 where field_db_name = 'last_name';
update public.dynamic_form_fields set field_order = 2 where field_db_name = 'first_name';	
update public.dynamic_form_fields set field_order = 3 where field_db_name = 'middle_name';	
update public.dynamic_form_fields set field_order = 4 where field_db_name = 'preffix';	
update public.dynamic_form_fields set field_order = 5 where field_db_name = 'suffix';	

update public.dynamic_form_fields set field_section_order = 5 where field_db_name = 'employer';
update public.dynamic_form_fields set field_section_order = 5 where field_db_name = 'occupation';

update public.dynamic_form_fields set field_section_order = 6, seperator = 'true' where field_db_name = 'contribution_aggregate';
update public.dynamic_form_fields set field_section_order = 6, seperator = 'true' where field_db_name = 'contribution_amount';
update public.dynamic_form_fields set field_section_order = 6, seperator = 'true' where field_db_name = 'contribution_date';
update public.dynamic_form_fields set field_section_order = 6, seperator = 'true' where field_db_name = 'memo_code';

update public.dynamic_form_fields set field_order = 15 where field_db_name = 'memo_code';
update public.dynamic_form_fields set field_order = 16 where field_db_name = 'purpose_description';
update public.dynamic_form_fields set field_order = 17 where field_db_name = 'memo_text';