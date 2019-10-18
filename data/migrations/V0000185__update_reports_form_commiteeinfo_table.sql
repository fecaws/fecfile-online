
-- Reports table add columns

alter table public.reports
  add column begining_image_number bigint;

alter table public.reports
  add column message text;

alter table public.reports
  add column error_message text;

alter table public.reports
  add column uploaded_date timestamp without time zone DEFAULT now();




-- forms_committeeinfo table add columns

alter table public.forms_committeeinfo
  add column status character varying(90);

alter table public.forms_committeeinfo
  add column submission_id  character varying(36);

alter table public.forms_committeeinfo
  add column  image_number bigint;

alter table public.forms_committeeinfo
  add column begining_image_number bigint;

alter table public.forms_committeeinfo
  add column message text;

alter table public.forms_committeeinfo
  add column error_message text;

alter table public.forms_committeeinfo
  add column uploaded_date timestamp without time zone DEFAULT now();
