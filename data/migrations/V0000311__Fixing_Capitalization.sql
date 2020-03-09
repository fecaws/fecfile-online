-- FNE-1662
-- Add Committee FEC ID to Refunds of Contributions to the Unregistered Committees. 
INSERT INTO dynamic_form_fields ( form_type, transaction_type, field_label, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_order, field_section, field_section_order, create_date, last_update_date, field_db_name, class_name, height, width, scroll, seperator, transaction_type_desc, field_input_group, child_form, toggle, entity_id_mapping )
    SELECT form_type, 'REF_TO_OTH_CMTE', field_label, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_order, field_section, field_section_order, create_date, last_update_date, field_db_name, class_name, height, width, scroll, seperator, transaction_type_desc, field_input_group, child_form, toggle, entity_id_mapping
      FROM dynamic_form_fields 
      WHERE transaction_type = 'REF_TO_FED_CAN' AND field_label = 'Committee FEC ID';

-- FNE-2154
-- Fix ind abbreviation 
UPDATE transaction_categories SET tran_type = 'Refund of Individual Contribution - Void' WHERE tran_type_identifier = 'REF_CONT_IND_VOID';
UPDATE transaction_categories SET tran_type = 'Refund of Individual Contribution' WHERE tran_type_identifier = 'REF_CONT_IND';

UPDATE transaction_categories SET tran_type = 'Party National Party Recount Account' WHERE tran_type_identifier = 'PARTY_NP_RECNT_ACC';
UPDATE transaction_categories SET tran_type = 'PAC National Party Recount Account' WHERE tran_type_identifier = 'PAC_NP_RECNT_ACC';

UPDATE transaction_categories SET tran_type = 'Party National Party Headquarters Buildings Account' WHERE tran_type_identifier = 'PARTY_NP_HQ_ACC';
UPDATE transaction_categories SET tran_type = 'PAC National Party Headquarters Buildings Account' WHERE tran_type_identifier = 'PAC_NP_HQ_ACC';


UPDATE transaction_categories SET tran_type = 'Individual National Party Convention Account' WHERE tran_type_identifier = 'IND_NP_CONVEN_ACC';

UPDATE transaction_categories SET tran_type = 'Party National Party Convention Account' WHERE tran_type_identifier = 'PARTY_NP_CONVEN_ACC';
UPDATE transaction_categories SET tran_type = 'PAC National Party Convention Account' WHERE tran_type_identifier = 'PAC_NP_CONVEN_ACC';

UPDATE transaction_categories SET tran_type = 'Earmark Receipt for Recount Account (Contribution)' WHERE tran_type_identifier = 'EAR_REC_RECNT_ACC';
UPDATE transaction_categories SET tran_type = 'Earmark Receipt for Convention Account (Contribution)' WHERE tran_type_identifier = 'EAR_REC_CONVEN_ACC';

UPDATE transaction_categories SET tran_type = 'Earmark Receipt for Headquarters Account (Contribution)' WHERE tran_type_identifier = 'EAR_REC_HQ_ACC';





