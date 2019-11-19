update transaction_categories set sub_category_type= 'Loans Owed by the Committee' where category_type='Loans and Debts' and sub_category_type='Loans Owed to Committee' and sched_type is not null;

