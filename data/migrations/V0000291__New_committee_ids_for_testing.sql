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
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','svivian@fec.gov', 'C00361956',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','svivian@fec.gov', 'C00538975',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','kmcqueen@fec.gov','C00385120',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','kmcqueen@fec.gov','C00388587',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','clucas@fec.gov',  'C00084475',now(),now(),'f','t',now(),''),
       ('pbkdf2_sha256$36000$gZSXSbOJiHED$NKQPaMEHncW8lw0y8vvRvXD/3w4vs9xXWiTvjdFAUiM=','f','clucas@fec.gov',  'C00424226',now(),now(),'f','t',now(),'');


-- Applies to bot PAC and PTY
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
  'C00361956',
  'C00538975',
  'C00385120',
  'C00388587',
  'C00084475',
  'C00424226'
 );

Delete from cmte_current_due_reports
where cmte_id in (
  'C00361956',
  'C00538975',
  'C00385120',
  'C00388587',
  'C00084475',
  'C00424226'

    );

-- Applies to PAC only
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00361956', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';

INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00385120', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';

INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00084475', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00000422';

-- Applies to PTY only
INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00538975', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00010603';

INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00388587', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00010603';

INSERT INTO public.cmte_current_due_reports(
            cmte_id, form_type, report_type, due_date, last_update_date)
select 'C00424226', form_type, report_type, due_date, last_update_date
from public.cmte_current_due_reports
where cmte_id ='C00010603';


-- Applies to PAC
update committee_master set cmte_type='Q' where cmte_id in (
  'C00361956',
  'C00385120',
  'C00084475'
);
-- Applies to PTY
update committee_master set cmte_type='X' where cmte_id in (
  'C00538975',
  'C00388587',
  'C00424226'
);

-- Applies to both PTY and PTY
update committee_master set cmte_dsgn='B', cmte_filing_freq='M'  where cmte_id in (
  'C00361956',
  'C00538975',
  'C00385120',
  'C00388587',
  'C00084475',
  'C00424226'
);
