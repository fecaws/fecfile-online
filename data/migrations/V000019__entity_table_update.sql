DROP TABLE public.entity;
DROP FUNCTION public.get_next_entity_id;
--Function for Entity Id Sequence.   Format: ENTYYYYYMMDDSSSSSSS
CREATE OR REPLACE FUNCTION public.get_next_entity_id (p_entity_type character)
    RETURNS character
    LANGUAGE 'plpgsql'
AS $BODY$
begin
return substr(upper(p_entity_type),1,3)||(TO_CHAR(current_date,'YYYYMMDD'):: bigint * 1000000000) + nextval('entity_id_seq'):: bigint;
end;
$BODY$;


--Table to save Entity Information
create table public.entity(
        entity_id character varying(20) default get_next_entity_id('ENT'),
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

CREATE INDEX idx_entity_cmte_id ON public.entity USING btree (cmte_id);   
CREATE INDEX idx_entity_cmte_entity_type ON public.entity USING btree (entity_type);   
CREATE INDEX idx_entity_entity_id ON public.entity(entity_id); 








