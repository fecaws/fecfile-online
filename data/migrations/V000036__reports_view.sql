create or replace view reports_view as 
SELECT report_id, form_type, amend_ind, amend_number, cmte_id, report_type, cvg_start_date, cvg_end_date, due_date, superceded_report_id, previous_report_id, status,
	   filed_date, fec_id, fec_accepted_date, fec_status, most_recent_flag, delete_ind, create_date, last_update_date
	FROM public.reports
union    
SELECT id,form_type,'N',0,committeeid,reason,null,null,null,null,null,(case when isdeleted = true then 'Deleted'  when is_submitted = true then'Submitted' when is_submitted = false then'Saved' end) status,
	   (case when is_submitted =true then updated_at else null end),id,null,null,'Y', (case when isdeleted=true then 'X' else null end),null,updated_at
FROM public.forms_committeeinfo;

