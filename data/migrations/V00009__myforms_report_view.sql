
-- Remove Duplicate reports from ref table 
update ref_forms_vs_reports set filing_freq='M' where trim(report_type)='M4';
create table rf_temp as  select * From ref_forms_vs_reports;

delete from ref_forms_vs_reports;

insert into ref_forms_vs_reports(form_type,report_type,filing_freq)
select distinct trim(form_type),trim(report_type),trim(filing_freq) from rf_temp;

drop table rf_temp;


--Table for form due dates
create table public.cmte_current_due_reports(
cmte_id  character varying(9), 
form_type character varying(5), 
report_type character varying(5), 
due_date date,
last_update_date timestamp default now(),
PRIMARY KEY (cmte_id,form_type,report_type)
);

--sample date form form due dates
insert into cmte_current_due_reports(cmte_id,form_type,report_type,due_date)
select  cmte_id,form_type, 'YE','01/31/2019' from 
 ref_cmte_type_vs_forms rc  
join committee_master cm 
  on cm.cmte_type=rc.cmte_type 
 and cm.cmte_dsgn=rc.cmte_dsgn
where cmte_filing_freq in ('M','Q') and form_type in ('F3X','F3P','F3');

--View for my forms left menu
create or replace view my_forms_view as 
select cm.cmte_id,rc.category,rc.form_type,ccd.due_date,rf.form_description,rf.form_info 
from
 (ref_cmte_type_vs_forms rc  
 join ref_form_types rf 
 on rf.form_type=rc.form_type
 join committee_master cm 
  on rc.cmte_type=cm.cmte_type
  and rc.cmte_dsgn=cm.cmte_dsgn) 
  Left outer join cmte_current_due_reports ccd 
  on ccd.cmte_id=cm.cmte_id and ccd.form_type=rc.form_type;


create or replace view public.cmte_report_types_view as 
select
       cm.cmte_id,
       rf.filing_freq,
       rc.form_type,
       rf.report_type,
       rpt_type_desc,
       regular_special_report_ind,
       rpt_type_info,
       rpt_type_order    
from  (committee_master cm 
join ref_cmte_type_vs_forms rc  
on rc.cmte_type=cm.cmte_type
  and rc.cmte_dsgn=cm.cmte_dsgn)
join ref_forms_vs_reports rf 
 on rc.form_type=rf.form_type
and cm.cmte_filing_freq=rf.filing_freq 
join ref_rpt_types rrt on rrt.rpt_type=rf.report_type;



 
