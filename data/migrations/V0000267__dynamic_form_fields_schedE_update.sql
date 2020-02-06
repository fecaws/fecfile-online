update dynamic_form_fields set field_is_readonly = true where transaction_type like 'IE_%_MEMO' and 
field_db_name in('cand_last_name','cand_first_name','cand_middle_name','cand_prefix','cand_suffix','cand_last_name','payee_cmte_id',
				'beneficiary_cand_id','cand_office','cand_office_state','cand_office_district','cand_election_year','support_oppose_code',
 				'election_other_description','election_code');

 
 

update dynamic_form_fields set field_is_readonly = true where transaction_type = 'IE_B4_DISSE' and field_db_name in (
'entity_type',
'entity_name',
'last_name',
'first_name',
'middle_name',
'prefix',
'suffix',
'street_1',
'street_2',
'city',
'state',
'zip_code');
