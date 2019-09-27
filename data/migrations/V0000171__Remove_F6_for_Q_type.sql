--F6 should not be listed as an available report for a PAC or Party committee. Only Authorized committees can file the F6.
delete from ref_cmte_type_vs_forms where form_type='F6' and cmte_type not in ('H','S','P');
