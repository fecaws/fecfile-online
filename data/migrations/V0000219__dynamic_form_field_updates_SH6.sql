UPDATE public.dynamic_form_fields SET toggle = true WHERE field_db_name in ('last_name', 'first_name', 'middle_name', 'prefix', 'suffix') and transaction_type in 
('ALLOC_FEA_DISB_DEBT','ALLOC_FEA_DISB','ALLOC_FEA_STAF_REIM','ALLOC_FEA_VOID','ALLOC_FEA_CC_PAY_MEMO','ALLOC_FEA_STAF_REIM_MEMO');