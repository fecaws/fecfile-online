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
        END AS deleteddate,
    ( SELECT count('a') AS active_transactions_cnt
           FROM all_transactions_view atvw
          WHERE atvw.cmte_id::text = e.cmte_id::text AND atvw.entity_id::text = e.entity_id::text AND (atvw.delete_ind <> 'Y'::bpchar OR atvw.delete_ind IS NULL)) AS active_transactions_cnt
   FROM entity e
  ORDER BY e.last_update_date DESC;
