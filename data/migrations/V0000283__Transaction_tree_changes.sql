-- FNE-1651
-- Fixing Receipts Purpose description
UPDATE dynamic_form_fields SET field_label = 'Receipt Description' WHERE df_id IN ( SELECT df_id FROM dynamic_form_fields WHERE field_label LIKE 'Contribution Purpose%');

-- Fixing Disburspment description
UPDATE dynamic_form_fields SET field_label = 'Purpose of Disbursement' WHERE df_id IN ( SELECT df_id FROM dynamic_form_fields WHERE field_label LIKE 'Expenditure Purpose%');

-- FEN-2068
-- Remove Redesignation from contribution/Expenditures to regular filers
DELETE FROM transaction_categories WHERE tran_type_identifier = 'CONT_REDESIG';

-- Rename - Refund
UPDATE transaction_categories SET tran_type = 'Refund of Unregistered Contribution' WHERE tran_type_identifier = 'REF_CONT_NON_FED';
UPDATE transaction_categories SET tran_type = 'Refund of Unregistered Contribution - Void' WHERE tran_type_identifier = 'REF_CONT_NON_FED_VOID';

-- Removed from disbursement
DELETE FROM transaction_categories WHERE cmte_type_category = 'PAC' AND tran_type_identifier IN ('COEXP_PARTY', 'COEXP_CC_PAY', 'COEXP_STAF_REIM', 'COEXP_PMT_PROL', 'COEXP_PMT_PROL_VOID');

DELETE FROM transaction_categories WHERE cmte_type_category = 'PAC' AND tran_type_identifier IN ('ALLOC_EXP_DIR_CAN_SUP', 'ALLOC_EXP_DIR_CAN_SUP_CONT', 'ALLOC_EXP_DIR_CAN_IE', 'ALLOC_EXP_DIR_CAN_COORD');

DELETE FROM transaction_categories WHERE sub_category_type='Federal Election Activity Expenditures' AND cmte_type_category = 'PAC';
