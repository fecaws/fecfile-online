-- FNE-1643 Remove text from memobox and add text to expenditures 
-- Removing Memo text
UPDATE dynamic_form_fields SET field_value = '' WHERE df_id = 1923;

-- Add text to purpose of disbursement for OPEXP_CONV_ACC_OP_EXP_NP omit optoinsl text and gray it out 
UPDATE dynamic_form_fields SET field_value = 'Convention Account', field_is_readonly = 'true', field_is_required = 'true' WHERE df_id = 1922;

-- FNE-2089 Update Partnership Receipt
UPDATE dynamic_form_fields SET field_input_group = false WHERE df_id = 2169;
