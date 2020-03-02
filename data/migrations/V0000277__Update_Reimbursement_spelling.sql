UPDATE dynamic_form_fields set field_value = 'Reimbursement: See Below' WHERE df_id in (2317, 5514);
UPDATE transaction_categories SET sub_category_type = 'Contributions from Individuals/Persons' WHERE tran_category_id in (SELECT tran_category_id FROM transaction_categories WHERE sub_category_type = 'Contributions from Individuals');
