ALTER TABLE public.sched_a
  ADD COLUMN transaction_type_identifier character varying(12);

ALTER TABLE public.sched_b
  ADD COLUMN transaction_type_identifier character varying(12);
