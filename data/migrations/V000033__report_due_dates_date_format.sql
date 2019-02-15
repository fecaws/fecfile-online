CREATE OR REPLACE VIEW public.report_type_and_due_dates_view AS
 WITH duedate_by_report AS (
         WITH duedate AS (
                 SELECT t.report_type,
                    t.election_state,
                    json_agg(json_build_object('election_date', t.election_date, 'cvg_start_date', t.cvg_start_date, 'cvg_end_date', t.cvg_end_date, 'due_date', t.due_date)) AS dates
                   FROM ( SELECT DISTINCT due_dates.report_type,
                            due_dates.election_state,
                            to_char(due_dates.election_date, 'MM/DD/YYYY') as election_date ,
                            to_char(due_dates.cvg_start_date, 'MM/DD/YYYY') as cvg_start_date,
                            to_char(due_dates.cvg_end_date,'MM/DD/YYYY') as cvg_end_date,
                            to_char(due_dates.due_date,'MM/DD/YYYY') as due_date
                           FROM due_dates
                          WHERE due_dates.report_year::double precision = (date_part('year'::text, CURRENT_DATE) - 1::double precision)) t
                  GROUP BY t.report_type, t.election_state
                )
         SELECT duedate.report_type,
            json_agg(json_build_object('state', duedate.election_state, 'state_description', rs.state_description, 'dates', duedate.dates)) AS json_by_state
           FROM duedate
             LEFT JOIN ref_states rs ON duedate.election_state::text = rs.state_code::text
          GROUP BY duedate.report_type
        )
 SELECT cr.cmte_id,
    cr.form_type,
    ('{ "report_type":'::text || json_agg(json_build_object('report_type', duedate_by_report.report_type, 'report_type_desciption', rrt.rpt_type_desc, 'report_type_info', rrt.rpt_type_info, 'regular_special_report_ind', rrt.regular_special_report_ind, 'default_disp_ind', is_default_report(cr.cmte_id::bpchar, duedate_by_report.report_type::bpchar), 'election_state', duedate_by_report.json_by_state) ORDER BY rrt.rpt_type_order)) || '}'::text AS report_types_json
   FROM duedate_by_report
     JOIN ref_rpt_types rrt ON duedate_by_report.report_type::text = rrt.rpt_type::text
     JOIN cmte_report_types_view cr ON cr.report_type::text = duedate_by_report.report_type::text
  GROUP BY cr.cmte_id, cr.form_type;






update  due_dates set cvg_start_date=to_date('01/01/'||report_year,'MM/DD/YYYY')
where regular_special_report_ind='R' 
and report_type='Q1';

update  due_dates set cvg_start_date=to_date('04/01/'||report_year,'MM/DD/YYYY')
where regular_special_report_ind='R' 
and report_type='Q2';


update  due_dates set cvg_start_date=to_date('07/01/'||report_year,'MM/DD/YYYY')
where regular_special_report_ind='R' 
and report_type='Q3';

update  due_dates set cvg_start_date=to_date('01/01/'||report_year,'MM/DD/YYYY')
where regular_special_report_ind='R' 
and report_type='MY';




update dynamic_form_fields set field_section='Official Use Only 1' where field_order in (20,21);
update dynamic_form_fields set field_section='Official Use Only 2' where field_order in (22,23);
update dynamic_form_fields set field_section='Official Use Only 3' where field_order in (24);


