drop view public.dynamic_forms_view;
drop table  public.dynamic_form_fields;

CREATE TABLE public.dynamic_form_fields
(
  df_id integer NOT NULL DEFAULT nextval('dynamic_form_fields_id_seq'::regclass),
  form_type character varying(10),
  transaction_type character varying(90),
  field_label character varying(90),
  field_value character varying(90),
  field_size character varying(10),
  field_type character varying(30),
  field_html_type character varying(30),
  field_is_required character varying(5),
  field_is_hidden character varying(5),
  field_is_readonly character varying(5),
  field_validation character varying(90),
  field_infoicon character varying(5),
  field_info character varying(100),
  field_order integer,
  field_section character varying(20),
  field_section_order integer,
  create_date date DEFAULT now(),
  last_update_date date DEFAULT now(),
  CONSTRAINT dynamic_form_fields_pk PRIMARY KEY (df_id)
)
WITH (
  OIDS=FALSE
);
 

INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (7, 'F3X', 'Individual Receipt', 'Contribution Date', NULL, NULL, 'date', 'date', 'true', NULL, NULL, 'date', 'true', 'Request language from RAD', 12, 'Amount Section', 5, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (20, 'F3X', 'Individual Receipt', 'Entity Type', 'IND', '3', 'hidden', 'hidden', 'true', 'true', NULL, 'alphaNumeric', NULL, NULL, 1, 'Name Section 1', 1, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (1, 'F3X', 'Individual Receipt', 'Contributor Employer', NULL, '38', 'text', 'input', 'true', NULL, NULL, 'alphaNumeric', 'true', 'Request language from RAD', 16, 'Employment Section', 6, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (2, 'F3X', 'Individual Receipt', 'Contributor Occupation', NULL, '38', 'text', 'input', 'true', NULL, NULL, 'alphaNumeric', 'true', 'Request language from RAD', 17, 'Employment Section', 6, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (4, 'F3X', 'Individual Receipt', 'Contributor City', NULL, '30', 'text', 'input', 'true', NULL, NULL, 'alphaNumeric', NULL, NULL, 9, 'Address Section 2', 4, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (6, 'F3X', 'Individual Receipt', 'Contributor Zip', NULL, '9', 'text', 'input', 'true', NULL, NULL, 'alphaNumeric', NULL, NULL, 11, 'Address Section 2', 4, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (10, 'F3X', 'Individual Receipt', 'Memo Code', NULL, '1', 'text', 'input', 'false', NULL, NULL, 'alphaNumeric', 'true', 'Request language from RAD', 18, 'Memo Section', 7, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (5, 'F3X', 'Individual Receipt', 'Contributor State', NULL, '2', 'select', 'input', 'true', NULL, NULL, 'alphaNumeric', NULL, NULL, 10, 'Address Section 2', 4, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (12, 'F3X', 'Individual Receipt', 'Line Number', '11A', '8', 'hidden', 'hidden', 'true', 'true', NULL, 'alphaNumeric', 'false', NULL, 20, 'Official Use Only 1', 9, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (21, 'F3X', 'Individual Receipt', 'Contributor Street 1', NULL, '34', 'text', 'input', 'true', NULL, NULL, 'alphaNumeric', NULL, NULL, 7, 'Address Section 1', 3, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (23, 'F3X', 'Individual Receipt', 'Contributor Last Name', NULL, '30', 'text', 'input', 'true', NULL, NULL, 'alphaNumeric', NULL, NULL, 2, 'Name Section 1', 1, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (13, 'F3X', 'Individual Receipt', 'Transaction Id', NULL, '20', 'hidden', 'input', 'true', NULL, 'true', 'alphaNumeric', 'flase', NULL, 21, 'Official Use Only 1', 9, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (14, 'F3X', 'Individual Receipt', 'Back Reference Tran Id Number', NULL, '20', 'hidden', 'input', 'false', NULL, 'true', 'alphaNumeric', 'flase', NULL, 22, 'Official Use Only 2', 9, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (15, 'F3X', 'Individual Receipt', 'Back Reference Sched Name', NULL, '8', 'hidden', 'input', 'false', NULL, 'true', 'alphaNumeric', NULL, NULL, 23, 'Official Use Only 2', 9, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (17, 'F3X', 'Individual Receipt', 'Contributor Middle Name', NULL, '20', 'text', 'input', 'false', NULL, NULL, 'alphaNumeric', NULL, NULL, 4, 'Name Section 2', 2, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (18, 'F3X', 'Individual Receipt', 'Contributor Prefix', NULL, '10', 'text', 'input', 'false', NULL, NULL, 'alphaNumeric', NULL, NULL, 5, 'Name Section 2', 2, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (19, 'F3X', 'Individual Receipt', 'Contributor Suffix', NULL, '10', 'text', 'input', 'false', NULL, NULL, 'alphaNumeric', NULL, NULL, 6, 'Name Section 2', 2, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (22, 'F3X', 'Individual Receipt', 'Contributor Street 2', NULL, '34', 'text', 'input', 'false', NULL, NULL, 'alphaNumeric', NULL, NULL, 8, 'Address Section 1', 3, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (9, 'F3X', 'Individual Receipt', 'Contribution Aggregate', NULL, '12', 'number', 'input', 'false', NULL, NULL, 'alphaNumeric', 'true', 'Request language from RAD', 14, 'Amount Section', 5, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (24, 'F3X', 'Individual Receipt', 'Contributor First Name', NULL, '20', 'text', 'input', 'true', NULL, NULL, 'alphaNumeric', NULL, NULL, 3, 'Name Section 1', 1, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (3, 'F3X', 'Individual Receipt', 'Contribution Purpose Description', NULL, '100', 'text', 'input', 'false', NULL, NULL, 'alphaNumeric', 'true', 'Request language from RAD', 15, 'Purpose Section', 8, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (11, 'F3X', 'Individual Receipt', 'Memo Text', NULL, '100', 'text', 'input', 'false', NULL, NULL, 'alphaNumeric', 'true', 'Request language from RAD', 19, 'Memo Section', 7, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (16, 'F3X', 'Individual Receipt', 'Transaction Type Code', '15', '4', 'hidden', 'hidden', 'false', 'true', 'true', 'alphaNumeric', 'flase', NULL, 24, 'Official Use Only 3', 9, '2019-01-27', '2019-01-27');
INSERT INTO public.dynamic_form_fields (df_id, form_type, transaction_type, field_label, field_value, field_size, field_type, field_html_type, field_is_required, field_is_hidden, field_is_readonly, field_validation, field_infoicon, field_info, field_order, field_section, field_section_order, create_date, last_update_date) VALUES (8, 'F3X', 'Individual Receipt', 'Contribution Amount', NULL, '12', 'number', 'input', 'true', NULL, NULL, 'dollarAmount', 'true', 'Request language from RAD', 13, 'Amount Section', 5, '2019-01-27', '2019-01-27');


CREATE OR REPLACE VIEW public.dynamic_forms_view AS 
 WITH dy_forms_by_section AS (
         SELECT dynamic_form_fields.form_type,
            dynamic_form_fields.transaction_type,
            dynamic_form_fields.field_section,
            dynamic_form_fields.field_section_order,
            json_agg(json_build_object('text', dynamic_form_fields.field_label, 'infoIcon', dynamic_form_fields.field_infoicon, 'infoText', dynamic_form_fields.field_info, 'name', replace(dynamic_form_fields.field_label::text, ' '::text, ''::text), 'type', dynamic_form_fields.field_type, 'validation', json_build_object('required', dynamic_form_fields.field_is_required, 'max', dynamic_form_fields.field_size, dynamic_form_fields.field_validation, true)) ORDER BY dynamic_form_fields.field_order) AS json_by_section
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




