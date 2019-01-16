-- Matching with front-end Object
create or replace  view transaction_category_json_view as 
with trans_category as (    
with categories as (
with sub_category as (
select  
	form_type,
    category_type,
    category_order,
    sub_category_type,
    sub_category_order,
    json_agg(
json_build_object('type','radio',
                  'text',tran_type,
                  'name',regexp_replace(lower(sub_category_type),'[^a-zA-Z0-9]', '-','g'),
                  'value',regexp_replace(lower(tran_type),'[^a-zA-Z0-9]', '-','g'),
                  'infoIcon',tran_type_info_icon,
                  'info',tran_type_info) order by tran_type_order)as json_by_tran     
from transaction_categories
 group by form_type,
    category_type,
    category_order,
    sub_category_type,
	sub_category_order )
select
	form_type,
    category_type, 
    category_order,
    json_agg(
    json_build_object('text',sc.sub_category_type,
                      'name', regexp_replace(lower(sc.sub_category_type),'[^a-zA-Z0-9]', '-','g'),
                  	  'value',regexp_replace(lower(sc.sub_category_type),'[^a-zA-Z0-9]', '-','g'),
                      'infoIcon',(select tc.sub_category_type_info_icon from transaction_categories tc 
                                  		where tc.form_type=sc.form_type and tc.category_type=sc.category_type
                                  		  and tc.sub_category_type=sc.sub_category_type limit 1),
                  	  'info',(select tc.sub_category_type_info from transaction_categories tc 
                                  		where tc.form_type=sc.form_type and tc.category_type=sc.category_type
                                  		  and tc.sub_category_type=sc.sub_category_type limit 1),
                  	  'options',sc.json_by_tran)  order by sc.sub_category_order) as json_by_sub_category
from sub_category sc
    group by form_type,category_type,category_order)
select
    form_type,        
    json_agg(
    json_build_object('text',category_type,
                      'value',regexp_replace(lower(category_type),'[^a-zA-Z0-9]', '-','g'),
                      'options',json_by_sub_category) order by category_order) as json_transaction_type
FROM categories group by form_type)
SELECT form_type,json_build_object('data',json_build_object('transactionCategories',json_transaction_type,
                         'cashOnHand',(select json_build_object('text','Cash on Hand','value','cash-on-hand','showCashOnHand','true')),
                         'steps',(select json_agg(json_build_object('text',sequence_desc,'step',sequence_order)) from form_wizard_steps fw where fw.form_type='F3X' group by fw.form_type),
                         'transactionSearchField',(select json_build_object('text','transaction-search','type','text','placeholder','Search for transaction'))
                        )) as transaction_category_json  from trans_category;
