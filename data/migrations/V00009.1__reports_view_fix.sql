create or replace view public.cmte_report_types_view as 
select
      cm.cmte_id,
      rf.filing_freq,
      rc.form_type,
      rf.report_type,
      rpt_type_desc,
      rrt.regular_special_report_ind,
      rpt_type_info,
      rpt_type_order,
      cvg_start_date,
      cvg_end_date,
      due_date
from  ((committee_master cm
join ref_cmte_type_vs_forms rc
on rc.cmte_type=cm.cmte_type
 and rc.cmte_dsgn=cm.cmte_dsgn)
join ref_forms_vs_reports rf
on rc.form_type=rf.form_type
and (cm.cmte_filing_freq=rf.filing_freq  or rf.filing_freq  IS NULL)
join ref_rpt_types rrt on rrt.rpt_type=rf.report_type)
left outer join due_dates dd on dd.report_type=rf.report_type and report_year=extract(year from current_date) and rrt.regular_special_report_ind='R';


--View for my forms left menu
create or replace view my_forms_view as 
select cm.cmte_id,rc.category,rc.form_type,ccd.due_date,rf.form_description,rf.form_info,rf.form_pdf_url
from
 (ref_cmte_type_vs_forms rc  
 join ref_form_types rf 
 on rf.form_type=rc.form_type
 join committee_master cm 
  on rc.cmte_type=cm.cmte_type
  and rc.cmte_dsgn=cm.cmte_dsgn) 
  Left outer join cmte_current_due_reports ccd 
  on ccd.cmte_id=cm.cmte_id and ccd.form_type=rc.form_type;

update due_dates set report_year=extract( YEAR from cvg_end_date);
