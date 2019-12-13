alter table sched_h1 add column back_ref_transaction_id character varying(20);
alter table sched_h1 add column back_ref_sched_name character varying(8);
alter table sched_h2 add column back_ref_transaction_id character varying(20);
alter table sched_h2 add column back_ref_sched_name character varying(8);
