
update transaction_categories 
set sub_category_type= 'Loans Owed to Committee'
where sub_category_type= 'Loans Owed by the Committee' and ( tran_type_identifier not in ('LOAN_FROM_IND', 'LOAN_FROM_BANK') or tran_type_identifier is null);

update  dynamic_form_fields
set toggle = true
where transaction_type in (  'FEA_100PCT_DEBT_PAY' )
and  field_db_name in ( 'entity_name', 'first_name', 'last_name', 'middle_name', 'prefix', 'suffix');


