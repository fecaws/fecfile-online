DROP VIEW public.reports_view;

CREATE OR REPLACE VIEW public.reports_view AS 
 SELECT reports.report_id,
    reports.form_type,
    reports.amend_ind,
    reports.amend_number,
    reports.cmte_id,
    reports.report_type,
    ref_rpt_types.rpt_type_desc as report_type_desc,
    reports.cvg_start_date,
    reports.cvg_end_date,
    reports.due_date,
    reports.superceded_report_id,
    reports.previous_report_id,
    reports.status,
    reports.filed_date,
    reports.fec_id,
    reports.fec_accepted_date,
    reports.fec_status,
    reports.most_recent_flag,
    reports.delete_ind,
    reports.create_date,
    reports.last_update_date
   FROM reports  left outer  join ref_rpt_types on reports.report_type=ref_rpt_types.rpt_type
UNION
 SELECT forms_committeeinfo.id AS report_id,
    forms_committeeinfo.form_type,
    'N'::character varying AS amend_ind,
    0 AS amend_number,
    forms_committeeinfo.committeeid AS cmte_id,
    forms_committeeinfo.reason AS report_type,
    NULL as report_type_desc,
    NULL::date AS cvg_start_date,
    NULL::date AS cvg_end_date,
    NULL::date AS due_date,
    NULL::bigint AS superceded_report_id,
    NULL::bigint AS previous_report_id,
        CASE
            WHEN forms_committeeinfo.isdeleted = true THEN 'Deleted'::text
            WHEN forms_committeeinfo.is_submitted = true THEN 'Submitted'::text
            WHEN forms_committeeinfo.is_submitted = false THEN 'Saved'::text
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
            WHEN forms_committeeinfo.isdeleted = true THEN 'X'::text
            ELSE NULL::text
        END AS delete_ind,
    NULL::timestamp without time zone AS create_date,
    forms_committeeinfo.updated_at AS last_update_date
   FROM forms_committeeinfo;