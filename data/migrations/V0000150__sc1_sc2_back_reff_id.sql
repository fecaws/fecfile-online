alter table sched_c1 add column back_ref_transaction_id character varying(20);
alter table sched_c1 add column back_ref_sched_name character varying(8);
alter table sched_c2 add column back_ref_transaction_id character varying(20);
alter table sched_c2 add column back_ref_sched_name character varying(8);
