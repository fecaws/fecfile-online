﻿create table public.sched_l
(
   cmte_id                            character varying (9) not null,
   report_id                          bigint not null,
   transaction_type_identifier        character varying (12),
   transaction_id                     character varying (20) not null default get_next_transaction_id('SL'::bpchar),
   record_id                          character varying (9) not null,
   account_name                       character varying (90),
   cvg_from_date                      date,
   cvg_end_date                       date,
   item_receipts                      numeric(12,2),
   unitem_receipts                    numeric(12,2),
   ttl_receipts                       numeric(12,2),
   other_receipts                     numeric(12,2),
   total_receipts                     numeric(12,2),
   voter_reg_disb_amount              numeric(12,2),
   voter_id_disb_amount               numeric(12,2),
   gotv_disb_amount                   numeric(12,2),
   generic_campaign_disb_amount       numeric(12,2),
   total_disb_sub                     numeric(12,2),
   other_disb                         numeric(12,2),
   total_disb                         numeric(12,2),
   coh_bop                            numeric(12,2),
   receipts                           numeric(12,2),
   subtotal                           numeric(12,2),
   disbursements                      numeric(12,2),
   coh_cop                            numeric(12,2),
   item_receipts_ytd                  numeric(12,2),
   unitem_receipts_ytd                numeric(12,2),
   total_reciepts_ytd                 numeric(12,2),
   other_receipts_ytd                 numeric(12,2),
   total_receipts_ytd                 numeric(12,2),
   voter_reg_disb_amount_ytd          numeric(12,2),
   voter_id_disb_amount_ytd           numeric(12,2),
   gotv_disb_amount_ytd               numeric(12,2),
   generic_campaign_disb_amount_ytd   numeric(12,2),
   total_disb_sub_ytd                 numeric(12,2),
   other_disb_ytd                     numeric(12,2),
   total_disb_ytd                     numeric(12,2),
   coh_coy                            numeric(12,2),
   receipts_ytd                       numeric(12,2),
   sub_total_ytd                      numeric(12,2),
   disbursements_ytd                  numeric(12,2),
   coh_cop_ytd                        numeric(12,2),
   delete_ind                         character varying(1),
   create_date                        timestamp without time zone default now(),
   last_update_date                   timestamp without time zone default now(),
   constraint sched_l_transaction_id_pk primary key (transaction_id)
);