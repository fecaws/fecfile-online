create table form_wizard_steps (form_type character varying(9),sequence_desc character varying(30),sequence_order character varying(10));

CREATE TABLE transaction_categories
(
   form_type character varying (10),   
   category_type character varying (300),
   category_type_info   character varying (3000),
   category_type_info_icon character varying(5) default 'true', 
   category_order  integer,
   sub_category_type character varying (300),
   sub_category_type_info   character varying (3000),
   sub_category_type_info_icon character varying(5) default 'true',
   sub_category_order  integer,
   tran_type character varying (300),
   tran_type_line_num   character varying (10),
   tran_type_order  integer,
   tran_type_info   character varying (3000),
   tran_type_info_icon character varying(5) default 'true',
   sub_tran_type character varying (300),
   sub_tran_type_line_num   character varying (10),
   sub_tran_type_order  integer,
   sub_tran_type_info   character varying (3000),
   sub_tran_type_info_icon character varying(5) default 'true'
);

insert into form_wizard_steps(form_type,sequence_desc,sequence_order ) values('F3X','Type','step_1');
insert into form_wizard_steps(form_type,sequence_desc,sequence_order ) values('F3X','Form','step_2');
insert into form_wizard_steps(form_type,sequence_desc,sequence_order ) values('F3X','Preview','step_3');
insert into form_wizard_steps(form_type,sequence_desc,sequence_order ) values('F3X','Sign','step_4');
insert into form_wizard_steps(form_type,sequence_desc,sequence_order ) values('F3X','Submit','step_5');

delete from transaction_categories;
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'PAC National Party Recount  account', '17', 8, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Ind National party headquarters buildings account', '17', 9, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Party National party headquarters buildings account', '17', 10, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'PAC National party headquarters buildings account', '17', 11, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Ind National party Convention account', '17', 12, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Party National Party Convention account', '17', 13, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'PAC National Party Convention  account', '17', 14, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Earmark Receipt for Recount Account (contribution)', '17', 15, 
    'true', 'Earmark Memo', '11C', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Earmark Receipt for Convention Account (contribution)', '17', 16, 
    'true', 'Earmark Memo', '11C', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Earmark Receipt for Headquarters Account (contribution)', '17', 17, 
    'true', 'Earmark Memo', '11C', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Ind. Receipt - Non-Contribution Account', '17', 18, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Other Committee Receipt - Non-Contribution Account', '17', 19, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Business/Labor Org. Receipt - Non-Contribution Account', '17', 20, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Credit Card Payment for Allocated Expenditure', '21a', 2, 
    'true', 'Credit Card Corresponding Memo', '21A', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Offsets to Operating Expenditures', '15', 1, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Refunds', 
    'true', 4, 'Refunds of Contributions to Candidate', '16', 1, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Refunds', 
    'true', 4, 'Refunds of Contributions to Other Committees', '16', 2, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Loans and Debts', 'false', 3, 'Loans Owed to Committee', 
    'true', 1, 'Loans Received
