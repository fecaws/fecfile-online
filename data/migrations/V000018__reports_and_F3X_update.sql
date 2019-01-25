drop table public.reports;

CREATE TABLE public.reports
(
    report_id bigint NOT NULL,
    form_type character varying(9) NOT NULL,
    amend_ind character varying(1) NOT NULL,
    amend_number integer,
    cmte_id character varying(9) NOT NULL,
    report_type character varying(10),
    cvg_start_date date,
    cvg_end_date date,
    due_date date,
    superceded_report_id bigint,
    previous_report_id bigint,
    status character varying(90),
    filed_date timestamp,        
    fec_id bigint,
    fec_accepted_date timestamp,
    fec_status character varying(90),
    most_recent_flag character varying(1) DEFAULT 'Y',
    delete_ind character(1),
    create_date timestamp DEFAULT NOW(),
    last_update_date timestamp DEFAULT NOW(),
    PRIMARY KEY (report_id)
)
WITH (
    OIDS = FALSE
);

create index idx_reports_cmte_id on public.reports(cmte_id);
create index idx_reports_form_type on public.reports(form_type);
create index idx_reports_report_type on public.reports(report_type);
create index idx_reports_cvg_start_dt on public.reports(cvg_start_date);
create index idx_reports_cvg_end_dt on public.reports(cvg_end_date);



drop table public.form_3x;

create table public.form_3x
(
        report_id           bigint NOT NULL,
    	form_type character varying(9) NOT NULL,
	amend_ind character varying(1) NOT NULL,
        cmte_id             character varying (9),
        cmte_nm             character varying (200),
        cmte_addr_chg_flag  character varying (1),
        cmte_street_1       character varying (34),
        cmte_street_2       character varying (34),
        cmte_city           character varying (30),
        cmte_state          character varying (2),
        cmte_zip            character varying (9),
        report_type         character varying (3),
        election_code       character varying (5),
        date_of_election    timestamp without time zone,
        state_of_election   character varying(2) ,
        cvg_start_dt timestamp without time zone,
        cvg_end_dt timestamp without time zone,
        qual_cmte_flag character varying(1) ,
        treasurer_last_name character varying(30),
        treasurer_first_name character varying(20),
        treasurer_middle_name character varying(20),
        treasurer_prefix character varying(10),
        treasurer_suffix character varying(10),
        date_signed timestamp without time zone,
        coh_bop numeric(14,2),
        ttl_receipts_sum_page_per numeric(14,2),
        subttl_sum_page_per numeric(14,2),
        ttl_disb_sum_page_per numeric(14,2),
        coh_cop numeric(14,2),
        debts_owed_to_cmte numeric(14,2),
        debts_owed_by_cmte numeric(14,2),
        indv_item_contb_per numeric(14,2),
        indv_unitem_contb_per numeric(14,2),
        ttl_indv_contb numeric(14,2),
        pol_pty_cmte_contb_per_i numeric(14,2),
        other_pol_cmte_contb_per_i numeric(14,2),
        ttl_contb_col_ttl_per numeric(14,2),
        tranf_from_affiliated_pty_per numeric(14,2),
        all_loans_received_per numeric(14,2),
        loan_repymts_received_per numeric(14,2),
        offsets_to_op_exp_per_i numeric(14,2),
        fed_cand_contb_ref_per numeric(14,2),
        other_fed_receipts_per numeric(14,2),
        tranf_from_nonfed_acct_per numeric(14,2),
        tranf_from_nonfed_levin_per numeric(14,2),
        ttl_nonfed_tranf_per numeric(14,2),
        ttl_receipts_per numeric(14,2),
        ttl_fed_receipts_per numeric(14,2),
        shared_fed_op_exp_per numeric(14,2),
        shared_nonfed_op_exp_per numeric(14,2),
        other_fed_op_exp_per numeric(14,2),
        ttl_op_exp_per numeric(14,2),
        tranf_to_affliliated_cmte_per numeric(14,2),
        fed_cand_cmte_contb_per numeric(14,2),
        indt_exp_per numeric(14,2),
        coord_exp_by_pty_cmte_per numeric(14,2),
        loan_repymts_made_per numeric(14,2),
        loans_made_per numeric(14,2),
        indv_contb_ref_per numeric(14,2),
        pol_pty_cmte_contb_per_ii numeric(14,2),
        other_pol_cmte_contb_per_ii numeric(14,2),
        ttl_contb_ref_per_i numeric(14,2),
        other_disb_per numeric(14,2),
        shared_fed_actvy_fed_shr_per numeric(14,2),
        shared_fed_actvy_nonfed_per numeric(14,2),
        non_alloc_fed_elect_actvy_per numeric(14,2),
        ttl_fed_elect_actvy_per numeric(14,2),
        ttl_disb_per numeric(14,2),
        ttl_fed_disb_per numeric(14,2),
        ttl_contb_per numeric(14,2),
        ttl_contb_ref_per_ii numeric(14,2),
        net_contb_per numeric(14,2),
        ttl_fed_op_exp_per numeric(14,2),
        offsets_to_op_exp_per_ii numeric(14,2),
        net_op_exp_per numeric(14,2),
        coh_begin_calendar_yr numeric(14,2),
        calendar_yr numeric(4,0),
        ttl_receipts_sum_page_ytd numeric(14,2),
        subttl_sum_ytd numeric(14,2),
        ttl_disb_sum_page_ytd numeric(14,2),
        coh_coy numeric(14,2),
        indv_item_contb_ytd numeric(14,2),
        indv_unitem_contb_ytd numeric(14,2),
        ttl_indv_contb_ytd numeric(14,2),
        pol_pty_cmte_contb_ytd_i numeric(14,2),
        other_pol_cmte_contb_ytd_i numeric(14,2),
        ttl_contb_col_ttl_ytd numeric(14,2),
        tranf_from_affiliated_pty_ytd numeric(14,2),
        all_loans_received_ytd numeric(14,2),
        loan_repymts_received_ytd numeric(14,2),
        offsets_to_op_exp_ytd_i numeric(14,2),
        fed_cand_cmte_contb_ytd numeric(14,2),
        other_fed_receipts_ytd numeric(14,2),
        tranf_from_nonfed_acct_ytd numeric(14,2),
        tranf_from_nonfed_levin_ytd numeric(14,2),
        ttl_nonfed_tranf_ytd numeric(14,2),
        ttl_receipts_ytd numeric(14,2),
        ttl_fed_receipts_ytd numeric(14,2),
        shared_fed_op_exp_ytd numeric(14,2),
        shared_nonfed_op_exp_ytd numeric(14,2),
        other_fed_op_exp_ytd numeric(14,2),
        ttl_op_exp_ytd numeric(14,2),
        tranf_to_affilitated_cmte_ytd numeric(14,2),
        fed_cand_cmte_contb_ref_ytd numeric(14,2),
        indt_exp_ytd numeric(14,2),
        coord_exp_by_pty_cmte_ytd numeric(14,2),
        loan_repymts_made_ytd numeric(14,2),
        loans_made_ytd numeric(14,2),
        indv_contb_ref_ytd numeric(14,2),
        pol_pty_cmte_contb_ytd_ii numeric(14,2),
        other_pol_cmte_contb_ytd_ii numeric(14,2),
        ttl_contb_ref_ytd_i numeric(14,2),
        other_disb_ytd numeric(14,2),
        shared_fed_actvy_fed_shr_ytd numeric(14,2),
        shared_fed_actvy_nonfed_ytd numeric(14,2),
        non_alloc_fed_elect_actvy_ytd numeric(14,2),
        ttl_fed_elect_actvy_ytd numeric(14,2),
        ttl_disb_ytd numeric(14,2),
        ttl_fed_disb_ytd numeric(14,2),
        ttl_contb_ytd numeric(14,2),
        ttl_contb_ref_ytd_ii numeric(14,2),
        net_contb_ytd numeric(14,2),
        ttl_fed_op_exp_ytd numeric(14,2),
        offsets_to_op_exp_ytd_ii numeric(14,2),
        net_op_exp_ytd numeric(14,2),
        delete_ind character(1),
        create_date timestamp without time zone default now(),
        last_update_date timestamp without time zone default now(),
	PRIMARY KEY (report_id)
)    
with (
    oids = false
);

