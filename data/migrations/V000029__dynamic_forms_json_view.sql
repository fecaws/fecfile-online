CREATE OR REPLACE FUNCTION public.get_field_validations_json(p_df_id integer)
    RETURNS json
    LANGUAGE 'plpgsql' 
AS $BODY$

declare
v_json JSON;
begin
/* Desired way of doing, will work with frontend and check if posible 
select json_agg(json_build_object('name',validation_type,'validator',validation_rule,'message',validation_message)) INTO v_json 
from dynamic_form_fields_validation  where df_id=p_df_id;
*/
select 
json_build_object('required',true) INTO v_json
from dynamic_form_fields_validation  where validation_type='required'  and  df_id=p_df_id;
return v_json;
end;
$BODY$;


create or replace  view transaction_subcategory_json_view as 
WITH tran_sub_category as (
select distinct form_type, category_type,sub_category_type,sub_category_type_info,category_order, sub_category_order FROM transaction_categories trc where form_type='F3X'
order by category_order, sub_category_order)
select form_type, json_agg(json_build_object( 'value', lower(replace(sub_category_type,' ','-')),
                          'text', sub_category_type,
                          'type', category_type,
                          'info', sub_category_type_info) order by category_order, sub_category_order) as tran_subcategory					
 From tran_sub_category group by form_type;




CREATE OR REPLACE VIEW public.dynamic_forms_view AS
   WITH dy_forms_by_section AS (
         SELECT dynamic_form_fields.form_type,
            dynamic_form_fields.transaction_type,
            dynamic_form_fields.field_section,
            dynamic_form_fields.field_section_order,
            json_agg(json_build_object('text', dynamic_form_fields.field_label, 
                                       'infoIcon', dynamic_form_fields.field_infoicon, 
                                       'infoText', dynamic_form_fields.field_info, 
                                       'name', replace(dynamic_form_fields.field_label::text, ' '::text, ''::text), 
                                       'type', dynamic_form_fields.field_type, 
                                       'validation', public.get_field_validations_json(dynamic_form_fields.df_id)) 
                     ORDER BY dynamic_form_fields.field_order) AS json_by_section
           FROM dynamic_form_fields
          GROUP BY dynamic_form_fields.form_type, dynamic_form_fields.transaction_type, dynamic_form_fields.field_section, dynamic_form_fields.field_section_order
        )
 SELECT dfbs.form_type,
    dfbs.transaction_type,
    json_build_object('data', json_build_object('formFields', json_agg(json_build_object('cols', dfbs.json_by_section) ORDER BY dfbs.field_section_order), 
						'states', (SELECT json_agg(json_build_object('name', ref_states.state_description, 'code', ref_states.state_code) order by st_number) 
							   FROM ref_states), 
						'transactionCategories', (SELECT tran_subcategory FROM transaction_subcategory_json_view tsjv
          WHERE tsjv.form_type::text = dfbs.form_type::text))) AS form_fields
   FROM dy_forms_by_section dfbs
  GROUP BY dfbs.form_type, dfbs.transaction_type;

