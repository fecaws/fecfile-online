-- FNE-1741 moving 


UPDATE public.transaction_categories SET tran_type_order='9'  WHERE tran_type_identifier = 'PARTY_NP_RECNT_ACC';
UPDATE public.transaction_categories SET tran_type_order='10' WHERE tran_type_identifier = 'PAC_NP_RECNT_ACC';
UPDATE public.transaction_categories SET tran_type_order='11' WHERE tran_type_identifier = 'TRIB_NP_RECNT_ACC';

-- FNE-1656 Fixing purpose description for Unregistered Receipt from Person


UPDATE dynamic_form_fields set field_is_required = 'True', field_is_readonly = 'True', field_value = 'Permissible Funds'  WHERE transaction_type = 'PAC_NON_FED_REC' AND field_label = 'Receipt Description'
