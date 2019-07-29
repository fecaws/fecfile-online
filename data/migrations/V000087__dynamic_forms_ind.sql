update dynamic_form_fields set field_label = REGEXP_REPLACE(field_label, 'Contributor ', '', 'g')   where field_label like '%Contributor%';


update dynamic_form_fields set class_name='col col-md-4';

update dynamic_form_fields set class_name='col col-md-5' where field_section in ('Address Section 1','Memo Section');

ALTER TABLE dynamic_form_fields  ADD COLUMN transaction_type_identifier character varying(15);

update dynamic_form_fields set transaction_type_identifier='INDV_REC' where transaction_type='Individual Receipt';


create table public.df_tran_type_identifier
(form_type character varying(5),
 tran_type_identifier character varying(20),
 tran_type_desc character varying(200),
 tran_type_forms_title character varying(200),
 tran_type_code character varying(5),
 fieldset boolean,
 class_name character varying(100));


INSERT INTO public.df_tran_type_identifier(form_type, tran_type_identifier, tran_type_desc, tran_type_forms_title, tran_type_code,fieldset,class_name)
    VALUES ('F3X', 'INDV_REC', 'Individual Receipt', 'Contributor Information:', '15',true,'col col-md-12 fieldset');

drop  view dynamic_forms_view;

CREATE OR REPLACE VIEW dynamic_forms_view AS 
 WITH dy_forms_by_section AS (
         SELECT dynamic_form_fields.form_type,
            dynamic_form_fields.transaction_type,
            dynamic_form_fields.transaction_type_identifier,
            dynamic_form_fields.field_section,
            dynamic_form_fields.field_section_order,
            dynamic_form_fields.class_name,
            dynamic_form_fields.seperator,
            json_agg(json_build_object('text', dynamic_form_fields.field_label, 'infoIcon', dynamic_form_fields.field_infoicon, 'infoText', dynamic_form_fields.field_info, 'name', dynamic_form_fields.field_db_name, 'type', dynamic_form_fields.field_type, 'value', dynamic_form_fields.field_value, 'scroll', dynamic_form_fields.scroll, 'height', dynamic_form_fields.height, 'width', dynamic_form_fields.width, 'validation', json_build_object('required', dynamic_form_fields.field_is_required, 'max', dynamic_form_fields.field_size, dynamic_form_fields.field_validation, true)) ORDER BY dynamic_form_fields.field_order) AS json_by_section
           FROM dynamic_form_fields
          WHERE dynamic_form_fields.field_type::text <> 'hidden'::text
          GROUP BY dynamic_form_fields.form_type, dynamic_form_fields.transaction_type, dynamic_form_fields.field_section, dynamic_form_fields.field_section_order, dynamic_form_fields.class_name, dynamic_form_fields.seperator,dynamic_form_fields.transaction_type_identifier
        )
 SELECT dfbs.form_type,
    dfbs.transaction_type_identifier,
    dfbs.transaction_type,    
    json_build_object('data', json_build_object('formFields', json_agg(json_build_object('colClassName', dfbs.class_name, 'seperator', dfbs.seperator, 'cols', dfbs.json_by_section) ORDER BY dfbs.field_section_order), 
				'hiddenFields', ( SELECT json_agg(json_build_object('type', h.field_type, 'name', replace(h.field_db_name::text, ' '::text, ''::text), 'value', h.field_value)) AS json_agg
							FROM dynamic_form_fields h
							WHERE h.field_type::text = 'hidden'::text and h.form_type=dfbs.form_type and h.transaction_type_identifier=dfbs.transaction_type_identifier), 
				'states', ( SELECT json_agg(json_build_object('name', ref_states.state_description, 'code', ref_states.state_code) ORDER BY ref_states.st_number) AS json_agg FROM ref_states),
				'titles',( select json_agg(json_build_object('fieldset', fieldset, 'colClassName', class_name,'label',tran_type_forms_title)) AS json_agg from df_tran_type_identifier dft where  dft.form_type=dfbs.form_type and dft.tran_type_identifier=dfbs.transaction_type_identifier) 
           )) AS form_fields
   FROM dy_forms_by_section dfbs
  GROUP BY dfbs.form_type, dfbs.transaction_type,dfbs.transaction_type_identifier;
