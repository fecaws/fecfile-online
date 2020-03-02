-- FNE-2067
-- Move PAC_NON_FED_REC and PAC_NON_FED_RET to Contribution from individuals and rename
UPDATE public.transaction_categories
  SET sub_category_type = 'Contributions from Individuals/Persons', sub_category_order = 1, tran_type = 'Unregistered Receipt from Person'
  WHERE tran_type_identifier = 'PAC_NON_FED_REC';

UPDATE public.transaction_categories
  SET sub_category_type = 'Contributions from Individuals/Persons', sub_category_order = 1, tran_type = 'Unregistered Receipt from Person - Returned/Bounced Receipt'
  WHERE tran_type_identifier = 'PAC_NON_FED_RET';

-- Renaming REF_TO_FED_CAN and REF_TO_OTH_CMTE
UPDATE public.transaction_categories
  SET tran_type = 'Refunds of Contributions to Registered Committees'
  WHERE tran_type_identifier = 'REF_TO_FED_CAN';

UPDATE public.transaction_categories
  SET tran_type = 'Refunds of Contributions to Unregistered Committees'
  WHERE tran_type_identifier = 'REF_TO_OTH_CMTE';

-- Remove TRAN_NON_ED_ACC and TRAN_FROM_LEFIN_ACC
UPDATE public.transaction_categories SET is_functional = 'false' WHERE tran_type_identifier = 'TRAN_FROM_NON_FED_ACC';
UPDATE public.transaction_categories SET is_functional = 'false' WHERE tran_type_identifier = 'TRAN_FROM_LEVIN_ACC';
