alter table sched_d
add column back_ref_transaction_id character varying(20) ;

alter table sched_d
add column back_ref_sched_name character varying(8) ;

