create table public.ref_filing_freq
(
  filing_freq    character varying(1),
  filing_freq_desc  character varying(90)
);
 
create table public.ref_cmte_type
(
  cmte_type    character varying(1),
  cmte_type_desc  character varying(90)
); 

create table public.ref_cmte_dsgn
(
  cmte_dsgn    character varying(1),
  cmte_dsgn_desc  character varying(90)
); 


Insert into ref_filing_freq   (filing_freq, filing_freq_desc) Values   ('A', 'Administratively Terminated');
Insert into ref_filing_freq   (filing_freq, filing_freq_desc) Values   ('D', 'Debt');
Insert into ref_filing_freq   (filing_freq, filing_freq_desc) Values   ('M', 'Monthly Filer');
Insert into ref_filing_freq   (filing_freq, filing_freq_desc) Values   ('Q', 'Quarterly Filer');
Insert into ref_filing_freq   (filing_freq, filing_freq_desc) Values   ('T', 'Terminated');
Insert into ref_filing_freq   (filing_freq, filing_freq_desc) Values   ('W', 'Waived');


Insert into public.ref_cmte_dsgn   (cmte_dsgn, cmte_dsgn_desc) Values   ('A', 'Authorized By A Candidate');
Insert into public.ref_cmte_dsgn   (cmte_dsgn, cmte_dsgn_desc) Values   ('J', 'Joint Fundraiser');
Insert into public.ref_cmte_dsgn   (cmte_dsgn, cmte_dsgn_desc) Values   ('P', 'Principal Campaign Committee Of A Candidate');
Insert into public.ref_cmte_dsgn   (cmte_dsgn, cmte_dsgn_desc) Values   ('U', 'Unauthorized');
Insert into public.ref_cmte_dsgn   (cmte_dsgn, cmte_dsgn_desc) Values   ('B', 'Lobbyist/Registrant Pac');
Insert into public.ref_cmte_dsgn   (cmte_dsgn, cmte_dsgn_desc) Values   ('D', 'Leadership Pac');

Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('C', 'Communication Cost');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('D', 'Delegate');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('H', 'House');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('N', 'Non-Qualified Non-Party');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('P', 'Presidential');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('Q', 'Qualified Non-Party');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('S', 'Senate');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('X', 'Non-Qualified Party');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('Y', 'Qualified Party');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('Z', 'National Party Organization. Non Fed Acct.');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('V', 'Non-Qualified Non-Party With Non-Contribution Account');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('W', 'Qualified Non-Party With Non-Contribution Account');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('I', 'Independent Expenditure - Person Or Group Not A Committee');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('U', 'Single Candidate Independent Expenditure Committee');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('O', 'Independent Expenditure-Only Committee');
Insert into public.ref_cmte_type   (cmte_type, cmte_type_desc) Values   ('E', 'Electioneering Communication');






