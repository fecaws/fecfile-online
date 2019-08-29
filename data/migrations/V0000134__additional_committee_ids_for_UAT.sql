INSERT into authentication_account(
        password, 
        is_superuser,
        email, 
        username, 
        created_at, 
        updated_at, 
        is_staff, 
        is_active, 
        date_joined, 
        tagline
    )
VALUES
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','radame-wilson@fec.gov','C00407627',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','radame-wilson@fec.gov','C00211037',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','achamorro@fec.gov','C00249250',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','achamorro@fec.gov','C00241083',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','mbeckman@fec.gov','C00319699',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','mbeckman@fec.gov','C00253906',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','jbaisden@fec.gov','C00368159',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','jbaisden@fec.gov','C00366195',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','kfortkiewicz@fec.gov','C00370221',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','kfortkiewicz@fec.gov','C00126805',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','JAmerhein@fec.gov','C00374306',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','JAmerhein@fec.gov','C00275529',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','RFurman@fec.gov','C00385518',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','RFurman@fec.gov','C00335109',now(),now(),'f','t',now(),'');



INSERT INTO public.forms_committee(
	committeeid, 
    committeename, 
    street1, 
    street2, 
    city, 
    state, 
    zipcode, 
    treasurerlastname, 
    treasurerfirstname, 
    treasurermiddlename, 
    treasurerprefix, 
    treasurersuffix, 
    created_at, 
    updated_at,  
    isdeleted, 
    email_on_file)	
    SELECT 
        cm.cmte_id, 
        cm.cmte_name, 
        cm.street_1, 
        cm.street_2, 
        cm.city, 
        cm.state, 
        20148, 
        cm.treasurer_last_name, 
        cm.treasurer_first_name, 
        cm.treasurer_middle_name, 
        cm.treasurer_prefix, 
        cm.treasurer_suffix, 
        now(), 
        now(), 
        false, 
        aa.email
    FROM committee_master cm 
    INNER JOIN  authentication_account aa ON cm.cmte_id = aa.username 
WHERE cm.cmte_id in ( 
    'C00407627',
    'C00211037',
    'C00249250',
    'C00241083',
    'C00319699',
    'C00253906',
    'C00368159',
    'C00366195',
    'C00370221',
    'C00126805',
    'C00374306',
    'C00275529',
    'C00385518',
    'C00335109'
    );

Delete from cmte_current_due_reports
where cmte_id in ( 
    'C00407627',
    'C00211037',
    'C00249250',
    'C00241083',
    'C00319699',
    'C00253906',
    'C00368159',
    'C00366195',
    'C00370221',
    'C00126805',
    'C00374306',
    'C00275529',
    'C00385518',
    'C00335109'
    );

INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00407627', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';

INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00211037', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';

INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00249250', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00241083', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00319699', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00253906', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00368159', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00366195', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00370221', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00126805', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00374306', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00275529', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00385518', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00335109', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';

update committee_master set cmte_type='Q' where cmte_id in (
  'C00126805',
  'C00211037',
  'C00241083',
  'C00253906',
  'C00275529',
  'C00335109',
  'C00366195'

);
update committee_master set cmte_type='X' where cmte_id in (
  'C00407627',
  'C00249250',
  'C00319699',
  'C00368159',
  'C00370221',
  'C00374306',
  'C00385518'

);
update committee_master set cmte_dsgn='B', cmte_filing_freq='M'  where cmte_id in ( 
    'C00407627',
    'C00211037',
    'C00249250',
    'C00241083',
    'C00319699',
    'C00253906',
    'C00368159',
    'C00366195',
    'C00370221',
    'C00126805',
    'C00374306',
    'C00275529',
    'C00385518',
    'C00335109'
    );

