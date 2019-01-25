--Sequence for entity table. Re-sets after the max value
CREATE SEQUENCE public.entity_id_seq
    CYCLE
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 999999999;
    
--Function for Entity Id Sequence.   Format: YYYYYMMDDSSSSSSS
CREATE OR REPLACE FUNCTION public.get_next_entity_id ()
    RETURNS character
    LANGUAGE 'plpgsql'
AS $BODY$
begin
return 'ENT'||(TO_CHAR(current_date,'YYYYMMDD'):: bigint * 1000000000) + nextval('entity_id_seq'):: bigint;
end;
$BODY$;


--Table to save Entity Information
create table entity(
        entity_id character varying(20) default get_next_entity_id(),
        entity_type character varying(8) NOT NULL,
        cmte_id character varying(9) NOT NULL,    
        entity_name character varying(200),
        first_name character varying(20),
        last_name character varying(30),
        middle_name character varying(20),
        preffix character varying(10),
        suffix character varying(10),
        street_1 character varying(35),
        street_2 character varying(35),
        city character varying(30),
        state character varying(2),
        zip_code character varying(9),
        occupation character varying(40),
        employer character varying(40),
        ref_cand_cmte_id character varying(9),
        delete_ind character(1),
        create_date timestamp default now(),
        last_update_date timestamp default now(),
        CONSTRAINT entity_pk PRIMARY KEY (entity_id)
);

CREATE INDEX entity_cmte_id_idx ON public.entity USING btree (cmte_id);   
CREATE INDEX entity_entity_id_idx ON public.entity(entity_id); 








