update transaction_categories
SET sub_category_type_info='Schedule C Entry (C1 Entry Screens Including Bank Loans)', tran_type_identifier='LOAN_FROM_IND_BANK', 
    tran_type='Schedule C Entry (C1 Entry Screens Including Bank Loans)', sched_type='sched_c'
where category_type ='Loans and Debts' 
and sub_category_type='Loans Owed by the Committee'
AND tran_type_identifier='LOAN_FROM_IND';


update transaction_categories
SET sub_category_type_info='Schedule C Summary (List of Loans-Including C1 and Endorsers)', tran_type_identifier='LOAN_SUMMARY', 
     tran_type='Schedule C Summary (List of Loans-Including C1 and Endorsers)', sched_type='sched_c'
where category_type ='Loans and Debts' 
and sub_category_type='Loans Owed by the Committee'
AND tran_type_identifier='LOAN_FROM_BANK';
