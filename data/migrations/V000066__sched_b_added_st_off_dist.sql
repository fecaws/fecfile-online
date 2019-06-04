ALTER TABLE public.sched_b
  ADD COLUMN beneficiary_cand_office character varying (1);

ALTER TABLE public.sched_b
  ADD COLUMN beneficiary_cand_state character varying (2);

ALTER TABLE public.sched_b
  ADD COLUMN beneficiary_cand_district character varying(3);

