update public.dynamic_form_fields set field_is_readonly = true 
where transaction_type = 'JF_TRAN_IND_MEMO' and field_label = 'Contribution Purpose Description';
update public.dynamic_form_fields set field_is_readonly = true 
where transaction_type = 'JF_TRAN_PARTY_MEMO' and field_label = 'Contribution Purpose Description';
update public.dynamic_form_fields set field_is_readonly = true 
where transaction_type = 'JF_TRAN_PAC_MEMO' and field_label = 'Contribution Purpose Description';
update public.dynamic_form_fields set field_is_readonly = true 
where transaction_type = 'JF_TRAN_TRIB_MEMO' and field_label = 'Contribution Purpose Description';
commit;