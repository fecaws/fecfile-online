create sequence upload_log_id_seq;
CREATE TABLE public.upload_logs
(
    upload_log_id bigint NOT NULL DEFAULT nextval('upload_log_id_seq'::regclass),
    report_id numeric not null,    
    cmte_id character varying(9) not null,
    process_name character varying(90),
    message_type character varying(90),
    message_text text ,
    response_json text ,
    error_code character varying(90),
    error_json text ,
    app_error text ,	
    host_name character varying (90),
    create_date timestamp without time zone DEFAULT now(),
    CONSTRAINT parser_logs_pk PRIMARY KEY (upload_log_id)
);
