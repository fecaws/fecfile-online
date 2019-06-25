alter table public.dynamic_form_fields add column class_name character varying (30) DEFAULT 'col col-md-3';
alter table public.dynamic_form_fields add column height character varying(7); 
alter table public.dynamic_form_fields add column width character varying(7);
ALTER TABLE public.dynamic_form_fields ADD COLUMN scroll boolean DEFAULT false;
ALTER TABLE public.dynamic_form_fields ADD COLUMN seperator boolean DEFAULT false;
ALTER TABLE public.dynamic_form_fields drop COLUMN transaction_type_identifier;



update  public.dynamic_form_fields set field_section = 'Memo Section' where field_section in ('Purpose Section');
update  public.dynamic_form_fields set field_section = 'Amount Section' where field_db_name in ('memo_code');
update  public.dynamic_form_fields set field_db_name = 'transaction_type_identifier' where field_label in ('Transaction Type Identifier');



update  public.dynamic_form_fields set class_name = 'col col-md-3' where field_section in ('Name Section 1','Name Section 2','Address Section 2','Employment Section','Amount Section');
update  public.dynamic_form_fields set class_name = 'col col-md-4' where field_section in ('Address Section 1');
update  public.dynamic_form_fields set class_name = 'col col-md-5' where field_section in ('Memo Section');
update  public.dynamic_form_fields set class_name = 'col col-md-3' where class_name is null;



update  public.dynamic_form_fields set height='30px', width='190px' where field_db_name='entity_type';
update  public.dynamic_form_fields set height='30px', width='197px' where field_db_name='last_name';
update  public.dynamic_form_fields set height='30px', width='197px' where field_db_name='first_name';
update  public.dynamic_form_fields set height='30px', width='197px' where field_db_name='middle_name';
update  public.dynamic_form_fields set height='30px', width='98.35px' where field_db_name='preffix';
update  public.dynamic_form_fields set height='30px', width='98.35px' where field_db_name='suffix';
update  public.dynamic_form_fields set height='30px', width='275px' where field_db_name='street_1';
update  public.dynamic_form_fields set height='30px', width='275px' where field_db_name='street_2';
update  public.dynamic_form_fields set height='30px', width='197px' where field_db_name='city';
update  public.dynamic_form_fields set height='30px', width='98px' where field_db_name='state';
update  public.dynamic_form_fields set height='30px', width='98px' where field_db_name='zip_code';
update  public.dynamic_form_fields set height='30px', width='154px' where field_db_name='contribution_date';
update  public.dynamic_form_fields set height='30px', width='154px' where field_db_name='contribution_amount';
update  public.dynamic_form_fields set height='30px', width='196px' where field_db_name='contribution_aggregate';
update  public.dynamic_form_fields set height='135px', width='400px' where field_db_name='purpose_description';
update  public.dynamic_form_fields set height='30px', width='200px' where field_db_name='employer';
update  public.dynamic_form_fields set height='30px', width='200px' where field_db_name='occupation';
update  public.dynamic_form_fields set height='24px', width='24px' where field_db_name='memo_code';
update  public.dynamic_form_fields set height='135px', width='400px' where field_db_name='memo_text';
update  public.dynamic_form_fields set height='30px', width='100px' where field_db_name='line_number';
update  public.dynamic_form_fields set height='30px', width='100px' where field_db_name='transaction_id';
update  public.dynamic_form_fields set height='30px', width='100px' where field_db_name='back_ref_transaction_id';
update  public.dynamic_form_fields set height='30px', width='100px' where field_db_name='back_ref_sched_name';
update  public.dynamic_form_fields set height='30px', width='100px' where field_db_name='transaction_type';
update  public.dynamic_form_fields set height='30px', width='100px' where field_db_name='transaction_type_identifier';
update public.dynamic_form_fields set scroll = true where field_section='Memo Section';

update public.dynamic_form_fields set seperator = true where field_section in('Employment Section','Name Section 2','Address Section 2');

 
CREATE OR REPLACE VIEW public.dynamic_forms_view AS 
 WITH dy_forms_by_section AS (
         SELECT dynamic_form_fields.form_type,
            dynamic_form_fields.transaction_type,
            dynamic_form_fields.field_section,
            dynamic_form_fields.field_section_order,
            dynamic_form_fields.class_name,
            dynamic_form_fields.seperator,
            json_agg(json_build_object('text', dynamic_form_fields.field_label, 'infoIcon', dynamic_form_fields.field_infoicon, 'infoText', dynamic_form_fields.field_info, 'name', dynamic_form_fields.field_db_name, 'type', dynamic_form_fields.field_type, 'scroll',scroll,'height',height,'width',width,'validation', json_build_object('required', dynamic_form_fields.field_is_required, 'max', dynamic_form_fields.field_size, dynamic_form_fields.field_validation, true)) ORDER BY dynamic_form_fields.field_order) AS json_by_section
           FROM dynamic_form_fields
          WHERE dynamic_form_fields.field_type::text <> 'hidden'::text
          GROUP BY dynamic_form_fields.form_type, dynamic_form_fields.transaction_type, dynamic_form_fields.field_section, dynamic_form_fields.field_section_order,dynamic_form_fields.class_name,dynamic_form_fields.seperator
        )
 SELECT dfbs.form_type,
    dfbs.transaction_type,
    json_build_object('data', json_build_object('formFields', json_agg(json_build_object('colClassName', dfbs.class_name, 'seperator', seperator, 'cols', dfbs.json_by_section) ORDER BY dfbs.field_section_order), 'hiddenFields', ( SELECT json_agg(json_build_object('type', h.field_type, 'name', replace(h.field_label::text, ' '::text, ''::text), 'value', h.field_value)) AS json_agg
           FROM dynamic_form_fields h
          WHERE h.field_type::text = 'hidden'::text), 'states', ( SELECT json_agg(json_build_object('name', ref_states.state_description, 'code', ref_states.state_code) ORDER BY ref_states.st_number) AS json_agg
           FROM ref_states))) AS form_fields
   FROM dy_forms_by_section dfbs
  GROUP BY dfbs.form_type, dfbs.transaction_type;


