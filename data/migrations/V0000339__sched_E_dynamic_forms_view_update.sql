update dynamic_form_fields set field_is_required = false where transaction_type like 'IE%' and field_db_name = 'payee_cmte_id'

commit;