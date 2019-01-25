--Sequence for all transactions table. Re-sets after the max value
CREATE SEQUENCE public.transaction_id_seq
    CYCLE
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9999999999;
    
--Function for Transaction Id Sequence.   Format: TTYYYYYMMDDSSSSSSS
CREATE OR REPLACE FUNCTION public.get_next_transaction_id (p_sched character)
    RETURNS character
    LANGUAGE 'plpgsql'
AS $BODY$
begin
return upper(substr(p_sched,1,2))||(TO_CHAR(current_date,'YYYYMMDD'):: bigint * 1000000000) + nextval('transaction_id_seq'):: bigint ;
end;
$BODY$;

--Sched_A table
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
   create_date               	timestamp 		default now (),
   last_update_date          	timestamp 		default now (),
   CONSTRAINT sched_a_transaction_id_pk PRIMARY KEY (transaction_id)
);

 
CREATE INDEX sched_a_transaction_id_idx ON public.sched_a (transaction_id);    
CREATE INDEX sched_a_cmte_id_idx ON public.sched_a USING btree (cmte_id);
CREATE INDEX sched_a_report_id_idx ON public.sched_a USING btree (report_id);
CREATE INDEX sched_a_contribution_date_idx ON public.sched_a USING btree (contribution_date);
CREATE INDEX sched_a_line_number_idx ON public.sched_a USING btree (line_number);
