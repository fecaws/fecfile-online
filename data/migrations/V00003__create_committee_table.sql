CREATE TABLE public.committee_lookup
(
   cmte_id            CHARACTER (9) NOT NULL,
   cmte_name          CHARACTER (200),
   street_1           CHARACTER (34),
   street_2           CHARACTER (34),
   city               CHARACTER (30),
   state              CHARACTER (2),
   zip_code           CHARACTER (9),
   cmte_email_1       CHARACTER (100),
   cmte_email_2       CHARACTER (100),
   phone_number       CHARACTER (30),   
   cmte_type          CHARACTER (1),
   cmte_dsgn          CHARACTER (1),
   cmte_filing_freq   CHARACTER (1),
   cmte_filed_type    CHARACTER (1),
   treasurer_last_name CHARACTER (90),
   treasurer_first_name CHARACTER (90),
   treasurer_middle_name CHARACTER (90),
   treasurer_prefix CHARACTER (10),
   treasurer_suffix CHARACTER (10),
   last_update_date time with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (cmte_id)
);


GRANT ALL ON TABLE public.committee_lookup TO fecdbuser;

