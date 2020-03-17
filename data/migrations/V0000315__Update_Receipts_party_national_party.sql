-- FNE-2167
-- Receipt description field is showing up as required and not able to type the data
UPDATE public.dynamic_form_fields SET field_is_readonly='False' WHERE transaction_type='PARTY_NP_RECNT_ACC' AND field_label = 'Receipt Description';
