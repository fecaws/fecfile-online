create table forms_and_schedules(form_type character varying(40),sched_type character varying(40), sort_order numeric, json_builder_flag boolean default False);
ALTER TABLE public.forms_and_schedules
  ADD CONSTRAINT pk_forms_and_schedules PRIMARY KEY (form_type, sched_type);

insert into forms_and_schedules(form_type,sched_type,sort_order,json_builder_flag) values
('form_3x','sched_a',1,true),
('form_3x','sched_b',2,true),
('form_3x','sched_c',3,true),
('form_3x','sched_c1',4,true),
('form_3x','sched_c2',5,true),
('form_3x','sched_d',6,true),
('form_3x','sched_e',7,true),
('form_3x','sched_f',8,true),
('form_3x','sched_h1',9,false),
('form_3x','sched_h2',10,false),
('form_3x','sched_h3',11,true),
('form_3x','sched_h4',12,true),
('form_3x','sched_h5',13,true),
('form_3x','sched_h6',14,false),
('form_3x','sched_l',15,true);

create table tran_query_string(form_type character varying(40),sched_type character varying(40), tran_type_identifier character varying(40), query_string text);
ALTER TABLE public.tran_query_string
  ADD CONSTRAINT pk_ftran_query_string PRIMARY KEY (form_type, tran_type_identifier);

insert into tran_query_string(form_type,sched_type,tran_type_identifier,query_string) values
('form_3x','sched_a','IND_REC',' select cmte_id from public.sched_a where transaction_type_identifier=''IND_REC'' and report_id=');
