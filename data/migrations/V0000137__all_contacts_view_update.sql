alter table entity add column phone_number Numeric(10); 

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
    e.delete_ind as deletedFlag
   FROM entity e
  ORDER BY e.last_update_date DESC;
