-- FNE-2148 Updating text fields. 
-- 1. 2nd field for Receipt Description must not be disabled. 
UPDATE dynamic_form_fields SET field_is_readonly = 'false' WHERE transaction_type = 'JF_TRAN_NP_HQ_ACC' AND field_label = 'Receipt Description';


-- FNE-1928
-- Org. needs to be spelled out.
UPDATE df_tran_type_identifier SET tran_type_desc = 'Business/Labor Organization Receipt - Non-Contribution Account'  where tran_type_identifier = 'BUS_LAB_NON_CONT_ACC';


-- FNE-1929
-- Ensure all fields for Contribution purpose description are all capitalized. 
UPDATE dynamic_form_fields SET field_value = 'Non-Contribution Account Receipt' WHERE transaction_type in ('BUS_LAB_NON_CONT_ACC','IND_REC_NON_CONT_ACC','OTH_CMTE_NON_CONT_ACC') AND field_value like 'Non-contribution%';
