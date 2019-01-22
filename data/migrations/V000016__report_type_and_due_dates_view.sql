CREATE OR REPLACE FUNCTION public.is_default_report(
	p_cmte_id character,
	p_report_type character)
    RETURNS character
    LANGUAGE 'plpgsql'
AS $BODY$

begin
IF EXISTS (SELECT 1 FROM cmte_current_due_reports ccdr WHERE ccdr.cmte_id = p_cmte_id	and report_type=p_report_type ) THEN	
	return	'Y' ;
ELSE 
	return 'N';
END IF;
end;

$BODY$;


create or replace view report_type_and_due_dates_view as 
WITH duedate_by_report as ( 
		with duedate as (select
                                report_type,
                                election_state,                                
                                json_agg(
                                    json_build_object('election_date,',election_date,'cvg_start_date', cvg_start_date,'cvg_end_date', cvg_end_date,'due_date',due_date)) as   dates
                                                                from (select distinct report_type,election_state,election_date,cvg_start_date, cvg_end_date,due_date  
                                                                      from due_dates where report_year=extract(year from current_date)-1) t
                                group by 
                                report_type,
                                election_state)
					select
					report_type,
					json_agg(
					json_build_object('state',election_state,'state_description', rs.state_description, 'dates',dates)) as json_by_state
					from duedate  left outer join ref_states rs on election_state=rs.state_code					
					group by report_type)
					select
                                cmte_id,
                                form_type,
                                '{ "report_type":' ||
                                json_agg(
                                json_build_object(
                                'report_type',duedate_by_report.report_type,
                                'report_type_desciption',rrt.rpt_type_desc,
                                'report_type_info',rrt.rpt_type_info,
                                'regular_special_report_ind',rrt.regular_special_report_ind,
                                'default_disp_ind',public.is_default_report(cmte_id,duedate_by_report.report_type ), 
                                'election_state',json_by_state) ORDER BY rrt.rpt_type_order)||'}' as report_types_json
                                from duedate_by_report 
                                join ref_rpt_types rrt on duedate_by_report.report_type=rrt.rpt_type
                                join cmte_report_types_view cr on cr.report_type=duedate_by_report.report_type                                                               
                                group by  cmte_id,
                                form_type;