', '13', 1, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_info_icon)
 Values
   ('F3X', 'Loans and Debts', 'false', 3, 'Loans Owed to Committee', 
    'true', 1, 'Loan Repayments Received', '14', 2, 
    'true', 'Schedule C, C1, C2', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Allocated Federal/Non-Federal Expenditure', '21a', 1, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Staff Reimbursement for Allocated Expenditure', '21a', 3, 
    'true', 'Reimbursement Corresponding Memo', '21A', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Payment to Payroll', '21a', 4, 
    'true', 'Payroll Memo', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Direct Candidate Support', '21a', 5, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Direct Candidate Support Contribution', '21A', 6, 
    'true', 'DCS - Contribution Memo', '23', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Direct Candidate Support - IE', '21A', 7, 
    'true', 'DCS - IE Memo', '24', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Direct Candidate Support - Coordinated', '21A', 8, 
    'true', 'DCS - Coordinated Memo', '25', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Allocated Federal/Non-Federal Expenditure', '21a', 9, 
    'true', 'Debt to Vendor', '10', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Void - Allocated Federal/Non-Federal Expenditure', '21a', 10, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Operating Expenditures', 
    'true', 1, 'Operating Expenditure', '21b', 1, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Operating Expenditures', 
    'true', 1, 'Operating Expenditure', '21b', 2, 
    'true', 'Debt to Vendor', '10', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Operating Expenditures', 
    'true', 1, 'Credit Card Payment', '21b', 3, 
    'true', 'CC Corresponding Memo', '21B', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Operating Expenditures', 
    'true', 1, 'Staff Reimbursement', '21b', 4, 
    'true', 'Reimbursement Corresponding Memo', '21B', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Operating Expenditures', 
    'true', 1, 'Payment to Payroll', '21b', 5, 
    'true', 'Payroll Memo', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Operating Expenditures', 
    'true', 1, 'Void - Payment to Payroll', '21b', 6, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Operating Expenditures', 
    'true', 1, 'Headquarters Account Operating Expense for National Party Expenses', '21b', 7, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Operating Expenditures', 
    'true', 1, 'Convention Account Operating Expense for National Party Expense', '21b', 8, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Transfers to Affiliates/Other Committees', '22', 1, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Contribution to Candidate', '23', 2, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Redesignation', '23', 3, 
    'true', 'Redesignation Memo', '23', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Contribution to Other Committee', '23', 4, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Void - Contribution to Other Committee', '23', 5, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Independent Expenditure', '24', 6, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'IE Before Dissemination - Memo', '24', 7, 
    'true', 'Debt to Vendor', '10', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Credit Card Payment', '24', 8, 
    'true', 'CC Corresponding Memo', '24', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Staff Reimbursement', '24', 9, 
    'true', 'Reimbursement Corresponding Memo', '24', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Payment to Payroll', '24', 10, 
    'true', 'Payroll Memo', '24', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'VOID -Payment to Payroll', '24', 11, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Coordinated Party Expenditure', '25', 12, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Credit Card Payment', '25', 13, 
    'true', 'Credit Card Corresponding Memo', '25', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Staff Reimbursement', '25', 14, 
    'true', 'Reimbursement Corresponding Memo', '25', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'Payment to Payroll', '25', 15, 
    'true', 'Payroll Memo', '25', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'VOID -Payment to Payroll', '25', 16, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Refund', 
    'true', 4, 'Refund of Ind. Contribution', '28a', 1, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Refund', 
    'true', 4, 'VOID - Refund of Ind. Contribution', '28a', 2, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Refund', 
    'true', 4, 'Refund of Party Contribution', '28b', 3, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Refund', 
    'true', 4, 'VOID - Refund of Party Contribution', '28b', 4, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Refund', 
    'true', 4, 'Refund of PAC Contribution', '28c', 5, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Refund', 
    'true', 4, 'VOID - Refund of PAC Contribution', '28c', 6, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Refund', 
    'true', 4, 'Non-Federal Committee Refund', '20c', 7, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Refund', 
    'true', 4, 'Non-Federal Committee Refund Void', '20c', 8, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Other Expenditures', 
    'true', 3, 'Other Disbursements', '29', 1, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Other Expenditures', 
    'true', 3, 'Credit Card Payment', '29', 2, 
    'true', 'Credit Card Corresponding Memo', '29', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Other Expenditures', 
    'true', 3, 'Staff Reimbursement', '29', 3, 
    'true', 'Reimbursement Corresponding Memo', '29', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Other Expenditures', 
    'true', 3, 'Payment to Payroll', '29', 4, 
    'true', 'Payroll Memo', '29', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Other Expenditures', 
    'true', 3, 'Recount Disbursements', '29', 5, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Other Expenditures', 
    'true', 3, 'National Party Recount Account Disbursements', '29', 6, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Other Expenditures', 
    'true', 3, 'Non-Contribution Account Disbursements', '29', 7, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Other Expenditures', 
    'true', 3, 'Non-Contribution Account Credit Card Payment', '29', 8, 
    'true', 'Credit Card Corresponding Memo', '29', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Other Expenditures', 
    'true', 3, 'Non-Contribution Account Staff Reimbursement', '29', 9, 
    'true', 'Reimb. Corresponding Memo', '29', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Other Expenditures', 
    'true', 3, 'Non-Contribution Account Payment to Payroll', '29', 10, 
    'true', 'Payroll Memo', '29', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Other Expenditures', 
    'true', 3, 'VOID -Non-Contribution Account Payment to Payroll', '29', 11, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Allocated FEA Disbursement', '30a', 11, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Allocated FEA Credit Card Payment', '30a', 12, 
    'true', 'CC Corresponding Memo', '30A', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Staff Reimbursement for Allocated FEA Payment', '30a', 13, 
    'true', 'Reimbursement Corresponding Memo', '30A', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'VOID -Staff Reimbursement for Allocated FEA Payment', '30a', 14, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, '100% FEA Payment', '30b', 15, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, '100% FEA Payment-Debt Payment', '30b', 16, 
    'true', 'Debt to Vendor', '10', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'FEA Credit Card Payment', '30b', 17, 
    'true', 'CC Corresponding Memo', '30B', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'FEA Staff Reimbursement', '30b', 18, 
    'true', 'Reimb. Corresponding Memo', '30B', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'Payment to Payroll', '30b', 19, 
    'true', 'Payroll Memo', '30B', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'VOID - Payment to Payroll', '30b', 20, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Operating Expenditures', 
    'true', 1, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Contributions/Expenditures to Reg. Filers', 
    'true', 2, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Other Expenditures', 
    'true', 3, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Refund', 
    'true', 4, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Disbursements', 'false', 2, 'Allocated or FEA Expenditures', 
    'true', 5, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_info_icon, 
    sub_tran_type_info_icon)
 Values
   ('F3X', 'Loans and Debts', 'false', 3, 'Loans Owed to Committee', 
    'true', 1, 'Loan Repayments Made
', '26', 'true', 
    'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_info_icon, 
    sub_tran_type, sub_tran_type_info_icon)
 Values
   ('F3X', 'Loans and Debts', 'false', 3, 'Loans Owed by Committee', 
    'true', 2, 'Loans Made
', '27', 'true', 
    'Schedule C', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Loans and Debts', 'false', 3, 'Debts Owed to Committee', 
    'true', 3, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Loans and Debts', 'false', 3, 'Debts owed by Committee', 
    'true', 4, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Other', 'false', 4, 'H1 - Allocation Ratios', 
    'true', 1, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Other', 'false', 4, 'H2 - Fundraising Ratios', 
    'true', 2, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Other', 'false', 4, 'Schedule L', 
    'true', 3, 'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'Individual Receipt', '11A', 1, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_order, sub_tran_type_info, 
    sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'Partnership Receipt', '11A', 2, 
    'true', 'Partnership Memo', '11A', 1, 'Partnership Memo
Partnership Memo
Partnership Memo', 
    'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'Tribal Receipt', '11A', 3, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'In-Kind Receipt', '11A', 4, 
    'true', 'In-Kind Out', '21B', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'Ind. In-Kind Bitcoin Receipt', '11A', 5, 
    'true', 'In-Kind Bitcoin Out', '21B', '# Bitcoin Not Liquidated', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'Reattribution', '11A', 6, 
    'true', 'Reattribution Memo
', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'Returned/Bounced Receipt', '11A', 7, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'Earmark Receipt', '11A', 8, 
    'true', 'Earmark Out', '23', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'Earmark Receipt (In)', '11A', 9, 
    'true', 'Earmark Memo', '23', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'Bitcoin Sold to Ind', '11A', 10, 
    'true', 'Bitcoin Memo', '11A', '# Bitcoins, contribution previously disclosed', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info, tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info, 
    sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'Bitcoin Sold to Unknown', '11A', 11, 
    '# Bitcoins sold via # - purchaser unknown
# Bitcoins sold via # - purchaser unknown
# Bitcoins sold via # - purchaser unknown', 'true', 'Bitcoin Memo', '11A', '# Bitcoins, Previously Disclosed', 
    'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Individuals', 
    'true', 1, 'Earmark contribution', '11A', 12, 
    'true', 'Earmark Memo', '11C', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Party Receipt', '11B', 1, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Party In-Kind', '11B', 2, 
    'true', 'In-Kind Out', '21B', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Party In-Kind Bitcoin Receipt', '11B', 3, 
    'true', 'In-Kind Bitcoin Out', '21B', '# Bitcoin Not Liquidated', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Bitcoin Sold to Party', '11B', 4, 
    'true', 'Bitcoin Memo', '11B', '# Bitcoins, Previously Disclosed', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Returned/Bounced Receipt', '11B', 5, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Earmark contribution', '11B', 6, 
    'true', 'Earmark Memo
Earmark Memo
', '11C', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'PAC Receipt', '11C', 7, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'PAC In-Kind', '11C', 8, 
    'true', 'In-Kind Out', '21B', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'PAC In-Kind Bitcoin Receipt', '11B', 9, 
    'true', 'In-Kind Bitcoin Out', '21B', '# Bitcoin Not Liquidated', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Earmark Receipt', '11C', 10, 
    'true', 'Earmark Out', '23', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Bitcoin Sold to PAC', '11C', 11, 
    'true', 'Bitcoin Memo', '11C', '# Bitcoins, Previously Disclosed', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Earmark Receipt (In)', '11C', 12, 
    'true', 'Earmark Memo', '11C', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Earmark contribution', '11C', 13, 
    'true', 'Earmark Memo', '11C', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Returned/Bounced Receipt', '11C', 14, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Non-Federal Committee Receipt', '11C', 15, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Contributions from Registered Filers', 
    'true', 2, 'Non-Federal Committee Receipt Returned/Bounced Receipt', '11C', 16, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'Transfers', '12', 1, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'JF Transfers', '12', 2, 
    'true', 'Ind. JF Memo
', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'In-Kind Transfer', '12', 9, 
    'true', 'In-Kind Out', '21B', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'In-Kind Transfer-FEA', '12', 10, 
    'true', 'In-Kind Out', '30B', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'Transfer from Non-Federal Account', '18A', 11, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'Transfer from Levin Account', '18B', 12, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'JF Transfers Individual', '12', 3, 
    'true', 'Ind. JF Memo
', '11A', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'JF Transfers Party', '12', 4, 
    'true', 'Party JF Memo
', '11B', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'JF Transfers PAC', '12', 5, 
    'true', 'PAC JF Memo
', '11C', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'JF Transfers Party HQ', '12', 6, 
    'true', 'Party HQ Account JF Memo
', '17', 'Headquarters Account
', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'JF Transfers Party Concention Account', '12', 7, 
    'true', 'Party Conv Account JF Memo
', '17', 'Convention Account
', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, sub_tran_type_info, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Transfers', 
    'true', 3, 'JF Transfers Party Recount Account', '12', 8, 
    'true', 'Party Recount Account JF Memo
', '17', 'Convention Account
', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Tribal Receipt', '11A', 21, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Other Receipts', '17', 2, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Ind. Recount Receipt', '17', 3, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Party Recount Receipt', '17', 4, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'PAC Recount Receipt', '17', 5, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Transfer National Party Recount account', '17', 6, 
    'true', 'true');
Insert into transaction_categories
   (form_type, category_type, category_type_info_icon, category_order, sub_category_type, 
    sub_category_type_info_icon, sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
    tran_type_info_icon, sub_tran_type_info_icon)
 Values
   ('F3X', 'Receipts', 'false', 1, 'Other', 
    'true', 5, 'Party National Party Recount account', '17', 7, 
    'true', 'true');
