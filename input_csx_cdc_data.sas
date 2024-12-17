/*
The CDC launched the Moving Forward initiative to update and enhance its internal systems and processes. 
The National Center for State, Tribal, Local, and Territorial Public Health Infrastructure and Workforce (PHIC) 
is responsible for executing the "Moving Forward Recommendation" aimed at improving support for recipients of 
CDC funding through a comprehensive survey. This program will read in the survey data to facilitate analysis and insights.
*/

/* filepath where the CSX_CDC_DATA.csv file is located.*/
%let csx_file = %bquote(C:\Users\pqn7\OneDrive - CDC\projects\recipient-experience\data\rfc4180\csx_cdc_data_rfc4180.csv);

data work.csx    ;
	infile "&csx_file" delimiter = ',' missover dsd lrecl=32767 firstobs=2 ;
   informat wrespid $12. ;
   informat appc_web best32. ;
   informat appc_faq best32. ;
   informat appc_stf best32. ;
   informat appc_inf best32. ;
   informat app_clar best32. ;
   informat app_detl best32. ;
   informat app_time best32. ;
   informat app_prep best32. ;
   informat app_sbmt best32. ;
   informat app_sprt best32. ;
   informat awpc_und best32. ;
   informat awpc_cnt best32. ;
   informat awpc_rsp best32. ;
   informat awpc_fdb best32. ;
   informat awpc_cns best32. ;
   informat awpc_rec best32. ;
   informat tch_clar best32. ;
   informat tch_asst best32. ;
   informat tch_time best32. ;
   informat tch_cnst best32. ;
   informat tch_help best32. ;
   informat process_text_redacted $3439. ;
   informat mnt_clar $11. ;
   informat mnt_reqr $10. ;
   informat mnt_cntc $251. ;
   informat mnt_intr $19. ;
   informat mnt_usep $5. ;
   informat mnt_guid best32. ;
   informat d_sitvis best32. ;
   informat site_tim best32. ;
   informat site_hpo best32. ;
   informat site_gms best32. ;
   informat site_use best32. ;
   informat d_prep best32. ;
   informat d_flwup best32. ;
   informat sitevisit_text_redacted $845. ;
   informat rep_clar best32. ;
   informat rep_org best32. ;
   informat rep_cntc best32. ;
   informat rep_intr best32. ;
   informat rep_sbmt best32. ;
   informat rep_ufin best32. ;
   informat rep_uprg best32. ;
   informat rep_guid best32. ;
   informat d_rpamnt best32. ;
   informat d_newrep best32. ;
   informat report_text_redacted $4771. ;
   informat d_train best32. ;
   informat notrn_1 best32. ;
   informat notrn_2 best32. ;
   informat notrn_3 best32. ;
   informat notrn_4 best32. ;
   informat notrn_97 best32. ;
   informat notrn_97_other_redacted $270. ;
   informat topic_1 best32. ;
   informat topic_2 best32. ;
   informat topic_3 $450. ;
   informat topic_4 best32. ;
   informat topic_97 best32. ;
   informat topic_97_other_redacted $687. ;
   informat trn_req best32. ;
   informat trn_resp best32. ;
   informat trn_adrs best32. ;
   informat trn_time best32. ;
   informat trn_use best32. ;
   informat trn_cnst best32. ;
   informat training_text_redacted $2000. ;
   informat com_time $44. ;
   informat com_lang $66. ;
   informat com_cnst best32. ;
   informat com_info $459. ;
   informat src_poc best32. ;
   informat src_gms $92. ;
   informat src_gcom best32. ;
   informat src_notf best32. ;
   informat d_amntcm best32. ;
   informat commnctn_text_redacted $1033. ;
   informat prt_jrsd best32. ;
   informat prt_org best32. ;
   informat prt_trns best32. ;
   informat prt_blnc best32. ;
   informat prt_resp best32. ;
   informat prtnrshp_text_redacted $1426. ;
   informat d_wrkpo best32. ;
   informat d_cntpo best32. ;
   informat d_frqpo best32. ;
   informat cdcpo_text_redacted $1358. ;
   informat d_wrkgms $92. ;
   informat d_cntgms $348. ;
   informat d_frqgms $189. ;
   informat cdcgms_text_redacted $989. ;
   informat d_guid $426. ;
   informat trnvr_1 $185. ;
   informat trnvr_2 best32. ;
   informat trnvr_3 best32. ;
   informat trnvr_98 $522. ;
   informat d_poguid best32. ;
   informat d_gmsgud best32. ;
   informat bdg_chng best32. ;
   informat bdg_hire best32. ;
   informat bdg_actv best32. ;
   informat sat_ovr best32. ;
   informat sat_exp best32. ;
   informat sat_idl best32. ;
   informat out_sprt best32. ;
   informat out_trst best32. ;
   informat exprnc_text_redacted $1701. ;
   informat d_wrkdur best32. ;
   informat d_pastwk best32. ;
   informat addtn_fdbk_text_redacted $3017. ;
   informat app_detl_score best32. ;
   informat app_time_score best32. ;
   informat app_prep_score best32. ;
   informat app_sbmt_score best32. ;
   informat supp_help best32. ;
   informat supp_reach best32. ;
   informat supp_time best32. ;
   informat supp_consist best32. ;
   informat supp_useful best32. ;
   informat mr_clarity best32. ;
   informat mr_reason best32. ;
   informat mr_online best32. ;
   informat mr_submit best32. ;
   informat tta_req best32. ;
   informat tta_respon best32. ;
   informat tta_address best32. ;
   informat tta_time best32. ;
   informat tta_consist best32. ;
   informat comm_time best32. ;
   informat comm_plain best32. ;
   informat comm_consist $3. ;
   informat part_und best32. ;
   informat part_open $4. ;
   informat part_bal best32. ;
   informat flex_change $8. ;
   informat flex_hire $4. ;
   informat flex_emerge $7. ;
   informat csi_over $4. ;
   informat csi_expect $5. ;
   informat csi_idea $4. ;
   informat app_score $14. ;
   informat supp_score $13. ;
   informat mr_score $19. ;
   informat tta_score $17. ;
   informat comm_score $41. ;
   informat part_score $86. ;
   informat flex_score $15. ;
   informat csi_index $91. ;
   informat out_goal $35. ;
   informat out_trust $17. ;
   informat process_rapid $35. ;
   informat sitevisit_rapid $85. ;
   informat report_rapid $21. ;
   informat training_rapid $12. ;
   informat commnctn_rapid $35. ;
   informat prtnrshp_rapid $4. ;
   informat cdcpo_rapid $9. ;
   informat cdcgms_rapid $8. ;
   informat exprnc_rapid $13. ;
   informat addtn_fdbk_rapid $13. ;
   informat dropdwn $36. ;
   informat response_weight best32. ;
   informat cio $7. ;
   informat nofo_num $21. ;
   informat nofo_short $57. ;
   informat nofo_title $179. ;
   informat ftype $21. ;
   informat research $12. ;
   informat stlt_type $36. ;
   informat pp_start_year best32. ;
   informat pp_dur_years best32. ;
   informat pp_tot_cat best32. ;
   format wrespid $12. ;
   format appc_web best12. ;
   format appc_faq best12. ;
   format appc_stf best12. ;
   format appc_inf best12. ;
   format app_clar best12. ;
   format app_detl best12. ;
   format app_time best12. ;
   format app_prep best12. ;
   format app_sbmt best12. ;
   format app_sprt best12. ;
   format awpc_und best12. ;
   format awpc_cnt best12. ;
   format awpc_rsp best12. ;
   format awpc_fdb best12. ;
   format awpc_cns best12. ;
   format awpc_rec best12. ;
   format tch_clar best12. ;
   format tch_asst best12. ;
   format tch_time best12. ;
   format tch_cnst best12. ;
   format tch_help best12. ;
   format process_text_redacted $3439. ;
   format mnt_clar $11. ;
   format mnt_reqr $10. ;
   format mnt_cntc $251. ;
   format mnt_intr $19. ;
   format mnt_usep $5. ;
   format mnt_guid best12. ;
   format d_sitvis best12. ;
   format site_tim best12. ;
   format site_hpo best12. ;
   format site_gms best12. ;
   format site_use best12. ;
   format d_prep best12. ;
   format d_flwup best12. ;
   format sitevisit_text_redacted $845. ;
   format rep_clar best12. ;
   format rep_org best12. ;
   format rep_cntc best12. ;
   format rep_intr best12. ;
   format rep_sbmt best12. ;
   format rep_ufin best12. ;
   format rep_uprg best12. ;
   format rep_guid best12. ;
   format d_rpamnt best12. ;
   format d_newrep best12. ;
   format report_text_redacted $4771. ;
   format d_train best12. ;
   format notrn_1 best12. ;
   format notrn_2 best12. ;
   format notrn_3 best12. ;
   format notrn_4 best12. ;
   format notrn_97 best12. ;
   format notrn_97_other_redacted $270. ;
   format topic_1 best12. ;
   format topic_2 best12. ;
   format topic_3 $450. ;
   format topic_4 best12. ;
   format topic_97 best12. ;
   format topic_97_other_redacted $687. ;
   format trn_req best12. ;
   format trn_resp best12. ;
   format trn_adrs best12. ;
   format trn_time best12. ;
   format trn_use best12. ;
   format trn_cnst best12. ;
   format training_text_redacted $2000. ;
   format com_time $44. ;
   format com_lang $66. ;
   format com_cnst best12. ;
   format com_info $459. ;
   format src_poc best12. ;
   format src_gms $92. ;
   format src_gcom best12. ;
   format src_notf best12. ;
   format d_amntcm best12. ;
   format commnctn_text_redacted $1033. ;
   format prt_jrsd best12. ;
   format prt_org best12. ;
   format prt_trns best12. ;
   format prt_blnc best12. ;
   format prt_resp best12. ;
   format prtnrshp_text_redacted $1426. ;
   format d_wrkpo best12. ;
   format d_cntpo best12. ;
   format d_frqpo best12. ;
   format cdcpo_text_redacted $1358. ;
   format d_wrkgms $92. ;
   format d_cntgms $348. ;
   format d_frqgms $189. ;
   format cdcgms_text_redacted $989. ;
   format d_guid $426. ;
   format trnvr_1 $185. ;
   format trnvr_2 best12. ;
   format trnvr_3 best12. ;
   format trnvr_98 $522. ;
   format d_poguid best12. ;
   format d_gmsgud best12. ;
   format bdg_chng best12. ;
   format bdg_hire best12. ;
   format bdg_actv best12. ;
   format sat_ovr best12. ;
   format sat_exp best12. ;
   format sat_idl best12. ;
   format out_sprt best12. ;
   format out_trst best12. ;
   format exprnc_text_redacted $1701. ;
   format d_wrkdur best12. ;
   format d_pastwk best12. ;
   format addtn_fdbk_text_redacted $3017. ;
   format app_detl_score best12. ;
   format app_time_score best12. ;
   format app_prep_score best12. ;
   format app_sbmt_score best12. ;
   format supp_help best12. ;
   format supp_reach best12. ;
   format supp_time best12. ;
   format supp_consist best12. ;
   format supp_useful best12. ;
   format mr_clarity best12. ;
   format mr_reason best12. ;
   format mr_online best12. ;
   format mr_submit best12. ;
   format tta_req best12. ;
   format tta_respon best12. ;
   format tta_address best12. ;
   format tta_time best12. ;
   format tta_consist best12. ;
   format comm_time best12. ;
   format comm_plain best12. ;
   format comm_consist $3. ;
   format part_und best12. ;
   format part_open $4. ;
   format part_bal best12. ;
   format flex_change $8. ;
   format flex_hire $4. ;
   format flex_emerge $7. ;
   format csi_over $4. ;
   format csi_expect $5. ;
   format csi_idea $4. ;
   format app_score $14. ;
   format supp_score $13. ;
   format mr_score $19. ;
   format tta_score $17. ;
   format comm_score $41. ;
   format part_score $86. ;
   format flex_score $15. ;
   format csi_index $91. ;
   format out_goal $35. ;
   format out_trust $17. ;
   format process_rapid $35. ;
   format sitevisit_rapid $85. ;
   format report_rapid $21. ;
   format training_rapid $12. ;
   format commnctn_rapid $35. ;
   format prtnrshp_rapid $4. ;
   format cdcpo_rapid $9. ;
   format cdcgms_rapid $8. ;
   format exprnc_rapid $13. ;
   format addtn_fdbk_rapid $13. ;
   format dropdwn $36. ;
   format response_weight best12. ;
   format cio $7. ;
   format nofo_num $21. ;
   format nofo_short $57. ;
   format nofo_title $179. ;
   format ftype $21. ;
   format research $12. ;
   format stlt_type $36. ;
   format pp_start_year best12. ;
   format pp_dur_years best12. ;
   format pp_tot_cat best12. ;
