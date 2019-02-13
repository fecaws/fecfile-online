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

