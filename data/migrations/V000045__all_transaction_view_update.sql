drop view all_transactions_view;

CREATE OR REPLACE VIEW public.all_transactions_view AS
 SELECT sa.cmte_id,
    sa.report_id,
    sa.line_number,
    'sched_a' as transaction_table,	
    sa.transaction_type,
    rt.transaction_type_desc,
    rt.transaction_type_mini_desc,
    sa.transaction_id,
    sa.back_ref_transaction_id,
    sa.back_ref_sched_name,
    sa.entity_id,
        CASE
            WHEN e.entity_type::text = ANY (ARRAY['IND'::character varying, 'CAN'::character varying]::text[]) THEN ((e.last_name::text || ','::text) || e.first_name::text)::character varying
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
    sa.purpose_description,
    sa.memo_code,
    sa.memo_text,
    sa.election_code,
    sa.election_other_description,
    sa.delete_ind,
    sa.create_date,
    sa.last_update_date
   FROM sched_a sa
     JOIN entity e ON e.entity_id::text = sa.entity_id::text
     LEFT JOIN ref_transaction_type rt ON rt.transaction_type::text = sa.transaction_type::text;
