

ALTER TABLE public.committee_lookup RENAME TO committee_master;

ALTER TABLE public.ref_form_types RENAME form_tooltip  TO form_info;

ALTER TABLE public.ref_rpt_types DROP COLUMN last_update_date;

ALTER TABLE public.ref_rpt_types
    ADD COLUMN rpt_type_info character varying(1000);

ALTER TABLE public.ref_rpt_types
    ADD COLUMN last_update_date timestamp DEFAULT NOW(); 


update public.ref_rpt_types set rpt_type_info='Quarterly reports must be filed no later than April 15, July 15, October 15 and January 31 of the following calendar year. Each such report must disclose all transactions from the last report filed through the last day of the calendar quarter. A quarterly report is not required to be filed if a Pre-Election Report is required to be filed during the period beginning on the 5th day and ending on the 15th day after the close of  the calendar quarter.'
where rpt_type like 'Q%';

update public.ref_rpt_types set rpt_type_info='Need language from RAD' where rpt_type not like 'Q%';
