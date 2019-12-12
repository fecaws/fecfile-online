UPDATE public.dynamic_form_fields SET field_is_readonly=true WHERE field_db_name = 'memo_code' AND transaction_type in ('ALLOC_FEA_DISB', 'ALLOC_FEA_VOID', 
	'ALLOC_FEA_STAF_REIM', 'ALLOC_FEA_CC_PAY', 'ALLOC_EXP', 'ALLOC_EXP_VOID', 'ALLOC_EXP_CC_PAY', 
	'ALLOC_EXP_STAF_REIM', 'ALLOC_EXP_PMT_TO_PROL');

