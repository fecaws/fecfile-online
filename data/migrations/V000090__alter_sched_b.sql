alter table sched_b add column beneficiary_cmte_name character  varying(200);
alter table sched_b add column beneficiary_cand_last_name character  varying(34);
alter table sched_b add column beneficiary_cand_first_name character  varying(30);
alter table sched_b add column beneficiary_cand_middle_name character  varying(30);
alter table sched_b add column beneficiary_cand_prefix character  varying(10);
alter table sched_b add column beneficiary_cand_suffix character  varying(10);

update sched_b   set  beneficiary_cmte_id='C00270934', 
		      beneficiary_cmte_name='Stark County Republican Party'
where  entity_id like '%CCM%' and cmte_id='C00034157';

update sched_b   set  beneficiary_cmte_id='C00001198', 
		      beneficiary_cmte_name='American Hotel and Lodging Association Political Action Committee (''HotelPAC'')'
where  entity_id like '%CCM%' and cmte_id='C00029447';

update sched_b   set  beneficiary_cand_id='H4MN06111', 
		      beneficiary_cand_last_name='Read',
		      beneficiary_cand_first_name='James',
		      beneficiary_cand_middle_name='M',
		      beneficiary_cand_suffix='II',
		      beneficiary_cand_prefix='Mr',
		      beneficiary_cand_office='H',
		      beneficiary_cand_state='MN',
		      beneficiary_cand_district='06'		      
where  entity_id  like '%IND%' and cmte_id='C00029447'  and line_number='28A' ;
