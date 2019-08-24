DROP VIEW public.dynamic_forms_view;

CREATE OR REPLACE VIEW public.df_entity_types_view AS
 SELECT 
 	df.form_type,
    df.transaction_type,
    rf.entity_type,
    rf.entity_type_description,
    'ind-group' as entity_group,
    (select  (case when count(*)=1 then true else false end)   from dynamic_form_fields d  
     	where d.form_type=df.form_type and d.transaction_type=df.transaction_type and d.field_label='Entity Type'
    and rf.entity_type=upper(d.field_value)) as selected    
   FROM df_entity_types df
     JOIN ref_entity_types rf ON rf.entity_type::text = 'CAN'::text AND df.can = true
UNION
 SELECT df.form_type,
    df.transaction_type,
    rf.entity_type,
    rf.entity_type_description,
    'org-group' as entity_group,
    (select  (case when count(*)=1 then true else false end)   from dynamic_form_fields d  
     	where d.form_type=df.form_type and d.transaction_type=df.transaction_type and d.field_label='Entity Type'
    and rf.entity_type=upper(d.field_value)) as selected 
   FROM df_entity_types df
     JOIN ref_entity_types rf ON rf.entity_type::text = 'CCM'::text AND df.ccm = true
UNION
 SELECT df.form_type,
    df.transaction_type,
    rf.entity_type,
    rf.entity_type_description,
    'org-group' as entity_group,
    (select  (case when count(*)=1 then true else false end)   from dynamic_form_fields d  
     	where d.form_type=df.form_type and d.transaction_type=df.transaction_type and d.field_label='Entity Type'
    and rf.entity_type=upper(d.field_value)) as selected 
   FROM df_entity_types df
     JOIN ref_entity_types rf ON rf.entity_type::text = 'COM'::text AND df.com = true
UNION
 SELECT df.form_type,
    df.transaction_type,
    rf.entity_type,
    rf.entity_type_description,
    'ind-group' as entity_group,
    (select  (case when count(*)=1 then true else false end)   from dynamic_form_fields d  
     	where d.form_type=df.form_type and d.transaction_type=df.transaction_type and d.field_label='Entity Type'
    and rf.entity_type=upper(d.field_value)) as selected   
   FROM df_entity_types df
     JOIN ref_entity_types rf ON rf.entity_type::text = 'IND'::text AND df.ind = true
UNION
 SELECT df.form_type,
    df.transaction_type,
    rf.entity_type,
    rf.entity_type_description,
    'org-group' as entity_group,
    (select  (case when count(*)=1 then true else false end)   from dynamic_form_fields d  
     	where d.form_type=df.form_type and d.transaction_type=df.transaction_type and d.field_label='Entity Type'
    and rf.entity_type=upper(d.field_value)) as selected 
   FROM df_entity_types df
     JOIN ref_entity_types rf ON rf.entity_type::text = 'ORG'::text AND df.org = true
UNION
 SELECT df.form_type,
    df.transaction_type,
    rf.entity_type,
    rf.entity_type_description,
    'org-group' as entity_group,
    (select  (case when count(*)=1 then true else false end)   from dynamic_form_fields d  
     	where d.form_type=df.form_type and d.transaction_type=df.transaction_type and d.field_label='Entity Type'
    and rf.entity_type=upper(d.field_value)) as selected 
   FROM df_entity_types df
     JOIN ref_entity_types rf ON rf.entity_type::text = 'PAC'::text AND df.pac = true
UNION
 SELECT df.form_type,
    df.transaction_type,
    rf.entity_type,
    rf.entity_type_description,
    'org-group' as entity_group,
    (select  (case when count(*)=1 then true else false end)   from dynamic_form_fields d  
     	where d.form_type=df.form_type and d.transaction_type=df.transaction_type and d.field_label='Entity Type'
    and rf.entity_type=upper(d.field_value)) as selected 
   FROM df_entity_types df
     JOIN ref_entity_types rf ON rf.entity_type::text = 'PTY'::text AND df.pty = true;

 
 
delete from df_entity_types;
 
 
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PARTY_RET', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'TRIB_REC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PARTY_REC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PAC_REC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PAC_RET', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PAC_NON_FED_REC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PAC_NON_FED_RET', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'TRAN', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'REF_TO_FED_CAN', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'REF_TO_OTH_CMTE', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PARTY_RECNT_REC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PAC_RECNT_REC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'TRIB_RECNT_REC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'TRIB_NP_RECNT_ACC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PARTY_NP_RECNT_ACC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PAC_NP_RECNT_ACC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PARTY_NP_HQ_ACC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PAC_NP_HQ_ACC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'TRIB_NP_HQ_ACC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PARTY_NP_CONVEN_ACC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'PAC_NP_CONVEN_ACC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'TRIB_NP_CONVEN_ACC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'OTH_CMTE_NON_CONT_ACC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'BUS_LAB_NON_CONT_ACC', false, false, false, false, true, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'RET_REC', false, false, false, true, false, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'INDV_REC', false, false, false, true, false, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'EAR_REC', false, false, false, true, false, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'IND_RECNT_REC', false, false, false, true, false, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'IND_NP_RECNT_ACC', false, false, false, true, false, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'IND_NP_HQ_ACC', false, false, false, true, false, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'IND_NP_CONVEN_ACC', false, false, false, true, false, false, false);
INSERT INTO df_entity_types (form_type, transaction_type, can, ccm, com, ind, org, pac, pty) VALUES ('F3X', 'IND_REC_NON_CONT_ACC', false, false, false, true, false, false, false);

