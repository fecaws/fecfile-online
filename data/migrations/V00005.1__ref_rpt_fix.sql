ALTER TABLE public.ref_rpt_types DROP COLUMN last_update_date;

ALTER TABLE public.ref_rpt_types
    ADD COLUMN regular_special_report_ind character varying(1);

ALTER TABLE public.ref_rpt_types
    ADD COLUMN last_update_date timestamp DEFAULT NOW(); 
    
update ref_rpt_types
	set regular_special_report_ind='R',
    	last_update_date=now()
	where rpt_type like 'M%' or rpt_type  like 'Q%'  or rpt_type ='24' or rpt_type='48' or  rpt_type='TER';

update ref_rpt_types
	set regular_special_report_ind='S',
        last_update_date=now()
  where regular_special_report_ind is null;

ALTER TABLE public.due_dates DROP COLUMN last_update_date;

ALTER TABLE public.due_dates
    ADD COLUMN report_year integer;

ALTER TABLE public.due_dates
    ADD COLUMN last_update_date timestamp DEFAULT NOW(); 
