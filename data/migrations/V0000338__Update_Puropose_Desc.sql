-- FNE-2254 Missing Prepopulated text.
UPDATE dynamic_form_fields SET field_value = 'Reimbursement: See Below', field_is_readonly = 'True' WHERE  transaction_type = 'ALLOC_EXP_STAF_REIM' AND field_label = 'Purpose of Disbursement';

-- FNE-2255 Allocated Payroll Payment Missing Prepopulated Text.
UPDATE dynamic_form_fields SET field_value = 'Payroll: See Below', field_is_readonly = 'True' WHERE  transaction_type = 'ALLOC_EXP_PMT_TO_PROL' AND field_label = 'Purpose of Disbursement';
