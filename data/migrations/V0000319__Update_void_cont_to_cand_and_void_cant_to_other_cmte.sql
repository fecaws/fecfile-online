-- FNE-2108


-- update teh tran type order of Void of Contribution to Candidate
update public.transaction_categories 
set tran_type_order = 3, tran_type = 'Void of Contribution to Candidate' 
where tran_type_identifier  = 'CONT_VOID';

-- adding new transaction type of CONT_TO_OTH_CMTE_VOID
insert into public.ref_transaction_types
    (
    ref_tran_id,
    form_type,
    sched_type,
    line_num,
    tran_code,
    tran_identifier,
    tran_desc,
    parent_tran_id,
    auto_generate,
    category_type)
select
    10078,
    form_type,
    sched_type,
    line_num,
    tran_code,
    'CONT_TO_OTH_CMTE_VOID',
    'Contribution to Other Committee: Void',
    parent_tran_id, auto_generate,
    category_type
from public.ref_transaction_types
where tran_identifier = 'CONT_TO_OTH_CMTE';

-- adding CONT_TO_OTH_CMTE_VOID transaction category tree for both PAC/PTY
insert into public.transaction_categories
    (
    form_type,
    category_type,
    category_type_info,
    category_type_info_icon,
    category_order,
    sub_category_type,
    sub_category_type_info,
    sub_category_type_info_icon,
    sub_category_order,
    tran_type,
    tran_type_line_num,
    tran_type_order,
    tran_type_info,
    tran_type_info_icon,
    sub_tran_type,
    sub_tran_type_line_num,
    sub_tran_type_order,
    sub_tran_type_info,
    sub_tran_type_info_icon,
    tran_type_identifier,
    tran_sub_type_identifier,
    cmte_type_category,
    is_functional,
    sched_type
    )
select
    form_type,
    category_type,
    category_type_info,
    category_type_info_icon,
    category_order,
    sub_category_type,
    sub_category_type_info,
    sub_category_type_info_icon,
    sub_category_order,
    'Void of Contribution to Other Committee',
    tran_type_line_num,
    5,
    tran_type_info,
    tran_type_info_icon,
    sub_tran_type,
    sub_tran_type_line_num,
    sub_tran_type_order,
    sub_tran_type_info,
    sub_tran_type_info_icon,
    'CONT_TO_OTH_CMTE_VOID',
    tran_sub_type_identifier,
    cmte_type_category,
    is_functional,
    sched_type
from public.transaction_categories
where tran_type_identifier  = 'CONT_TO_OTH_CMTE' and cmte_type_category = 'PTY';

insert into public.transaction_categories
    (
    form_type,
    category_type,
    category_type_info,
    category_type_info_icon,
    category_order,
    sub_category_type,
    sub_category_type_info,
    sub_category_type_info_icon,
    sub_category_order,
    tran_type,
    tran_type_line_num,
    tran_type_order,
    tran_type_info,
    tran_type_info_icon,
    sub_tran_type,
    sub_tran_type_line_num,
    sub_tran_type_order,
    sub_tran_type_info,
    sub_tran_type_info_icon,
    tran_type_identifier,
    tran_sub_type_identifier,
    cmte_type_category,
    is_functional,
    sched_type
    )
select
    form_type,
    category_type,
    category_type_info,
    category_type_info_icon,
    category_order,
    sub_category_type,
    sub_category_type_info,
    sub_category_type_info_icon,
    sub_category_order,
    'Void of Contribution to Other Committee',
    tran_type_line_num,
    5,
    tran_type_info,
    tran_type_info_icon,
    sub_tran_type,
    sub_tran_type_line_num,
    sub_tran_type_order,
    sub_tran_type_info,
    sub_tran_type_info_icon,
    'CONT_TO_OTH_CMTE_VOID',
    tran_sub_type_identifier,
    cmte_type_category,
    is_functional,
    sched_type
from public.transaction_categories
where tran_type_identifier  = 'CONT_TO_OTH_CMTE' and cmte_type_category = 'PAC';


-- add CONT_TO_OTH_CMTE_VOID to dynamic form fields
insert into public.dynamic_form_fields
    (
    form_type,
    transaction_type,
    field_label,
    field_value,
    field_size,
    field_type,
    field_html_type,
    field_is_required,
    field_is_hidden,
    field_is_readonly,
    field_validation,
    field_infoicon,
    field_info,
    field_order,
    field_section,
    field_section_order,
    create_date,
    last_update_date,
    field_db_name,
    class_name,
    height,
    width,
    scroll,
    seperator,
    transaction_type_desc,
    field_input_group,
    field_input_icon,
    child_form,
    form_sub_title,
    toggle,
    entity_group,
    entity_id_mapping
    )
select
    form_type,
    'CONT_TO_OTH_CMTE_VOID',
    field_label,
    field_value,
    field_size,
    field_type,
    field_html_type,
    field_is_required,
    field_is_hidden,
    field_is_readonly,
    field_validation,
    field_infoicon,
    field_info,
    field_order,
    field_section,
    field_section_order,
    create_date,
    last_update_date,
    field_db_name,
    class_name,
    height,
    width,
    scroll,
    seperator,
    transaction_type_desc,
    field_input_group,
    field_input_icon,
    child_form,
    form_sub_title,
    toggle,
    entity_group,
    entity_id_mapping
from public.dynamic_form_fields
where transaction_type = 'CONT_TO_OTH_CMTE';

-- update some dynamic form fields
update public.dynamic_form_fields set field_value='CONT_TO_OTH_CMTE_VOID' where transaction_type = 'CONT_TO_OTH_CMTE_VOID' and field_label = 'Transaction Type Identifier';
update public.dynamic_form_fields set field_validation='dollarAmountNegative' where transaction_type = 'CONT_TO_OTH_CMTE_VOID' and field_label = 'Expenditure Amount';



