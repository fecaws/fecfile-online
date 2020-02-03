
update dynamic_form_fields set seperator = true, class_name = 'col col-md-4' where transaction_type = 'IE_MULTI' and field_db_name in ('memo_text', 'memo_text_states');

commit;