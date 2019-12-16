
  INSERT INTO public.due_dates (report_type, cvg_start_date, cvg_end_date, due_date, regular_special_report_ind, report_year) VALUES
  ('YE', '2019-12-01', '2019-12-31', '2020-01-20', 'R', '2019');

  -- SCHEDULE H6

DELETE FROM public.dynamic_form_fields WHERE transaction_type in ('ALLOC_FEA_CC_PAY_MEMO', 'ALLOC_FEA_STAF_REIM_MEMO','ALLOC_FEA_DISB', 'ALLOC_FEA_VOID', 'ALLOC_FEA_STAF_REIM', 'ALLOC_FEA_CC_PAY');

INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_FEA_DISB', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_FEA_DISB_DEBT';

  INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_FEA_CC_PAY', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_FEA_DISB_DEBT';

  INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_FEA_STAF_REIM', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_FEA_DISB_DEBT';

  INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_FEA_VOID', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_FEA_DISB_DEBT';

  INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_FEA_CC_PAY_MEMO', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_FEA_DISB_DEBT';


  INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_FEA_STAF_REIM_MEMO', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_FEA_DISB_DEBT';

UPDATE public.dynamic_form_fields SET field_is_readonly=false WHERE transaction_type in ('ALLOC_FEA_CC_PAY_MEMO', 'ALLOC_FEA_STAF_REIM_MEMO','ALLOC_FEA_DISB', 'ALLOC_FEA_VOID', 'ALLOC_FEA_STAF_REIM', 'ALLOC_FEA_CC_PAY')  
AND field_db_name in ('entity_type','entity_name','last_name','first_name','middle_name','prefix','suffix','street_1','street_2','city','state','zip_code');

UPDATE public.dynamic_form_fields SET field_value='ALLOC_FEA_DISB' WHERE transaction_type = 'ALLOC_FEA_DISB' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='ALLOC_FEA_VOID' WHERE transaction_type = 'ALLOC_FEA_VOID' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='ALLOC_FEA_STAF_REIM' WHERE transaction_type = 'ALLOC_FEA_STAF_REIM' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='ALLOC_FEA_CC_PAY' WHERE transaction_type = 'ALLOC_FEA_CC_PAY' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='ALLOC_FEA_CC_PAY_MEMO' WHERE transaction_type = 'ALLOC_FEA_CC_PAY_MEMO' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='ALLOC_FEA_STAF_REIM_MEMO' WHERE transaction_type = 'ALLOC_FEA_STAF_REIM_MEMO' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='X' WHERE transaction_type = 'ALLOC_FEA_CC_PAY_MEMO' AND field_db_name = 'memo_code';
UPDATE public.dynamic_form_fields SET field_value='X' WHERE transaction_type = 'ALLOC_FEA_STAF_REIM_MEMO' AND field_db_name = 'memo_code';


UPDATE public.dynamic_form_fields SET field_value='ORG', field_type = 'hidden', field_html_type='hidden', field_is_hidden=true, field_is_readonly=false,
field_infoicon=false, field_info='' WHERE transaction_type = 'ALLOC_FEA_CC_PAY' AND field_db_name = 'entity_type';

UPDATE public.dynamic_form_fields SET entity_group='' WHERE transaction_type = 'ALLOC_FEA_CC_PAY' AND field_db_name = 'entity_name';

DELETE FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_FEA_CC_PAY' AND field_db_name in ('last_name', 'first_name', 'middle_name','prefix', 'suffix');


-- SCHEDULE H4

