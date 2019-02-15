update dynamic_form_fields set field_is_required='false'  where field_is_required is null;
update dynamic_form_fields set field_label=trim(field_label);
update dynamic_form_fields set field_section='Official Use Only 1' where field_order in (20,21,22);
update dynamic_form_fields set field_section='Official Use Only 2' where field_order in (23,24);
update dynamic_form_fields set field_type='text',field_size=4,field_is_readonly='true' where field_label='Transaction Type Code';
update dynamic_form_fields set field_type='text' where field_label='Memo Code';
update  dynamic_form_fields  set field_type='select' where field_label='Contributor State';
