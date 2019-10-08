DO
$$
BEGIN
IF not EXISTS (SELECT column_name 
               FROM information_schema.columns 
               WHERE table_schema='public' and table_name='reports' and column_name='submission_id') THEN
alter table reports add submission_id character varying(36);
else
raise NOTICE 'Already exists';
END IF;
END
$$	
;


DO
$$
BEGIN
IF not EXISTS (SELECT column_name 
               FROM information_schema.columns 
               WHERE table_schema='public' and table_name='reports' and column_name='image_number') THEN
alter table reports add image_number bigint;
else
raise NOTICE 'Already exists';
END IF;
END
$$	
;



DROP VIEW public.all_contacts_view;
DROP VIEW public.all_transactions_view;

CREATE OR REPLACE VIEW public.all_transactions_view AS
 SELECT sa.cmte_id,
    sa.report_id,
    sa.line_number,
    'sched_a'::text AS transaction_table,
    sa.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sa.transaction_type_identifier,
    sa.transaction_id,
    sa.back_ref_transaction_id,
    sa.back_ref_sched_name,
    sa.entity_id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying::text, 'CAN'::character varying::text]) THEN ((((initcap(e.last_name::text) || COALESCE(', '::text || initcap(e.first_name::text), ''::text)) || COALESCE(', '::text || initcap(e.middle_name::text), ''::text)) || COALESCE(', '::text || initcap(e.preffix::text), ''::text)) || COALESCE(', '::text || initcap(e.suffix::text), ''::text))::character varying
            ELSE e.entity_name
        END AS name,
    e.street_1,
    e.street_2,
    e.city,
    e.state,
    e.zip_code,
    e.occupation,
    e.employer,
    sa.contribution_date AS transaction_date,
    sa.contribution_amount AS transaction_amount,
    sa.aggregate_amt,
    sa.purpose_description,
    sa.memo_code,
    sa.memo_text,
    sa.election_code,
    sa.election_other_description,
    sa.delete_ind,
    sa.create_date,
    sa.last_update_date,
    sa.itemized_ind AS itemized,
    '/sa/schedA'::text AS api_call,
    rt.category_type
   FROM sched_a sa
     JOIN entity e ON e.entity_id::text = sa.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sa.transaction_type_identifier::text
UNION ALL
 SELECT sb.cmte_id,
    sb.report_id,
    sb.line_number,
    'sched_b'::text AS transaction_table,
    sb.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sb.transaction_type_identifier,
    sb.transaction_id,
    sb.back_ref_transaction_id,
    sb.back_ref_sched_name,
    sb.entity_id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying::text, 'CAN'::character varying::text]) THEN ((((initcap(e.last_name::text) || COALESCE(', '::text || initcap(e.first_name::text), ''::text)) || COALESCE(', '::text || initcap(e.middle_name::text), ''::text)) || COALESCE(', '::text || initcap(e.preffix::text), ''::text)) || COALESCE(', '::text || initcap(e.suffix::text), ''::text))::character varying
            ELSE e.entity_name
        END AS name,
    e.street_1,
    e.street_2,
    e.city,
    e.state,
    e.zip_code,
    e.occupation,
    e.employer,
    sb.expenditure_date AS transaction_date,
    sb.expenditure_amount AS transaction_amount,
    sb.aggregate_amt,
    sb.expenditure_purpose AS purpose_description,
    sb.memo_code,
    sb.memo_text,
    sb.election_code,
    sb.election_other_description,
    sb.delete_ind,
    sb.create_date,
    sb.last_update_date,
    sb.itemized_ind AS itemized,
    '/sb/schedB'::text AS api_call,
    rt.category_type
   FROM sched_b sb
     JOIN entity e ON e.entity_id::text = sb.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sb.transaction_type_identifier::text
UNION ALL
 SELECT sd.cmte_id,
    sd.report_id,
    sd.line_num AS line_number,
    'sched_d'::text AS transaction_table,
    sd.transaction_type,
    rt.tran_desc AS transaction_type_desc,
    sd.transaction_type_identifier,
    sd.transaction_id,
    ''::text AS back_ref_transaction_id,
    ''::text AS back_ref_sched_name,
    sd.entity_id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying::text, 'CAN'::character varying::text]) THEN ((((initcap(e.last_name::text) || COALESCE(', '::text || initcap(e.first_name::text), ''::text)) || COALESCE(', '::text || initcap(e.middle_name::text), ''::text)) || COALESCE(', '::text || initcap(e.preffix::text), ''::text)) || COALESCE(', '::text || initcap(e.suffix::text), ''::text))::character varying
            ELSE e.entity_name
        END AS name,
    e.street_1,
    e.street_2,
    e.city,
    e.state,
    e.zip_code,
    e.occupation,
    e.employer,
    NULL::date AS transaction_date,
    sd.incurred_amount AS transaction_amount,
    NULL::numeric AS aggregate_amt,
    sd.purpose AS purpose_description,
    ''::text AS memo_code,
    ''::text AS memo_text,
    ''::text AS election_code,
    ''::text AS election_other_description,
    sd.delete_ind,
    sd.create_date,
    sd.last_update_date,
    NULL::text AS itemized,
    '/sd/schedD'::text AS api_call,
    rt.category_type
   FROM sched_d sd
     JOIN entity e ON e.entity_id::text = sd.entity_id::text
     JOIN ref_transaction_types rt ON rt.tran_identifier::text = sd.transaction_type_identifier::text;
 


CREATE OR REPLACE VIEW public.all_contacts_view AS
 SELECT e.cmte_id,
    e.entity_id AS id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying::text, 'CAN'::character varying::text]) THEN ((((initcap(e.last_name::text) || COALESCE(', '::text || initcap(e.first_name::text), ''::text)) || COALESCE(', '::text || initcap(e.middle_name::text), ''::text)) || COALESCE(', '::text || initcap(e.preffix::text), ''::text)) || COALESCE(', '::text || initcap(e.suffix::text), ''::text))::character varying
            ELSE e.entity_name
        END AS name,
    e.entity_type,
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
        END AS deleteddate,
    ( SELECT count('a') AS active_transactions_cnt
           FROM all_transactions_view atvw
          WHERE atvw.cmte_id::text = e.cmte_id::text AND atvw.entity_id::text = e.entity_id::text AND (atvw.delete_ind <> 'Y'::bpchar OR atvw.delete_ind IS NULL)) AS active_transactions_cnt
   FROM entity e
  ORDER BY e.last_update_date DESC;
  


  
