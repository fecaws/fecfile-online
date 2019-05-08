delete from authentication_account where username  in ('C00337733','C00547349','C00458000','C00029447','C00034157');
delete from public.forms_committee where committeeid in ('C00337733','C00547349','C00458000','C00029447','C00034157');

insert into authentication_account(password,  is_superuser, email, username,  created_at, updated_at, is_staff, is_active, date_joined,tagline)
select 'pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','mkancherla.ctr@fec.gov',cmte_id,now(),now(),'f','t',now(),''
from committee_master where cmte_id in ('C00337733','C00547349','C00458000','C00029447','C00034157');

INSERT INTO public.forms_committee(
	committeeid, committeename, street1, street2, city, state, zipcode, treasurerlastname, treasurerfirstname, treasurermiddlename, treasurerprefix, treasurersuffix, created_at, updated_at,  isdeleted, email_on_file)	
select cmte_id,cmte_name,street_1,street_2,city,state,20148,treasurer_last_name,treasurer_first_name,treasurer_middle_name,treasurer_prefix,treasurer_suffix,now(),now(),false, 'mkancherla.ctr@fec.gov'
   from committee_master where cmte_id in ('C00337733','C00547349','C00458000','C00029447','C00034157');

