update ref_rpt_types set regular_special_report_ind='R' where rpt_type='YE';

CREATE OR REPLACE VIEW public.cmte_report_types_view AS
 SELECT cm.cmte_id,
    rf.filing_freq,
    rc.form_type,
    rf.report_type,
    rrt.rpt_type_desc,
    rrt.regular_special_report_ind,
    rrt.rpt_type_info,
    rrt.rpt_type_order,
    dd.cvg_start_date,
    dd.cvg_end_date,
    dd.due_date,
    replace(rc.form_type::text, 'F'::text, ''::text) AS form_type_mini
   FROM committee_master cm
     JOIN ref_cmte_type_vs_forms rc ON rc.cmte_type::bpchar = cm.cmte_type::bpchar AND rc.cmte_dsgn::bpchar = cm.cmte_dsgn::bpchar
     JOIN ref_forms_vs_reports rf ON rc.form_type::text = rf.form_type::text AND (cm.cmte_filing_freq::bpchar = rf.filing_freq::bpchar OR rf.filing_freq IS NULL) AND cm.cmte_filing_freq in ('M','Q')
     JOIN ref_rpt_types rrt ON rrt.rpt_type::text = rf.report_type::text
     LEFT JOIN due_dates dd ON dd.report_type::text = rf.report_type::text AND dd.report_year::double precision = date_part('year'::text, CURRENT_DATE) AND rrt.regular_special_report_ind::text = 'R'::text;

update committee_master set cmte_filing_freq='M' where cmte_id='C00689968';


CREATE OR REPLACE VIEW public.report_type_and_due_dates_view AS
 WITH duedate_by_report AS (
         WITH duedate AS (
                 SELECT t.report_type,
                    t.election_state,
                    json_agg(json_build_object('election_date', t.election_date, 'cvg_start_date', t.cvg_start_date, 'cvg_end_date', t.cvg_end_date, 'due_date', t.due_date)) AS dates
                   FROM ( SELECT DISTINCT due_dates.report_type,
                            due_dates.election_state,
                            due_dates.election_date,
                            due_dates.cvg_start_date,
                            due_dates.cvg_end_date,
                            due_dates.due_date
                           FROM due_dates
                          WHERE due_dates.report_year::double precision = (date_part('year'::text, CURRENT_DATE) - 1::double precision)
                          UNION
						SELECT 'TER',NULL,NULL,current_date,current_date,null
                        ) t
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

