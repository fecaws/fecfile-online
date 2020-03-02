update public.ref_transaction_types set tran_desc = 'Coordinated EXP Payment to Payroll' where tran_identifier = 'COEXP_PMT_PROL';
update public.ref_transaction_types set tran_desc = 'Coordinated EXP Payment to Payroll Memo' where tran_identifier = 'COEXP_PMT_PROL_MEMO';
		
update public.ref_transaction_types set tran_desc = 'Coordinated EXP Credit Card Payment' where tran_identifier = 'COEXP_CC_PAY';
update public.ref_transaction_types set tran_desc = 'Coordinated EXP Credit Card Payment Memo' where tran_identifier = 'COEXP_CC_PAY_MEMO';
		
update public.ref_transaction_types set tran_desc = 'Coordinated EXP Staff Reimbursement' where tran_identifier = 'COEXP_STAF_REIM';
update public.ref_transaction_types set tran_desc = 'Coordinated EXP Staff Reimbursement Memo' where tran_identifier = 'COEXP_STAF_REIM_MEMO';
