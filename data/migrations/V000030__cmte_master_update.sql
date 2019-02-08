update committee_master set  street_1 ='999 E Street' where trim(street_1)='';
update committee_master set  zip_code ='12345' where trim(zip_code)='';
update committee_master set  zip_code ='city' where trim(city)='';
update committee_master set  treasurer_last_name ='Last Name' where trim(treasurer_last_name)='';
update committee_master set  treasurer_first_name ='First Name' where trim(treasurer_first_name)='';
update committee_master set  state ='DC' where trim(state)='';

