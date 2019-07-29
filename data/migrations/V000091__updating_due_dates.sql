--Update FF for test committee
update committee_master set cmte_filing_freq='M' where cmte_id='C01234567';

--deleting old due dates
delete from cmte_current_due_reports;

--adding new due dates
INSERT INTO public.cmte_current_due_reports(cmte_id, form_type, report_type, due_date)    
select cmte_id,'F3','Q3','10/15/2019'::date from committee_master where  cmte_type in ('H','S') and cmte_filing_freq='Q'
union
select cmte_id,'F3P','Q3','10/15/2019'::date from committee_master where  cmte_type in ('P') and cmte_filing_freq='Q'
union
select cmte_id,'F3X','M8','10/20/2019'::date from committee_master where  cmte_type not in ('H','S','P') and cmte_filing_freq='M'
union
select cmte_id,'F3X','Q3','10/15/2019'::date from committee_master where  cmte_type not in ('H','S','P') and cmte_filing_freq='Q' and cmte_id like 'C00%'


