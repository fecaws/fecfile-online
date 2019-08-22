DROP VIEW public.all_contacts_view;

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
    e.employer
   FROM entity e
   order by last_update_date desc
