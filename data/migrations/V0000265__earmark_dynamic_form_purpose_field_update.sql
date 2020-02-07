update public.dynamic_form_fields set field_value = 'Earmarked through' where transaction_type in
('EAR_REC', 'PAC_EAR_REC', 'EAR_REC_RECNT_ACC', 'EAR_REC_CONVEN_ACC', 'EAR_REC_HQ_ACC') 
and field_label = 'Contribution Purpose Description';

update public.dynamic_form_fields set field_value = 'Earmarked through' where transaction_type in 
('EAR_REC', 'PAC_EAR_REC', 'EAR_REC_RECNT_ACC', 'EAR_REC_CONVEN_ACC', 'EAR_REC_HQ_ACC') 
and field_label = 'Pre Text';

update public.dynamic_form_fields set field_value = 'Total earmarked through conduit.' where transaction_type in
('CON_EAR_UNDEP_MEMO', 'CON_EAR_DEP_MEMO', 'PAC_CON_EAR_DEP_MEMO', 'PAC_CON_EAR_UNDEP_MEMO', 'PAC_EAR_MEMO', 
 'EAR_REC_RECNT_ACC_MEMO', 'EAR_MEMO', 'EAR_REC_CONVEN_ACC_MEMO', 'EAR_REC_HQ_ACC_MEMO') 
 and field_label = 'Contribution Purpose Description';
