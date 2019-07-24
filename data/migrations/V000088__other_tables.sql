CREATE TABLE public.sched_e
(
  cmte_id character varying(9) NOT NULL,
  report_id bigint NOT NULL,
  transaction_type_identifier character varying(12),
  transaction_id character varying(20) NOT NULL DEFAULT get_next_transaction_id('SE'::bpchar),
  back_ref_transaction_id character varying(20),
  back_ref_sched_name character varying(8),
  payee_entity_id character varying(20),
  election_code character varying(5),
  election_other_desc character varying(20),
  dissemination_date date,
  expenditure_amount numeric(12,2),
  disbursement_date date,
  calendar_ytd_amount numeric(12,2),
  purpose character varying(100),
  category_code character varying(3),
  payee_cmte_id character varying(9),
  support_oppose_code character varying(1),
  so_cand_id character varying(9),
  so_cand_last_name  character varying(30),
  so_cand_fist_name character varying(20),
  so_cand_middle_name  character varying(20),
  so_cand_prefix character varying(10),
  so_cand_suffix character varying(10),
  so_cand_office character varying(1),
  so_cand_district character varying(2),
  so_cand_state character varying(2),
  completing_entity_id character varying(20),
  date_signed date,
  memo_code character varying(1),
  memo_text character varying(100), 
  delete_ind character(1),
  create_date timestamp without time zone DEFAULT now(),
  last_update_date timestamp without time zone DEFAULT now(),
  CONSTRAINT sched_e_transaction_id_pk PRIMARY KEY (transaction_id)
);



CREATE TABLE public.sched_f
(
  cmte_id character varying(9) NOT NULL,
  report_id bigint NOT NULL,
  transaction_type_identifier character varying(12),
  transaction_id character varying(20) NOT NULL DEFAULT get_next_transaction_id('SF'::bpchar),
  back_ref_transaction_id character varying(20),
  back_ref_sched_name character varying(8),
  coordinated_exp_ind character varying(3),
  designating_cmte_id character varying(9),
  designating_cmte_name character varying(200),
  subordinate_cmte_id character varying(9),
  subordinate_cmte_name character varying(200),
  subordinate_cmte_street_1 character varying(34),
  subordinate_cmte_street_2 character varying(34),
  subordinate_cmte_city character varying(30),
  subordinate_cmte_state character varying(2),
  subordinate_cmte_zip character varying(10),
  payee_entity_id character varying(20),
  expenditure_date date, 
  expenditure_amount numeric(12,2),
  aggregate_general_elec_exp numeric(12,2),
  purpose character varying(100),
  category_code character varying(3),
  payee_cmte_id character varying(9),
  payee_cand_id character varying(9),
  payee_cand_last_name  character varying(30),
  payee_cand_fist_name character varying(20),
  payee_cand_middle_name  character varying(20),
  payee_cand_prefix character varying(10),
  payee_cand_suffix character varying(10),
  payee_cand_office character varying(1),
  payee_cand_state character varying(2),
  payee_cand_district character varying(2),  
  memo_code character varying(1),
  memo_text character varying(100), 
  delete_ind character(1),
  create_date timestamp without time zone DEFAULT now(),
  last_update_date timestamp without time zone DEFAULT now(),
  CONSTRAINT sched_f_transaction_id_pk PRIMARY KEY (transaction_id)
);


CREATE TABLE public.sched_h3
( cmte_id character varying(9) NOT NULL,
  report_id bigint NOT NULL,
  transaction_type_identifier character varying(12),
  transaction_id character varying(20) NOT NULL DEFAULT get_next_transaction_id('H3'::bpchar),
  back_ref_transaction_id character varying(20),
  back_ref_sched_name character varying(8),  
  account_name character varying(90),
  activity_event_type character varying (2),
  activity_event_name character varying (90),
  receipt_date date,
  total_amount_transferred numeric(12,2),
  transferred_amount    numeric(12,2),
  memo_code character varying(1),
  memo_text character varying(90),
  delete_ind character(1),
  create_date timestamp without time zone DEFAULT now(),
  last_update_date timestamp without time zone DEFAULT now(),
  CONSTRAINT sched_h3_transaction_id_pk PRIMARY KEY (transaction_id));

 

CREATE TABLE public.sched_h4
(
  cmte_id character varying(9) NOT NULL,
  report_id bigint NOT NULL,
  transaction_type_identifier character varying(12),
  transaction_id character varying(20) NOT NULL DEFAULT get_next_transaction_id('H4'::bpchar),
  back_ref_transaction_id character varying(20),
  back_ref_sched_name character varying(8),
  payee_entity_id character varying(20),
  activity_event_identifier character varying(90),
  expenditure_date date,
  fed_share_amount  numeric(12,2),
  non_fed_share_amount numeric(12,2),
  total_amount  numeric(12,2),
  activity_event_amount_ytd numeric(12,2),
  purpose character varying(100),
  category_code character varying(2),
  activity_event_type character varying (2),
  memo_code character varying(1),
  memo_text character varying(90),
  delete_ind character(1),
  create_date timestamp without time zone DEFAULT now(),
  last_update_date timestamp without time zone DEFAULT now(),
  CONSTRAINT sched_h4_transaction_id_pk PRIMARY KEY (transaction_id));



create table ref_event_types(event_type character varying(2), event_type_desc character varying(90)) ;
insert into ref_event_types(event_type,event_type_desc) values('AD','ADministrative');
insert into ref_event_types(event_type,event_type_desc) values('GV','Generic Voter Drive');
insert into ref_event_types(event_type,event_type_desc) values('DF','Direct Fundraising');
insert into ref_event_types(event_type,event_type_desc) values('DC','Direct Candidate Support');
insert into ref_event_types(event_type,event_type_desc) values('EA','Exempt Activities');
insert into ref_event_types(event_type,event_type_desc) values('PC','Public Communications Referring Only to Party (made by PAC)');




CREATE TABLE public.sched_h5
( cmte_id character varying(9) NOT NULL,
  report_id bigint NOT NULL,
  transaction_type_identifier character varying(12),
  transaction_id character varying(20) NOT NULL DEFAULT get_next_transaction_id('H5'::bpchar),  
  account_name character varying(90),  
  receipt_date date,
  total_amount_transferred numeric(12,2),
  voter_registration_amount numeric(12,2),
  voter_id_amount numeric(12,2),
  gotv_amount numeric(12,2),
  generic_campaign_amount numeric(12,2),  
  memo_code character varying(1),
  memo_text character varying(90),
  delete_ind character(1),
  create_date timestamp without time zone DEFAULT now(),
  last_update_date timestamp without time zone DEFAULT now(),
  CONSTRAINT sched_h5_transaction_id_pk PRIMARY KEY (transaction_id));