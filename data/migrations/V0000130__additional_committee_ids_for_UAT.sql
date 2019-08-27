INSERT into authentication_account(password, is_superuser, email, username, created_at, updated_at, is_staff, is_active, date_joined, tagline)
VALUES ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693218',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693267',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693309',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693267',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693309',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693267',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693309',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693267',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693309',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693267',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693309',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693267',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693309',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','Rlanz@fec.gov','C00693267',now(),now(),'f','t',now(),'');



INSERT INTO public.forms_committee(
	committeeid, committeename, street1, street2, city, state, zipcode, treasurerlastname, treasurerfirstname, treasurermiddlename, treasurerprefix, treasurersuffix, created_at, updated_at,  isdeleted, email_on_file)	
SELECT cmte_id,cmte_name,street_1,street_2,city,state,20148,treasurer_last_name,treasurer_first_name,treasurer_middle_name,treasurer_prefix,treasurer_suffix,now(),now(),false, 'Rlanz@fec.gov'
FROM committee_master WHERE cmte_id in ('C00693218','C00693267', 'C00693309');

