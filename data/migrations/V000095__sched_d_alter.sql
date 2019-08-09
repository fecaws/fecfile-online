DROP TABLE public.sched_d;

CREATE TABLE public.sched_d
(
  cmte_id character varying(9) NOT NULL,
  report_id bigint NOT NULL,
  line_num character varying(8) NOT NULL,
  transaction_type_identifier character varying(12),
  transaction_id character varying(20) NOT NULL DEFAULT get_next_transaction_id('SD'::bpchar),
  creditor_entity_id character varying(20),
  purpose character varying(100),
  beginning_balance numeric(12,2),
  incurred_amount numeric(12,2),
  payment_amount numeric(12,2),
  balance_at_close numeric(12,2),
  delete_ind character(1),
  create_date timestamp without time zone DEFAULT now(),
  last_update_date timestamp without time zone DEFAULT now(),
  CONSTRAINT sched_d_transaction_id_pk PRIMARY KEY (transaction_id)
)
WITH (
  OIDS=FALSE
);
