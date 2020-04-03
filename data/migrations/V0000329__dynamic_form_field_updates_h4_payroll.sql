-- FNE-2240: fix H4 payment to payroll rntity type issue
update public.dynamic_form_fields set field_value = 'ORG' where transaction_type = 'ALLOC_EXP_PMT_TO_PROL' and field_label = 'Entity Type';