
/* drop view public.all_loans_debts_transactions_view; */

drop view public.all_loans_transactions_view;

drop table public.sched_c;

CREATE TABLE public.sched_c
(
  cmte_id character varying(9) NOT NULL,
  report_id bigint NOT NULL,
  line_number character varying(8) NOT NULL,
  transaction_type character varying(12) NOT NULL,
  transaction_type_identifier character varying(40),
  transaction_id character varying(20) NOT NULL DEFAULT get_next_transaction_id('SC'::bpchar),
  entity_id character varying(20),
  election_code character varying(5),
  election_other_description character varying(20),
  loan_amount_original numeric(12,2),
  loan_payment_to_date numeric(12,2),
  loan_balance numeric(12,2),
  loan_incurred_date date,
  loan_due_date date,
  loan_intrest_rate character varying(15),
  is_loan_secured character(1),
  is_personal_funds character(1),
  lender_cmte_id character varying(9),
  lender_cand_id character varying(9),
  lender_cand_last_name character varying(30),
  lender_cand_first_name character varying(20),
  lender_cand_middle_name character varying(20),
  lender_cand_prefix character varying(10),
  lender_cand_suffix character varying(10),
  lender_cand_office character varying(1),
  lender_cand_state character varying(2),
  lender_cand_district numeric,
  memo_code character varying(1),
  memo_text character varying(100),
  delete_ind character(1),
  create_date timestamp without time zone DEFAULT now(),
  last_update_date timestamp without time zone DEFAULT now(),
  CONSTRAINT sched_c_transaction_id_pk PRIMARY KEY (transaction_id)
);


 
CREATE OR REPLACE VIEW public.all_loans_debts_transactions_view AS 
 SELECT sc.cmte_id,
    sc.report_id,
    rp.report_type,
    rrt.rpt_type_desc AS report_desc,
    sc.line_number,
    'sched_c'::text AS transaction_table,
    sc.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sc.transaction_type_identifier,
    sc.transaction_id,
    sc.entity_id,
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
    sc.loan_amount_original as Loan_amount,
    sc.loan_payment_to_date,
    sc.loan_balance,
    sc.loan_incurred_date,
    sc.loan_due_date,
    0 as loan_beginning_balance,
    0 as loan_incurred_amt,
    0 as loan_payment_amt,
    0 as loan_closing_balance,
     ''::text AS purpose_description,
    sc.memo_code,
    sc.memo_text,
    sc.delete_ind,
    sc.create_date,
    sc.last_update_date,
    NULL::text AS itemized,
    '/sc/schedC'::text AS api_call,
    rt.category_type,
        CASE
            WHEN e.delete_ind = 'Y'::bpchar THEN sc.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate
   FROM sched_c sc
     JOIN entity e ON e.entity_id::text = sc.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sc.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sc.cmte_id::text AND rp.report_id = sc.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text
UNION
SELECT sd.cmte_id,
    sd.report_id,
    rp.report_type,
    rrt.rpt_type_desc AS report_desc,
    sd.line_num AS line_number,
    'sched_d'::text AS transaction_table,
    sd.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sd.transaction_type_identifier,
    sd.transaction_id,
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
    0 as Loan_Amount,
    0 as loan_payment_to_date,
    0 as loan_balance,
    NULL::date as loan_incurred_date,
    NULL::date as loan_due_date,
    sd.beginning_balance as loan_beginning_balance,
    sd.incurred_amount as loan_incurred_amt,
    sd.payment_amount as loan_payment_amt,
    sd.balance_at_close as loan_closing_balance,
    sd.purpose AS purpose_description,
    ''::text AS memo_code,
    ''::text AS memo_text,
    sd.delete_ind,
    sd.create_date,
    sd.last_update_date,
    NULL::text AS itemized,
    '/sd/schedD'::text AS api_call,
    rt.category_type,
        CASE
            WHEN e.delete_ind = 'Y'::bpchar THEN sd.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate    
    FROM sched_d sd
     JOIN entity e ON e.entity_id::text = sd.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sd.transaction_type_identifier::text
     JOIN reports rp ON rp.cmte_id::text = sd.cmte_id::text AND rp.report_id = sd.report_id
     JOIN ref_rpt_types rrt ON rp.report_type::text = rrt.rpt_type::text;

