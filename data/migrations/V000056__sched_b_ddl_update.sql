DROP TABLE public.sched_b;

CREATE TABLE public.sched_b
(
    cmte_id character varying(9) COLLATE pg_catalog."default",
    report_id bigint NOT NULL,
    line_number character varying(8) COLLATE pg_catalog."default",
    transaction_type character varying(12) COLLATE pg_catalog."default",
    transaction_id character varying(20) COLLATE pg_catalog."default" NOT NULL DEFAULT get_next_transaction_id('SB'::bpchar),
    back_ref_transaction_id character varying(20) COLLATE pg_catalog."default",
    back_ref_sched_name character varying(8) COLLATE pg_catalog."default",
    entity_id character varying(20) COLLATE pg_catalog."default",
    expenditure_date date NOT NULL,
    expenditure_amount numeric(12,2) NOT NULL,
    semi_annual_refund_bundled_amount numeric(12,2) NOT NULL,
    expenditure_purpose character varying(100) COLLATE pg_catalog."default",
    category_code character varying(3) COLLATE pg_catalog."default",
    memo_code character varying(1) COLLATE pg_catalog."default",
    memo_text character varying(100) COLLATE pg_catalog."default",
    election_code character varying(5) COLLATE pg_catalog."default",
    election_other_description character varying(20) COLLATE pg_catalog."default",
    beneficiary_cmte_id character varying(9) COLLATE pg_catalog."default",
    beneficiary_cand_id character varying(9) COLLATE pg_catalog."default",
    other_name character varying(200) COLLATE pg_catalog."default",
    other_street_1 character varying(34) COLLATE pg_catalog."default",
    other_street_2 character varying(34) COLLATE pg_catalog."default",
    other_city character varying(30) COLLATE pg_catalog."default",
    other_state character varying(2) COLLATE pg_catalog."default",
    other_zip character varying(9) COLLATE pg_catalog."default",
    nc_soft_account character varying(9) COLLATE pg_catalog."default",
    delete_ind character(1) COLLATE pg_catalog."default",
    create_date timestamp without time zone DEFAULT now(),
    last_update_date timestamp without time zone DEFAULT now(),
    CONSTRAINT sched_b_transaction_id_pk PRIMARY KEY (transaction_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.sched_b
    OWNER to fecdbuser;

-- Index: idx_sched_b_cmte_id

-- DROP INDEX public.idx_sched_b_cmte_id;

CREATE INDEX idx_sched_b_cmte_id
    ON public.sched_b USING btree
    (cmte_id COLLATE pg_catalog."default")
    TABLESPACE pg_default;

-- Index: idx_sched_b_contribution_date

-- DROP INDEX public.idx_sched_b_contribution_date;

CREATE INDEX idx_sched_b_contribution_date
    ON public.sched_b USING btree
    (expenditure_date)
    TABLESPACE pg_default;

-- Index: idx_sched_b_line_number

-- DROP INDEX public.idx_sched_b_line_number;

CREATE INDEX idx_sched_b_line_number
    ON public.sched_b USING btree
    (line_number COLLATE pg_catalog."default")
    TABLESPACE pg_default;

-- Index: idx_sched_b_report_id

-- DROP INDEX public.idx_sched_b_report_id;

CREATE INDEX idx_sched_b_report_id
    ON public.sched_b USING btree
    (report_id)
    TABLESPACE pg_default;

-- Index: idx_sched_b_transaction_id

-- DROP INDEX public.idx_sched_b_transaction_id;

CREATE INDEX idx_sched_b_transaction_id
    ON public.sched_b USING btree
    (transaction_id COLLATE pg_catalog."default")
    TABLESPACE pg_default;      
