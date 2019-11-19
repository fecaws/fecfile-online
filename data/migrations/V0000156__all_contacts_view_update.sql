
CREATE OR REPLACE VIEW public.reports_view AS 
 SELECT reports.report_id,
    reports.form_type,
    reports.amend_ind,
    reports.amend_number,
    reports.cmte_id,
    reports.report_type,
    ref_rpt_types.rpt_type_desc AS report_type_desc,
    reports.cvg_start_date,
    reports.cvg_end_date,
    reports.due_date,
    reports.superceded_report_id,
    reports.previous_report_id,
        CASE
            WHEN reports.status::text = 'Submitted'::text THEN 'Filed'::text
            WHEN reports.status::text = 'Saved'::text THEN 'Saved'::text
            WHEN reports.status::text = 'Failed'::text THEN 'Failed'::text
            ELSE NULL::text
        END AS status,
    reports.filed_date,
    reports.fec_id,
    reports.fec_accepted_date,
    reports.fec_status,
    reports.most_recent_flag,
    reports.delete_ind,
    reports.create_date,
    reports.last_update_date
   FROM reports
     LEFT JOIN ref_rpt_types ON reports.report_type::text = ref_rpt_types.rpt_type::text
UNION
 SELECT forms_committeeinfo.id AS report_id,
    forms_committeeinfo.form_type,
    'N'::character varying AS amend_ind,
    0 AS amend_number,
    forms_committeeinfo.committeeid AS cmte_id,
    forms_committeeinfo.reason AS report_type,
    NULL::character varying AS report_type_desc,
    NULL::date AS cvg_start_date,
    NULL::date AS cvg_end_date,
    NULL::date AS due_date,
    NULL::bigint AS superceded_report_id,
    NULL::bigint AS previous_report_id,
        CASE
            WHEN forms_committeeinfo.is_submitted = true THEN 'Filed'::text
            WHEN forms_committeeinfo.is_submitted = false THEN 'Saved'::text
            WHEN forms_committeeinfo.is_failed = true THEN 'Failed'::text
            ELSE NULL::text
        END AS status,
        CASE
            WHEN forms_committeeinfo.is_submitted = true THEN forms_committeeinfo.updated_at
            ELSE NULL::timestamp with time zone
        END AS filed_date,
    forms_committeeinfo.id AS fec_id,
    NULL::timestamp without time zone AS fec_accepted_date,
    NULL::character varying AS fec_status,
    'Y'::character varying AS most_recent_flag,
        CASE
            WHEN forms_committeeinfo.isdeleted = true THEN 'Y'::text
            ELSE NULL::text
        END AS delete_ind,
    NULL::timestamp without time zone AS create_date,
    forms_committeeinfo.updated_at AS last_update_date
   FROM forms_committeeinfo;


CREATE OR REPLACE VIEW public.all_contacts_view AS 
 SELECT e.cmte_id,
    e.entity_id AS id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying::text, 'CAN'::character varying::text]) THEN ((((initcap(e.last_name::text) || COALESCE(', '::text || initcap(e.first_name::text), ''::text)) || COALESCE(', '::text || initcap(e.middle_name::text), ''::text)) || COALESCE(', '::text || initcap(e.preffix::text), ''::text)) || COALESCE(', '::text || initcap(e.suffix::text), ''::text))::character varying
            ELSE e.entity_name
        END AS name,
    e.entity_type AS type,
    e.street_1 AS street1,
    e.street_2 AS street2,
    e.city,
    e.state,
    e.zip_code AS zip,
    e.occupation,
    e.employer,
    e.cand_office AS candoffice,
    e.cand_office_state AS candofficestate,
    e.cand_office_district AS candofficedistrict,
    e.phone_number,
    e.ref_cand_cmte_id AS candcmteid,
    e.delete_ind AS deletedflag,
        CASE
            WHEN e.delete_ind = 'Y'::bpchar THEN e.last_update_date
            ELSE NULL::timestamp without time zone
        END AS deleteddate
   FROM entity e
  ORDER BY e.last_update_date DESC;