create index idx_form_3x_report_id on public.form_3x(report_id);
create index idx_form_3x_cmte_id on public.form_3x(cmte_id);




--Sched_A table
delete sched_a;
create table sched_a
(
   cmte_id                   	character varying (9) 	NOT NULL,
   report_id		     	bigint			NOT NULL,
   line_number               	character varying (8) 	NOT NULL, 
   transaction_type          	character varying (12)	NOT NULL,
   transaction_id            	character varying (20) 	default  get_next_transaction_id('SA'),
   back_ref_transaction_id   	character varying (20),
   back_ref_sched_name       	character varying (8),
   entity_id                 	character varying (20),
   contribution_date         	date 			NOT NULL,
   contribution_amount       	numeric (12, 2) 	NOT NULL,
   purpose_description       	character varying (100),
   memo_code                 	character varying (1),
   memo_text                 	character varying (100),
   election_code             	character varying (5),
   election_other_description 	character varying (20),
   delete_ind 			character(1),
   create_date               	timestamp 		default now (),
   last_update_date          	timestamp 		default now (),
   CONSTRAINT sched_a_transaction_id_pk PRIMARY KEY (transaction_id)
);

 
CREATE INDEX sched_a_transaction_id_idx ON public.sched_a (transaction_id);    
CREATE INDEX sched_a_cmte_id_idx ON public.sched_a USING btree (cmte_id);
CREATE INDEX sched_a_report_id_idx ON public.sched_a USING btree (report_id);
CREATE INDEX sched_a_contribution_date_idx ON public.sched_a USING btree (contribution_date);
CREATE INDEX sched_a_line_number_idx ON public.sched_a USING btree (line_number);
