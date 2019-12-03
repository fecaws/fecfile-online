DROP FUNCTION public.get_sub_transaction_json(character varying, character varying) CASCADE;

CREATE OR REPLACE FUNCTION public.get_sub_transaction_json(
    p_form_type character varying,
    p_tran_identifier character varying)
  RETURNS json AS
$BODY$

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
                                     when parent.sched_type ='sched_h1' then '/sh1/schedH1'
                                     when parent.sched_type ='sched_h2' then '/sh2/schedH2'
                                     when parent.sched_type ='sched_h3' then '/sh3/schedH3'
                                     when parent.sched_type ='sched_h4' then '/sh4/schedH4'
                                       when parent.sched_type ='sched_h5' then '/sh5/schedH5'
                                     when parent.sched_type ='sched_h6' then '/sh6/schedH6'
                                                                      else '/sa/schedA'
                                                                   end),
                                                         'isParent',is_parent,
                               'isEarmark',is_earmark
                                                        ) ORDER BY child.ref_tran_id) into v_json
           FROM ref_transaction_types parent
            JOIN ref_transaction_types child ON parent.ref_tran_id = child.parent_tran_id
            where parent.tran_identifier=v_tran_identifier
       and parent.auto_generate = false;/* Excluding auto generated transactions*/
return v_json;
end;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

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
           FROM ref_election_type), 'committeeTypeEvents', ( SELECT json_agg(t.*) AS json_agg
           FROM ( SELECT 'PAC'::text AS "committeeTypeCategory",
                    json_agg(json_build_object('eventType', ref_event_types.event_type, 'eventTypeDescription', ref_event_types.event_type_desc, 'scheduleType',
                        CASE
                            WHEN ref_event_types.event_type::text = ANY (ARRAY['DF'::character varying::text, 'DC'::character varying::text]) THEN 'sched_h2'::text
                            ELSE 'sched_h1'::text
                        END, 'activityEventTypes', NULL::unknown)) AS "eventTypes"
                   FROM ref_event_types
                  WHERE ref_event_types.is_pac = true
                UNION ALL
                 SELECT 'PTY'::text AS "committeeTypeCategory",
                    json_agg(json_build_object('eventType', ref_event_types.event_type, 'eventTypeDescription', ref_event_types.event_type_desc, 'scheduleType',
                        CASE
                            WHEN ref_event_types.event_type::text = ANY (ARRAY['DF'::character varying::text, 'DC'::character varying::text]) THEN 'sched_h2'::text
                            ELSE 'sched_h1'::text
                        END, 'activityEventTypes', NULL::unknown)) AS "eventTypes"
                   FROM ref_event_types
                  WHERE ref_event_types.is_pty = true
                UNION ALL
                 SELECT 'H6'::text AS "committeeTypeCategory",
                    json_agg(json_build_object('eventType', ref_event_types.event_type, 'eventTypeDescription', ref_event_types.event_type_desc, 'scheduleType', 'sched_h6', 'activityEventTypes', NULL::unknown)) AS "eventTypes"
                   FROM ref_event_types
                  WHERE ref_event_types.is_h6 = true) t), 'subTransactions', get_sub_transaction_json(dfbs.form_type, dfbs.transaction_type::text::character varying), 'jfMemoTypes', get_jf_memo_types(dfbs.form_type, dfbs.transaction_type::text::character varying))) AS form_fields
   FROM dy_forms_by_section dfbs
  GROUP BY dfbs.form_type, dfbs.transaction_type;

