update public.dynamic_form_fields set field_value=null where transaction_type = 'CON_EAR_DEP_MEMO' and field_label = 'Election Year';
update public.dynamic_form_fields set field_value=null where transaction_type = 'CON_EAR_UNDEP_MEMO' and field_label = 'Election Year';
update public.dynamic_form_fields set field_value=null where transaction_type = 'PAC_CON_EAR_UNDEP_MEMO' and field_label = 'Election Year';
update public.dynamic_form_fields set field_value=null where transaction_type = 'PAC_CON_EAR_DEP_MEMO' and field_label = 'Election Year';
