UPDATE public.dynamic_form_fields SET field_is_readonly='f' WHERE transaction_type = 'JF_TRAN_NP_RECNT_ACC' and field_db_name='purpose_description';

UPDATE public.dynamic_form_fields SET field_is_required='t' WHERE transaction_type in ('ALLOC_EXP','ALLOC_EXP_CC_PAY','ALLOC_EXP_STAF_REIM','ALLOC_EXP_PMT_TO_PROL','ALLOC_EXP_CC_PAY_MEMO','ALLOC_EXP_STAF_REIM_MEMO',
'ALLOC_EXP_PMT_TO_PROL_MEMO','ALLOC_EXP_VOID','ALLOC_EXP_DEBT','ALLOC_FEA_DISB','ALLOC_FEA_CC_PAY','ALLOC_FEA_STAF_REIM',
'ALLOC_FEA_CC_PAY_MEMO','ALLOC_FEA_STAF_REIM_MEMO','ALLOC_FEA_VOID','ALLOC_FEA_DISB_DEBT') AND field_db_name in ('fed_share_amount',
'non_fed_share_amount', 'federal_share', 'levin_share');

UPDATE public.dynamic_form_fields SET field_is_readonly='t' WHERE transaction_type ='OTH_REC_DEBT' and field_db_name='entity_type';