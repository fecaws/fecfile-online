update public.ref_transaction_types set tran_desc = 'Coordinated Exp Payment to Payroll' where tran_identifier = 'COEXP_PMT_PROL';
update public.ref_transaction_types set tran_desc = 'Coordinated Exp Payment to Payroll Memo' where tran_identifier = 'COEXP_PMT_PROL_MEMO';
		
update public.ref_transaction_types set tran_desc = 'Coordinated Exp Credit Card Payment' where tran_identifier = 'COEXP_CC_PAY';
update public.ref_transaction_types set tran_desc = 'Coordinated Exp Credit Card Payment Memo' where tran_identifier = 'COEXP_CC_PAY_MEMO';
		
update public.ref_transaction_types set tran_desc = 'Coordinated Exp Staff Reimbursement' where tran_identifier = 'COEXP_STAF_REIM';
update public.ref_transaction_types set tran_desc = 'Coordinated Exp Staff Reimbursement Memo' where tran_identifier = 'COEXP_STAF_REIM_MEMO';
