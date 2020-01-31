UPDATE public.transaction_categories SET tran_type='Credit Card Payment for Other Disbursements' 
WHERE tran_type_identifier='OTH_DISB_CC_PAY';
UPDATE public.transaction_categories SET tran_type='Staff Reimbursements for Other Disbursements' 
WHERE tran_type_identifier='OTH_DISB_STAF_REIM';
UPDATE public.transaction_categories SET tran_type='Payment to Payroll for Other Disbursements' 
WHERE tran_type_identifier='OTH_DISB_PMT_TO_PROL';
UPDATE public.transaction_categories SET tran_type='Void of Other Disbursements' 
WHERE tran_type_identifier='OTH_DISB_VOID';