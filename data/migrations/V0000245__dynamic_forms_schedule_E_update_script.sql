------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--IE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--updating read only flag on IE
update dynamic_form_fields set field_is_readonly = 'false' where transaction_type = 'IE' and field_is_readonly = 'true' and field_db_name in (
'entity_name',
'last_name',
'first_name',
'middle_name',
'prefix',
'suffix',
'street_1',
'street_2',
'city',
'state',
'zip_code',
'cand_last_name',
'cand_first_name',
'cand_middle_name',
'cand_prefix',
'cand_suffix',
'beneficiary_cand_id',
'cand_office',
'cand_office_state',
'cand_office_district',
'completing_last_name',
'completing_first_name',
'completing_middle_name',
'completing_prefix_name',
'completing_suffix_name');


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--MULTISTATE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--updating multstate type to 'multiSelect'
update dynamic_form_fields set field_type = 'multiSelect' where transaction_type = 'IE_MULTI' and field_db_name = 'multi_state_options';

--updating read only flag
update dynamic_form_fields set field_is_readonly = 'false' where transaction_type = 'IE_MULTI' and field_is_readonly = 'true' and field_db_name in (
'entity_name',
'last_name',
'first_name',
'middle_name',
'prefix',
'suffix',
'street_1',
'street_2',
'city',
'state',
'zip_code',
'cand_last_name',
'cand_first_name',
'cand_middle_name',
'cand_prefix',
'cand_suffix',
'beneficiary_cand_id',
'cand_office',
'cand_office_state',
'cand_office_district',
'completing_last_name',
'completing_first_name',
'completing_middle_name',
'completing_prefix_name',
'completing_suffix_name',
'multi_state_options');

--reordering of some fields
update dynamic_form_fields set field_order = 27 where transaction_type = 'IE_MULTI' and field_db_name = 'election_other_description';
update dynamic_form_fields set field_order = 28 where transaction_type = 'IE_MULTI' and field_db_name = 'support_oppose_code';
update dynamic_form_fields set field_order = 29 where transaction_type = 'IE_MULTI' and field_db_name = 'multi_state_options';

--make memo code required
update dynamic_form_fields set field_is_required = 'true' where transaction_type = 'IE_MULTI' and field_db_name = 'memo_text';

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--IE Credit Card Pay
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--updating read only flag
update dynamic_form_fields set field_is_readonly = 'false' where transaction_type = 'IE_CC_PAY' and field_is_readonly = 'true' and field_db_name in (
'entity_name',
'street_1',
'street_2',
'city',
'state',
'zip_code',
'cand_last_name',
'cand_first_name',
'cand_middle_name',
'cand_prefix',
'cand_suffix',
'beneficiary_cand_id',
'cand_office',
'cand_office_state',
'cand_office_district',
'completing_last_name',
'completing_first_name',
'completing_middle_name',
'completing_prefix_name',
'completing_suffix_name');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--IE Credit Card MEMO Pay 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--updating read only flag on IE
update dynamic_form_fields set field_is_readonly = 'false' where transaction_type = 'IE_CC_PAY_MEMO' and field_is_readonly = 'true' and field_db_name in (
'entity_name',
'last_name',
'first_name',
'middle_name',
'prefix',
'suffix',
'street_1',
'street_2',
'city',
'state',
'zip_code',
'cand_last_name',
'cand_first_name',
'cand_middle_name',
'cand_prefix',
'cand_suffix',
'beneficiary_cand_id',
'cand_office',
'cand_office_state',
'cand_office_district',
'completing_last_name',
'completing_first_name',
'completing_middle_name',
'completing_prefix_name',
'completing_suffix_name');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--IE Staff Reimburser Pay
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--updating read only flag
update dynamic_form_fields set field_is_readonly = 'false' where transaction_type = 'IE_STAF_REIM' and field_is_readonly = 'true' and field_db_name in (
'last_name',
'first_name',
'middle_name',
'prefix',
'suffix',
'street_1',
'street_2',
'city',
'state',
'zip_code',
'cand_last_name',
'cand_first_name',
'cand_middle_name',
'cand_prefix',
'cand_suffix',
'beneficiary_cand_id',
'cand_office',
'cand_office_state',
'cand_office_district',
'completing_last_name',
'completing_first_name',
'completing_middle_name',
'completing_prefix_name',
'completing_suffix_name');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--IE Staff Reimburse Memo 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--updating read only flag
update dynamic_form_fields set field_is_readonly = 'false' where transaction_type = 'IE_STAF_REIM_MEMO' and field_is_readonly = 'true' and field_db_name in (
'entity_name',
'last_name',
'first_name',
'middle_name',
'prefix',
'suffix',
'street_1',
'street_2',
'city',
'state',
'zip_code',
'cand_last_name',
'cand_first_name',
'cand_middle_name',
'cand_prefix',
'cand_suffix',
'beneficiary_cand_id',
'cand_office',
'cand_office_state',
'cand_office_district',
'completing_last_name',
'completing_first_name',
'completing_middle_name',
'completing_prefix_name',
'completing_suffix_name');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--IE Payroll
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--updating read only flag
update dynamic_form_fields set field_is_readonly = 'false' where transaction_type = 'IE_PMT_TO_PROL' and field_is_readonly = 'true' and field_db_name in (
'entity_name',
'street_1',
'street_2',
'city',
'state',
'zip_code',
'cand_last_name',
'cand_first_name',
'cand_middle_name',
'cand_prefix',
'cand_suffix',
'beneficiary_cand_id',
'cand_office',
'cand_office_state',
'cand_office_district',
'completing_last_name',
'completing_first_name',
'completing_middle_name',
'completing_prefix_name',
'completing_suffix_name');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--IE Payroll MEMO  
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--updating read only flag on IE
update dynamic_form_fields set field_is_readonly = 'false' where transaction_type = 'IE_PMT_TO_PROL_MEMO' and field_is_readonly = 'true' and field_db_name in (
'entity_name',
'last_name',
'first_name',
'middle_name',
'prefix',
'suffix',
'street_1',
'street_2',
'city',
'state',
'zip_code',
'cand_last_name',
'cand_first_name',
'cand_middle_name',
'cand_prefix',
'cand_suffix',
'beneficiary_cand_id',
'cand_office',
'cand_office_state',
'cand_office_district',
'completing_last_name',
'completing_first_name',
'completing_middle_name',
'completing_prefix_name',
'completing_suffix_name');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--IE VOID
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--updating read only flag on IE
update dynamic_form_fields set field_is_readonly = 'false' where transaction_type = 'IE_VOID' and field_is_readonly = 'true' and field_db_name in (
'entity_name',
'last_name',
'first_name',
'middle_name',
'prefix',
'suffix',
'street_1',
'street_2',
'city',
'state',
'zip_code',
'cand_last_name',
'cand_first_name',
'cand_middle_name',
'cand_prefix',
'cand_suffix',
'beneficiary_cand_id',
'cand_office',
'cand_office_state',
'cand_office_district',
'completing_last_name',
'completing_first_name',
'completing_middle_name',
'completing_prefix_name',
'completing_suffix_name');
