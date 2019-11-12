ALTER TABLE public.ref_event_types ADD COLUMN is_PTY boolean, ADD COLUMN is_PAC boolean;

UPDATE public.ref_event_types SET is_PTY=true WHERE event_type NOT IN ('PC');

UPDATE public.ref_event_types SET is_PAC=true WHERE event_type IN ('PC', 'AD', 'GV', 'DC');

ALTER TABLE public.ref_event_types ADD COLUMN is_H6 boolean;

INSERT INTO public.ref_event_types(event_type, event_type_desc, is_H6) VALUES 
('VR', 'Voter Registration', true), ('GO', 'GOTV', true), ('VI', 'Voter ID', true), ('GC', 'Generic Campaign', true);

ALTER TABLE public.sched_h6 ALTER COLUMN activity_event_type TYPE VARCHAR(2);

ALTER TABLE public.sched_h1 RENAME COLUMN adminstrative TO administrative;

ALTER TABLE public.sched_h1 ADD COLUMN election_year NUMERIC(4);

DROP VIEW public.dynamic_forms_view;

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
                    WHEN dynamic_form_fields.child_form = false THEN json_agg(json_build_object('preText',
                    CASE
                        WHEN dynamic_form_fields.field_db_name::text ~~ '%purpose%'::text THEN dynamic_form_fields.field_value
                        ELSE NULL::character varying
                    END, 'setEntityIdTo', dynamic_form_fields.entity_id_mapping, 'isReadonly', dynamic_form_fields.field_is_readonly, 'entityGroup', dynamic_form_fields.entity_group, 'toggle', dynamic_form_fields.toggle, 'inputGroup', dynamic_form_fields.field_input_group, 'inputIcon', dynamic_form_fields.field_input_icon, 'text', dynamic_form_fields.field_label, 'infoIcon', dynamic_form_fields.field_infoicon, 'infoText', dynamic_form_fields.field_info, 'name', dynamic_form_fields.field_db_name, 'type', dynamic_form_fields.field_type, 'value',
                    CASE
                        WHEN dynamic_form_fields.field_db_name::text ~~ '%purpose%'::text AND dynamic_form_fields.field_input_group = true THEN NULL::character varying
                        ELSE dynamic_form_fields.field_value
                    END, 'scroll', dynamic_form_fields.scroll, 'height', dynamic_form_fields.height, 'width', dynamic_form_fields.width, 'validation', json_build_object('required', dynamic_form_fields.field_is_required, 'max', dynamic_form_fields.field_size, dynamic_form_fields.field_validation, true)) ORDER BY dynamic_form_fields.field_order)
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
          WHERE dft.form_type::text = dfbs.form_type::text AND dft.tran_type_identifier::text = dfbs.transaction_type::text), 'entityTypes', ( SELECT json_agg(json_build_object('entityType', dfe.entity_type, 'entityTypeDescription', dfe.entity_type_description, 'group', dfe.entity_group, 'selected', dfe.selected)) AS json_agg
           FROM df_entity_types_view dfe
          WHERE dfe.form_type::text = dfbs.form_type::text AND dfe.transaction_type::text = dfbs.transaction_type::text), 'electionTypes', ( SELECT json_agg(json_build_object('electionType', ref_election_type.election_type, 'electionTypeDescription', ref_election_type.election_type_desc)) AS json_agg
           FROM ref_election_type), 'committeeTypeEvents', (SELECT json_agg(t) FROM (
          SELECT 'PAC' AS "committeeTypeCategory", json_agg(json_build_object('eventType',ref_event_types.event_type, 'eventTypeDescription', 
                  ref_event_types.event_type_desc, 'scheduleType', CASE WHEN ref_event_types.event_type in ('DF','DC') THEN 'sched_h2' ELSE 'sched_h1' END, 'activityEventTypes', null)) AS "eventTypes"
          FROM ref_event_types WHERE is_PAC=true
          UNION ALL
          SELECT 'PTY' AS "committeeTypeCategory", json_agg(json_build_object('eventType', ref_event_types.event_type, 'eventTypeDescription', 
      ref_event_types.event_type_desc, 'scheduleType', CASE WHEN ref_event_types.event_type in ('DF','DC') THEN 'sched_h2' ELSE 'sched_h1' END, 'activityEventTypes', null)) AS "eventTypes"
          FROM ref_event_types WHERE is_PTY=true
          UNION ALL
          SELECT 'H6' AS "committeeTypeCategory", json_agg(json_build_object('eventType', ref_event_types.event_type, 'eventTypeDescription', 
      ref_event_types.event_type_desc, 'scheduleType', 'sched_h6', 'activityEventTypes', null)) AS "eventTypes"
          FROM ref_event_types WHERE is_H6=true
          ) AS t), 'subTransactions', get_sub_transaction_json(dfbs.form_type, dfbs.transaction_type::text::character varying), 'jfMemoTypes', get_jf_memo_types(dfbs.form_type, dfbs.transaction_type::text::character varying))) AS form_fields
   FROM dy_forms_by_section dfbs
  GROUP BY dfbs.form_type, dfbs.transaction_type;

ALTER TABLE public.sched_l ALTER COLUMN transaction_type_identifier TYPE varchar(20);

INSERT INTO public.dynamic_form_fields(df_id,form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, field_db_name, class_name, height, width, scroll, seperator, transaction_type_desc, field_input_group, field_input_icon, child_form, form_sub_title, toggle, entity_group, entity_id_mapping) VALUES ('6509','F3X', 'ALLOC_EXP_DEBT', 'Allocated Activity or Event', 'Select', '90', 'select', 'select', false, false, false, 'alphaNumeric', true, 'Request language from RAD', '17', 'Amount Section', '9', 'activity_event_identifier', 'col col-md-2', '30px', '235px', false, false, 'Operating Expenditure', false, null, false, null, false, null, 'entity_id');


UPDATE public.dynamic_form_fields SET field_section_order='7', field_label='Type' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'activity_event_type';
UPDATE public.dynamic_form_fields SET field_order='15', field_section_order='7', field_section='Date Section', class_name='col col-md-4', width='100%' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'activity_event_identifier';
UPDATE public.dynamic_form_fields SET field_order='16' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'total_amount';
UPDATE public.dynamic_form_fields SET field_order='17' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'fed_share_amount';
UPDATE public.dynamic_form_fields SET field_order='18' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'non_fed_share_amount';
UPDATE public.dynamic_form_fields SET field_order='19' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'activity_event_amount_ytd';
UPDATE public.dynamic_form_fields SET field_order='20' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'memo_code';
UPDATE public.dynamic_form_fields SET field_order='21' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'expenditure_purpose';
UPDATE public.dynamic_form_fields SET field_order='22' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'memo_text';
UPDATE public.dynamic_form_fields SET field_order='23' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'line_number';
UPDATE public.dynamic_form_fields SET field_order='24' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'transaction_id';
UPDATE public.dynamic_form_fields SET field_order='25' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'back_ref_transaction_id';
UPDATE public.dynamic_form_fields SET field_order='26' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'back_ref_sched_name';
UPDATE public.dynamic_form_fields SET field_order='27' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'transaction_type';
UPDATE public.dynamic_form_fields SET field_order='28' WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name = 'transaction_type_identifier';
UPDATE public.dynamic_form_fields SET field_is_readonly=true WHERE transaction_type= 'ALLOC_EXP_DEBT' AND field_db_name in ('entity_type','entity_name','last_name','first_name','middle_name','prefix','suffix','street_1','street_2','city','state','zip_code');


UPDATE public.dynamic_form_fields SET child_form=true, form_sub_title='Candidate Information:' WHERE df_id='5847';