DO
$$
BEGIN
IF not EXISTS (SELECT column_name 
               FROM information_schema.columns 
               WHERE table_schema='public' and table_name='transaction_categories' and column_name='sched_type') THEN
ALTER TABLE public.transaction_categories
    ADD COLUMN sched_type character varying(10);
else
raise NOTICE 'Already exists';
END IF;
END
$$	
;
update ref_transaction_types set sched_type='sched_a' where sched_type='sched_l_a';
update ref_transaction_types set sched_type='sched_b' where sched_type='sched_l_b';
update transaction_categories t set  sched_type = (select a.sched_type from ref_transaction_types a where tran_identifier=tran_type_identifier and sched_type is not null);


-- View: public.transaction_category_json_view

-- DROP VIEW public.transaction_category_json_view;

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
                            ( SELECT json_agg(json_build_object('type', 'radio', 'text', trc.tran_type, 'name', regexp_replace(lower(trc.sub_category_type::text), '[^a-zA-Z0-9]'::text, '-'::text, 'g'::text), 'value', trc.tran_type_identifier, 'infoIcon', trc.tran_type_info_icon, 'info', trc.tran_type_info,'scheduleType',trc.sched_type) ORDER BY trc.tran_type_order) AS json_agg
                                   FROM transaction_categories trc
                                  WHERE trc.form_type::text = tc.form_type::text AND trc.cmte_type_category::text = tc.cmte_type_category::text AND trc.category_type::text = tc.category_type::text AND trc.sub_category_type::text = tc.sub_category_type::text AND trc.tran_type IS NOT NULL AND trc.is_functional = true) AS json_by_tran
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




CREATE OR REPLACE FUNCTION public.get_sub_transaction_json(
	p_form_type character varying,
	p_tran_identifier character varying)
    RETURNS json
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

declare
v_json JSON;
v_parent_tran_id integer;
v_tran_identifier character varying(90);
is_parent boolean;
is_earmark boolean;
begin
/* This will give the sub-transactions when you enter a parent or child transaction identifier*/

	select  COALESCE (parent_tran_id, null,0) into v_parent_tran_id 
    	from ref_transaction_types 
        	where form_type=p_form_type 
              and tran_identifier=p_tran_identifier;
			 
              
    if v_parent_tran_id > 0 then
    /*If this is a child then find parent*/
    	is_parent = false;
		select  tran_identifier  into v_tran_identifier from   ref_transaction_types 
        	where form_type=p_form_type and ref_tran_id=v_parent_tran_id;			
	else
    	is_parent = true;
        v_tran_identifier = p_tran_identifier;
    end if;
	
	if upper(p_tran_identifier) like '%EAR%' then
		is_earmark = true;
	else
		is_earmark = false;
	end if;		
    
	SELECT json_agg(json_build_object('transactionType', parent.tran_identifier, 
                                                         'transactionTypeDescription', parent.tran_desc, 
                                                         'scheduleType', parent.sched_type, 
                                                         'subTransactionType', child.tran_identifier, 
                                                         'subScheduleType', child.sched_type,                                                         
                                                         'subTransactionTypeDescription', child.tran_desc,
                                      					'api_call',(case when parent.sched_type ='sched_a' then '/sa/schedA'
                                                                    	 when parent.sched_type ='sched_b' then '/sb/schedB'
																		 when parent.sched_type ='sched_c' then '/sc/schedC'
																	     when parent.sched_type ='sched_d' then '/sd/schedD'																	
																		 when parent.sched_type ='sched_h1' then '/sh/schedH1'
																		 when parent.sched_type ='sched_h2' then '/sh/schedH2'
																		 when parent.sched_type ='sched_h3' then '/sh/schedH3'
																		 when parent.sched_type ='sched_h4' then '/sh/schedH4'
																	     when parent.sched_type ='sched_h5' then '/sh/schedH5'
																		 when parent.sched_type ='sched_h6' then '/sh/schedH6'
                                                                    	else '/sa/schedA'
                                                                   end),
                                                         'isParent',is_parent,
									  					 'isEarmark',is_earmark
                                                        )) into v_json
           FROM ref_transaction_types parent
            JOIN ref_transaction_types child ON parent.ref_tran_id = child.parent_tran_id
            where parent.tran_identifier=v_tran_identifier
			 and parent.auto_generate = false;/* Excluding auto generated transactions*/
return v_json;
end;

$BODY$;

 
