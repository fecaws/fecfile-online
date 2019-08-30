ALTER TABLE public.sched_b
    ALTER COLUMN semi_annual_refund_bundled_amount DROP NOT NULL;

ALTER TABLE public.reports DROP CONSTRAINT reports_pkey;

ALTER TABLE public.reports ADD COLUMN report_seq bigint default nextval('report_id_seq');

ALTER TABLE public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (report_seq);
