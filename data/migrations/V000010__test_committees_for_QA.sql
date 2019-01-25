ALTER TABLE public.authentication_account
  DROP CONSTRAINT authentication_account_email_key;
 
ALTER TABLE public.authentication_account
  ADD CONSTRAINT authentication_account_username_email_key UNIQUE (email, username);


delete from authentication_account where username  in 
  ('C00329375','C00519900','C00013128','C00650184','C00302687','C00265652','C00423079','C00350421',
'C00506865','C00436998','C00345496','C00107680','C00488486','C00488338','C00484642','C00381517',
'C00599910','C00378125','C00661421','C00000729','C00002832','C00196824','C00235572','C00002238',
'C00001180','C00503870','C00577445','C00428557','C00453704','C00483891','C00250399','C00159319',
'C00326835','C00299842','C00001305','C00009845','C00467118','C00689000','C00193623',
'C00200865','C00493783','C00012229','C00647479','C00605634','C00296624','C00212423',
'C00351056','C00332890','C00496018','C00415992','C00526020','C00330290','C00011767',
'C00483693','C00484253','C00489203','C00473918','C00322958','C00329706','C00581199',
'C00364091','C00639021','C00000422','C00001214','C00165548','C00095059','C00624049',
'C00063586','C00000059','C00000638','C00651935','C00412072','C00573790','C00402800',
'C00433227','C00410068','C00452276','C00001727','C00010322','C00487900','C00259481',
'C00111476','C00000935','C00005801','C00466854','C00640946','C00148999'
);


insert into authentication_account(password,  is_superuser, email, username,  created_at, updated_at, is_staff, is_active, date_joined,tagline)
select 'pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','mkancherla.ctr@fec.gov',cmte_id,now(),now(),'f','t',now(),''
from committee_master where cmte_id in (
'C00200865','C00493783','C00012229','C00647479','C00605634','C00296624','C00212423',
'C00351056','C00332890','C00496018','C00415992','C00526020','C00330290','C00011767',
'C00483693','C00484253','C00489203','C00473918','C00322958','C00329706','C00581199',
'C00364091','C00639021','C00000422','C00001214','C00165548','C00095059','C00624049',
'C00063586','C00000059','C00000638','C00651935','C00412072','C00573790','C00402800',
'C00433227','C00410068','C00452276','C00001727','C00010322','C00487900','C00259481',
'C00111476','C00000935','C00005801','C00466854','C00640946','C00148999');

INSERT INTO public.forms_committee(
	committeeid, committeename, street1, street2, city, state, zipcode, treasurerlastname, treasurerfirstname, treasurermiddlename, treasurerprefix, treasurersuffix, created_at, updated_at,  isdeleted, email_on_file)	
select cmte_id,cmte_name,street_1,street_2,city,state,20148,treasurer_last_name,treasurer_first_name,treasurer_middle_name,treasurer_prefix,treasurer_suffix,now(),now(),false, 'mkancherla.ctr@fec.gov'
   from committee_master where cmte_id in ('C00200865','C00493783','C00012229','C00647479','C00605634','C00296624','C00212423',
'C00351056','C00332890','C00496018','C00415992','C00526020','C00330290','C00011767',
'C00483693','C00484253','C00489203','C00473918','C00322958','C00329706','C00581199',
'C00364091','C00639021','C00000422','C00001214','C00165548','C00095059','C00624049',
'C00063586','C00000059','C00000638','C00651935','C00412072','C00573790','C00402800',
'C00433227','C00410068','C00452276','C00001727','C00010322','C00487900','C00259481',
'C00111476','C00000935','C00005801','C00466854','C00640946','C00148999');

 insert into authentication_account(password,  is_superuser, email, username,  created_at, updated_at, is_staff, is_active, date_joined,tagline)
select 'pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','cmukerjee.ctr@fec.gov',cmte_id,now(),now(),'f','t',now(),''
from committee_master where cmte_id in ('C00329375','C00519900','C00013128','C00650184','C00302687','C00265652','C00423079','C00350421',
'C00506865','C00436998','C00345496','C00107680','C00488486','C00488338','C00484642','C00381517',
'C00599910','C00378125','C00661421','C00000729','C00002832','C00196824','C00235572','C00002238',
'C00001180','C00503870','C00577445','C00428557','C00453704','C00483891','C00250399','C00159319',
'C00326835','C00299842','C00001305','C00009845','C00467118','C00689000','C00193623');

INSERT INTO public.forms_committee(
	committeeid, committeename, street1, street2, city, state, zipcode, treasurerlastname, treasurerfirstname, treasurermiddlename, treasurerprefix, treasurersuffix, created_at, updated_at,  isdeleted, email_on_file)	
select cmte_id,cmte_name,street_1,street_2,city,state,20148,treasurer_last_name,treasurer_first_name,treasurer_middle_name,treasurer_prefix,treasurer_suffix,now(),now(),false, 'cmukerjee.ctr@fec.gov'
   from committee_master where cmte_id in ('C00329375','C00519900','C00013128','C00650184','C00302687','C00265652','C00423079','C00350421',
'C00506865','C00436998','C00345496','C00107680','C00488486','C00488338','C00484642','C00381517',
'C00599910','C00378125','C00661421','C00000729','C00002832','C00196824','C00235572','C00002238',
'C00001180','C00503870','C00577445','C00428557','C00453704','C00483891','C00250399','C00159319',
'C00326835','C00299842','C00001305','C00009845','C00467118','C00689000','C00193623');
