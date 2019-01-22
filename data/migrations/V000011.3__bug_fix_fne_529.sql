--FNE 529 Bug fix
update ref_cmte_type_vs_forms  set category ='Other Forms' where form_type='F8';
update ref_cmte_type_vs_forms  set category ='Other Forms' where form_type='F6' and cmte_type not in ('H','S');


