update public.dynamic_form_fields set field_label = REGEXP_REPLACE(field_label, 'Contributor ', '', 'g') where form_type = 'F3X';