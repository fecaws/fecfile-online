update public.dynamic_form_fields set field_section = 'Date Section', seperator = 'false' where field_db_name = 'contribution_date';
update public.dynamic_form_fields set field_section_order = 7 where field_section = 'Amount Section';
update public.dynamic_form_fields set field_section_order = 8 where field_section = 'Memo Section';
update public.dynamic_form_fields set field_section_order = 9 where field_section = 'Official Use Only 1' and field_section = 'Official Use Only 2';
update public.dynamic_form_fields set field_order = 15 where field_db_name = 'memo_code';
update public.dynamic_form_fields set field_order = 13 where field_db_name = 'contribution_amount';
update public.dynamic_form_fields set field_order = 14 where field_db_name = 'contribution_aggregate';

