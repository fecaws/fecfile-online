update dynamic_form_fields set field_value = 'Credit Card: See Below',field_is_readonly='true'  where transaction_type = 'IE_CC_PAY' and field_db_name = 'expenditure_purpose_description';
update dynamic_form_fields set field_value = 'Credit Card Payment',field_is_readonly='true'  where transaction_type = 'IE_CC_PAY_MEMO' and field_db_name = 'expenditure_purpose_description';
update dynamic_form_fields set field_value = 'Reimbursement: See Below',field_is_readonly='true'  where transaction_type = 'IE_STAF_REIM' and field_db_name = 'expenditure_purpose_description';
update dynamic_form_fields set field_value = 'Payroll: See Below',field_is_readonly='true'  where transaction_type = 'IE_PMT_TO_PROL' and field_db_name = 'expenditure_purpose_description';

update dynamic_form_fields set field_type = 'textarea',field_is_readonly='true' where transaction_type = 'IE_MULTI' and field_db_name = 'memo_text_states';

update dynamic_form_fields set field_is_required = true where transaction_type like 'IE%' and field_db_name='election_other_description';

update dynamic_form_fields set field_value = null where transaction_type like 'IE%' and field_db_name = 'cand_election_year';
