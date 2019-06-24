alter table public.dynamic_form_fields add column    field_db_name character varying(50); 
alter table public.dynamic_form_fields add column    transaction_type_identifier character varying(12);

INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (25, 'F3X', 'Individual Receipt', 'Transaction Type Identifier', 'INDV_REC', 12, 'hidden', 'hidden', true, true, false, 'alphaNumeric', false, NULL, 25, 'Official Use Only 1', 9, '2019-01-27', '2019-01-27');

update public.dynamic_form_fields set  field_db_name='entity_type'  where  field_label='Entity Type';
update public.dynamic_form_fields set  field_db_name='last_name'  where  field_label='Contributor Last Name';
update public.dynamic_form_fields set  field_db_name='first_name'  where  field_label='Contributor First Name';
update public.dynamic_form_fields set  field_db_name='middle_name'  where  field_label='Contributor Middle Name';
update public.dynamic_form_fields set  field_db_name='preffix'  where  field_label='Contributor Prefix';
update public.dynamic_form_fields set  field_db_name='suffix'  where  field_label='Contributor Suffix';
update public.dynamic_form_fields set  field_db_name='street_1'  where  field_label='Contributor Street 1';
update public.dynamic_form_fields set  field_db_name='street_2'  where  field_label='Contributor Street 2';
update public.dynamic_form_fields set  field_db_name='city'  where  field_label='Contributor City';
update public.dynamic_form_fields set  field_db_name='state'  where  field_label='Contributor State';
update public.dynamic_form_fields set  field_db_name='zip_code'  where  field_label='Contributor Zip';
update public.dynamic_form_fields set  field_db_name='contribution_date'  where  field_label='Contribution Date';
update public.dynamic_form_fields set  field_db_name='contribution_amount'  where  field_label='Contribution Amount';
update public.dynamic_form_fields set  field_db_name='contribution_aggregate'  where  field_label='Contribution Aggregate';
update public.dynamic_form_fields set  field_db_name='purpose_description'  where  field_label='Contribution Purpose Description';
update public.dynamic_form_fields set  field_db_name='employer'  where  field_label='Contributor Employer';
update public.dynamic_form_fields set  field_db_name='occupation'  where  field_label='Contributor Occupation';
update public.dynamic_form_fields set  field_db_name='memo_code'  where  field_label='Memo Code';
update public.dynamic_form_fields set  field_db_name='memo_text'  where  field_label='Memo Text';
update public.dynamic_form_fields set  field_db_name='line_number'  where  field_label='Line Number';
update public.dynamic_form_fields set  field_db_name='transaction_id'  where  field_label='Transaction Id';
update public.dynamic_form_fields set  field_db_name='back_ref_transaction_id'  where  field_label='Back Reference Tran Id Number';
update public.dynamic_form_fields set  field_db_name='back_ref_sched_name'  where  field_label='Back Reference Sched Name';
update public.dynamic_form_fields set  field_db_name='transaction_type'  where  field_label='Transaction Type Code';
update public.dynamic_form_fields set  field_db_name='transaction_type_identifier'  where  field_label='Transaction Type Identifier';

CREATE OR REPLACE VIEW public.dynamic_forms_view AS 
 WITH dy_forms_by_section AS (
         SELECT dynamic_form_fields.form_type,
            dynamic_form_fields.transaction_type,
            dynamic_form_fields.field_section,
            dynamic_form_fields.field_section_order,
            json_agg(json_build_object('text', dynamic_form_fields.field_label, 'infoIcon', dynamic_form_fields.field_infoicon, 'infoText', dynamic_form_fields.field_info, 'name', dynamic_form_fields.field_db_name, 'type', dynamic_form_fields.field_type, 'validation', json_build_object('required', dynamic_form_fields.field_is_required, 'max', dynamic_form_fields.field_size, dynamic_form_fields.field_validation, true)) ORDER BY dynamic_form_fields.field_order) AS json_by_section
           FROM dynamic_form_fields
          WHERE dynamic_form_fields.field_type::text <> 'hidden'::text
          GROUP BY dynamic_form_fields.form_type, dynamic_form_fields.transaction_type, dynamic_form_fields.field_section, dynamic_form_fields.field_section_order
        )
 SELECT dfbs.form_type,
    dfbs.transaction_type,
    json_build_object('data', json_build_object('formFields', json_agg(json_build_object('cols', dfbs.json_by_section) ORDER BY dfbs.field_section_order), 'hiddenFields', ( SELECT json_agg(json_build_object('type', h.field_type, 'name', replace(h.field_label::text, ' '::text, ''::text), 'value', h.field_value)) AS json_agg
           FROM dynamic_form_fields h
          WHERE h.field_type::text = 'hidden'::text), 'states', ( SELECT json_agg(json_build_object('name', ref_states.state_description, 'code', ref_states.state_code) ORDER BY ref_states.st_number) AS json_agg
           FROM ref_states))) AS form_fields
   FROM dy_forms_by_section dfbs
  GROUP BY dfbs.form_type, dfbs.transaction_type;


 
