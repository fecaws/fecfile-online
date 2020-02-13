update dynamic_form_fields set field_input_group = false
where transaction_type = 'EAR_MEMO' and field_label = 'Contribution Purpose Description';

update dynamic_form_fields set field_input_group = false
where transaction_type = 'PAC_EAR_MEMO' and field_label = 'Contribution Purpose Description';

update dynamic_form_fields set field_input_group = false
where transaction_type = 'EAR_REC_RECNT_ACC_MEMO' and field_label = 'Contribution Purpose Description';

update dynamic_form_fields set field_input_group = false
where transaction_type = 'EAR_REC_CONVEN_ACC_MEMO' and field_label = 'Contribution Purpose Description';

update dynamic_form_fields set field_input_group = false
where transaction_type = 'EAR_REC_HQ_ACC_MEMO' and field_label = 'Contribution Purpose Description';

update dynamic_form_fields set field_is_required = false
where transaction_type = 'EAR_REC_RECNT_ACC' and field_label = 'Contribution Purpose Description';
