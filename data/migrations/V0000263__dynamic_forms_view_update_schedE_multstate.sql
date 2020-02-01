update dynamic_form_fields set field_section_order = 14 , class_name = 'col col-md-12', seperator='false' where transaction_type = 'IE_MULTI' and field_db_name='expenditure_purpose_description';

update dynamic_form_fields set field_order = 36, seperator='false' where transaction_type = 'IE_MULTI' and field_db_name='memo_text';

update dynamic_form_fields set field_order = 37, seperator='true' where transaction_type = 'IE_MULTI' and field_db_name='memo_text_states';

update dynamic_form_fields set field_order = field_order + 1 where transaction_type = 'IE_MULTI' and field_order >= 37 and field_html_type != 'hidden';

update dynamic_form_fields set field_order = 37, seperator='true' where transaction_type = 'IE_MULTI' and field_db_name='memo_text_states';