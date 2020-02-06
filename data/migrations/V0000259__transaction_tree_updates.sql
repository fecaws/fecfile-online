UPDATE public.transaction_categories SET sub_category_type='"Contributions/Expenditures to Regular Filers"' 
  WHERE sub_category_type='Contributions/Expenditures to Reg. Filers';

UPDATE public.transaction_categories SET tran_type='Void of Contributions to Other Committee' 
  WHERE tran_type_identifier='CONT_VOID';

UPDATE public.transaction_categories SET tran_type_order='5' WHERE tran_type_identifier='OTH_DISB_VOID';

UPDATE public.transaction_categories SET tran_type_order='6' WHERE category_order='2' AND sub_category_order = '3'
 AND tran_type_order='5'; 

UPDATE public.transaction_categories SET tran_type='100% Federal Election Activity Payment' 
WHERE tran_type_identifier='FEA_100PCT_PAY';

UPDATE public.transaction_categories SET tran_type='Credit Card Payment for 100% Federal Election Activity' 
WHERE tran_type_identifier='FEA_CC_PAY';

UPDATE public.transaction_categories SET tran_type='Staff Reimbursement for 100% Federal Election Activity' 
WHERE tran_type_identifier='FEA_STAF_REIM';

UPDATE public.transaction_categories SET tran_type='Payment to Payroll for 100% Federal Election Activity' 
WHERE tran_type_identifier='FEA_PAY_TO_PROL';

UPDATE public.transaction_categories SET tran_type='Void of 100% Federal Election Activity' 
WHERE tran_type_identifier='FEA_VOID';

UPDATE public.transaction_categories SET sched_type=null, tran_type=null WHERE 
tran_type_identifier in ('ALLOC_EXP', 'ALLOC_EXP_CC_PAY', 'ALLOC_EXP_STAF_REIM', 'ALLOC_EXP_PMT_TO_PROL',
'ALLOC_EXP_DEBT', 'ALLOC_FEA_DISB', 'ALLOC_FEA_CC_PAY', 'ALLOC_FEA_STAF_REIM', 'FEA_100PCT_DEBT_PAY');

UPDATE public.transaction_categories SET sub_category_type='Federal Election Activity Expenditures' 
WHERE sub_category_type='Allocated or FEA Expenditures';