CREATE OR REPLACE VIEW public.dynamic_forms_view AS
 WITH dy_forms_by_section AS (
         SELECT dynamic_form_fields.form_type,
            dynamic_form_fields.transaction_type,
            dynamic_form_fields.field_section,
            dynamic_form_fields.field_section_order,
            dynamic_form_fields.class_name,
            dynamic_form_fields.seperator,
            dynamic_form_fields.child_form,
            dynamic_form_fields.form_sub_title,
                CASE
                    WHEN dynamic_form_fields.child_form = false THEN json_agg(json_build_object('entityGroup', dynamic_form_fields.entity_group, 'toggle', dynamic_form_fields.toggle, 'inputGroup', dynamic_form_fields.field_input_group, 'inputIcon', dynamic_form_fields.field_input_icon, 'text', dynamic_form_fields.field_label, 'infoIcon', dynamic_form_fields.field_infoicon, 'infoText', dynamic_form_fields.field_info, 'name', dynamic_form_fields.field_db_name, 'type', dynamic_form_fields.field_type, 'value', dynamic_form_fields.field_value, 'scroll', dynamic_form_fields.scroll, 'height', dynamic_form_fields.height, 'width', dynamic_form_fields.width, 'validation', json_build_object('required', dynamic_form_fields.field_is_required, 'max', dynamic_form_fields.field_size, dynamic_form_fields.field_validation, true)) ORDER BY dynamic_form_fields.field_order)
                    ELSE NULL::json
                END AS json_by_section
           FROM dynamic_form_fields
          WHERE dynamic_form_fields.field_type::text <> 'hidden'::text
          GROUP BY dynamic_form_fields.form_type, dynamic_form_fields.transaction_type, dynamic_form_fields.field_section, dynamic_form_fields.field_section_order, dynamic_form_fields.class_name, dynamic_form_fields.seperator, dynamic_form_fields.child_form, dynamic_form_fields.form_sub_title
          ORDER BY dynamic_form_fields.field_section_order
        )
 SELECT dfbs.form_type,
    dfbs.transaction_type,
    json_build_object('data', json_build_object('formFields', json_agg(json_build_object('childForm', dfbs.child_form, 'childFormTitle', dfbs.form_sub_title, 'colClassName', dfbs.class_name, 'seperator', dfbs.seperator, 'cols', dfbs.json_by_section) ORDER BY dfbs.field_section_order), 'hiddenFields', ( SELECT json_agg(json_build_object('type', h.field_type, 'name', replace(h.field_db_name::text, ' '::text, ''::text), 'value', h.field_value)) AS json_agg
           FROM dynamic_form_fields h
          WHERE h.field_type::text = 'hidden'::text AND h.form_type::text = dfbs.form_type::text AND h.transaction_type::text = dfbs.transaction_type::text), 'states', ( SELECT json_agg(json_build_object('name', ref_states.state_description, 'code', ref_states.state_code) ORDER BY ref_states.st_number) AS json_agg
           FROM ref_states), 'titles', ( SELECT json_agg(json_build_object('fieldset', dft.fieldset, 'colClassName', dft.class_name, 'label', dft.tran_type_forms_title)) AS json_agg
           FROM df_tran_type_identifier dft
          WHERE dft.form_type::text = dfbs.form_type::text AND dft.tran_type_identifier::text = dfbs.transaction_type::text), 
		  'entityTypes', ( SELECT json_agg(json_build_object('entityType', dfe.entity_type, 'entityTypeDescription', dfe.entity_type_description,'group',entity_group,'selected',selected)) AS json_agg
           FROM df_entity_types_view dfe
          WHERE dfe.form_type::text = dfbs.form_type::text AND dfe.transaction_type::text = dfbs.transaction_type::text))) AS form_fields
   FROM dy_forms_by_section dfbs
  GROUP BY dfbs.form_type, dfbs.transaction_type;

 
update  dynamic_form_fields set field_value='X' where transaction_type='EAR_REC' and field_label='Memo Code' and field_db_name='child*memo_code';
