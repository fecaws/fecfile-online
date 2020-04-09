-- FNE-2246 Adding space in field_values.

UPDATE public.dynamic_form_fields SET field_value = 'Convention: Refund'   WHERE field_value = 'Convention:Refund';
UPDATE public.dynamic_form_fields SET field_value = 'Headquarters: Refund' WHERE field_value = 'Headquarters:Refund';

