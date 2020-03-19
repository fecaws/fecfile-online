UPDATE public.df_entity_types SET ind=true WHERE form_type::text = 'F3X'
  AND transaction_type::text = 'REF_CONT_IND';