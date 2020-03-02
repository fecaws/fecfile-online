-- Fix for Expenditure purpose description
update dynamic_form_fields set field_type = 'text', field_input_group = 'false' WHERE df_id in (5514, 5592);
-- Fix for Expenditure purpose description for memo
update dynamic_form_fields set field_is_readonly = 'false', field_input_group = 'false'  WHERE df_id in (5553,5665,5468);

