/*reference table for entity type*/
create table ref_entity_types (entity_type character varying(3),entity_type_description character varying(100));

insert into ref_entity_types(entity_type,entity_type_description) values('CAN','Candidate');
insert into ref_entity_types(entity_type,entity_type_description) values('CCM','Candidate Committee');
insert into ref_entity_types(entity_type,entity_type_description) values('COM','Committee');
insert into ref_entity_types(entity_type,entity_type_description) values('IND','Individual (a person)');
insert into ref_entity_types(entity_type,entity_type_description) values('ORG','Organization (not a committee and not a person)');
insert into ref_entity_types(entity_type,entity_type_description) values('PAC','Political Action Committee');
insert into ref_entity_types(entity_type,entity_type_description) values('PTY','Party Organization');

