Delete from cmte_current_due_reports
where cmte_id in ('C00693218', 'C00693267', 'C00693309');

INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00693218', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';

INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00693267', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';

INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00693309', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';

update committee_master set cmte_type='Q' where cmte_id in ('C00693218','C00693267', 'C00693309');
update committee_master set cmte_dsgn='B' where cmte_id in ('C00693218','C00693267', 'C00693309');
update committee_master set cmte_filing_freq='M' where cmte_id in ('C00693218','C00693267', 'C00693309');


