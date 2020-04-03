-- FNE-2206
-- update CONT_TO_CAN Void desc

update ref_transaction_types set tran_desc = 'Contrtibution to Candidate - Void' where tran_identifier = 'CONT_VOID';