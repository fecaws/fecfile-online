
CREATE OR REPLACE VIEW public.transaction_category_json_view AS
 WITH trans_category AS (
         WITH categories AS (
                 WITH sub_category AS (
                         SELECT tc.form_type,
                            tc.cmte_type_category,
                            tc.category_type,
                            tc.category_order,
                            tc.sub_category_type,
                            tc.sub_category_order,
                            ( SELECT json_agg(json_build_object('type', 'radio', 'text', trc.tran_type, 'name', regexp_replace(lower(trc.sub_category_type::text), '[^a-zA-Z0-9]'::text, '-'::text, 'g'::text), 'value', trc.tran_type_identifier, 'infoIcon', trc.tran_type_info_icon, 'info', trc.tran_type_info) ORDER BY trc.tran_type_order) AS json_agg
                                   FROM transaction_categories trc
                                  WHERE trc.form_type::text = tc.form_type::text AND trc.cmte_type_category::text = tc.cmte_type_category::text AND trc.category_type::text = tc.category_type::text AND trc.sub_category_type::text = tc.sub_category_type::text AND trc.tran_type IS NOT NULL and trc.is_functional=true) AS json_by_tran
                           FROM transaction_categories tc
                          GROUP BY tc.form_type, tc.cmte_type_category, tc.category_type, tc.category_order, tc.sub_category_type, tc.sub_category_order
                        )
                 SELECT sc.form_type,
                    sc.cmte_type_category,
                    sc.category_type,
                    sc.category_order,
                    json_agg(json_build_object('text', sc.sub_category_type, 'name', regexp_replace(lower(sc.sub_category_type::text), '[^a-zA-Z0-9]'::text, '-'::text, 'g'::text), 'value', regexp_replace(lower(sc.sub_category_type::text), '[^a-zA-Z0-9]'::text, '-'::text, 'g'::text), 'infoIcon', ( SELECT tc.sub_category_type_info_icon
                           FROM transaction_categories tc
                          WHERE tc.form_type::text = sc.form_type::text AND tc.cmte_type_category::text = sc.cmte_type_category::text AND tc.category_type::text = sc.category_type::text AND tc.sub_category_type::text = sc.sub_category_type::text
                         LIMIT 1), 'info', ( SELECT tc.sub_category_type_info
                           FROM transaction_categories tc
                          WHERE tc.form_type::text = sc.form_type::text AND tc.cmte_type_category::text = sc.cmte_type_category::text AND tc.category_type::text = sc.category_type::text AND tc.sub_category_type::text = sc.sub_category_type::text
                         LIMIT 1), 'options', COALESCE(sc.json_by_tran, '[]'::json)) ORDER BY sc.sub_category_order) AS json_by_sub_category
                   FROM sub_category sc
                  GROUP BY sc.form_type, sc.cmte_type_category, sc.category_type, sc.category_order
                )
         SELECT categories.form_type,
            categories.cmte_type_category,
            json_agg(json_build_object('text', categories.category_type, 'value', regexp_replace(lower(categories.category_type::text), '[^a-zA-Z0-9]'::text, '-'::text, 'g'::text), 'options', categories.json_by_sub_category) ORDER BY categories.category_order) AS json_transaction_type
           FROM categories
          GROUP BY categories.form_type, categories.cmte_type_category
        )
 SELECT trans_category.form_type,
    trans_category.cmte_type_category,
    json_build_object('data', json_build_object('transactionCategories', trans_category.json_transaction_type, 'cashOnHand', ( SELECT json_build_object('text', 'Cash on Hand', 'value', 'cash-on-hand', 'showCashOnHand', 'true') AS json_build_object), 'steps', ( SELECT json_agg(json_build_object('text', fw.sequence_desc, 'step', fw.sequence_order)) AS json_agg
           FROM form_wizard_steps fw
          WHERE fw.form_type::text = 'F3X'::text
          GROUP BY fw.form_type), 'transactionSearchField', ( SELECT json_build_object('text', 'transaction-search', 'type', 'text', 'placeholder', 'Search for transaction') AS json_build_object))) AS transaction_category_json
   FROM trans_category;

ALTER TABLE public.transaction_category_json_view
    OWNER TO fecdbuser;


