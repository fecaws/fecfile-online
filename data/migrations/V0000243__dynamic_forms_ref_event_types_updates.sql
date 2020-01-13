UPDATE public.ref_event_types SET is_pac='t' WHERE event_type='DF';

UPDATE public.dynamic_form_fields SET field_is_readonly='f' WHERE transaction_type in ('JF_TRAN', 'JF_TRAN_PAC_MEMO','JF_TRAN_IND_MEMO',
'JF_TRAN_PARTY_MEMO','JF_TRAN_TRIB_MEMO') and field_db_name='purpose_description';