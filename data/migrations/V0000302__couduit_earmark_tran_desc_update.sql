update ref_transaction_types set tran_desc = 'Conduit Earmark Out (Undeposited)' where tran_identifier = 'CON_EAR_UNDEP_MEMO';

update ref_transaction_types set tran_desc = 'Conduit Earmark Out (Deposited)' where tran_identifier = 'CON_EAR_DEP_MEMO';

update ref_transaction_types set tran_desc = 'PAC Conduit Earmark Out (Deposited)' where tran_identifier = 'PAC_CON_EAR_DEP_MEMO';

update ref_transaction_types set tran_desc = 'PAC Conduit Earmark Out (Undeposited)' where tran_identifier = 'PAC_CON_EAR_UNDEP_MEMO';
