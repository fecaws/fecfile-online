-- FNE-2165
update public.dynamic_form_fields set field_is_readonly = true where transaction_type = 'PARTN_MEMO' and field_label = 'Contribution Date';

--FNE-1804
alter table public.sched_e add column aggregation_ind character varying
(1);
alter table public.sched_f add column aggregation_ind character varying
(1);





