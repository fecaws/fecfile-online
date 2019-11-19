delete from entity where cmte_id='C00000000';

INSERT INTO public.entity(
	entity_id, entity_type, cmte_id, first_name, last_name, middle_name, preffix, suffix, street_1, street_2, city, state, zip_code, ref_cand_cmte_id, cand_office, cand_office_state, cand_office_district, cand_election_year)
select get_next_entity_id('FEC'),'CAN','C00000000',trim(cand_first_name),trim(cand_last_name),cand_middle_name,cand_prefix,cand_suffix,cand_street_1,cand_street_2,cand_city,cand_state,cand_zip,cand_id,cand_office,cand_office_state,cand_office_district,cand_election_year  from candidate_master where length(cand_first_name)<=20;
 

INSERT INTO public.entity(entity_id, entity_type, cmte_id, entity_name,street_1, street_2, city, state, zip_code, ref_cand_cmte_id)
select  get_next_entity_id('FEC'), (case when cmte_type in ('H','S','P') then 'CCM' 
	when cmte_type_category in ('PAC','PTY') then cmte_type_category
	      else 'COM' end),'C00000000',cmte_name,street_1, street_2, city, state, zip_code,cmte_id from committee_master;
