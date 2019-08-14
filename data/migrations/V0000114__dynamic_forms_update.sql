alter table  dynamic_form_fields add column toggle boolean default false; 
alter table  dynamic_form_fields add column entity_group character varying(9);


CREATE TABLE public.df_entity_types
(
    form_type character varying(5) COLLATE pg_catalog."default" NOT NULL,
    transaction_type character varying(60) COLLATE pg_catalog."default" NOT NULL,
    can boolean DEFAULT false,
    ccm boolean DEFAULT false,
    com boolean DEFAULT false,
    ind boolean DEFAULT false,
    org boolean DEFAULT false,
    pac boolean DEFAULT false,
    pty boolean DEFAULT false,
    CONSTRAINT pkg_df_entity_types PRIMARY KEY (form_type, transaction_type)
);



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
                    WHEN dynamic_form_fields.child_form = false THEN json_agg(json_build_object('entityGroup',dynamic_form_fields.entity_group,'toggle',dynamic_form_fields.toggle,'inputGroup', dynamic_form_fields.field_input_group, 'inputIcon', dynamic_form_fields.field_input_icon, 'text', dynamic_form_fields.field_label, 'infoIcon', dynamic_form_fields.field_infoicon, 'infoText', dynamic_form_fields.field_info, 'name', dynamic_form_fields.field_db_name, 'type', dynamic_form_fields.field_type, 'value', dynamic_form_fields.field_value, 'scroll', dynamic_form_fields.scroll, 'height', dynamic_form_fields.height, 'width', dynamic_form_fields.width, 'validation', json_build_object('required', dynamic_form_fields.field_is_required, 'max', dynamic_form_fields.field_size, dynamic_form_fields.field_validation, true)) ORDER BY dynamic_form_fields.field_order)
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
          WHERE dft.form_type::text = dfbs.form_type::text AND dft.tran_type_identifier::text = dfbs.transaction_type::text))) AS form_fields
   FROM dy_forms_by_section dfbs
  GROUP BY dfbs.form_type, dfbs.transaction_type;
