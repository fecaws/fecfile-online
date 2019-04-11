CREATE TABLE public.sched_b
(
    cmte_id character varying(9) ,
    report_id bigint NOT NULL,
    line_number character varying(8) ,
    transaction_type character varying(12) ,
    transaction_id character varying(20),
    back_ref_transaction_id character varying(20),
    back_ref_sched_name character varying(8),
    entity_id character varying(20),
    expenditure_date date NOT NULL,
    expenditure_amount numeric(12,2) NOT NULL,
    semi_annual_refund_bundled_amount numeric(12,2) NOT NULL,
    expenditure_purpose character varying(100),
    category_code character varying(3),
    memo_code character varying(1) ,
    memo_text character varying(100) ,
    election_code character varying(5) ,
    election_other_description character varying(20),
    beneficiary_cmte_id character varying(9),
    beneficiary_cand_id character varying(9),
    other_name character varying(200),
    other_street_1 character varying(34),
    other_street_2 character varying(34),
    other_city character varying(30),
    other_state character varying(2),
    other_zip character varying(9),
    nc_soft_account character varying(9),    
    delete_ind character(1) ,
    create_date timestamp without time zone DEFAULT now(),
    last_update_date timestamp without time zone DEFAULT now(),
    CONSTRAINT sched_b_transaction_id_pk PRIMARY KEY (transaction_id)
);

CREATE INDEX idx_sched_b_cmte_id ON sched_b(cmte_id );
CREATE INDEX idx_sched_b_contribution_date ON sched_b(expenditure_date);
CREATE INDEX idx_sched_b_line_number ON sched_b(line_number );
CREATE INDEX idx_sched_b_report_id ON sched_b(report_id);
CREATE INDEX idx_sched_b_transaction_id ON sched_b(transaction_id );
   
