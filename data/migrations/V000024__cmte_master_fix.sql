DROP VIEW public.report_type_and_due_dates_view;
DROP VIEW public.cmte_report_types_view ;
DROP VIEW public.my_forms_view;



ALTER TABLE public.committee_master
    ALTER COLUMN cmte_id TYPE character varying(9) ;

ALTER TABLE public.committee_master
    ALTER COLUMN cmte_name TYPE character varying(200) ;

ALTER TABLE public.committee_master
    ALTER COLUMN street_1 TYPE character varying(34) ;

ALTER TABLE public.committee_master
    ALTER COLUMN street_2 TYPE character varying(34) ;

ALTER TABLE public.committee_master
    ALTER COLUMN city TYPE character varying(30) ;

ALTER TABLE public.committee_master
    ALTER COLUMN state TYPE character varying(2) ;

ALTER TABLE public.committee_master
    ALTER COLUMN zip_code TYPE character varying(9) ;

ALTER TABLE public.committee_master
    ALTER COLUMN cmte_email_1 TYPE character varying(100) ;

ALTER TABLE public.committee_master
    ALTER COLUMN cmte_email_2 TYPE character varying(100) ;

ALTER TABLE public.committee_master
    ALTER COLUMN phone_number TYPE character varying(30) ;

ALTER TABLE public.committee_master
    ALTER COLUMN cmte_type TYPE character varying(1) ;

ALTER TABLE public.committee_master
    ALTER COLUMN cmte_dsgn TYPE character varying(1) ;

ALTER TABLE public.committee_master
    ALTER COLUMN cmte_filing_freq TYPE character varying(1) ;

ALTER TABLE public.committee_master
    ALTER COLUMN cmte_filed_type TYPE character varying(1) ;

ALTER TABLE public.committee_master
    ALTER COLUMN treasurer_last_name TYPE character varying(90) ;

ALTER TABLE public.committee_master
    ALTER COLUMN treasurer_first_name TYPE character varying(90) ;

ALTER TABLE public.committee_master
    ALTER COLUMN treasurer_middle_name TYPE character varying(90) ;

ALTER TABLE public.committee_master
    ALTER COLUMN treasurer_prefix TYPE character varying(10) ;

ALTER TABLE public.committee_master
    ALTER COLUMN treasurer_suffix TYPE character varying(10) ;


ALTER TABLE public.committee_master
    RENAME CONSTRAINT committee_lookup_pkey TO committee_master_pkey;

ALTER TABLE public.committee_master DROP COLUMN last_update_date;

ALTER TABLE public.committee_master
    ADD COLUMN create_date timestamp without time zone default now();

ALTER TABLE public.committee_master
    ADD COLUMN last_update_date timestamp without time zone default now();

create index idx_committee_master_cmte_id on committee_master(cmte_id);
create index idx_committee_master_cmte_type on committee_master USING btree (cmte_type);
create index idx_committee_master_cmte_dsgn on committee_master USING btree (cmte_dsgn);




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
     JOIN ref_cmte_type_vs_forms rc ON rc.cmte_type::bpchar = cm.cmte_type AND rc.cmte_dsgn::bpchar = cm.cmte_dsgn
     JOIN ref_forms_vs_reports rf ON rc.form_type::text = rf.form_type::text AND (cm.cmte_filing_freq = rf.filing_freq::bpchar OR rf.filing_freq IS NULL)
     JOIN ref_rpt_types rrt ON rrt.rpt_type::text = rf.report_type::text
     LEFT JOIN due_dates dd ON dd.report_type::text = rf.report_type::text AND dd.report_year::double precision = date_part('year'::text, CURRENT_DATE) AND rrt.regular_special_report_ind::text = 'R'::text;



CREATE OR REPLACE VIEW public.my_forms_view AS
 SELECT cm.cmte_id,
    rc.category,
    ccd.due_date,
    rf.form_description,
    rf.form_info,
    rf.form_pdf_url,
    rc.form_type,
    replace(rc.form_type::text, 'F'::text, ''::text) AS form_type_mini
   FROM ref_cmte_type_vs_forms rc
     JOIN ref_form_types rf ON rf.form_type::text = rc.form_type::text
     JOIN committee_master cm ON rc.cmte_type::bpchar = cm.cmte_type AND rc.cmte_dsgn::bpchar = cm.cmte_dsgn
     LEFT JOIN cmte_current_due_reports ccd ON ccd.cmte_id::bpchar = cm.cmte_id AND ccd.form_type::text = rc.form_type::text;





CREATE OR REPLACE VIEW public.report_type_and_due_dates_view AS
 WITH duedate_by_report AS (
         WITH duedate AS (
                 SELECT t.report_type,
                    t.election_state,
                    json_agg(json_build_object('election_date,', t.election_date, 'cvg_start_date', t.cvg_start_date, 'cvg_end_date', t.cvg_end_date, 'due_date', t.due_date)) AS dates
                   FROM ( SELECT DISTINCT due_dates.report_type,
                            due_dates.election_state,
                            due_dates.election_date,
                            due_dates.cvg_start_date,
                            due_dates.cvg_end_date,
                            due_dates.due_date
                           FROM due_dates
                          WHERE due_dates.report_year::double precision = (date_part('year'::text, CURRENT_DATE) - 1::double precision)
                        UNION
                         SELECT 'TER'::character varying,
                            NULL::character varying,
                            NULL::date,
                            NULL::date,
                            CURRENT_DATE AS "current_date",
                            NULL::date) t
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
    ('{ "report_type":'::text || json_agg(json_build_object('report_type', duedate_by_report.report_type, 'report_type_desciption', rrt.rpt_type_desc, 'report_type_info', rrt.rpt_type_info, 'regular_special_report_ind', rrt.regular_special_report_ind, 'default_disp_ind', is_default_report(cr.cmte_id, duedate_by_report.report_type::bpchar), 'election_state', duedate_by_report.json_by_state) ORDER BY rrt.rpt_type_order)) || '}'::text AS report_types_json
   FROM duedate_by_report
     JOIN ref_rpt_types rrt ON duedate_by_report.report_type::text = rrt.rpt_type::text
     JOIN cmte_report_types_view cr ON cr.report_type::text = duedate_by_report.report_type::text
  GROUP BY cr.cmte_id, cr.form_type;
