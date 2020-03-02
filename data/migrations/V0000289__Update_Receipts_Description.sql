-- Having this value prevents the Receipt Description from comming back when returning to edit 
-- a Partnership Receipt
UPDATE public.dynamic_form_fields SET field_value = '' WHERE df_id = 4419;
