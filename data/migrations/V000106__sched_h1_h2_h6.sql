create table sched_h1 (
	cmte_id character varying(9) COLLATE pg_catalog."default",
    report_id bigint NOT NULL,
    line_number character varying(8) COLLATE pg_catalog."default",
    transaction_type_identifier character varying(40) COLLATE pg_catalog."default",
    transaction_type character varying(12) COLLATE pg_catalog."default",
    transaction_id character varying(20) COLLATE pg_catalog."default" NOT NULL DEFAULT get_next_transaction_id('H1'::bpchar),
    presidential_only boolean,
    presidential_and_senate boolean,
    senate_only boolean,
    non_pres_and_non_senate boolean,
    federal_percent numeric(3,2),
    non_federal_percent numeric(3,2),
    adminstrative boolean,
    generic_voter_drive boolean,
    public_communications boolean,
    delete_ind character(1) COLLATE pg_catalog."default",
    create_date timestamp without time zone DEFAULT now(),
    last_update_date timestamp without time zone DEFAULT now(),
    CONSTRAINT sched_h1_transaction_id_pk PRIMARY KEY (transaction_id));
    
create table sched_h2 (
	cmte_id character varying(9) COLLATE pg_catalog."default",
    report_id bigint NOT NULL,
    line_number character varying(8) COLLATE pg_catalog."default",
    transaction_type_identifier character varying(40) COLLATE pg_catalog."default",
    transaction_type character varying(12) COLLATE pg_catalog."default",
    transaction_id character varying(20) COLLATE pg_catalog."default" NOT NULL DEFAULT get_next_transaction_id('H2'::bpchar),
    activity_event_name character varying(90) COLLATE pg_catalog."default",
    fundraising boolean,
    direct_cand_support boolean,
    ratio_code character varying(1) COLLATE pg_catalog."default",  
    federal_percent numeric(3,2),
    non_federal_percent numeric(3,2),            
    delete_ind character(1) COLLATE pg_catalog."default",
    create_date timestamp without time zone DEFAULT now(),
    last_update_date timestamp without time zone DEFAULT now(),
    CONSTRAINT sched_h2_transaction_id_pk PRIMARY KEY (transaction_id));

create table sched_h6 (
	cmte_id character varying(9) COLLATE pg_catalog."default",
    report_id bigint NOT NULL,
    line_number character varying(8) COLLATE pg_catalog."default",
    transaction_type_identifier character varying(40) COLLATE pg_catalog."default",
    transaction_type character varying(12) COLLATE pg_catalog."default",
    transaction_id character varying(20) COLLATE pg_catalog."default" NOT NULL DEFAULT get_next_transaction_id('H6'::bpchar),
    back_ref_transaction_id character varying(20) COLLATE pg_catalog."default",
    back_ref_sched_name character varying(8) COLLATE pg_catalog."default",
    entity_id character varying(20) COLLATE pg_catalog."default",
    account_event_identifier character varying(90) COLLATE pg_catalog."default",
    expenditure_date date,
    total_fed_levin_amount numeric(12,2),
    federal_share numeric(12,2),
    levin_share numeric(12,2),
    activity_event_total_ytd numeric(12,2),
    expenditure_purpose character varying(100) COLLATE pg_catalog."default",
    category_code  character varying(3) COLLATE pg_catalog."default",
    activity_event_type character varying(20) COLLATE pg_catalog."default",
    memo_code character varying(1) COLLATE pg_catalog."default",
    memo_text character varying(90) COLLATE pg_catalog."default",
    delete_ind character(1) COLLATE pg_catalog."default",
    create_date timestamp without time zone DEFAULT now(),
    last_update_date timestamp without time zone DEFAULT now(),
    CONSTRAINT sched_h6_transaction_id_pk PRIMARY KEY (transaction_id));
    
ALTER TABLE public.sched_a    ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_b    ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_c    ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_c1   ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_c2   ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_d    ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_e    ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_f    ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_h1   ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_h2   ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_h3   ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_h4   ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_h5   ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;
ALTER TABLE public.sched_h6   ALTER COLUMN transaction_type_identifier TYPE character varying(40) ;

 
	 
     
     
