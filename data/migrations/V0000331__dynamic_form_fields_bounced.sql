UPDATE public.dynamic_form_fields SET field_value = 'Bounced', field_input_group = true
WHERE field_db_name='purpose_description' and transaction_type in ('PARTY_RET', 'PAC_RET', 'RET_REC');