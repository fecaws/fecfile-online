-- Fix Purpose of Disbursement for Recount Disbursement


UPDATE public.transaction_categories SET tran_type_order='9'  WHERE tran_type_identifier = 'PARTY_NP_RECNT_ACC';
UPDATE public.transaction_categories SET tran_type_order='10' WHERE tran_type_identifier = 'PAC_NP_RECNT_ACC';
UPDATE public.transaction_categories SET tran_type_order='11' WHERE tran_type_identifier = 'TRIB_NP_RECNT_ACC';
