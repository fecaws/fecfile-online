ALTER TABLE public.sched_f ADD COLUMN transaction_type VARCHAR(12);

DELETE FROM public.dynamic_form_fields WHERE transaction_type in ('COEXP_PARTY_DEBT');

INSERT INTO public.dynamic_form_fields(
    form_type, transaction_type, field_label, field_value, 
    field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
    field_is_readonly, field_validation, field_infoicon, field_info, 
    field_order, field_section, field_section_order, create_date, 
    last_update_date, field_db_name, class_name, height, width, scroll, 
    seperator, transaction_type_desc, field_input_group, field_input_icon, 
    child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
SELECT form_type, 'COEXP_PARTY_DEBT', field_label, field_value, 
field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
field_is_readonly, field_validation, field_infoicon, field_info, 
field_order, field_section, field_section_order, create_date, 
last_update_date, field_db_name, class_name, height, width, scroll, 
seperator, null, field_input_group, field_input_icon, 
child_form, form_sub_title, toggle, entity_group, entity_id_mapping
FROM public.dynamic_form_fields WHERE transaction_type = 'OPEXP';  

UPDATE public.dynamic_form_fields SET field_value = '/sf/schedF' WHERE field_db_name = 'api_call' AND transaction_type = 'COEXP_PARTY_DEBT'; 
UPDATE public.dynamic_form_fields SET field_value = '25' WHERE field_db_name = 'line_number' AND transaction_type = 'COEXP_PARTY_DEBT'; 
UPDATE public.dynamic_form_fields SET field_value = '24C' WHERE field_db_name = 'transaction_type' AND transaction_type = 'COEXP_PARTY_DEBT'; 
UPDATE public.dynamic_form_fields SET field_value='COEXP_PARTY_DEBT' WHERE transaction_type = 'COEXP_PARTY_DEBT' AND field_db_name = 'transaction_type_identifier';

UPDATE public.dynamic_form_fields SET field_is_readonly=true WHERE transaction_type = 'COEXP_PARTY_DEBT'
AND field_db_name in ('entity_type','entity_name','last_name','first_name','middle_name','prefix','suffix','street_1',
'street_2','city','state','zip_code');

UPDATE public.dynamic_form_fields SET field_db_name = 'purpose' WHERE field_db_name = 'expenditure_purpose' AND transaction_type = 'COEXP_PARTY_DEBT';
UPDATE public.dynamic_form_fields SET field_order = '34' WHERE field_db_name = 'line_number' AND transaction_type = 'COEXP_PARTY_DEBT';
UPDATE public.dynamic_form_fields SET field_order = '35' WHERE field_db_name = 'transaction_id' AND transaction_type = 'COEXP_PARTY_DEBT';
UPDATE public.dynamic_form_fields SET field_order = '36' WHERE field_db_name = 'back_ref_transaction_id' AND transaction_type = 'COEXP_PARTY_DEBT';
UPDATE public.dynamic_form_fields SET field_order = '37' WHERE field_db_name = 'back_ref_sched_name' AND transaction_type = 'COEXP_PARTY_DEBT';
UPDATE public.dynamic_form_fields SET field_order = '38' WHERE field_db_name = 'transaction_type' AND transaction_type = 'COEXP_PARTY_DEBT';
UPDATE public.dynamic_form_fields SET field_order = '39' WHERE field_db_name = 'transaction_type_identifier' AND transaction_type = 'COEXP_PARTY_DEBT';

UPDATE public.dynamic_form_fields SET field_value = '/sf/schedF' WHERE field_db_name = 'api_call' AND transaction_type = 'COEXP_PARTY_DEBT';


INSERT INTO public.dynamic_form_fields(
    form_type, transaction_type, field_label, field_value, 
    field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
    field_is_readonly, field_validation, field_infoicon, field_info, 
    field_order, field_section, field_section_order, field_db_name, class_name, height, width, scroll, 
    seperator, transaction_type_desc, field_input_group, field_input_icon, 
    child_form, form_sub_title, toggle, entity_group, entity_id_mapping) VALUES (
	'F3X','COEXP_PARTY_DEBT','Committee FEC ID',null,
	9,'text','input',true,false,
	true,'alphaNumeric',false,'',
	22,'Committee Section',11,'payee_cmte_id','col col-md-4','30px','197px',false,
	true,null,false,'',
	false,'',false,'','entity_id'), 
	('F3X','COEXP_PARTY_DEBT','Candidate Information','Candidate Information:',
	9,'text','label',true,false,
	false,'alphaNumeric',false,'',
	23,'Cand Form Section',12,'','col col-md-12 fieldset childForm','30px','197px',false,
	false,null,false,'',
	true,'Candidate Information:',false,'','entity_id'), 
	('F3X','COEXP_PARTY_DEBT','Aggregate General Election Expended','',
	12,'text','input',true,false,
	true,'dollarAmount',true,'Request language from RAD',
	15,'Amount Section',9,'aggregate_general_elec_exp','col col-md-4','30px','154px',false,
	true,null,true,'dollar-sign-icon',
	false,'',false,'','entity_id')
	;

UPDATE public.dynamic_form_fields SET field_is_required = false WHERE field_db_name = 'aggregate_general_elec_exp' AND transaction_type = 'COEXP_PARTY_DEBT';

INSERT INTO public.dynamic_form_fields(
    form_type, transaction_type, field_label, field_value, 
    field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
    field_is_readonly, field_validation, field_infoicon, field_info, 
    field_order, field_section, field_section_order, create_date, 
    last_update_date, field_db_name, class_name, height, width, scroll, 
    seperator, transaction_type_desc, field_input_group, field_input_icon, 
    child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
SELECT form_type, 'COEXP_PARTY_DEBT', field_label, field_value, 
field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
field_is_readonly, field_validation, field_infoicon, field_info, 
field_order, field_section, field_section_order, create_date, 
last_update_date, field_db_name, class_name, height, width, scroll, 
seperator, null, field_input_group, field_input_icon, 
child_form, form_sub_title, toggle, entity_group, entity_id_mapping
FROM public.dynamic_form_fields WHERE transaction_type = 'FEA_STAF_REIM_MEMO' AND 
field_db_name in ('cand_last_name','cand_first_name','cand_middle_name','cand_prefix',
'cand_suffix','beneficiary_cand_id','cand_office','cand_office_state','cand_office_district'
);

UPDATE public.dynamic_form_fields SET field_db_name = 'payee_cand_last_name', field_order='24', field_section_order='13' WHERE transaction_type = 'COEXP_PARTY_DEBT' 
AND field_db_name = 'cand_last_name';

UPDATE public.dynamic_form_fields SET field_db_name = 'payee_cand_fist_name', field_order='25', field_section_order='13' WHERE transaction_type = 'COEXP_PARTY_DEBT' 
AND field_db_name = 'cand_first_name';

UPDATE public.dynamic_form_fields SET field_db_name = 'payee_cand_middle_name', field_order='26', field_section_order='13' WHERE transaction_type = 'COEXP_PARTY_DEBT' 
AND field_db_name = 'cand_middle_name';

UPDATE public.dynamic_form_fields SET field_db_name = 'payee_cand_prefix', field_order='27', field_section_order='14' WHERE transaction_type = 'COEXP_PARTY_DEBT' 
AND field_db_name = 'cand_prefix';

UPDATE public.dynamic_form_fields SET field_db_name = 'payee_cand_suffix', field_order='28', field_section_order='14' WHERE transaction_type = 'COEXP_PARTY_DEBT' 
AND field_db_name = 'cand_suffix';

UPDATE public.dynamic_form_fields SET field_db_name = 'payee_cand_id', field_order='29', field_section_order='15' WHERE transaction_type = 'COEXP_PARTY_DEBT' 
AND field_db_name = 'beneficiary_cand_id';

UPDATE public.dynamic_form_fields SET field_label = 'Office', field_db_name = 'payee_cand_office', field_order='30', field_section_order='16' WHERE transaction_type = 'COEXP_PARTY_DEBT' 
AND field_db_name = 'cand_office';

UPDATE public.dynamic_form_fields SET field_label = 'State', field_db_name = 'payee_cand_state', field_order='31', field_section_order='16' WHERE transaction_type = 'COEXP_PARTY_DEBT' 
AND field_db_name = 'cand_office_state';

UPDATE public.dynamic_form_fields SET field_label = 'District', field_db_name = 'payee_cand_district', field_order='32', field_section_order='16' WHERE transaction_type = 'COEXP_PARTY_DEBT' 
AND field_db_name = 'cand_office_district';

UPDATE public.dynamic_form_fields SET field_is_required = false WHERE field_db_name = 'aggregate_general_elec_exp' AND transaction_type = 'COEXP_PARTY_DEBT';

UPDATE public.dynamic_form_fields SET field_section_order = '9', form_sub_title=null, seperator=true WHERE field_db_name = 'aggregate_general_elec_exp' AND transaction_type = 'COEXP_PARTY_DEBT';

UPDATE public.dynamic_form_fields SET field_is_readonly=true WHERE transaction_type = 'COEXP_PARTY_DEBT' AND field_db_name in ('payee_cand_last_name','payee_cand_fist_name','payee_cand_middle_name','payee_cand_prefix',
'payee_cand_suffix','payee_cand_id','payee_cand_office','payee_cand_state','payee_cand_district');

UPDATE public.dynamic_form_fields SET field_is_readonly=false WHERE transaction_type = 'COEXP_PARTY_DEBT' AND field_db_name = 'payee_cmte_id';

UPDATE public.dynamic_form_fields SET field_db_name = 'cand_last_name' WHERE transaction_type = 'COEXP_PARTY_DEBT' AND field_db_name = 'payee_cand_last_name';

UPDATE public.dynamic_form_fields SET field_db_name = 'cand_first_name' WHERE transaction_type = 'COEXP_PARTY_DEBT' AND field_db_name = 'payee_cand_fist_name';

UPDATE public.dynamic_form_fields SET field_db_name = 'cand_middle_name' WHERE transaction_type = 'COEXP_PARTY_DEBT' AND field_db_name = 'payee_cand_middle_name';

UPDATE public.dynamic_form_fields SET field_db_name = 'cand_prefix' WHERE transaction_type = 'COEXP_PARTY_DEBT' AND field_db_name = 'payee_cand_prefix';

UPDATE public.dynamic_form_fields SET field_db_name = 'cand_suffix' WHERE transaction_type = 'COEXP_PARTY_DEBT' AND field_db_name = 'payee_cand_suffix';

UPDATE public.dynamic_form_fields SET field_db_name = 'beneficiary_cand_id' WHERE transaction_type = 'COEXP_PARTY_DEBT' AND field_db_name = 'payee_cand_id';

UPDATE public.dynamic_form_fields SET field_db_name = 'cand_office' WHERE transaction_type = 'COEXP_PARTY_DEBT' AND field_db_name = 'payee_cand_office';

UPDATE public.dynamic_form_fields SET field_db_name = 'cand_office_state' WHERE transaction_type = 'COEXP_PARTY_DEBT' AND field_db_name = 'payee_cand_state';

UPDATE public.dynamic_form_fields SET field_db_name = 'cand_office_district' WHERE transaction_type = 'COEXP_PARTY_DEBT' AND field_db_name = 'payee_cand_district';


DELETE FROM public.transaction_categories WHERE category_type = 'Other' AND cmte_type_category='PAC' AND sched_type='sched_L';

UPDATE public.transaction_categories SET tran_type_identifier = 'ALLOC_H4_SUM' WHERE sub_tran_type = 'ALLOC_H4_SUM' AND sched_type='sched_h4' and category_type='Other';