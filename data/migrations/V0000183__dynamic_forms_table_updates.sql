-- H4
update dynamic_form_fields
set field_db_name = 'total_amount'
where field_label = 'Total Amount'
and transaction_type = 'ALLOC_EXP_DEBT';

update dynamic_form_fields
set field_db_name = 'fed_share_amount'
where field_label = 'Federal Share'
and transaction_type = 'ALLOC_EXP_DEBT';

update  dynamic_form_fields
set field_db_name = 'non_fed_share_amount'
where field_label = 'Non Federal Share' 
and transaction_type = 'ALLOC_EXP_DEBT';

update dynamic_form_fields
set field_db_name = 'activity_event_amount_ytd'
where field_label = 'Activity/Event Total Year to Date'
and transaction_type = 'ALLOC_EXP_DEBT';

update  dynamic_form_fields 
set field_is_readonly = true, field_is_required = false
where transaction_type = 'ALLOC_EXP_DEBT'
and field_label in ( 'Federal Share', 'Non Federal Share', 'Activity/Event Total Year to Date' );


-- for H6
update dynamic_form_fields
set field_db_name = 'total_amount'
where field_label = 'Total Amount'
and transaction_type = 'ALLOC_FEA_DISB_DEBT';

update dynamic_form_fields
set field_db_name = 'fed_share_amount'
where field_label = 'Federal Share'
and transaction_type = 'ALLOC_FEA_DISB_DEBT';

update  dynamic_form_fields
set field_db_name = 'non_fed_share_amount'
where field_label = 'Non Federal Share' 
and transaction_type = 'ALLOC_FEA_DISB_DEBT';

update dynamic_form_fields
set field_db_name = 'activity_event_amount_ytd'
where field_label = 'Activity/Event Total Year to Date'
and transaction_type = 'ALLOC_FEA_DISB_DEBT';

update  dynamic_form_fields 
set field_is_readonly = true, field_is_required = false
where transaction_type = 'ALLOC_FEA_DISB_DEBT'
and field_label in ( 'Federal Share', 'Non Federal Share', 'Activity/Event Total Year to Date' );


-- D
update  dynamic_form_fields 
set field_is_readonly = true, field_is_required = false
where transaction_type = 'DEBT_TO_VENDOR'
and field_label in ( 'Beginning Balance(This Period)', 'Balance at Close(This Period)', 'Payment Amount(This Period)' );


