
update committee_master  set cmte_dsgn='U',cmte_filing_freq='Q' where cmte_id='C00690099';
update committee_master  set cmte_dsgn='U',cmte_filing_freq='M' where cmte_id='C00220269';

/*Fixing the sort order for reports*/
update public.ref_rpt_types set rpt_type_order=0 where rpt_type='M1';
update public.ref_rpt_types set rpt_type_order=1 where rpt_type='M2';
update public.ref_rpt_types set rpt_type_order=2 where rpt_type='M3';
update public.ref_rpt_types set rpt_type_order=3 where rpt_type='Q1';
update public.ref_rpt_types set rpt_type_order=4 where rpt_type='M4';
update public.ref_rpt_types set rpt_type_order=5 where rpt_type='M5';
update public.ref_rpt_types set rpt_type_order=6 where rpt_type='M6';
update public.ref_rpt_types set rpt_type_order=7 where rpt_type='Q2';
update public.ref_rpt_types set rpt_type_order=8 where rpt_type='Q2S';
update public.ref_rpt_types set rpt_type_order=9 where rpt_type='M7';
update public.ref_rpt_types set rpt_type_order=10 where rpt_type='M7S';
update public.ref_rpt_types set rpt_type_order=11 where rpt_type='MY';
update public.ref_rpt_types set rpt_type_order=12 where rpt_type='MSA';
update public.ref_rpt_types set rpt_type_order=13 where rpt_type='QSA';
update public.ref_rpt_types set rpt_type_order=14 where rpt_type='QMS';
update public.ref_rpt_types set rpt_type_order=15 where rpt_type='M8';
update public.ref_rpt_types set rpt_type_order=16 where rpt_type='M9';
update public.ref_rpt_types set rpt_type_order=17 where rpt_type='Q3';
update public.ref_rpt_types set rpt_type_order=18 where rpt_type='M10';
update public.ref_rpt_types set rpt_type_order=19 where rpt_type='M11';
update public.ref_rpt_types set rpt_type_order=20 where rpt_type='M12';
update public.ref_rpt_types set rpt_type_order=21 where rpt_type='YE';
update public.ref_rpt_types set rpt_type_order=22 where rpt_type='MSY';
update public.ref_rpt_types set rpt_type_order=23 where rpt_type='QYS';
update public.ref_rpt_types set rpt_type_order=24 where rpt_type='QYE';
update public.ref_rpt_types set rpt_type_order=25 where rpt_type='MYS';
update public.ref_rpt_types set rpt_type_order=26 where rpt_type='12P';
update public.ref_rpt_types set rpt_type_order=27 where rpt_type='12G';
update public.ref_rpt_types set rpt_type_order=28 where rpt_type='12R';
update public.ref_rpt_types set rpt_type_order=29 where rpt_type='12S';
update public.ref_rpt_types set rpt_type_order=30 where rpt_type='12C';
update public.ref_rpt_types set rpt_type_order=31 where rpt_type='30P';
update public.ref_rpt_types set rpt_type_order=32 where rpt_type='30G';
update public.ref_rpt_types set rpt_type_order=33 where rpt_type='30D';
update public.ref_rpt_types set rpt_type_order=34 where rpt_type='30R';
update public.ref_rpt_types set rpt_type_order=35 where rpt_type='30S';
update public.ref_rpt_types set rpt_type_order=36 where rpt_type='10P';
update public.ref_rpt_types set rpt_type_order=37 where rpt_type='10G';
update public.ref_rpt_types set rpt_type_order=38 where rpt_type='10D';
update public.ref_rpt_types set rpt_type_order=39 where rpt_type='10R';
update public.ref_rpt_types set rpt_type_order=40 where rpt_type='10S';
update public.ref_rpt_types set rpt_type_order=41 where rpt_type='90D';
update public.ref_rpt_types set rpt_type_order=42 where rpt_type='90S';
update public.ref_rpt_types set rpt_type_order=43 where rpt_type='60D';
update public.ref_rpt_types set rpt_type_order=44 where rpt_type='CA';
update public.ref_rpt_types set rpt_type_order=45 where rpt_type='ADJ';
update public.ref_rpt_types set rpt_type_order=46 where rpt_type='TER';
update public.ref_rpt_types set rpt_type_order=47 where rpt_type='24';
update public.ref_rpt_types set rpt_type_order=48 where rpt_type='48';






