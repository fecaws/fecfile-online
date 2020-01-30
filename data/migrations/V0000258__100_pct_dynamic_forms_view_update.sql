update dynamic_form_fields set field_is_required = 'false' where transaction_type = 'FEA_100PCT_DEBT_PAY' and field_html_type != 'hidden' and field_db_name like 'cand%';

update dynamic_form_fields set field_is_required = 'false' where transaction_type = 'FEA_100PCT_DEBT_PAY' and field_html_type != 'hidden' and field_db_name = 'beneficiary_cand_id';

update dynamic_form_fields set field_is_required = 'false' where transaction_type = 'FEA_100PCT_PAY' and field_html_type != 'hidden' and field_db_name like 'cand%';

update dynamic_form_fields set field_is_required = 'false' where transaction_type = 'FEA_100PCT_PAY' and field_html_type != 'hidden' and field_db_name = 'beneficiary_cand_id';




