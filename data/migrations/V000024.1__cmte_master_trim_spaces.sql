UPDATE public.committee_master
   SET cmte_id=trim(cmte_id), cmte_name=trim(cmte_name), street_1=trim(street_1), street_2=trim(street_2), city=trim(city), state=trim(state), 
       zip_code=trim(zip_code), cmte_email_1=trim(cmte_email_1), cmte_email_2=trim(cmte_email_2), phone_number=trim(phone_number), cmte_type=trim(cmte_type), 
       cmte_dsgn=trim(cmte_dsgn), cmte_filing_freq=trim(cmte_filing_freq), cmte_filed_type=trim(cmte_filed_type), treasurer_last_name=trim(treasurer_last_name), 
       treasurer_first_name=trim(treasurer_first_name), treasurer_middle_name=trim(treasurer_middle_name), treasurer_prefix=trim(treasurer_prefix), 
       treasurer_suffix=trim(treasurer_suffix);

