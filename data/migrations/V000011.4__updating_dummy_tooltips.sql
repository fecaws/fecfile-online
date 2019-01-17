--Updating the default tooltip with dummy message
update transaction_categories 
	set category_type_info='Language will be provided by RAD',
	    sub_category_type_info='Language will be provided by RAD',
	    tran_type_info='Language will be provided by RAD',
	    sub_tran_type_info=sub_tran_type_info||' - Language will be provided by RAD';
