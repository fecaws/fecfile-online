
UPDATE public.dynamic_form_fields SET toggle = true, entity_group = 'org-group' WHERE transaction_type = 'ALLOC_FEA_DISB_DEBT' and field_db_name='entity_name';

UPDATE public.dynamic_form_fields SET field_value = '/sh6/schedH6' WHERE field_db_name='api_call' AND transaction_type='ALLOC_FEA_DISB_DEBT';

UPDATE public.transaction_categories SET sched_type = 'sched_c_ls' WHERE tran_type_identifier= 'LOAN_FROM_SUMMARY';