DELETE FROM public.dynamic_form_fields WHERE transaction_type in ('ALLOC_EXP_CC_PAY_MEMO', 'ALLOC_EXP_STAF_REIM_MEMO', 'ALLOC_EXP_PMT_TO_PROL_MEMO','ALLOC_EXP', 'ALLOC_EXP_VOID', 'ALLOC_EXP_CC_PAY', 'ALLOC_EXP_STAF_REIM', 'ALLOC_EXP_PMT_TO_PROL');

  INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_EXP', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_EXP_DEBT';

  INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_EXP_VOID', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_EXP_DEBT';

  INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_EXP_CC_PAY', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_EXP_DEBT';

  INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_EXP_STAF_REIM', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_EXP_DEBT';

  INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_EXP_PMT_TO_PROL', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_EXP_DEBT';  

  INSERT INTO public.dynamic_form_fields(
            form_type, transaction_type, field_label, field_value, 
            field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
            field_is_readonly, field_validation, field_infoicon, field_info, 
            field_order, field_section, field_section_order, create_date, 
            last_update_date, field_db_name, class_name, height, width, scroll, 
            seperator, transaction_type_desc, field_input_group, field_input_icon, 
            child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
    SELECT form_type, 'ALLOC_EXP_CC_PAY_MEMO', field_label, field_value, 
       field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
       field_is_readonly, field_validation, field_infoicon, field_info, 
       field_order, field_section, field_section_order, create_date, 
       last_update_date, field_db_name, class_name, height, width, scroll, 
       seperator, transaction_type_desc, field_input_group, field_input_icon, 
       child_form, form_sub_title, toggle, entity_group, entity_id_mapping
  FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_EXP_DEBT';

  INSERT INTO public.dynamic_form_fields(
          form_type, transaction_type, field_label, field_value, 
          field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
          field_is_readonly, field_validation, field_infoicon, field_info, 
          field_order, field_section, field_section_order, create_date, 
          last_update_date, field_db_name, class_name, height, width, scroll, 
          seperator, transaction_type_desc, field_input_group, field_input_icon, 
          child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
  SELECT form_type, 'ALLOC_EXP_STAF_REIM_MEMO', field_label, field_value, 
     field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
     field_is_readonly, field_validation, field_infoicon, field_info, 
     field_order, field_section, field_section_order, create_date, 
     last_update_date, field_db_name, class_name, height, width, scroll, 
     seperator, transaction_type_desc, field_input_group, field_input_icon, 
     child_form, form_sub_title, toggle, entity_group, entity_id_mapping
FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_EXP_DEBT';

  INSERT INTO public.dynamic_form_fields(
          form_type, transaction_type, field_label, field_value, 
          field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
          field_is_readonly, field_validation, field_infoicon, field_info, 
          field_order, field_section, field_section_order, create_date, 
          last_update_date, field_db_name, class_name, height, width, scroll, 
          seperator, transaction_type_desc, field_input_group, field_input_icon, 
          child_form, form_sub_title, toggle, entity_group, entity_id_mapping)
  SELECT form_type, 'ALLOC_EXP_PMT_TO_PROL_MEMO', field_label, field_value, 
     field_size, field_type, field_html_type, field_is_required, field_is_hidden, 
     field_is_readonly, field_validation, field_infoicon, field_info, 
     field_order, field_section, field_section_order, create_date, 
     last_update_date, field_db_name, class_name, height, width, scroll, 
     seperator, transaction_type_desc, field_input_group, field_input_icon, 
     child_form, form_sub_title, toggle, entity_group, entity_id_mapping
FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_EXP_DEBT'; 


UPDATE public.dynamic_form_fields SET field_is_readonly=false WHERE transaction_type in ('ALLOC_EXP_CC_PAY_MEMO', 'ALLOC_EXP_STAF_REIM_MEMO', 'ALLOC_EXP_PMT_TO_PROL_MEMO','ALLOC_EXP', 'ALLOC_EXP_VOID', 'ALLOC_EXP_CC_PAY', 'ALLOC_EXP_STAF_REIM', 'ALLOC_EXP_PMT_TO_PROL')
AND field_db_name in ('entity_type','entity_name','last_name','first_name','middle_name','prefix','suffix','street_1','street_2','city','state','zip_code');

UPDATE public.dynamic_form_fields SET field_value='ALLOC_EXP' WHERE transaction_type = 'ALLOC_EXP' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='ALLOC_EXP_VOID' WHERE transaction_type = 'ALLOC_EXP_VOID' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='ALLOC_EXP_CC_PAY' WHERE transaction_type = 'ALLOC_EXP_CC_PAY' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='ALLOC_EXP_STAF_REIM' WHERE transaction_type = 'ALLOC_EXP_STAF_REIM' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='ALLOC_EXP_PMT_TO_PROL' WHERE transaction_type = 'ALLOC_EXP_PMT_TO_PROL' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='ALLOC_EXP_CC_PAY_MEMO' WHERE transaction_type = 'ALLOC_EXP_CC_PAY_MEMO' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='ALLOC_EXP_STAF_REIM_MEMO' WHERE transaction_type = 'ALLOC_EXP_STAF_REIM_MEMO' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='ALLOC_EXP_PMT_TO_PROL_MEMO' WHERE transaction_type = 'ALLOC_EXP_PMT_TO_PROL_MEMO' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_value='X' WHERE transaction_type = 'ALLOC_EXP_CC_PAY_MEMO' AND field_db_name = 'memo_code';
UPDATE public.dynamic_form_fields SET field_value='X' WHERE transaction_type = 'ALLOC_EXP_STAF_REIM_MEMO' AND field_db_name = 'memo_code';
UPDATE public.dynamic_form_fields SET field_value='X' WHERE transaction_type = 'ALLOC_EXP_PMT_TO_PROL_MEMO' AND field_db_name = 'memo_code';


UPDATE public.dynamic_form_fields SET field_value='ORG', field_type = 'hidden', field_html_type='hidden', field_is_hidden=true, field_is_readonly=false,
field_infoicon=false, field_info='' WHERE transaction_type = 'ALLOC_EXP_CC_PAY' AND field_db_name = 'entity_type';

UPDATE public.dynamic_form_fields SET entity_group='' WHERE transaction_type = 'ALLOC_EXP_CC_PAY' AND field_db_name = 'entity_name';

DELETE FROM public.dynamic_form_fields WHERE transaction_type = 'ALLOC_EXP_CC_PAY' AND field_db_name in ('last_name', 'first_name', 'middle_name','prefix', 'suffix');


UPDATE public.ref_transaction_types SET tran_desc = 'Allocated Federal/Non-Federal Expenditure Debt Payment' WHERE tran_identifier='ALLOC_EXP_DEBT';
UPDATE public.ref_transaction_types SET tran_desc = 'Allocated FEA Debt Payment' WHERE tran_identifier='ALLOC_FEA_DISB_DEBT';
UPDATE public.ref_transaction_types SET tran_desc = 'Operating Expenditure Debt Payment' WHERE tran_identifier='OPEXP_DEBT';
UPDATE public.ref_transaction_types SET tran_desc = 'IE Before Dissemination - Memo - Debt Payment' WHERE tran_identifier='IE_B4_DISSE_MEMO';
UPDATE public.ref_transaction_types SET tran_desc = '100% FEA Payment - Debt Payment' WHERE tran_identifier='FEA_100PCT_DEBT_PAY';
UPDATE public.ref_transaction_types SET tran_desc = 'Other Disbursements Debt Payment' WHERE tran_identifier='OTH_DISB_DEBT';
UPDATE public.ref_transaction_types SET tran_desc = 'Coordinated Party Expenditure Debt Payment' WHERE tran_identifier='COEXP_PARTY_DEBT';


UPDATE public.dynamic_form_fields SET field_is_readonly=false WHERE transaction_type = 'IND_NP_RECNT_ACC' AND field_db_name = 'purpose_description';