input
            wrespid $
            appc_web
            appc_faq
            appc_stf
            appc_inf
            app_clar
            app_detl
            app_time
            app_prep
            app_sbmt
            app_sprt
            awpc_und
            awpc_cnt
            awpc_rsp
            awpc_fdb
            awpc_cns
            awpc_rec
            tch_clar
            tch_asst
            tch_time
            tch_cnst
            tch_help
            process_text_redacted  $
            mnt_clar  $
            mnt_reqr  $
            mnt_cntc  $
            mnt_intr  $
            mnt_usep  $
            mnt_guid
            d_sitvis
            site_tim
            site_hpo
            site_gms
            site_use
            d_prep
            d_flwup
            sitevisit_text_redacted  $
            rep_clar
            rep_org
            rep_cntc
            rep_intr
            rep_sbmt
            rep_ufin
            rep_uprg
            rep_guid
            d_rpamnt
            d_newrep
            report_text_redacted  $
            d_train
            notrn_1
            notrn_2
            notrn_3
            notrn_4
            notrn_97
            notrn_97_other_redacted  $
            topic_1
            topic_2
            topic_3  $
            topic_4
            topic_97
            topic_97_other_redacted  $
            trn_req
            trn_resp
            trn_adrs
            trn_time
            trn_use
            trn_cnst
            training_text_redacted  $
            com_time  $
            com_lang  $
            com_cnst
            com_info  $
            src_poc
            src_gms  $
            src_gcom
            src_notf
            d_amntcm
            commnctn_text_redacted  $
            prt_jrsd
            prt_org
            prt_trns
            prt_blnc
            prt_resp
            prtnrshp_text_redacted  $
            d_wrkpo
            d_cntpo
            d_frqpo
            cdcpo_text_redacted  $
            d_wrkgms  $
            d_cntgms  $
            d_frqgms  $
            cdcgms_text_redacted  $
            d_guid  $
            trnvr_1  $
            trnvr_2
            trnvr_3
            trnvr_98  $
            d_poguid
            d_gmsgud
            bdg_chng
            bdg_hire
            bdg_actv
            sat_ovr
            sat_exp
            sat_idl
            out_sprt
            out_trst
            exprnc_text_redacted  $
            d_wrkdur
            d_pastwk
            addtn_fdbk_text_redacted  $
            app_detl_score
            app_time_score
            app_prep_score
            app_sbmt_score
            supp_help
            supp_reach
            supp_time
            supp_consist
            supp_useful
            mr_clarity
            mr_reason
            mr_online
            mr_submit
            tta_req
            tta_respon
            tta_address
            tta_time
            tta_consist
            comm_time
            comm_plain
            comm_consist  $
            part_und
            part_open  $
            part_bal
            flex_change  $
            flex_hire  $
            flex_emerge  $
            csi_over  $
            csi_expect  $
            csi_idea  $
            app_score  $
            supp_score  $
            mr_score  $
            tta_score  $
            comm_score  $
            part_score  $
            flex_score  $
            csi_index  $
            out_goal  $
            out_trust  $
            process_rapid  $
            sitevisit_rapid  $
            report_rapid  $
            training_rapid  $
            commnctn_rapid  $
            prtnrshp_rapid  $
            cdcpo_rapid  $
            cdcgms_rapid  $
            exprnc_rapid  $
            addtn_fdbk_rapid  $
            dropdwn  $
            response_weight
            cio  $
            nofo_num  $
            nofo_short  $
            nofo_title  $
            ftype  $
            research  $
            stlt_type  $
            pp_start_year
            pp_dur_years
            pp_tot_cat
;
run;
