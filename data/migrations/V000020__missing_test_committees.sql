delete from public.committee_master where cmte_id in ('C00220269','C00690099','C01234555','C01234567','C01234588','C11234567');

insert into public.committee_master(cmte_id,cmte_name,street_1,street_2,city,state,zip_code,cmte_type,cmte_dsgn,cmte_filed_type,cmte_filing_freq,treasurer_last_name,treasurer_first_name,treasurer_middle_name,treasurer_prefix,treasurer_suffix) VALUES 
('C00220269','Ken Lally For Congress ','3600 West Lake Avenue','','IL','IL','60026    ','Q','B','5','T','Lally','Ken','','Mr.',''),
('C00690099','BRADFORD WHITE CORPORATION POLITICAL ACTION COMMITTEE ("BWC PAC")','','','','','','Q','U','5','M','Lanz','Ryan','','Mr.',''),
('C01234567','Test 1','20300 CIVIC CENTER DRIVE','SUITE 320','MI','MI','480764169','Q','U','5','T','GELLER','PERRY K.','','MR.','Sr.'),
('C01234588','Test 2','25 Massachusetts Ave NW','Ste 600','DC','DC','200017400','Q','B',' ','M','Walker','Kevin','','Mr.',''),
('C11234567','Test 3','25 Massachusetts Ave NW','Ste 600','DC','DC','200017400','Q','B',' ','M','Walker','Kevin','','Mr.',''),
('C01234555','Test 4','25 Massachusetts Ave NW','Ste 600','DC','DC','200017400','Q','B',' ','M','Walker','Kevin','','Mr.','');


/*M4 Report Description update */
update public.ref_rpt_types set rpt_type_desc='April 20 Monthly',last_update_date=now() where rpt_type='M4'
