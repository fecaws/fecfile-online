-- Fix Purpose of Disbursement for Recount Disbursement

UPDATE public.dynamic_form_fields SET field_is_readonly = 'False' WHERE transaction_type = 'OTH_DISB_RECNT' AND field_label = 'Purpose of Disbursement';
UPDATE public.dynamic_form_fields SET field_is_readonly = 'False' WHERE transaction_type = 'OTH_DISB_NP_RECNT_ACC' AND field_label = 'Purpose of Disbursement';

