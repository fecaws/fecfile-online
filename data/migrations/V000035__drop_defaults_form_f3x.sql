ALTER TABLE public.form_3x
    ALTER COLUMN create_date DROP DEFAULT;

ALTER TABLE public.form_3x
    ALTER COLUMN last_update_date DROP DEFAULT;


update  due_dates set cvg_start_date = cast(date_trunc('month', cvg_end_date) as date)
where report_year=2018 and regular_special_report_ind='S' and cvg_start_date is null;
