update public.dynamic_form_fields set field_is_readonly = true where transaction_type = 'ALLOC_FEA_CC_PAY_MEMO' and field_label = 'Type';
update public.dynamic_form_fields set field_is_readonly = true where transaction_type = 'ALLOC_FEA_CC_PAY_MEMO' and field_label = 'Allocated Activity or Event';
update public.dynamic_form_fields set field_is_readonly = true where transaction_type = 'ALLOC_FEA_STAF_REIM_MEMO' and field_label = 'Type';
update public.dynamic_form_fields set field_is_readonly = true where transaction_type = 'ALLOC_FEA_STAF_REIM_MEMO' and field_label = 'Allocated Activity or Event';
