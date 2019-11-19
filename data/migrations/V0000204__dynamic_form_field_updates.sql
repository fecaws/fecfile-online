UPDATE public.dynamic_form_fields SET field_is_readonly=false, field_input_group=false WHERE transaction_type='FEA_100PCT_DEBT_PAY' AND field_db_name = 'expenditure_purpose';

UPDATE public.dynamic_form_fields SET field_is_readonly=false WHERE transaction_type='FEA_100PCT_DEBT_PAY' AND field_db_name = 'memo_code';

UPDATE public.dynamic_form_fields SET field_is_readonly=true WHERE transaction_type in 
('OPEXP_DEBT', 'OTH_DISB_DEBT', 'ALLOC_FEA_DISB_DEBT', 'FEA_100PCT_DEBT_PAY') 
AND field_db_name in ('entity_type','entity_name','last_name','first_name','middle_name','prefix','suffix','street_1',
'street_2','city','state','zip_code');

UPDATE public.transaction_categories SET tran_type_identifier = 'DEBT_TO_VENDOR' WHERE tran_type_identifier = 'debt_to_vendor';

UPDATE public.dynamic_form_fields SET field_order='14', field_section='Date Section', field_section_order='8' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name='activity_event_type';

UPDATE public.dynamic_form_fields SET field_order='15' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'total_amount';
UPDATE public.dynamic_form_fields SET field_order='16' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'fed_share_amount';
UPDATE public.dynamic_form_fields SET field_order='17' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'non_fed_share_amount';
UPDATE public.dynamic_form_fields SET field_order='18' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'activity_event_amount_ytd';
UPDATE public.dynamic_form_fields SET field_order='19' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'memo_code';
UPDATE public.dynamic_form_fields SET field_order='20' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'expenditure_purpose';
UPDATE public.dynamic_form_fields SET field_order='21' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'memo_text';
UPDATE public.dynamic_form_fields SET field_order='22' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'line_number';
UPDATE public.dynamic_form_fields SET field_order='23' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'transaction_id';
UPDATE public.dynamic_form_fields SET field_order='24' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'back_ref_transaction_id';
UPDATE public.dynamic_form_fields SET field_order='25' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'back_ref_sched_name';
UPDATE public.dynamic_form_fields SET field_order='26' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'transaction_type';
UPDATE public.dynamic_form_fields SET field_order='27' WHERE transaction_type='ALLOC_FEA_DISB_DEBT' AND field_db_name= 'transaction_type_identifier';