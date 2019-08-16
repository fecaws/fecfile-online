create table ref_transaction_types_0816 as 
select * from ref_transaction_types;


delete from ref_transaction_types;



Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (1, 'F3X', 'sched_a', '11A', '15', 
    'INDV_REC', 'Individual Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (2, 'F3X', 'sched_a', '11A', '15P', 
    'PARTN_REC', 'Partnership Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (3, 'F3X', 'sched_a', '11A', '15K', 
    'IK_REC', 'In-Kind Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (4, 'F3X', 'sched_a', '11A', '15B', 
    'IK_BC_REC', 'Ind. In-Kind Bitcoin Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_identifier, 
    tran_desc)
 Values
   (5, 'F3X', 'sched_a', '11A', 'REATT_FROM', 
    'Reattribution');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (6, 'F3X', 'sched_a', '11A', '15', 
    'RET_REC', 'Returned/Bounced Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (7, 'F3X', 'sched_a', '11A', '15E', 
    'EAR_REC', 'Earmark Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (8, 'F3X', 'sched_a', '11A', '15I', 
    'CON_EAR_DEP', 'Conduit Earmark (Deposited)');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (9, 'F3X', 'sched_a', '11A', '15IM', 
    'CON_EAR_UNDEP', 'Conduit Earmark (Undeposited)');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (10, 'F3X', 'sched_a', '11A', '15B', 
    'BC_TO_IND', 'Bitcoin Sold to Ind');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (11, 'F3X', 'sched_a', '11A', '15B', 
    'BC_TO_UNKN', 'Bitcoin Sold to Unknown');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (12, 'F3X', 'sched_a', '11B', '18K', 
    'PARTY_REC', 'Party Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (13, 'F3X', 'sched_a', '11B', '15Z', 
    'PARTY_IK_REC', 'Party In-Kind');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (14, 'F3X', 'sched_a', '11B', '18B', 
    'PARTY_IK_BC_REC', 'Party In-Kind Bitcoin Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (15, 'F3X', 'sched_a', '11B', '18B', 
    'PARTY_PUR_BC', 'Bitcoin Sold to Party');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (16, 'F3X', 'sched_a', '11B', '18K', 
    'PARTY_RET', 'Returned/Bounced Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (17, 'F3X', 'sched_a', '11C', '18K', 
    'PAC_REC', 'PAC Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (18, 'F3X', 'sched_a', '11C', '15Z', 
    'PAC_IK_REC', 'PAC In-Kind');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (19, 'F3X', 'sched_a', '11C', '18B', 
    'PAC_IK_BC_REC', 'PAC In-Kind Bitcoin Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (20, 'F3X', 'sched_a', '11C', '18I', 
    'PAC_CON_EAR_DEP', 'Conduit Earmark (Deposited)');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (21, 'F3X', 'sched_a', '11C', '18IM', 
    'PAC_CON_EAR_UNDEP', 'Conduit Earmark (Undeposited)');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (22, 'F3X', 'sched_a', '11C', '18B', 
    'PAC_PUR_BC', 'Bitcoin Sold to PAC');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (23, 'F3X', 'sched_a', '11C', '18E', 
    'PAC_EAR_REC', 'Earmark Receipt (In)');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (24, 'F3X', 'sched_a', '11C', '18K', 
    'PAC_RET', 'Returned/Bounced Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (25, 'F3X', 'sched_a', '11C', '18U', 
    'PAC_NON_FED_REC', 'Non-Federal Committee Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (26, 'F3X', 'sched_a', '11C', '18U', 
    'PAC_NON_FED_RET', 'Non-Federal Committee Receipt Returned/Bounced Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (27, 'F3X', 'sched_a', '12', '18G', 
    'TRAN', 'Transfers');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (28, 'F3X', 'sched_a', '12', '14G', 
    'JF_TRAN', 'JF Transfers');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (29, 'F3X', 'sched_a', '12', '18Z', 
    'IK_TRAN', 'In-Kind Transfer');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (30, 'F3X', 'sched_a', '12', '18F', 
    'IK_TRAN_FEA', 'In-Kind Transfer-FEA');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (31, 'F3X', 'sched_a', '17', '32G', 
    'JF_TRAN_NP_RECNT_ACC', 'JF Transfer - National Party Recount Account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (32, 'F3X', 'sched_a', '17', '30T', 
    'JF_TRAN_NP_CONVEN_ACC', 'JF Transfer - Nataional Party Convention Account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (33, 'F3X', 'sched_a', '17', '31T', 
    'JF_TRAN_NP_HQ_ACC', 'JF Transfer - National Party Headquarters Account ');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (34, 'F3X', 'sched_h3', '18A', '10G', 
    'TRAN_FROM_NON_FED_ACC', 'Transfer from Non-Federal Account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (35, 'F3X', 'sched_h5', '18B', '12G', 
    'TRAN_FROM_LEVIN_ACC', 'Transfer from Levin Account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (36, 'F3X', 'sched_a', '16', '17Z', 
    'REF_TO_FED_CAN', 'Refunds of Contributions to Candidate');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (37, 'F3X', 'sched_a', '16', '17Z', 
    'REF_TO_OTH_CMTE', 'Refunds of Contributions to Other Committees');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (38, 'F3X', 'sched_a', '11A', '11', 
    'TRIB_REC', 'Tribal Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (39, 'F3X', 'sched_a', '15', '15O', 
    'OFFSET_TO_OPEX', 'Offsets to Operating Expenditures');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (40, 'F3X', 'sched_a', '17', '15O', 
    'OTH_REC', 'Other Receipts');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (41, 'F3X', 'sched_a', '17', '15R', 
    'IND_RECNT_REC', 'Ind. Recount Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (42, 'F3X', 'sched_a', '17', '18R', 
    'PARTY_RECNT_REC', 'Party Recount Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (43, 'F3X', 'sched_a', '17', '18R', 
    'PAC_RECNT_REC', 'PAC Recount Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (44, 'F3X', 'sched_a', '17', '11R', 
    'TRIB_RECNT_REC', 'Tribal Recount Receipt');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (45, 'F3X', 'sched_a', '17', '32', 
    'IND_NP_RECNT_ACC', 'Ind National Party Recount account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (46, 'F3X', 'sched_a', '17', '32T', 
    'TRIB_NP_RECNT_ACC', 'Tribal National Party Recount Account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (47, 'F3X', 'sched_a', '17', '32K', 
    'PARTY_NP_RECNT_ACC', 'Party National Party Recount account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (48, 'F3X', 'sched_a', '17', '32K', 
    'PAC_NP_RECNT_ACC', 'PAC National Party Recount  account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (49, 'F3X', 'sched_a', '17', '31', 
    'IND_NP_HQ_ACC', 'Ind National party headquarters buildings account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (50, 'F3X', 'sched_a', '17', '31K', 
    'PARTY_NP_HQ_ACC', 'Party National party headquarters buildings account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (51, 'F3X', 'sched_a', '17', '31K', 
    'PAC_NP_HQ_ACC', 'PAC National party headquarters buildings account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (52, 'F3X', 'sched_a', '17', '31T', 
    'TRIB_NP_HQ_ACC', 'Tribal National Party Headquarters Buildings Account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (53, 'F3X', 'sched_a', '17', '30', 
    'IND_NP_CONVEN_ACC', 'Ind National party Convention account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (54, 'F3X', 'sched_a', '17', '30K', 
    'PARTY_NP_CONVEN_ACC', 'Party National Party Convention account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (55, 'F3X', 'sched_a', '17', '30K', 
    'PAC_NP_CONVEN_ACC', 'PAC National Party Convention  account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (56, 'F3X', 'sched_a', '17', '30T', 
    'TRIB_NP_CONVEN_ACC', 'Tribal National Party Convention Account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (57, 'F3X', 'sched_a', '17', '32E', 
    'EAR_REC_RECNT_ACC', 'Earmark Receipt for Recount Account (contribution)');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (58, 'F3X', 'sched_a', '17', '30E', 
    'EAR_REC_CONVEN_ACC', 'Earmark Receipt for Convention Account (contribution)');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (59, 'F3X', 'sched_a', '17', '31E', 
    'EAR_REC_HQ_ACC', 'Earmark Receipt for Headquarters Account (contribution)');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (60, 'F3X', 'sched_a', '17', '10', 
    'IND_REC_NON_CONT_ACC', 'Ind. Receipt - Non-Contribution Account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (61, 'F3X', 'sched_a', '17', '10K', 
    'OTH_CMTE_NON_CONT_ACC', 'Other Committee Receipt - Non-Contribution Account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (62, 'F3X', 'sched_a', '17', '10B', 
    'BUS_LAB_NON_CONT_ACC', 'Business/Labor Org. Receipt - Non-Contribution Account');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (63, 'F3X', 'sched_b', '21B', '20', 
    'OPEXP', 'Operating Expenditure');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (64, 'F3X', 'sched_b', '21B', '20', 
    'OPEXP_DEBT', 'Operating Expenditure Debt to Vendor');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (65, 'F3X', 'sched_b', '21B', '20', 
    'OPEXP_CC_PAY', 'Credit Card Payment');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (66, 'F3X', 'sched_b', '21B', '20', 
    'OPEXP_STAF_REIM', 'Staff Reimbursement');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (67, 'F3X', 'sched_b', '21B', '20', 
    'OPEXP_PMT_TO_PROL', 'Payment to Payroll');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (68, 'F3X', 'sched_b', '21B', '20', 
    'OPEXP_VOID', 'Operating Expenditure - Void');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (69, 'F3X', 'sched_b', '29', '41', 
    'OPEXP_HQ_ACC_OP_EXP_NP', 'Headquarters Account Operating Expense for National Party Expenses');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (70, 'F3X', 'sched_b', '29', '40', 
    'OPEXP_CONV_ACC_OP_EXP_NP', 'Convention Account Operating Expense for National Party Expense');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (71, 'F3X', 'sched_b', '22', '24G', 
    'TRAN_TO_AFFI', 'Transfers to Affiliates/Other Committees');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (72, 'F3X', 'sched_b', '23', '24K', 
    'CONT_TO_CAN', 'Contribution to Candidate');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (73, 'F3X', 'sched_b', '23', '24KM', 
    'CONT_REDESIG', 'Redesignation');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (74, 'F3X', 'sched_b', '23', '23', 
    'CONT_TO_OTH_CMTE', 'Contribution to Other Committee');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (75, 'F3X', 'sched_b', '23', '24K', 
    'CONT_VOID', 'Contributions - Void');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (76, 'F3X', 'sched_e', '24', '24_', 
    'IE', 'Independent Expenditure');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (77, 'F3X', 'sched_e', '24', '24_', 
    'IE_B4_DISSE', 'IE Before Dissemination - Memo');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (78, 'F3X', 'sched_e', '24', '24_', 
    'IE_CC_PAY', 'Credit Card Payment');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (79, 'F3X', 'sched_e', '24', '24_', 
    'IE_STAF_REIM', 'Staff Reimbursement');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (80, 'F3X', 'sched_e', '24', '24_', 
    'IE_PMT_TO_PROL', 'Payment to Payroll');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (81, 'F3X', 'sched_e', '24', '24', 
    'IE_VOID', 'Independent Expenditure - Void');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (82, 'F3X', 'sched_f', '25', '24C', 
    'COEXP_PARTY', 'Coordinated Party Expenditure');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (83, 'F3X', 'sched_f', '25', '24C', 
    'COEXP_CC_PAY', 'Credit Card Payment');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (84, 'F3X', 'sched_f', '25', '24C', 
    'COEXP_STAF_REIM', 'Staff Reimbursement');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (85, 'F3X', 'sched_f', '25', '24C', 
    'COEXP_PMT_PROL', 'Payment to Payroll');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (86, 'F3X', 'sched_f', '25', '24C', 
    'COEXP_PARTY_VOID', 'Coordinated Party Expenditure - Void');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (87, 'F3X', 'sched_b', '29', '20O', 
    'OTH_DISB', 'Other Disbursements');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (88, 'F3X', 'sched_b', '29', '29', 
    'OTH_DISB_CC_PAY', 'Credit Card Payment');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (89, 'F3X', 'sched_b', '29', '20O', 
    'OTH_DISB_STAF_REIM', 'Staff Reimbursement');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (90, 'F3X', 'sched_b', '29', '20O', 
    'OTH_DISB_PMT_TO_PROL', 'Payment to Payroll');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (91, 'F3X', 'sched_b', '29', '20', 
    'OTH_DISB_RECNT', 'Recount Disbursements');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (92, 'F3X', 'sched_b', '29', '29', 
    'OTH_DISB_NP_RECNT_ACC', 'National Party Recount Account Disbursements');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (93, 'F3X', 'sched_b', '29', '26', 
    'OTH_DISB_NC_ACC', 'Non-Contribution Account Disbursements');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (94, 'F3X', 'sched_b', '29', '26', 
    'OTH_DISB_NC_ACC_CC_PAY', 'Non-Contribution Account Credit Card Payment');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (95, 'F3X', 'sched_b', '29', '26', 
    'OTH_DISB_NC_ACC_STAF_REIM', 'Non-Contribution Account Staff Reimbursement');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (96, 'F3X', 'sched_b', '29', '26', 
    'OTH_DISB_NC_ACC_PMT_TO_PROL', 'Non-Contribution Account Payment to Payroll');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (97, 'F3X', 'sched_b', '29', '20O', 
    'OTH_DISB_VOID', 'Other Disbursement - Void');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (98, 'F3X', 'sched_b', '28A', '22Y', 
    'REF_CONT_IND', 'Refund of Ind. Contribution');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (99, 'F3X', 'sched_b', '28A', '22Y', 
    'REF_CONT_IND_VOID', 'VOID - Refund of Ind. Contribution');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (100, 'F3X', 'sched_b', '28B', '22Z', 
    'REF_CONT_PARTY', 'Refund of Party Contribution');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (101, 'F3X', 'sched_b', '28B', '22Z', 
    'REF_CONT_PARTY_VOID', 'VOID - Refund of Party Contribution');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (102, 'F3X', 'sched_b', '28C', '22Z', 
    'REF_CONT_PAC', 'Refund of PAC Contribution');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (103, 'F3X', 'sched_b', '28C', '22Z', 
    'REF_CONT_PAC_VOID', 'VOID - Refund of PAC Contribution');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (104, 'F3X', 'sched_b', '20C', '20Y', 
    'REF_CONT_NON_FED', 'Non-Federal Committee Refund');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (105, 'F3X', 'sched_b', '20C', '20Y', 
    'REF_CONT_NON_FED_VOID', 'Non-Federal Committee Refund Void');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (106, 'F3X', 'sched_h4', '21A', '20N', 
    'ALLOC_EXP', 'Allocated Federal/Non-Federal Expenditure');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (107, 'F3X', 'sched_h4', '21A', '20N', 
    'ALLOC_EXP_CC_PAY', 'Credit Card Payment for Allocated Expenditure');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (108, 'F3X', 'sched_h4', '21A', '20N', 
    'ALLOC_EXP_STAF_REIM', 'Staff Reimbursement for Allocated Expenditure');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (109, 'F3X', 'sched_h4', '21A', '20N', 
    'ALLOC_EXP_PMT_TO_PROL', 'Payment to Payroll');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (110, 'F3X', 'sched_h4', '21A', '20N', 
    'ALLOC_EXP_DIR_CAN_SUP', 'Direct Candidate Support');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (111, 'F3X', 'sched_h4', '23', '24KM', 
    'ALLOC_EXP_DIR_CAN_SUP_CONT', 'Direct Candidate Support Contribution');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (112, 'F3X', 'sched_h4', '24', 'TBD', 
    'ALLOC_EXP_DIR_CAN_IE', 'Direct Candidate Support - IE');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (113, 'F3X', 'sched_h4', '25', '24CM', 
    'ALLOC_EXP_DIR_CAN_COORD', 'Direct Candidate Support - Coordinated');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (114, 'F3X', 'sched_d', '21A', '20N', 
    'ALLOC_EXP_DEBT', 'Allocated Federal/Non-Federal Expenditure - Debt to Vendor');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (115, 'F3X', 'sched_h4', '21A', '20N', 
    'ALLOC_EXP_VOID', 'Void - Allocated Federal/Non-Federal Expenditure');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (116, 'F3X', 'sched_h6', '30A', '20E', 
    'ALLOC_FEA_DISB', 'Allocated FEA Disbursement');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (117, 'F3X', 'sched_h6', '30A', '20E', 
    'ALLOC_FEA_CC_PAY', 'Allocated FEA Credit Card Payment');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (118, 'F3X', 'sched_h6', '30A', '20E', 
    'ALLOC_FEA_STAF_REIM', 'Staff Reimbursement for Allocated FEA Payment');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (119, 'F3X', 'sched_h6', '30A', '20E', 
    'ALLOC_FEA_VOID', 'Allocated FEA - Void');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (120, 'F3X', 'sched_b', '30B', '20H', 
    'FEA_100PCT_PAY', '100% FEA Payment');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (121, 'F3X', 'sched_b', '30B', '20H', 
    'FEA_100PCT_DEBT_PAY', '100% FEA Payment-Debt Payment');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (122, 'F3X', 'sched_b', '30B', '20H', 
    'FEA_CC_PAY', 'FEA Credit Card Payment');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (123, 'F3X', 'sched_b', '30B', '20H', 
    'FEA_STAF_REIM', 'FEA Staff Reimbursement');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (124, 'F3X', 'sched_b', '30B', '20H', 
    'FEA_PAY_TO_PROL', 'Payment to Payroll');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (125, 'F3X', 'sched_b', '30B', '20H', 
    'FEA_PAY_VOID', 'FEA Payment - VOID');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (126, 'F3X', 'sched_c', '13', '16G', 
    'LOAN_FROM_IND', 'Loans Received from Ind');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (127, 'F3X', 'sched_c', '13', '16F', 
    'LOAN_FROM_BANK', 'Loans Received from Bank');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (128, 'F3X', 'sched_a', '14', '16L', 
    'LOAN_REPAY_RCVD', 'Loan Repayments Received');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (129, 'F3X', 'sched_b', '26', '22LJ', 
    'LOAN_REPAY_MADE', 'Loan Repayments Made');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, tran_identifier, tran_desc)
 Values
   (130, 'F3X', 'sched_c', 'SC', 'Schedule C');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, tran_identifier, tran_desc)
 Values
   (131, 'F3X', 'sched_c1', 'SC1', 'Schedule C-1');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, tran_code, tran_identifier, 
    tran_desc)
 Values
   (132, 'F3X', 'sched_c2', '15', 'SC2', 
    'Schedule C-2');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (133, 'F3X', 'sched_f', '25', '24C', 
    'COEXP_PARTY_DEBT', 'Coordinated Party Expenditure Debt to Vendor');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (134, 'F3X', 'sched_b', '29', '20O', 
    'OTH_DISB_DEBT', 'Other Disbursements Debt to Vendor');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (135, 'F3X', 'sched_b', '29', '41Y', 
    'OPEXP_HQ_ACC_IND_REF', 'HQ Account - Individual Refund
');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (136, 'F3X', 'sched_b', '29', '41T', 
    'OPEXP_HQ_ACC_TRIB_REF', 'HQ Account - Tribal Refund');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (137, 'F3X', 'sched_b', '29', '41T', 
    'OPEXP_HQ_ACC_REG_REF', 'HQ Account - Reg. Filer Refund');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (138, 'F3X', 'sched_b', '29', '40Z', 
    'OPEXP_CONV_ACC_REG_REF', 'Convention Account - Reg. Filer Refund');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (139, 'F3X', 'sched_b', '29', '40T', 
    'OPEXP_CONV_ACC_TRIB_REF', 'Convention Account - Tribal Refund');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (140, 'F3X', 'sched_b', '29', '40Y', 
    'OPEXP_CONV_ACC_IND_REF', 'Convention Account - Individual Refund');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (141, 'F3X', 'sched_b', '29', '42Z', 
    'OTH_DISB_NP_RECNT_REG_REF', 'National Party Recount Account - Reg. Filer Refund');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (142, 'F3X', 'sched_b', '29', '42T', 
    'OTH_DISB_NP_RECNT_TRIB_REF', 'National Party Recount Account - Tribal Refund');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (143, 'F3X', 'sched_b', '29', '42Y', 
    'OTH_DISB_NP_RECNT_IND_REF', 'National Party Recount Account - Individual Refund');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc)
 Values
   (144, 'F3X', 'sched_b', '27GH', 'TBD', 
    'LOANS_MADE', 'Loans Made');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier)
 Values
   (145, 'F3X', 'sched_h6', '30A', '20E', 
    'ALLOC_FEC_DISB_DEBT');
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10001, 'F3X', 'sched_a', '11A', '15PM', 
    'PARTN_MEMO', 'Partnership Memo', 2);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10002, 'F3X', 'sched_b', '21B', '20K', 
    'IK_OUT', 'In-Kind Out', 3);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10003, 'F3X', 'sched_b', '21B', '20B', 
    'IK_BC_OUT', 'In-Kind Bitcoin Out', 4);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10004, 'F3X', 'sched_b', '21B', '15M', 
    'REATT_MEMO', 'Reattribution Memo', 5);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10005, 'F3X', 'sched_a', '11A', '15EM', 
    'EAR_MEMO', 'Earmark Memo', 7);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10006, 'F3X', 'sched_b', '23', '24T', 
    'CON_EAR_OUT_DEP', 'Earmark Out', 8);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10007, 'F3X', 'sched_b', '23', '24IM', 
    'CON_EAR_UNDEP_MEMO', 'Earmark Out', 9);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10008, 'F3X', 'sched_a', '11A', '15BM', 
    'BC_TO_IND_MEMO', 'Bitcoin Memo', 10);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10009, 'F3X', 'sched_a', '11A', '15BM', 
    'BC_TO_UNKN_MEMO', 'Bitcoin Memo', 11);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10010, 'F3X', 'sched_b', '21B', '20K', 
    'PARTY_IK_OUT', 'In-Kind Out', 13);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10011, 'F3X', 'sched_b', '21B', '20B', 
    'PARTY_IK_BC_OUT', 'In-Kind Bitcoin Out', 14);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10012, 'F3X', 'sched_a', '11B', '18BM', 
    'PARTY_PUR_BC_MEMO', 'Bitcoin Memo', 15);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10013, 'F3X', 'sched_b', '21B', '20K', 
    'PAC_IK_OUT', 'In-Kind Out', 18);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10014, 'F3X', 'sched_b', '21B', '20B', 
    'PAC_IK_BC_OUT', 'In-Kind Bitcoin Out', 19);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10015, 'F3X', 'sched_b', '23', '24T', 
    'PAC_CON_EAR_DEP_OUT', 'Earmark Out', 20);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10016, 'F3X', 'sched_b', '23', '24IM', 
    'PAC_CON_EAR_UNDEP_MEMO', 'Earmark Out', 21);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10017, 'F3X', 'sched_a', '11C', '18BM', 
    'PAC_PUR_BC_MEMO', 'Bitcoin Memo', 22);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10018, 'F3X', 'sched_a', '11C', '18EM', 
    'PAC_EAR_MEMO', 'Earmark Memo', 23);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10019, 'F3X', 'sched_a', '12', '14JM', 
    'JF_TRAN_IND_MEMO', 'Ind JF Memo', 28);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10020, 'F3X', 'sched_a', '12', '14KM', 
    'JF_TRAN_PARTY_MEMO', 'Party JF Memo', 28);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10021, 'F3X', 'sched_a', '12', '14KM', 
    'JF_TRAN_PAC_MEMO', 'PAC JF Memp', 28);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10022, 'F3X', 'sched_a', '12', '14TM', 
    'JF_TRAN_TRIB_MEMO', 'Tribal JF Memo', 28);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10023, 'F3X', 'sched_b', '21B', '20K', 
    'IK_TRAN_OUT', 'In-Kind Out', 29);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10024, 'F3X', 'sched_b', '30B', '20K', 
    'IK_TRAN_FEA_OUT', 'In-Kind Out', 30);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10025, 'F3X', 'sched_a', '17', '32JM', 
    'JF_TRAN_NP_RECNT_IND_MEMO', 'Ind JF Transfer Memo', 31);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10026, 'F3X', 'sched_a', '17', '32KM', 
    'JF_TRAN_NP_RECNT_PAC_MEMO', 'PAC JF Transfer Memo', 31);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10027, 'F3X', 'sched_a', '17', '32TM', 
    'JF_TRAN_NP_RECNT_TRIB_MEMO', 'Tribal JF Transfer Memo', 31);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10028, 'F3X', 'sched_a', '17', '30JM', 
    'JF_TRAN_NP_CONVEN_IND_MEMO', 'Ind National Party Convention Account JF Transfer Memo', 32);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10029, 'F3X', 'sched_a', '17', '30KM', 
    'JF_TRAN_NP_CONVEN_PAC_MEMO', 'PAC National Party Convention Account JF Transfer Memo', 32);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10030, 'F3X', 'sched_a', '17', '30TM', 
    'JF_TRAN_NP_CONVEN_TRIB_MEMO', 'Tribal National Party Convention Account JF Transfer Memo', 32);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10031, 'F3X', 'sched_a', '17', '31JM', 
    'JF_TRAN_NP_HQ_IND_MEMO', 'Ind National Party HQ - JF Transfer Memo', 33);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10032, 'F3X', 'sched_a', '17', '31KM', 
    'JF_TRAN_NP_HQ_PAC_MEMO', 'PAC National Party HQ - JF Transfer Memo', 33);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10033, 'F3X', 'sched_a', '17', '31TM', 
    'JF_TRAN_NP_HQ_TRIB_MEMO', 'Tribal National Party HQ - JF Transfer Memo', 33);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10034, 'F3X', 'sched_a', '17', '32EM', 
    'EAR_REC_RECNT_ACC_MEMO', 'Earmark Memo', 57);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10035, 'F3X', 'sched_a', '17', '30EM', 
    'EAR_REC_CONVEN_ACC_MEMO', 'Earmark Memo', 58);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10036, 'F3X', 'sched_a', '17', '31EM', 
    'EAR_REC_HQ_ACC_MEMO', 'Earmark Memo', 59);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_identifier, 
    tran_desc, parent_tran_id)
 Values
   (10037, 'F3X', 'sched_d', '10', 'OPEXP_DEBT_TO_VEND', 
    'Debt to Vendor', 64);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10038, 'F3X', 'sched_b', '21B', '20M', 
    'OPEXP_CC_PAY_MEMO', 'CC Corresponding Memo', 65);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10039, 'F3X', 'sched_b', '21B', '20M', 
    'OPEXP_STAF_REIM_MEMO', 'Reimbursement Corresponding Memo', 66);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10040, 'F3X', 'sched_b', '21B', '20M', 
    'OPEXP_PMT_TO_PROL_MEMO', 'Payroll Memo', 67);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10041, 'F3X', 'sched_b', '23', '24KM', 
    'CONT_REDESIG_MEMO', 'Redesignation Memo', 73);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_identifier, 
    tran_desc, parent_tran_id)
 Values
   (10042, 'F3X', 'sched_d', '10', 'IE_B4_DISSE_TO_VEND', 
    'Debt to Vendor', 77);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10043, 'F3X', 'sched_e', '24', '24_M', 
    'IE_CC_PAY_MEMO', 'CC Corresponding Memo', 78);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10044, 'F3X', 'sched_e', '24', '24_M', 
    'IE_STAF_REIM_MEMO', 'Reimbursement Corresponding Memo', 79);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10045, 'F3X', 'sched_e', '24', '24_M', 
    'IE_PMT_TO_PROL_MEMO', 'Payroll Memo', 80);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10046, 'F3X', 'sched_f', '25', '24CM', 
    'COEXP_CC_PAY_MEMO', 'Credit Card Corresponding Memo', 83);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10047, 'F3X', 'sched_f', '25', '24CM', 
    'COEXP_STAF_REIM_MEMO', 'Reimbursement Corresponding Memo', 84);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10048, 'F3X', 'sched_f', '25', '24CM', 
    'COEXP_PMT_PROL_MEMO', 'Payroll Memo', 85);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10049, 'F3X', 'sched_b', '29', '20O', 
    'OTH_DISB_CC_PAY_MEMO', 'Credit Card Corresponding Memo', 88);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10050, 'F3X', 'sched_b', '29', '20OM', 
    'OTH_DISB_STAF_REIM_MEMO', 'Reimbursement Corresponding Memo', 89);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10051, 'F3X', 'sched_b', '29', '20OM', 
    'OTH_DISB_PMT_TO_PROL_MEMO', 'Payroll Memo', 90);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10052, 'F3X', 'sched_b', '29', '26M', 
    'OTH_DISB_NC_ACC_CC_PAY_MEMO', 'Credit Card Corresponding Memo', 94);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10053, 'F3X', 'sched_b', '29', '26M', 
    'OTH_DISB_NC_ACC_STAF_REIM_MEMO', 'Reimb. Corresponding Memo', 95);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10054, 'F3X', 'sched_b', '29', '26M', 
    'OTH_DISB_NC_ACC_PMT_TO_PROL_MEMO', 'Payroll Memo', 96);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10055, 'F3X', 'sched_h4', '21A', '20NM', 
    'ALLOC_EXP_CC_PAY_MEMO', 'Credit Card Corresponding Memo', 107);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10056, 'F3X', 'sched_h4', '21A', '20NM', 
    'ALLOC_EXP_STAF_REIM_MEMO', 'Reimbursement Corresponding Memo', 108);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10057, 'F3X', 'sched_h4', '21A', '20NM', 
    'ALLOC_EXP_PMT_TO_PROL_MEMO', 'Payroll Memo', 109);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10058, 'F3X', 'sched_b', '23', '21AM', 
    'ALLOC_EXP_DIR_CAN_SUP_CONT_MEMO', 'DCS - Contribution Memo', 111);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10059, 'F3X', 'sched_e', '24', '21AM', 
    'ALLOC_EXP_DIR_CAN_IE_MEMO', 'DCS - IE Memo', 112);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10060, 'F3X', 'sched_e', '25', '21AM', 
    'ALLOC_EXP_DIR_CAN_COORD_MEMO', 'DCS - Coordinated Memo', 113);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10061, 'F3X', 'sched_d', '10', '21AM', 
    'ALLOC_EXP_DEBT_TO_VEND', 'Debt to Vendor', 114);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10062, 'F3X', 'sched_h6', '30A', '20EM', 
    'ALLOC_FEA_CC_PAY_MEMO', 'CC Corresponding Memo', 117);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10063, 'F3X', 'sched_h6', '30A', '20EM', 
    'ALLOC_FEA_STAF_REIM_MEMO', 'Reimbursement Corresponding Memo', 118);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_identifier, 
    tran_desc, parent_tran_id)
 Values
   (10064, 'F3X', 'sched_d', '10', 'FEA_100PCT_DEBT_TO_VEND', 
    'Debt to Vendor', 121);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10065, 'F3X', 'sched_b', '30B', '20HM', 
    'FEA_CC_PAY_MEMO', 'CC Corresponding Memo', 122);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10066, 'F3X', 'sched_b', '30B', '20HM', 
    'FEA_STAF_REIM_MEMO', 'Reimb. Corresponding Memo', 123);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_code, 
    tran_identifier, tran_desc, parent_tran_id)
 Values
   (10067, 'F3X', 'sched_b', '30B', '20HM', 
    'FEA_PAY_TO_PROL_MEMO', 'Payroll Memo', 124);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_identifier, 
    tran_desc, parent_tran_id)
 Values
   (10068, 'F3X', 'sched_d', '10', 'COEXP_PARTY_DEBT_TO_VENDOR', 
    'Coordinated Party Expenditure Debt to Vendor', 133);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_identifier, 
    tran_desc, parent_tran_id)
 Values
   (10069, 'F3X', 'sched_d', '10', 'OTH_DISB_DEBT_TO_VEND', 
    'Other Disbursements Debt to Vendor', 134);
Insert into ref_transaction_types
   (ref_tran_id, form_type, sched_type, line_num, tran_identifier, 
    tran_desc, parent_tran_id)
 Values
   (10070, 'F3X', 'sched_d', '10', 'ALLOC_FEC_DISB_DEBT_TO_VEND', 
    'Allocated FEA Disbursement Debt to Vendor', 145);

