UPDATE public.dynamic_form_fields SET field_db_name = 'federal_share' WHERE transaction_type in ('ALLOC_FEA_CC_PAY_MEMO', 'ALLOC_FEA_STAF_REIM_MEMO','ALLOC_FEA_DISB', 'ALLOC_FEA_VOID', 
'ALLOC_FEA_STAF_REIM', 'ALLOC_FEA_CC_PAY', 'ALLOC_FEA_DISB_DEBT') AND field_db_name = 'fed_share_amount';


UPDATE public.dynamic_form_fields SET field_db_name = 'levin_share', field_label = 'Levin Share' WHERE transaction_type in ('ALLOC_FEA_CC_PAY_MEMO', 'ALLOC_FEA_STAF_REIM_MEMO','ALLOC_FEA_DISB', 'ALLOC_FEA_VOID', 
'ALLOC_FEA_STAF_REIM', 'ALLOC_FEA_CC_PAY', 'ALLOC_FEA_DISB_DEBT') AND field_db_name = 'non_fed_share_amount';