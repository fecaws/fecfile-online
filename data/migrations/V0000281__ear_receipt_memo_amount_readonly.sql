UPDATE public.dynamic_form_fields set field_is_readonly = true where transaction_type = 'EAR_MEMO' and field_label = 'Contribution Amount';

UPDATE public.dynamic_form_fields set field_is_readonly = true where transaction_type = 'PAC_EAR_MEMO' and field_label = 'Contribution Amount';

UPDATE public.dynamic_form_fields set field_is_readonly = true where transaction_type = 'EAR_REC_RECNT_ACC_MEMO' and field_label = 'Contribution Amount';

UPDATE public.dynamic_form_fields set field_is_readonly = true where transaction_type = 'EAR_REC_CONVEN_ACC_MEMO' and field_label = 'Contribution Amount';

UPDATE public.dynamic_form_fields set field_is_readonly = true where transaction_type = 'EAR_REC_HQ_ACC_MEMO' and field_label = 'Contribution Amount';

