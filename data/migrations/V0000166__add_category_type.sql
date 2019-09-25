delete from public.ref_transaction_types;

alter table ref_transaction_types add column category_type character varying (25);


CREATE OR REPLACE VIEW public.all_transactions_view AS
 SELECT sa.cmte_id,
    sa.report_id,
    sa.line_number,
    'sched_a'::text AS transaction_table,
    sa.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sa.transaction_type_identifier,
    sa.transaction_id,
    sa.back_ref_transaction_id,
    sa.back_ref_sched_name,
    sa.entity_id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying::text, 'CAN'::character varying::text]) THEN ((((initcap(e.last_name::text) || COALESCE(', '::text || initcap(e.first_name::text), ''::text)) || COALESCE(', '::text || initcap(e.middle_name::text), ''::text)) || COALESCE(', '::text || initcap(e.preffix::text), ''::text)) || COALESCE(', '::text || initcap(e.suffix::text), ''::text))::character varying
            ELSE e.entity_name
        END AS name,
    e.street_1,
    e.street_2,
    e.city,
    e.state,
    e.zip_code,
    e.occupation,
    e.employer,
    sa.contribution_date AS transaction_date,
    sa.contribution_amount AS transaction_amount,
    sa.aggregate_amt,
    sa.purpose_description,
    sa.memo_code,
    sa.memo_text,
    sa.election_code,
    sa.election_other_description,
    sa.delete_ind,
    sa.create_date,
    sa.last_update_date,
        CASE
            WHEN sa.aggregate_amt >= 0::numeric AND sa.aggregate_amt <= 200::numeric AND (sa.memo_code::text <> 'X'::text OR sa.memo_code IS NULL) THEN 'U'::text
            WHEN sa.aggregate_amt > 200::numeric THEN 'I'::text
            ELSE ''::text
        END AS itemized,
    '/sa/schedA'::text AS api_call,
	rt.category_type
   FROM sched_a sa
     JOIN entity e ON e.entity_id::text = sa.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sa.transaction_type_identifier::text
UNION ALL
 SELECT sb.cmte_id,
    sb.report_id,
    sb.line_number,
    'sched_b'::text AS transaction_table,
    sb.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sb.transaction_type_identifier,
    sb.transaction_id,
    sb.back_ref_transaction_id,
    sb.back_ref_sched_name,
    sb.entity_id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying::text, 'CAN'::character varying::text]) THEN ((((initcap(e.last_name::text) || COALESCE(', '::text || initcap(e.first_name::text), ''::text)) || COALESCE(', '::text || initcap(e.middle_name::text), ''::text)) || COALESCE(', '::text || initcap(e.preffix::text), ''::text)) || COALESCE(', '::text || initcap(e.suffix::text), ''::text))::character varying
            ELSE e.entity_name
        END AS name,
    e.street_1,
    e.street_2,
    e.city,
    e.state,
    e.zip_code,
    e.occupation,
    e.employer,
    sb.expenditure_date AS transaction_date,
    sb.expenditure_amount AS transaction_amount,
    sb.aggregate_amt,
    sb.expenditure_purpose AS purpose_description,
    sb.memo_code,
    sb.memo_text,
    sb.election_code,
    sb.election_other_description,
    sb.delete_ind,
    sb.create_date,
    sb.last_update_date,
    NULL::text AS itemized,
    '/sb/schedB'::text AS api_call,
	rt.category_type
   FROM sched_b sb
     JOIN entity e ON e.entity_id::text = sb.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sb.transaction_type_identifier::text
UNION ALL
 SELECT sd.cmte_id,
    sd.report_id,
    sd.line_num AS line_number,
    'sched_d'::text AS transaction_table,
    sd.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sd.transaction_type_identifier,
    sd.transaction_id,
    ''::text AS back_ref_transaction_id,
    ''::text AS back_ref_sched_name,
    sd.entity_id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying::text, 'CAN'::character varying::text]) THEN ((((initcap(e.last_name::text) || COALESCE(', '::text || initcap(e.first_name::text), ''::text)) || COALESCE(', '::text || initcap(e.middle_name::text), ''::text)) || COALESCE(', '::text || initcap(e.preffix::text), ''::text)) || COALESCE(', '::text || initcap(e.suffix::text), ''::text))::character varying
            ELSE e.entity_name
        END AS name,
    e.street_1,
    e.street_2,
    e.city,
    e.state,
    e.zip_code,
    e.occupation,
    e.employer,
    NULL::date AS transaction_date,
    sd.incurred_amount AS transaction_amount,
    NULL::numeric AS aggregate_amt,
    sd.purpose AS purpose_description,
    ''::text AS memo_code,
    ''::text AS memo_text,
    ''::text AS election_code,
    ''::text AS election_other_description,
    sd.delete_ind,
    sd.create_date,
    sd.last_update_date,
    NULL::text AS itemized,
    '/sd/schedD'::text AS api_call,
	rt.category_type
   FROM sched_d sd
     JOIN entity e ON e.entity_id::text = sd.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sd.transaction_type_identifier::text;



INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (12, 'F3X', 'sched_a', '11B', '18K', 'PARTY_REC', 'Party Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (127, 'F3X', 'sched_c', '13', NULL, 'LOANS_OWED_BY_CMTE', 'Loans Owed by the Committee', NULL, false, 'Loans and Debts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (15, 'F3X', 'sched_a', '11B', '18B', 'PARTY_PUR_BC', 'Bitcoin Sold to Party', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (16, 'F3X', 'sched_a', '11B', '18K', 'PARTY_RET', 'Returned/Bounced Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (17, 'F3X', 'sched_a', '11C', '18K', 'PAC_REC', 'PAC Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (88, 'F3X', 'sched_b', '29', '20O', 'OTH_DISB_CC_PAY', 'Credit Card Payment', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (22, 'F3X', 'sched_a', '11C', '18B', 'PAC_PUR_BC', 'Bitcoin Sold to PAC', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (24, 'F3X', 'sched_a', '11C', '18K', 'PAC_RET', 'Returned/Bounced Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (25, 'F3X', 'sched_a', '11C', '18U', 'PAC_NON_FED_REC', 'Non-Federal Committee Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (26, 'F3X', 'sched_a', '11C', '18U', 'PAC_NON_FED_RET', 'Non-Federal Committee Receipt Returned/Bounced Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (27, 'F3X', 'sched_a', '12', '18G', 'TRAN', 'Transfers', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (28, 'F3X', 'sched_a', '12', '14G', 'JF_TRAN', 'JF Transfers', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (31, 'F3X', 'sched_a', '17', '32G', 'JF_TRAN_NP_RECNT_ACC', 'JF Transfer - National Party Recount Account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (32, 'F3X', 'sched_a', '17', '30T', 'JF_TRAN_NP_CONVEN_ACC', 'JF Transfer - Nataional Party Convention Account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (33, 'F3X', 'sched_a', '17', '31T', 'JF_TRAN_NP_HQ_ACC', 'JF Transfer - National Party Headquarters Account ', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (34, 'F3X', 'sched_h3', '18A', '10G', 'TRAN_FROM_NON_FED_ACC', 'Transfer from Non-Federal Account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (35, 'F3X', 'sched_h5', '18B', '12G', 'TRAN_FROM_LEVIN_ACC', 'Transfer from Levin Account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (36, 'F3X', 'sched_a', '16', '17Z', 'REF_TO_FED_CAN', 'Refunds of Contributions to Candidate', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (37, 'F3X', 'sched_a', '16', '17Z', 'REF_TO_OTH_CMTE', 'Refunds of Contributions to Other Committees', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (38, 'F3X', 'sched_a', '11A', '11', 'TRIB_REC', 'Tribal Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (39, 'F3X', 'sched_a', '15', '15O', 'OFFSET_TO_OPEX', 'Offsets to Operating Expenditures', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (40, 'F3X', 'sched_a', '17', '15O', 'OTH_REC', 'Other Receipts', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (41, 'F3X', 'sched_a', '17', '15R', 'IND_RECNT_REC', 'Ind. Recount Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (42, 'F3X', 'sched_a', '17', '18R', 'PARTY_RECNT_REC', 'Party Recount Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (43, 'F3X', 'sched_a', '17', '18R', 'PAC_RECNT_REC', 'PAC Recount Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (44, 'F3X', 'sched_a', '17', '11R', 'TRIB_RECNT_REC', 'Tribal Recount Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (45, 'F3X', 'sched_a', '17', '32', 'IND_NP_RECNT_ACC', 'Ind National Party Recount account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (46, 'F3X', 'sched_a', '17', '32T', 'TRIB_NP_RECNT_ACC', 'Tribal National Party Recount Account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (47, 'F3X', 'sched_a', '17', '32K', 'PARTY_NP_RECNT_ACC', 'Party National Party Recount account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (48, 'F3X', 'sched_a', '17', '32K', 'PAC_NP_RECNT_ACC', 'PAC National Party Recount  account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (49, 'F3X', 'sched_a', '17', '31', 'IND_NP_HQ_ACC', 'Ind National party headquarters buildings account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (50, 'F3X', 'sched_a', '17', '31K', 'PARTY_NP_HQ_ACC', 'Party National party headquarters buildings account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (51, 'F3X', 'sched_a', '17', '31K', 'PAC_NP_HQ_ACC', 'PAC National party headquarters buildings account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (52, 'F3X', 'sched_a', '17', '31T', 'TRIB_NP_HQ_ACC', 'Tribal National Party Headquarters Buildings Account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (53, 'F3X', 'sched_a', '17', '30', 'IND_NP_CONVEN_ACC', 'Ind National party Convention account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (54, 'F3X', 'sched_a', '17', '30K', 'PARTY_NP_CONVEN_ACC', 'Party National Party Convention account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (55, 'F3X', 'sched_a', '17', '30K', 'PAC_NP_CONVEN_ACC', 'PAC National Party Convention  account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (56, 'F3X', 'sched_a', '17', '30T', 'TRIB_NP_CONVEN_ACC', 'Tribal National Party Convention Account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (57, 'F3X', 'sched_a', '17', '32E', 'EAR_REC_RECNT_ACC', 'Earmark Receipt for Recount Account (contribution)', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (58, 'F3X', 'sched_a', '17', '30E', 'EAR_REC_CONVEN_ACC', 'Earmark Receipt for Convention Account (contribution)', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (59, 'F3X', 'sched_a', '17', '31E', 'EAR_REC_HQ_ACC', 'Earmark Receipt for Headquarters Account (contribution)', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (60, 'F3X', 'sched_a', '17', '10', 'IND_REC_NON_CONT_ACC', 'Ind. Receipt - Non-Contribution Account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (61, 'F3X', 'sched_a', '17', '10K', 'OTH_CMTE_NON_CONT_ACC', 'Other Committee Receipt - Non-Contribution Account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (62, 'F3X', 'sched_a', '17', '10B', 'BUS_LAB_NON_CONT_ACC', 'Business/Labor Org. Receipt - Non-Contribution Account', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (63, 'F3X', 'sched_b', '21B', '20', 'OPEXP', 'Operating Expenditure', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (65, 'F3X', 'sched_b', '21B', '20', 'OPEXP_CC_PAY', 'Credit Card Payment', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (66, 'F3X', 'sched_b', '21B', '20', 'OPEXP_STAF_REIM', 'Staff Reimbursement', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (67, 'F3X', 'sched_b', '21B', '20', 'OPEXP_PMT_TO_PROL', 'Payment to Payroll', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (68, 'F3X', 'sched_b', '21B', '20', 'OPEXP_VOID', 'Operating Expenditure - Void', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (69, 'F3X', 'sched_b', '29', '41', 'OPEXP_HQ_ACC_OP_EXP_NP', 'Headquarters Account Operating Expense for National Party Expenses', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (70, 'F3X', 'sched_b', '29', '40', 'OPEXP_CONV_ACC_OP_EXP_NP', 'Convention Account Operating Expense for National Party Expense', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (71, 'F3X', 'sched_b', '22', '24G', 'TRAN_TO_AFFI', 'Transfers to Affiliates/Other Committees', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (72, 'F3X', 'sched_b', '23', '24K', 'CONT_TO_CAN', 'Contribution to Candidate', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (73, 'F3X', 'sched_b', '23', '24KM', 'CONT_REDESIG', 'Redesignation', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (74, 'F3X', 'sched_b', '23', '23', 'CONT_TO_OTH_CMTE', 'Contribution to Other Committee', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (75, 'F3X', 'sched_b', '23', '24K', 'CONT_VOID', 'Contributions - Void', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (76, 'F3X', 'sched_e', '24', '24_', 'IE', 'Independent Expenditure', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (81, 'F3X', 'sched_e', '24', '24', 'IE_VOID', 'Independent Expenditure - Void', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (130, 'F3X', 'sched_c', NULL, NULL, 'SC', 'Schedule C', NULL, false, 'Loans and Debts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (78, 'F3X', 'sched_e', '24', '24_', 'IE_CC_PAY', 'Credit Card Payment', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (79, 'F3X', 'sched_e', '24', '24_', 'IE_STAF_REIM', 'Staff Reimbursement', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (80, 'F3X', 'sched_e', '24', '24_', 'IE_PMT_TO_PROL', 'Payment to Payroll', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10037, 'F3X', 'sched_b', '21B', '20', 'OPEXP_DEBT', 'Operating Expenditure Debt to Vendor', 160, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (82, 'F3X', 'sched_f', '25', '24C', 'COEXP_PARTY', 'Coordinated Party Expenditure', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (83, 'F3X', 'sched_f', '25', '24C', 'COEXP_CC_PAY', 'Credit Card Payment', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (84, 'F3X', 'sched_f', '25', '24C', 'COEXP_STAF_REIM', 'Staff Reimbursement', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (85, 'F3X', 'sched_f', '25', '24C', 'COEXP_PMT_PROL', 'Payment to Payroll', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (87, 'F3X', 'sched_b', '29', '20O', 'OTH_DISB', 'Other Disbursements', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (89, 'F3X', 'sched_b', '29', '20O', 'OTH_DISB_STAF_REIM', 'Staff Reimbursement', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10002, 'F3X', 'sched_b', '21B', '20K', 'IK_OUT', 'In-Kind Out', 3, true, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (86, 'F3X', 'sched_f', '25', '24C', 'COEXP_PARTY_VOID', 'Coordinated Party Expenditure - Void', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10010, 'F3X', 'sched_b', '21B', '20K', 'PARTY_IK_OUT', 'In-Kind Out', 13, true, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10013, 'F3X', 'sched_b', '21B', '20K', 'PAC_IK_OUT', 'In-Kind Out', 18, true, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10003, 'F3X', 'sched_b', '21B', '20B', 'IK_BC_OUT', 'Ind. In-Kind Bitcoin Out', 4, true, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10014, 'F3X', 'sched_b', '21B', '20B', 'PAC_IK_BC_OUT', 'In-Kind Bitcoin Out', 19, true, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (3, 'F3X', 'sched_a', '11A', '15K', 'IK_REC', 'In-Kind Receipt', NULL, true, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (4, 'F3X', 'sched_a', '11A', '15B', 'IK_BC_REC', 'Ind. In-Kind Bitcoin Receipt', NULL, true, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (13, 'F3X', 'sched_a', '11B', '15Z', 'PARTY_IK_REC', 'Party In-Kind', NULL, true, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (14, 'F3X', 'sched_a', '11B', '18B', 'PARTY_IK_BC_REC', 'Party In-Kind Bitcoin Receipt', NULL, true, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (18, 'F3X', 'sched_a', '11C', '15Z', 'PAC_IK_REC', 'PAC In-Kind', NULL, true, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (19, 'F3X', 'sched_a', '11C', '18B', 'PAC_IK_BC_REC', 'PAC In-Kind Bitcoin Receipt', NULL, true, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (29, 'F3X', 'sched_a', '12', '18Z', 'IK_TRAN', 'In-Kind Transfer', NULL, true, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (30, 'F3X', 'sched_a', '12', '18F', 'IK_TRAN_FEA', 'In-Kind Transfer-FEA', NULL, true, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10023, 'F3X', 'sched_b', '21B', '20K', 'IK_TRAN_OUT', 'In-Kind Transfer Out', 29, true, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10024, 'F3X', 'sched_b', '30B', '20K', 'IK_TRAN_FEA_OUT', 'In-Kind Transfer-FEA Out', 30, true, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (9, 'F3X', 'sched_a', '11A', '15IM', 'CON_EAR_UNDEP', 'Conduit Earmark (Undeposited)', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (20, 'F3X', 'sched_a', '11C', '18I', 'PAC_CON_EAR_DEP', 'PAC Conduit Earmark (Deposited)', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (21, 'F3X', 'sched_a', '11C', '18IM', 'PAC_CON_EAR_UNDEP', 'PAC Conduit Earmark (Undeposited)', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (23, 'F3X', 'sched_a', '11C', '18E', 'PAC_EAR_REC', 'PAC Earmark Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10028, 'F3X', 'sched_a', '17', '30JM', 'JF_TRAN_NP_CONVEN_IND_MEMO', 'Ind National Party Convention Account JF Transfer Memo', 32, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (90, 'F3X', 'sched_b', '29', '20O', 'OTH_DISB_PMT_TO_PROL', 'Payment to Payroll', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (91, 'F3X', 'sched_b', '29', '20', 'OTH_DISB_RECNT', 'Recount Disbursements', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (92, 'F3X', 'sched_b', '29', '29', 'OTH_DISB_NP_RECNT_ACC', 'National Party Recount Account Disbursements', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10011, 'F3X', 'sched_b', '21B', '20B', 'PARTY_IK_BC_OUT', 'In-Kind Bitcoin Out', 14, true, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10021, 'F3X', 'sched_a', '12', '14KM', 'JF_TRAN_PAC_MEMO', 'PAC JF Memo', 28, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (138, 'F3X', 'sched_b', '29', '40Z', 'OPEXP_CONV_ACC_REG_REF', 'Convention Account - Reg. Filer Refund', NULL, true, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (141, 'F3X', 'sched_b', '29', '42Z', 'OTH_DISB_NP_RECNT_REG_REF', 'National Party Recount Account - Reg. Filer Refund', NULL, true, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (137, 'F3X', 'sched_b', '29', '41Z', 'OPEXP_HQ_ACC_REG_REF', 'HQ Account - Reg. Filer Refund', NULL, true, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10007, 'F3X', 'sched_b', '23', '24IM', 'CON_EAR_UNDEP_MEMO', 'Conduit Earmark Out', 9, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10006, 'F3X', 'sched_b', '23', '24T', 'CON_EAR_DEP_MEMO', 'Earmark Out', 8, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10015, 'F3X', 'sched_b', '23', '24T', 'PAC_CON_EAR_DEP_MEMO', 'PAC Conduit Earmark Out', 20, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10016, 'F3X', 'sched_b', '23', '24IM', 'PAC_CON_EAR_UNDEP_MEMO', 'PAC Conduit Earmark Out', 21, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10018, 'F3X', 'sched_a', '11C', '18EM', 'PAC_EAR_MEMO', 'PAC Earmark Memo', 23, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (93, 'F3X', 'sched_b', '29', '26', 'OTH_DISB_NC_ACC', 'Non-Contribution Account Disbursements', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (94, 'F3X', 'sched_b', '29', '26', 'OTH_DISB_NC_ACC_CC_PAY', 'Non-Contribution Account Credit Card Payment', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (95, 'F3X', 'sched_b', '29', '26', 'OTH_DISB_NC_ACC_STAF_REIM', 'Non-Contribution Account Staff Reimbursement', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (96, 'F3X', 'sched_b', '29', '26', 'OTH_DISB_NC_ACC_PMT_TO_PROL', 'Non-Contribution Account Payment to Payroll', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (97, 'F3X', 'sched_b', '29', '20O', 'OTH_DISB_VOID', 'Other Disbursement - Void', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (98, 'F3X', 'sched_b', '28A', '22Y', 'REF_CONT_IND', 'Refund of Ind. Contribution', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (100, 'F3X', 'sched_b', '28B', '22Z', 'REF_CONT_PARTY', 'Refund of Party Contribution', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (102, 'F3X', 'sched_b', '28C', '22Z', 'REF_CONT_PAC', 'Refund of PAC Contribution', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (106, 'F3X', 'sched_h4', '21A', '20N', 'ALLOC_EXP', 'Allocated Federal/Non-Federal Expenditure', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (107, 'F3X', 'sched_h4', '21A', '20N', 'ALLOC_EXP_CC_PAY', 'Credit Card Payment for Allocated Expenditure', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (108, 'F3X', 'sched_h4', '21A', '20N', 'ALLOC_EXP_STAF_REIM', 'Staff Reimbursement for Allocated Expenditure', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (109, 'F3X', 'sched_h4', '21A', '20N', 'ALLOC_EXP_PMT_TO_PROL', 'Payment to Payroll', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (110, 'F3X', 'sched_h4', '21A', '20N', 'ALLOC_EXP_DIR_CAN_SUP', 'Direct Candidate Support', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (111, 'F3X', 'sched_h4', '23', '24KM', 'ALLOC_EXP_DIR_CAN_SUP_CONT', 'Direct Candidate Support Contribution', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (113, 'F3X', 'sched_h4', '25', '24CM', 'ALLOC_EXP_DIR_CAN_COORD', 'Direct Candidate Support - Coordinated', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (125, 'F3X', 'sched_b', '30B', '20H', 'FEA_VOID', 'FEA - Void', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10034, 'F3X', 'sched_a', '17', '32EM', 'EAR_REC_RECNT_ACC_MEMO', 'Earmark Memo', 57, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (116, 'F3X', 'sched_h6', '30A', '20E', 'ALLOC_FEA_DISB', 'Allocated FEA Disbursement', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (117, 'F3X', 'sched_h6', '30A', '20E', 'ALLOC_FEA_CC_PAY', 'Allocated FEA Credit Card Payment', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (118, 'F3X', 'sched_h6', '30A', '20E', 'ALLOC_FEA_STAF_REIM', 'Staff Reimbursement for Allocated FEA Payment', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (120, 'F3X', 'sched_b', '30B', '20H', 'FEA_100PCT_PAY', '100% FEA Payment', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (122, 'F3X', 'sched_b', '30B', '20H', 'FEA_CC_PAY', 'FEA Credit Card Payment', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (123, 'F3X', 'sched_b', '30B', '20H', 'FEA_STAF_REIM', 'FEA Staff Reimbursement', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (124, 'F3X', 'sched_b', '30B', '20H', 'FEA_PAY_TO_PROL', 'Payment to Payroll', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (135, 'F3X', 'sched_b', '29', '41Y', 'OPEXP_HQ_ACC_IND_REF', 'HQ Account - Individual Refund
', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (136, 'F3X', 'sched_b', '29', '41T', 'OPEXP_HQ_ACC_TRIB_REF', 'HQ Account - Tribal Refund', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (139, 'F3X', 'sched_b', '29', '40T', 'OPEXP_CONV_ACC_TRIB_REF', 'Convention Account - Tribal Refund', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (140, 'F3X', 'sched_b', '29', '40Y', 'OPEXP_CONV_ACC_IND_REF', 'Convention Account - Individual Refund', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (142, 'F3X', 'sched_b', '29', '42T', 'OTH_DISB_NP_RECNT_TRIB_REF', 'National Party Recount Account - Tribal Refund', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (143, 'F3X', 'sched_b', '29', '42Y', 'OTH_DISB_NP_RECNT_IND_REF', 'National Party Recount Account - Individual Refund', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10001, 'F3X', 'sched_a', '11A', '15PM', 'PARTN_MEMO', 'Partnership Memo', 2, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10004, 'F3X', 'sched_b', '21B', '15M', 'REATT_MEMO', 'Reattribution Memo', 5, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10005, 'F3X', 'sched_a', '11A', '15EM', 'EAR_MEMO', 'Earmark Memo', 7, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10008, 'F3X', 'sched_a', '11A', '15BM', 'BC_TO_IND_MEMO', 'Bitcoin Memo', 10, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10009, 'F3X', 'sched_a', '11A', '15BM', 'BC_TO_UNKN_MEMO', 'Bitcoin Memo', 11, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (131, 'F3X', 'sched_c1', NULL, NULL, 'SC1', 'Schedule C-1', 127, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10012, 'F3X', 'sched_a', '11B', '18BM', 'PARTY_PUR_BC_MEMO', 'Bitcoin Memo', 15, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (132, 'F3X', 'sched_c2', NULL, '15', 'SC2', 'Schedule C-2', 127, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10073, 'F3X', 'sched_a', '14', '16L', 'LOAN_REPAY_RCVD', 'Loan Repayments Received', 126, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (112, 'F3X', 'sched_h4', '24', '24A/E', 'ALLOC_EXP_DIR_CAN_IE', 'Direct Candidate Support - IE', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10076, 'F3X', 'sched_b', '26', '22LJ', 'LOAN_REPAY_MADE', 'Loan Repayments Made', 127, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (104, 'F3X', 'sched_b', '28C', '20Y', 'REF_CONT_NON_FED', 'Non-Federal Committee Refund', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10017, 'F3X', 'sched_a', '11C', '18BM', 'PAC_PUR_BC_MEMO', 'Bitcoin Memo', 22, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10019, 'F3X', 'sched_a', '12', '14JM', 'JF_TRAN_IND_MEMO', 'Ind JF Memo', 28, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10020, 'F3X', 'sched_a', '12', '14KM', 'JF_TRAN_PARTY_MEMO', 'Party JF Memo', 28, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10022, 'F3X', 'sched_a', '12', '14TM', 'JF_TRAN_TRIB_MEMO', 'Tribal JF Memo', 28, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10072, 'F3X', 'sched_b', '27GH', 'TBD', 'LOANS_MADE', 'Loans Made', 126, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10074, 'F3X', 'sched_a', '13', '16G', 'LOAN_FROM_IND', 'Loans Received from Ind', 127, false, 'Loans and Debts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10025, 'F3X', 'sched_a', '17', '32JM', 'JF_TRAN_NP_RECNT_IND_MEMO', 'Ind JF Transfer Memo', 31, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10026, 'F3X', 'sched_a', '17', '32KM', 'JF_TRAN_NP_RECNT_PAC_MEMO', 'PAC JF Transfer Memo', 31, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10027, 'F3X', 'sched_a', '17', '32TM', 'JF_TRAN_NP_RECNT_TRIB_MEMO', 'Tribal JF Transfer Memo', 31, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (99, 'F3X', 'sched_b', '28A', '22Y', 'REF_CONT_IND_VOID', 'Refund of Ind. Contribution - Void', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10075, 'F3X', 'sched_a', '13', '16F', 'LOAN_FROM_BANK', 'Loans Received from Bank', 127, false, 'Loans and Debts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10029, 'F3X', 'sched_a', '17', '30KM', 'JF_TRAN_NP_CONVEN_PAC_MEMO', 'PAC National Party Convention Account JF Transfer Memo', 32, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10030, 'F3X', 'sched_a', '17', '30TM', 'JF_TRAN_NP_CONVEN_TRIB_MEMO', 'Tribal National Party Convention Account JF Transfer Memo', 32, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10031, 'F3X', 'sched_a', '17', '31JM', 'JF_TRAN_NP_HQ_IND_MEMO', 'Ind National Party HQ - JF Transfer Memo', 33, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10032, 'F3X', 'sched_a', '17', '31KM', 'JF_TRAN_NP_HQ_PAC_MEMO', 'PAC National Party HQ - JF Transfer Memo', 33, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10033, 'F3X', 'sched_a', '17', '31TM', 'JF_TRAN_NP_HQ_TRIB_MEMO', 'Tribal National Party HQ - JF Transfer Memo', 33, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10035, 'F3X', 'sched_a', '17', '30EM', 'EAR_REC_CONVEN_ACC_MEMO', 'Earmark Memo', 58, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10051, 'F3X', 'sched_b', '29', '20OM', 'OTH_DISB_PMT_TO_PROL_MEMO', 'Payroll Memo', 90, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10052, 'F3X', 'sched_b', '29', '26M', 'OTH_DISB_NC_ACC_CC_PAY_MEMO', 'Credit Card Corresponding Memo', 94, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10053, 'F3X', 'sched_b', '29', '26M', 'OTH_DISB_NC_ACC_STAF_REIM_MEMO', 'Reimb. Corresponding Memo', 95, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10054, 'F3X', 'sched_b', '29', '26M', 'OTH_DISB_NC_ACC_PMT_TO_PROL_MEMO', 'Payroll Memo', 96, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10055, 'F3X', 'sched_h4', '21A', '20NM', 'ALLOC_EXP_CC_PAY_MEMO', 'Credit Card Corresponding Memo', 107, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10056, 'F3X', 'sched_h4', '21A', '20NM', 'ALLOC_EXP_STAF_REIM_MEMO', 'Reimbursement Corresponding Memo', 108, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10057, 'F3X', 'sched_h4', '21A', '20NM', 'ALLOC_EXP_PMT_TO_PROL_MEMO', 'Payroll Memo', 109, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10058, 'F3X', 'sched_b', '23', '21AM', 'ALLOC_EXP_DIR_CAN_SUP_CONT_MEMO', 'DCS - Contribution Memo', 111, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10059, 'F3X', 'sched_e', '24', '21AM', 'ALLOC_EXP_DIR_CAN_IE_MEMO', 'DCS - IE Memo', 112, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10060, 'F3X', 'sched_e', '25', '21AM', 'ALLOC_EXP_DIR_CAN_COORD_MEMO', 'DCS - Coordinated Memo', 113, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10062, 'F3X', 'sched_h6', '30A', '20EM', 'ALLOC_FEA_CC_PAY_MEMO', 'CC Corresponding Memo', 117, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10071, 'F3X', 'sched_l_a', '11AI', NULL, 'LEVIN_PARTN_MEMO', 'Partnership Memo (Levin)', 150, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10063, 'F3X', 'sched_h6', '30A', '20EM', 'ALLOC_FEA_STAF_REIM_MEMO', 'Reimbursement Corresponding Memo', 118, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10065, 'F3X', 'sched_b', '30B', '20HM', 'FEA_CC_PAY_MEMO', 'CC Corresponding Memo', 122, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10066, 'F3X', 'sched_b', '30B', '20HM', 'FEA_STAF_REIM_MEMO', 'Reimb. Corresponding Memo', 123, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10067, 'F3X', 'sched_b', '30B', '20HM', 'FEA_PAY_TO_PROL_MEMO', 'Payroll Memo', 124, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10042, 'F3X', 'sched_e', '24', '24_', 'IE_B4_DISSE_MEMO', 'IE Before Dissemination - Memo', 160, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (160, 'F3X', 'sched_d', '10', NULL, 'DEBT_TO_VENDOR', 'Debt to Vendor', NULL, false, 'Loans and Debts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10064, 'F3X', 'sched_b', '30B', '20H', 'FEA_100PCT_DEBT_PAY', '100% FEA Payment-Debt Payment', 160, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10068, 'F3X', 'sched_f', '25', '24C', 'COEXP_PARTY_DEBT', 'Coordinated Party Expenditure Debt to Vendor', 160, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10069, 'F3X', 'sched_b', '29', '20O', 'OTH_DISB_DEBT', 'Other Disbursements Debt to Vendor', 160, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10070, 'F3X', 'sched_h6', '30A', '20E', 'ALLOC_FEC_DISB_DEBT', NULL, 160, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (105, 'F3X', 'sched_b', '28C', '20Y', 'REF_CONT_NON_FED_VOID', 'Non-Federal Committee Refund - Void', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10061, 'F3X', 'sched_h4', '21A', '20N', 'ALLOC_EXP_DEBT', 'Allocated Federal/Non-Federal Expenditure - Debt to Vendor', 160, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (101, 'F3X', 'sched_b', '28B', '22Z', 'REF_CONT_PARTY_VOID', 'Refund of Party Contribution - Void', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (103, 'F3X', 'sched_b', '28C', '22Z', 'REF_CONT_PAC_VOID', 'Refund of PAC Contribution - Void', NULL, false, 'Disbursements');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (1, 'F3X', 'sched_a', '11A', '15', 'INDV_REC', 'Individual Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (2, 'F3X', 'sched_a', '11A', '15P', 'PARTN_REC', 'Partnership Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10049, 'F3X', 'sched_b', '29', '20OM', 'OTH_DISB_CC_PAY_MEMO', 'Credit Card Corresponding Memo', 88, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (5, 'F3X', 'sched_a', '11A', NULL, 'REATT_FROM', 'Reattribution', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (6, 'F3X', 'sched_a', '11A', '15', 'RET_REC', 'Returned/Bounced Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (7, 'F3X', 'sched_a', '11A', '15E', 'EAR_REC', 'Earmark Receipt', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (8, 'F3X', 'sched_a', '11A', '15I', 'CON_EAR_DEP', 'Conduit Earmark (Deposited)', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10, 'F3X', 'sched_a', '11A', '15B', 'BC_TO_IND', 'Bitcoin Sold to Ind', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (11, 'F3X', 'sched_a', '11A', '15B', 'BC_TO_UNKN', 'Bitcoin Sold to Unknown', NULL, false, 'Receipts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (119, 'F3X', 'sched_h6', '30A', '20E', 'ALLOC_FEA_VOID', 'Allocated FEA - Void', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (146, 'F3X', 'sched_h1', 'H1', NULL, 'ALLOC_H1', 'Method of Allocation - H1', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (147, 'F3X', 'sched_h2', 'H2', NULL, 'ALLOC_H2_RATIO', 'Allocation Ration - H2', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (149, 'F3X', 'sched_l_a', NULL, NULL, 'LEVIN_TRIB_REC', 'Tribal Receipt (Levin)', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (150, 'F3X', 'sched_l_a', '11AI', NULL, 'LEVIN_PARTN_REC', 'Partnership Contribution Receipt (Levin)', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (151, 'F3X', 'sched_l_a', '11AI', NULL, 'LEVIN_ORG_REC', 'Company/Organization Receipt (Levin)', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (152, 'F3X', 'sched_l_a', '11AI', NULL, 'LEVIN_INDV_REC', 'Individual Receipt (Levin)', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (153, 'F3X', 'sched_l_a', NULL, NULL, 'LEVIN_NON_FED_REC', 'Non-Federal PAC Receipt (Levin)', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (154, 'F3X', 'sched_l_a', NULL, NULL, 'LEVIN_OTH_REC', 'Other Receipt Line 2( Levin)', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (155, 'F3X', 'sched_l_b', NULL, NULL, 'LEVIN_VOTER_ID', 'Voter ID (Line 4B)', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (156, 'F3X', 'sched_l_b', NULL, NULL, 'LEVIN_GOTV', 'GOTV (Line 4C)', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (157, 'F3X', 'sched_l_b', NULL, NULL, 'LEVIN_GEN', 'Generic Campaign', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (158, 'F3X', 'sched_l_b', NULL, NULL, 'LEVIN_OTH_DISB', 'Other Disbursements', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (159, 'F3X', 'sched_l_b', NULL, NULL, 'LEVIN_VOTER_REG', 'Voter Registration (Line 4A)', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (115, 'F3X', 'sched_h4', '21A', '20N', 'ALLOC_EXP_VOID', 'Allocated Federal/Non-Federal Expenditure - Void', NULL, false, 'Other');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (126, 'F3X', 'sched_c', '13', NULL, 'LOANS_OWED_TO_CMTE', 'Loans Owed to Comittee', NULL, false, 'Loans and Debts');
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10036, 'F3X', 'sched_a', '17', '31EM', 'EAR_REC_HQ_ACC_MEMO', 'Earmark Memo', 59, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10038, 'F3X', 'sched_b', '21B', '20M', 'OPEXP_CC_PAY_MEMO', 'CC Corresponding Memo', 65, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10039, 'F3X', 'sched_b', '21B', '20M', 'OPEXP_STAF_REIM_MEMO', 'Reimbursement Corresponding Memo', 66, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10040, 'F3X', 'sched_b', '21B', '20M', 'OPEXP_PMT_TO_PROL_MEMO', 'Payroll Memo', 67, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10041, 'F3X', 'sched_b', '23', '24KM', 'CONT_REDESIG_MEMO', 'Redesignation Memo', 73, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10043, 'F3X', 'sched_e', '24', '24_M', 'IE_CC_PAY_MEMO', 'CC Corresponding Memo', 78, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10044, 'F3X', 'sched_e', '24', '24_M', 'IE_STAF_REIM_MEMO', 'Reimbursement Corresponding Memo', 79, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10045, 'F3X', 'sched_e', '24', '24_M', 'IE_PMT_TO_PROL_MEMO', 'Payroll Memo', 80, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10046, 'F3X', 'sched_f', '25', '24CM', 'COEXP_CC_PAY_MEMO', 'Credit Card Corresponding Memo', 83, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10047, 'F3X', 'sched_f', '25', '24CM', 'COEXP_STAF_REIM_MEMO', 'Reimbursement Corresponding Memo', 84, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10048, 'F3X', 'sched_f', '25', '24CM', 'COEXP_PMT_PROL_MEMO', 'Payroll Memo', 85, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (10050, 'F3X', 'sched_b', '29', '20OM', 'OTH_DISB_STAF_REIM_MEMO', 'Reimbursement Corresponding Memo', 89, false, NULL);
INSERT INTO public.ref_transaction_types (ref_tran_id, form_type, sched_type, line_num, tran_code, tran_identifier, tran_desc, parent_tran_id, auto_generate, category_type) VALUES (148, 'F3X', 'sched_l_a', NULL, NULL, 'LEVIN_PAC_REC', 'PAC Receipt (Levin)', NULL, false, 'Other');


