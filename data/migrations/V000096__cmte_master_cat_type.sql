ALTER TABLE public.committee_master
  ADD COLUMN cmte_type_category character varying(10);
   
update committee_master set cmte_type_category='PAC' where cmte_type in ('N', 'O', 'Q', 'U', 'V', 'W', 'D','Z');
update committee_master set cmte_type_category='PTY' where cmte_type in ('X','Y');
update committee_master set cmte_type_category='HOUSE' where cmte_type in ('H');
update committee_master set cmte_type_category='SEN' where cmte_type in ('S');
update committee_master set cmte_type_category='PRES' where cmte_type in ('P');
update committee_master set cmte_type_category='IE' where cmte_type in ('I');
