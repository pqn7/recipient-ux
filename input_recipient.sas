    data WORK.survey    ;
    %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
    infile 'C:\Users\pqn7\OneDrive - CDC\projects\recipient-experience\alan\cfi-raw-data.csv' dsd dlm=',' MISSOVER lrecl=32767 firstobs=2 termstr=CRLF truncover;
       informat WRESPID best32. ;
       informat DATSTART anydtdtm40. ;
       informat DATEND anydtdtm40. ;
       informat CSI_INDEX best32. ;
       informat CSI_OVER best32. ;
       informat CSI_EXPECT best32. ;
       informat CSI_IDEA best32. ;
       informat OUT_TRUST best32. ;
       informat OUT_GOAL best32. ;
       informat APP_SCORE best32. ;
       informat APP_DETL_SCORE best32. ;
       informat APP_TIME_SCORE best32. ;
       informat APP_PREP_SCORE best32. ;
       informat APP_SBMT_SCORE best32. ;
       informat MR_SCORE best32. ;
       informat MR_CLARITY best32. ;
       informat MR_REASON best32. ;
       informat MR_ONLINE best32. ;
       informat MR_SUBMIT best32. ;
       informat TTA_SCORE best32. ;
       informat TTA_REQ best32. ;
       informat TTA_RESPON best32. ;
       informat TTA_ADDRESS best32. ;
       informat TTA_TIME best32. ;
       informat TTA_CONSIST best32. ;
       informat COMM_SCORE best32. ;
       informat COMM_TIME best32. ;
       informat COMM_PLAIN best32. ;
       informat COMM_CONSIST best32. ;
       informat PART_SCORE best32. ;
       informat PART_UND best32. ;
       informat PART_OPEN best32. ;
       informat PART_BAL best32. ;
       informat SUPP_SCORE best32. ;
       informat SUPP_TIME best32. ;
       informat SUPP_REACH best32. ;
       informat SUPP_HELP best32. ;
       informat SUPP_CONSIST best32. ;
       informat SUPP_USEFUL best32. ;
       informat FLEX_SCORE best32. ;
       informat FLEX_CHANGE best32. ;
       informat FLEX_HIRE best32. ;
       informat FLEX_EMERGE best32. ;
       informat APPC_WEB best32. ;
       informat APPC_FAQ best32. ;
       informat APPC_STF best32. ;
       informat APPC_INF best32. ;
       informat APP_CLAR best32. ;
       informat APP_DETL best32. ;
       informat APP_TIME best32. ;
       informat APP_PREP best32. ;
       informat APP_SBMT best32. ;
       informat APP_SPRT best32. ;
       informat AWPC_UND best32. ;
       informat AWPC_CNT best32. ;
       informat AWPC_RSP best32. ;
       informat AWPC_FDB best32. ;
       informat AWPC_CNS best32. ;
       informat AWPC_REC best32. ;
       informat TCH_CLAR best32. ;
       informat TCH_ASST best32. ;
       informat TCH_TIME best32. ;
       informat TCH_CNST best32. ;
       informat TCH_HELP best32. ;
       informat PROCESS_TEXT_RAW $3442. ;
       informat PROCESS_TEXT_CLEAN $3443. ;
       informat PROCESS_CODE1 $5. ;
       informat PROCESS_CODE2 $5. ;
       informat PROCESS_CODE3 $4. ;
       informat MNT_CLAR best32. ;
       informat MNT_REQR best32. ;
       informat MNT_CNTC best32. ;
       informat MNT_INTR best32. ;
       informat MNT_USEP best32. ;
       informat MNT_GUID best32. ;
       informat D_SITVIS best32. ;
       informat SITE_TIM best32. ;
       informat SITE_HPO best32. ;
       informat SITE_GMS best32. ;
       informat SITE_USE best32. ;
       informat D_PREP best32. ;
       informat D_FLWUP best32. ;
       informat SITEVISIT_TEXT_RAW $845. ;
       informat SITEVISIT_TEXT_CLEAN $845. ;
       informat SITEVISIT_CODE1 $3. ;
       informat SITEVISIT_CODE2 $3. ;
       informat SITEVISIT_CODE3 $1. ;
       informat REP_CLAR best32. ;
       informat REP_ORG best32. ;
       informat REP_CNTC best32. ;
       informat REP_INTR best32. ;
       informat REP_SBMT best32. ;
       informat REP_UFIN best32. ;
       informat REP_GUID best32. ;
       informat REP_UPRG best32. ;
       informat D_RPAMNT best32. ;
       informat D_NEWREP best32. ;
       informat REPORT_TEXT_RAW $4762. ;
       informat REPORT_TEXT_CLEAN $4762. ;
       informat REPORT_CODE1 $4. ;
       informat REPORT_CODE2 $4. ;
       informat REPORT_CODE3 $4. ;
       informat D_TRAIN best32. ;
       informat NOTRN_1 best32. ;
       informat NOTRN_2 best32. ;
       informat NOTRN_3 best32. ;
       informat NOTRN_4 best32. ;
       informat NOTRN_97 best32. ;
       informat NOTRN_97_Other $270. ;
       informat TOPIC_1 best32. ;
       informat TOPIC_2 best32. ;
       informat TOPIC_3 best32. ;
       informat TOPIC_4 best32. ;
       informat TOPIC_97 best32. ;
       informat TOPIC_97_Other $657. ;
       informat TRN_REQ best32. ;
       informat TRN_RESP best32. ;
       informat TRN_ADRS best32. ;
       informat TRN_TIME best32. ;
       informat TRN_USE best32. ;
       informat TRN_CNST best32. ;
       informat TRAINING_TEXT_RAW $1995. ;
       informat TRAINING_TEXT_CLEAN $1995. ;
       informat TRAINING_CODE1 $4. ;
       informat TRAINING_CODE2 $4. ;
       informat TRAINING_CODE3 $1. ;
       informat COM_TIME best32. ;
       informat COM_LANG best32. ;
       informat COM_CNST best32. ;
       informat COM_INFO best32. ;
       informat SRC_POC best32. ;
       informat SRC_GMS best32. ;
       informat SRC_GCOM best32. ;
       informat SRC_NOTF best32. ;
       informat D_AMNTCM best32. ;
       informat COMMNCTN_TEXT_RAW $1033. ;
       informat COMMNCTN_TEXT_CLEAN $1033. ;
       informat COMMNCTN_CODE1 $4. ;
       informat COMMNCTN_CODE2 $4. ;
       informat COMMNCTN_CODE3 $1. ;
       informat PRT_JRSD best32. ;
       informat PRT_ORG best32. ;
       informat PRT_TRNS best32. ;
       informat PRT_BLNC best32. ;
       informat PRT_RESP best32. ;
       informat PRTNRSHP_TEXT_RAW $1420. ;
       informat PRTNRSHP_TEXT_CLEAN $1420. ;
       informat PRTNRSHP_CODE1 $4. ;
       informat PRTNRSHP_CODE2 $1. ;
       informat PRTNRSHP_CODE3 $1. ;
       informat D_WRKPO best32. ;
       informat D_CNTPO best32. ;
       informat D_FRQPO best32. ;
       informat CDCPO_TEXT_RAW $1358. ;
       informat CDCPO_TEXT_CLEAN $1358. ;
       informat CDCPO_CODE1 $5. ;
       informat CDCPO_CODE2 $5. ;
       informat CDCPO_CODE3 $1. ;
       informat D_WRKGMS best32. ;
       informat D_CNTGMS best32. ;
       informat D_FRQGMS best32. ;
       informat CDCGMS_TEXT_RAW $989. ;
       informat CDCGMS_TEXT_CLEAN $989. ;
       informat CDCGMS_CODE1 $4. ;
       informat CDCGMS_CODE2 $4. ;
       informat CDCGMS_CODE3 $1. ;
       informat D_GUID $2048. ;
       informat TRNVR_1 best32. ;
       informat TRNVR_2 best32. ;
       informat TRNVR_3 best32. ;
       informat TRNVR_98 best32. ;
       informat D_POGUID best32. ;
       informat D_GMSGUD best32. ;
       informat BDG_CHNG best32. ;
       informat BDG_HIRE best32. ;
       informat BDG_ACTV best32. ;
       informat SAT_OVR best32. ;
       informat SAT_EXP best32. ;
       informat SAT_IDL best32. ;
       informat OUT_SPRT best32. ;
       informat OUT_TRST best32. ;
       informat EXPRNC_TEXT_RAW $1701. ;
       informat EXPRNC_TEXT_CLEAN $1701. ;
       informat EXPRNC_CODE1 $5. ;
       informat EXPRNC_CODE2 $5. ;
       informat EXPRNC_CODE3 $4. ;
       informat D_WRKDUR $2048. ;
       informat D_PASTWK $2048. ;
       informat ADDTN_FDBK_TEXT_RAW $3017. ;
       informat ADDTN_FDBK_TEXT_CLEAN $3017. ;
       informat ADDTN_FDBK_CODE1 $5. ;
       informat ADDTN_FDBK_CODE2 $4. ;
       informat ADDTN_FDBK_CODE3 $4. ;
       informat finalgrant $36. ;
       informat grant1 $36. ;
       informat grant2 $35. ;
       informat grant3 $35. ;
       informat grant4 $32. ;
       informat grant5 $32. ;
       informat grant6 $35. ;
       informat grant7 $30. ;
       informat grant8 $22. ;
       informat grant9 $13. ;
       informat grant10 $26. ;
       informat CIO $7. ;
       informat NOFO_NUM $21. ;
       informat CFDA_NUM best32. ;
       informat DROPDWN $36. ;
       informat NOFO_SHORT $57. ;
       informat FTYPE $21. ;
       informat RESEARCH $12. ;
       informat STLT_TYPE $36. ;
       informat RECIP_TYPE_DETAIL $40. ;
       informat ISSUED $31. ;
       informat PP_START $31. ;
       informat PP_END $31. ;
       informat HHS_REGION best32. ;
       informat NOFO_TITLE $5000. ;
       format WRESPID best12. ;
       format DATSTART datetime. ;
       format DATEND datetime. ;
       format CSI_INDEX best12. ;
       format CSI_OVER best12. ;
       format CSI_EXPECT best12. ;
       format CSI_IDEA best12. ;
       format OUT_TRUST best12. ;
       format OUT_GOAL best12. ;
       format APP_SCORE best12. ;
       format APP_DETL_SCORE best12. ;
       format APP_TIME_SCORE best12. ;
       format APP_PREP_SCORE best12. ;
       format APP_SBMT_SCORE best12. ;
       format MR_SCORE best12. ;
       format MR_CLARITY best12. ;
       format MR_REASON best12. ;
       format MR_ONLINE best12. ;
       format MR_SUBMIT best12. ;
       format TTA_SCORE best12. ;
       format TTA_REQ best12. ;
       format TTA_RESPON best12. ;
       format TTA_ADDRESS best12. ;
       format TTA_TIME best12. ;
       format TTA_CONSIST best12. ;
       format COMM_SCORE best12. ;
       format COMM_TIME best12. ;
       format COMM_PLAIN best12. ;
       format COMM_CONSIST best12. ;
       format PART_SCORE best12. ;
       format PART_UND best12. ;
       format PART_OPEN best12. ;
       format PART_BAL best12. ;
       format SUPP_SCORE best12. ;
       format SUPP_TIME best12. ;
       format SUPP_REACH best12. ;
       format SUPP_HELP best12. ;
       format SUPP_CONSIST best12. ;
       format SUPP_USEFUL best12. ;
       format FLEX_SCORE best12. ;
       format FLEX_CHANGE best12. ;
       format FLEX_HIRE best12. ;
       format FLEX_EMERGE best12. ;
       format APPC_WEB best12. ;
       format APPC_FAQ best12. ;
       format APPC_STF best12. ;
       format APPC_INF best12. ;
       format APP_CLAR best12. ;
       format APP_DETL best12. ;
       format APP_TIME best12. ;
       format APP_PREP best12. ;
       format APP_SBMT best12. ;
       format APP_SPRT best12. ;
       format AWPC_UND best12. ;
       format AWPC_CNT best12. ;
       format AWPC_RSP best12. ;
       format AWPC_FDB best12. ;
       format AWPC_CNS best12. ;
       format AWPC_REC best12. ;
       format TCH_CLAR best12. ;
       format TCH_ASST best12. ;
       format TCH_TIME best12. ;
       format TCH_CNST best12. ;
       format TCH_HELP best12. ;
       format PROCESS_TEXT_RAW $3442. ;
       format PROCESS_TEXT_CLEAN $3443. ;
       format PROCESS_CODE1 $5. ;
       format PROCESS_CODE2 $5. ;
       format PROCESS_CODE3 $4. ;
       format MNT_CLAR best12. ;
       format MNT_REQR best12. ;
       format MNT_CNTC best12. ;
       format MNT_INTR best12. ;
       format MNT_USEP best12. ;
       format MNT_GUID best12. ;
       format D_SITVIS best12. ;
       format SITE_TIM best12. ;
       format SITE_HPO best12. ;
       format SITE_GMS best12. ;
       format SITE_USE best12. ;
       format D_PREP best12. ;
       format D_FLWUP best12. ;
       format SITEVISIT_TEXT_RAW $845. ;
       format SITEVISIT_TEXT_CLEAN $845. ;
       format SITEVISIT_CODE1 $3. ;
       format SITEVISIT_CODE2 $3. ;
       format SITEVISIT_CODE3 $1. ;
       format REP_CLAR best12. ;
       format REP_ORG best12. ;
       format REP_CNTC best12. ;
       format REP_INTR best12. ;
       format REP_SBMT best12. ;
       format REP_UFIN best12. ;
       format REP_GUID best12. ;
       format REP_UPRG best12. ;
       format D_RPAMNT best12. ;
       format D_NEWREP best12. ;
       format REPORT_TEXT_RAW $4762. ;
       format REPORT_TEXT_CLEAN $4762. ;
       format REPORT_CODE1 $4. ;
       format REPORT_CODE2 $4. ;
       format REPORT_CODE3 $4. ;
       format D_TRAIN best12. ;
       format NOTRN_1 best12. ;
       format NOTRN_2 best12. ;
       format NOTRN_3 best12. ;
       format NOTRN_4 best12. ;
       format NOTRN_97 best12. ;
       format NOTRN_97_Other $270. ;
       format TOPIC_1 best12. ;
       format TOPIC_2 best12. ;
       format TOPIC_3 best12. ;
       format TOPIC_4 best12. ;
       format TOPIC_97 best12. ;
       format TOPIC_97_Other $657. ;
       format TRN_REQ best12. ;
       format TRN_RESP best12. ;
       format TRN_ADRS best12. ;
       format TRN_TIME best12. ;
       format TRN_USE best12. ;
       format TRN_CNST best12. ;
       format TRAINING_TEXT_RAW $1995. ;
       format TRAINING_TEXT_CLEAN $1995. ;
       format TRAINING_CODE1 $4. ;
       format TRAINING_CODE2 $4. ;
       format TRAINING_CODE3 $1. ;
       format COM_TIME best12. ;
       format COM_LANG best12. ;
       format COM_CNST best12. ;
       format COM_INFO best12. ;
       format SRC_POC best12. ;
       format SRC_GMS best12. ;
       format SRC_GCOM best12. ;
       format SRC_NOTF best12. ;
       format D_AMNTCM best12. ;
       format COMMNCTN_TEXT_RAW $1033. ;
       format COMMNCTN_TEXT_CLEAN $1033. ;
       format COMMNCTN_CODE1 $4. ;
       format COMMNCTN_CODE2 $4. ;
       format COMMNCTN_CODE3 $1. ;
       format PRT_JRSD best12. ;
       format PRT_ORG best12. ;
       format PRT_TRNS best12. ;
       format PRT_BLNC best12. ;
       format PRT_RESP best12. ;
       format PRTNRSHP_TEXT_RAW $1420. ;
       format PRTNRSHP_TEXT_CLEAN $1420. ;
       format PRTNRSHP_CODE1 $4. ;
       format PRTNRSHP_CODE2 $1. ;
       format PRTNRSHP_CODE3 $1. ;
       format D_WRKPO best12. ;
       format D_CNTPO best12. ;
       format D_FRQPO best12. ;
       format CDCPO_TEXT_RAW $1358. ;
       format CDCPO_TEXT_CLEAN $1358. ;
       format CDCPO_CODE1 $5. ;
       format CDCPO_CODE2 $5. ;
       format CDCPO_CODE3 $1. ;
       format D_WRKGMS best12. ;
       format D_CNTGMS best12. ;
       format D_FRQGMS best12. ;
       format CDCGMS_TEXT_RAW $989. ;
       format CDCGMS_TEXT_CLEAN $989. ;
       format CDCGMS_CODE1 $4. ;
       format CDCGMS_CODE2 $4. ;
       format CDCGMS_CODE3 $1. ;
       format D_GUID $2048. ;
       format TRNVR_1 best12. ;
       format TRNVR_2 best12. ;
       format TRNVR_3 best12. ;
       format TRNVR_98 best12. ;
       format D_POGUID best12. ;
       format D_GMSGUD best12. ;
       format BDG_CHNG best12. ;
       format BDG_HIRE best12. ;
       format BDG_ACTV best12. ;
       format SAT_OVR best12. ;
       format SAT_EXP best12. ;
       format SAT_IDL best12. ;
       format OUT_SPRT best12. ;
       format OUT_TRST best12. ;
       format EXPRNC_TEXT_RAW $1701. ;
       format EXPRNC_TEXT_CLEAN $1701. ;
       format EXPRNC_CODE1 $5. ;
       format EXPRNC_CODE2 $5. ;
       format EXPRNC_CODE3 $4. ;
       format D_WRKDUR $2048. ;
       format D_PASTWK $2048. ;
       format ADDTN_FDBK_TEXT_RAW $3017. ;
       format ADDTN_FDBK_TEXT_CLEAN $3017. ;
       format ADDTN_FDBK_CODE1 $5. ;
       format ADDTN_FDBK_CODE2 $4. ;
       format ADDTN_FDBK_CODE3 $4. ;
       format finalgrant $36. ;
       format grant1 $36. ;
       format grant2 $35. ;
       format grant3 $35. ;
       format grant4 $32. ;
       format grant5 $32. ;
       format grant6 $35. ;
       format grant7 $30. ;
       format grant8 $22. ;
       format grant9 $13. ;
       format grant10 $26. ;
       format CIO $7. ;
       format NOFO_NUM $21. ;
       format CFDA_NUM best12. ;
       format DROPDWN $36. ;
       format NOFO_SHORT $57. ;
       format FTYPE $21. ;
       format RESEARCH $12. ;
       format STLT_TYPE $36. ;
       format RECIP_TYPE_DETAIL $40. ;
       format ISSUED $31. ;
       format PP_START $31. ;
       format PP_END $31. ;
       format HHS_REGION best12. ;
       format NOFO_TITLE $5000. ;
    input
                WRESPID
                DATSTART
                DATEND
                CSI_INDEX
                CSI_OVER
                CSI_EXPECT
                CSI_IDEA
                OUT_TRUST
                OUT_GOAL
                APP_SCORE
                APP_DETL_SCORE
                APP_TIME_SCORE
                APP_PREP_SCORE
                APP_SBMT_SCORE
                MR_SCORE
                MR_CLARITY
                MR_REASON
                MR_ONLINE
                MR_SUBMIT
                TTA_SCORE
                TTA_REQ
                TTA_RESPON
                TTA_ADDRESS
                TTA_TIME
                TTA_CONSIST
                COMM_SCORE
                COMM_TIME
                COMM_PLAIN
                COMM_CONSIST
                PART_SCORE
                PART_UND
                PART_OPEN
                PART_BAL
                SUPP_SCORE
                SUPP_TIME
                SUPP_REACH
                SUPP_HELP
                SUPP_CONSIST
                SUPP_USEFUL
                FLEX_SCORE
                FLEX_CHANGE
                FLEX_HIRE
                FLEX_EMERGE
                APPC_WEB
                APPC_FAQ
                APPC_STF
                APPC_INF
                APP_CLAR
                APP_DETL
                APP_TIME
                APP_PREP
                APP_SBMT
                APP_SPRT
                AWPC_UND
                AWPC_CNT
                AWPC_RSP
                AWPC_FDB
                AWPC_CNS
                AWPC_REC
                TCH_CLAR
                TCH_ASST
                TCH_TIME
                TCH_CNST
                TCH_HELP
                PROCESS_TEXT_RAW  $
                PROCESS_TEXT_CLEAN  $
                PROCESS_CODE1  $
                PROCESS_CODE2  $
                PROCESS_CODE3  $
                MNT_CLAR
                MNT_REQR
                MNT_CNTC
                MNT_INTR
                MNT_USEP
                MNT_GUID
                D_SITVIS
                SITE_TIM
                SITE_HPO
                SITE_GMS
                SITE_USE
                D_PREP
                D_FLWUP
                SITEVISIT_TEXT_RAW  $
                SITEVISIT_TEXT_CLEAN  $
                SITEVISIT_CODE1  $
                SITEVISIT_CODE2  $
                SITEVISIT_CODE3  $
                REP_CLAR
                REP_ORG
                REP_CNTC
                REP_INTR
                REP_SBMT
                REP_UFIN
                REP_GUID
                REP_UPRG
                D_RPAMNT
                D_NEWREP
                REPORT_TEXT_RAW  $
                REPORT_TEXT_CLEAN  $
                REPORT_CODE1  $
                REPORT_CODE2  $
                REPORT_CODE3  $
                D_TRAIN
                NOTRN_1
                NOTRN_2
                NOTRN_3
                NOTRN_4
                NOTRN_97
                NOTRN_97_Other  $
                TOPIC_1
                TOPIC_2
                TOPIC_3
                TOPIC_4
                TOPIC_97
                TOPIC_97_Other  $
                TRN_REQ
                TRN_RESP
                TRN_ADRS
                TRN_TIME
                TRN_USE
                TRN_CNST
                TRAINING_TEXT_RAW  $
                TRAINING_TEXT_CLEAN  $
                TRAINING_CODE1  $
                TRAINING_CODE2  $
                TRAINING_CODE3  $
                COM_TIME
                COM_LANG
                COM_CNST
                COM_INFO
                SRC_POC
                SRC_GMS
                SRC_GCOM
                SRC_NOTF
                D_AMNTCM
                COMMNCTN_TEXT_RAW  $
                COMMNCTN_TEXT_CLEAN  $
                COMMNCTN_CODE1  $
                COMMNCTN_CODE2  $
                COMMNCTN_CODE3  $
                PRT_JRSD
                PRT_ORG
                PRT_TRNS
                PRT_BLNC
                PRT_RESP
                PRTNRSHP_TEXT_RAW  $
                PRTNRSHP_TEXT_CLEAN  $
                PRTNRSHP_CODE1  $
                PRTNRSHP_CODE2  $
                PRTNRSHP_CODE3  $
                D_WRKPO
                D_CNTPO
                D_FRQPO
                CDCPO_TEXT_RAW  $
                CDCPO_TEXT_CLEAN  $
                CDCPO_CODE1  $
                CDCPO_CODE2  $
                CDCPO_CODE3  $
                D_WRKGMS
                D_CNTGMS
                D_FRQGMS
                CDCGMS_TEXT_RAW  $
                CDCGMS_TEXT_CLEAN  $
                CDCGMS_CODE1  $
                CDCGMS_CODE2  $
                CDCGMS_CODE3  $
                D_GUID $
                TRNVR_1
                TRNVR_2
                TRNVR_3
                TRNVR_98
                D_POGUID
                D_GMSGUD
                BDG_CHNG
                BDG_HIRE
                BDG_ACTV
                SAT_OVR
                SAT_EXP
                SAT_IDL
                OUT_SPRT
                OUT_TRST
                EXPRNC_TEXT_RAW  $
                EXPRNC_TEXT_CLEAN  $
                EXPRNC_CODE1  $
                EXPRNC_CODE2  $
                EXPRNC_CODE3  $
                D_WRKDUR $
                D_PASTWK $
                ADDTN_FDBK_TEXT_RAW  $
                ADDTN_FDBK_TEXT_CLEAN  $
                ADDTN_FDBK_CODE1  $
                ADDTN_FDBK_CODE2  $
                ADDTN_FDBK_CODE3  $
                finalgrant  $
                grant1  $
                grant2  $
                grant3  $
                grant4  $
                grant5  $
                grant6  $
                grant7  $
                grant8  $
                grant9  $
                grant10  $
                CIO  $
                NOFO_NUM  $
                CFDA_NUM
                DROPDWN  $
                NOFO_SHORT  $
                FTYPE  $
                RESEARCH  $
                STLT_TYPE  $
                RECIP_TYPE_DETAIL  $
                ISSUED  $
                PP_START  $
                PP_END  $
                HHS_REGION
                NOFO_TITLE $
    ;
    if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
    run;
