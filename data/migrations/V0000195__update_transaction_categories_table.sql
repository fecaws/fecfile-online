delete from public.transaction_categories where tran_type_identifier like '%LOAN%' and tran_category_id in ( 995, 996, 997, 998)  ;

INSERT INTO public.transaction_categories(
            form_type, category_type, category_type_info, category_type_info_icon, 
            category_order, sub_category_type, sub_category_type_info, sub_category_type_info_icon, 
            sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
            tran_type_info, tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, 
            sub_tran_type_order, sub_tran_type_info, sub_tran_type_info_icon, 
            tran_category_id, tran_type_identifier, tran_sub_type_identifier, 
            cmte_type_category, is_functional, sched_type)
    VALUES ('F3X', 'Loans and Debts', 'Language will be provided by RAD', 'FALSE', 
            3, 'Loans Owed to Committee', 'Schedule C Entry ', 'TRUE', 
            2, 'Schedule C Entry', 13, 1, 
            'Language will be provided by RAD', 'TRUE', '', '', null, '', 'TRUE','995',
            'LOAN_TO_COMM', '','PTY',true, 
            'sched_c' );


INSERT INTO public.transaction_categories(
            form_type, category_type, category_type_info, category_type_info_icon, 
            category_order, sub_category_type, sub_category_type_info, sub_category_type_info_icon, 
            sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
            tran_type_info, tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, 
            sub_tran_type_order, sub_tran_type_info, sub_tran_type_info_icon, 
            tran_category_id, tran_type_identifier, tran_sub_type_identifier, 
            cmte_type_category, is_functional, sched_type)
    VALUES ('F3X', 'Loans and Debts', 'Language will be provided by RAD', 'FALSE', 
            3, 'Loans Owed to Committee', 'Schedule C Summary Entry ', 'TRUE', 
            2, 'Schedule C Summary Entry', 13, 2, 
            'Language will be provided by RAD', 'TRUE', '', '', null, '', 'TRUE','996',
            'LOAN_TO_COMM', '','PTY',true, 
            'sched_c' );

INSERT INTO public.transaction_categories(
            form_type, category_type, category_type_info, category_type_info_icon, 
            category_order, sub_category_type, sub_category_type_info, sub_category_type_info_icon, 
            sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
            tran_type_info, tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, 
            sub_tran_type_order, sub_tran_type_info, sub_tran_type_info_icon, 
            tran_category_id, tran_type_identifier, tran_sub_type_identifier, 
            cmte_type_category, is_functional, sched_type)
    VALUES ('F3X', 'Loans and Debts', 'Language will be provided by RAD', 'FALSE', 
            3, 'Loans Owed to Committee', 'Schedule C Entry ', 'TRUE', 
            2, 'Schedule C Entry', 13, 1, 
            'Language will be provided by RAD', 'TRUE', '', '', null, '', 'TRUE','997',
            'LOAN_TO_COMM', '','PAC',true, 
            'sched_c' );


INSERT INTO public.transaction_categories(
            form_type, category_type, category_type_info, category_type_info_icon, 
            category_order, sub_category_type, sub_category_type_info, sub_category_type_info_icon, 
            sub_category_order, tran_type, tran_type_line_num, tran_type_order, 
            tran_type_info, tran_type_info_icon, sub_tran_type, sub_tran_type_line_num, 
            sub_tran_type_order, sub_tran_type_info, sub_tran_type_info_icon, 
            tran_category_id, tran_type_identifier, tran_sub_type_identifier, 
            cmte_type_category, is_functional, sched_type)
    VALUES ('F3X', 'Loans and Debts', 'Language will be provided by RAD', 'FALSE', 
            3, 'Loans Owed to Committee', 'Schedule C Summary Entry ', 'TRUE', 
            2, 'Schedule C Summary Entry', 13, 2, 
            'Language will be provided by RAD', 'TRUE', '', '', null, '', 'TRUE','998',
            'LOAN_TO_COMM', '','PAC',true, 
            'sched_c' );            




