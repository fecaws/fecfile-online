
-- forms_committeeinfo table add columns

alter table public.forms_committeeinfo
  add column fec_id bigint;

alter table public.forms_committeeinfo
  add column fec_accepted_date timestamp without time zone;

alter table public.forms_committeeinfo
  add column fec_status character varying(90);


