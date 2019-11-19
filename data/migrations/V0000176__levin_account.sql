create sequence levin_account_id_seq;
CREATE TABLE public.levin_account
(
    levin_account_id numeric NOT NULL DEFAULT nextval('levin_account_id_seq'::regclass),
	cmte_id character varying(9),
	levin_account_name character varying(200),
	delete_ind character(1) ,
    create_date timestamp without time zone DEFAULT now(),
    last_update_date timestamp without time zone DEFAULT now()
	);
