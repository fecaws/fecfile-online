--DEBT PAYMENTS SQL

update ref_transaction_types set parent_tran_id = null where tran_identifier = 'IE_B4_DISSE_MEMO';

update ref_transaction_types set parent_tran_id = 160 where tran_identifier = 'IE';

commit;