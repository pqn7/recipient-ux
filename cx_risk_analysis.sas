/*
	cx_risk_analysis.sas
	author: alan hamm
	date: nov 2024

	requirements:
	•	NOFO_NUM * STLT_TYPE [1 cross-tab]; could also do NOFO_NUM alone and STLT_TYPE alone
	•	NOFO_NUM * STLT_TYPE * (ISSUED_Q; PP_START_Q; PP_END_Q; ISSUED_Q * PP_START_Q; ISSUED_Q * PP_END_Q; PP_START_Q * PP_END_Q; ISSUED_Q * PP_START_Q * PP_END_Q) [7 cross-tabs]
	•	NOFO_NUM * STLT_TYPE * (ISSUED_Y; PP_START_Y; PP_END_Y; ISSUED_Y * PP_START_Y; ISSUED_Y * PP_END_Y; PP_START_Y * PP_END_Y; ISSUED_Y * PP_START_Y * PP_END_Y) [7 cross-tabs]
	•	each of those (in the previous 2 bullets) with PP_TOT_CAT [14 cross-tabs]
	•	NOFO_NUM * STLT_TYPE * PP_TOT_CAT [1 cross-tab]

*/

data WORK._2_frame_0    ;
	infile 'D:\recipient-experience\data\2_frame_0.csv' delimiter = ',' MISSOVER DSD lrecl=13106 firstobs=2 ;
   informat FINAL_STATUS $28. ;
   informat FINAL_PIPD_NAME $28. ;
   informat PIPD_EMAIL $42. ;
   informat CIO $7. ;
   informat NOFO_NUM $21. ;
   informat CFDA_NUM best32. ;
   informat DROPDWN $36. ;
   informat NOFO_SHORT $57. ;
   informat FTYPE $21. ;
   informat RESEARCH $12. ;
   informat STLT_TYPE $36. ;
   informat RECIP_TYPE_DETAIL $40. ;
   informat GNUM $12. ;
   informat ISSUED yymmdd10. ;
   informat PP_START yymmdd10. ;
   informat PP_END yymmdd10. ;
   informat PP_TOT_AMT best32. ;
   informat PP_TOT_CAT $28. ;
   informat PO_NAME $26. ;
   informat PO_EMAIL $14. ;
   informat UEI $12. ;
   informat RECIP_NAME $105. ;
   informat HHS_REGION best32. ;
   informat NOFO_TITLE $179. ;
   format FINAL_STATUS $28. ;
   format FINAL_PIPD_NAME $28. ;
   format PIPD_EMAIL $42. ;
   format CIO $7. ;
   format NOFO_NUM $21. ;
   format CFDA_NUM best12. ;
   format DROPDWN $36. ;
   format NOFO_SHORT $57. ;
   format FTYPE $21. ;
   format RESEARCH $12. ;
   format STLT_TYPE $36. ;
   format RECIP_TYPE_DETAIL $40. ;
   format GNUM $12. ;
   format ISSUED yymmdd10. ;
   format PP_START yymmdd10. ;
   format PP_END yymmdd10. ;
   format PP_TOT_AMT best12. ;
   format PP_TOT_CAT $28. ;
   format PO_NAME $26. ;
   format PO_EMAIL $14. ;
   format UEI $12. ;
   format RECIP_NAME $105. ;
   format HHS_REGION best12. ;
   format NOFO_TITLE $179. ;
input
            FINAL_STATUS  $
            FINAL_PIPD_NAME  $
            PIPD_EMAIL  $
            CIO  $
            NOFO_NUM  $
            CFDA_NUM
            DROPDWN  $
            NOFO_SHORT  $
            FTYPE  $
            RESEARCH  $
            STLT_TYPE  $
            RECIP_TYPE_DETAIL  $
            GNUM  $
            ISSUED
            PP_START
            PP_END
            PP_TOT_AMT
            PP_TOT_CAT  $
            PO_NAME  $
            PO_EMAIL  $
            UEI  $
            RECIP_NAME  $
            HHS_REGION
            NOFO_TITLE  $
;
run;


data frame_qtr_yr(label="Derived Quarter and Year");
	/* rearrage to logically insert ISSUED_Q */
	length 	nofo_num $21 stlt_type $36 
			issued   /*new*/ issued_q issued_y 8
			pp_start /*new*/pp_start_q pp_start_y 8
			pp_end   /*new*/pp_end_q pp_end_y 8
			pp_tot_cat $28;
	set _2_frame_0(keep = nofo_num stlt_type issued pp_start pp_end pp_tot_cat);

	if _n_ = 1 then do;
		call missing(issued_y, pp_start_q, pp_start_y, pp_end_q, pp_end_y);
	end;
	
	format issued_q pp_start_q pp_end_q yyq10.;

	/* issued date */
	issued_q = input(put(issued,yyq10.), yyq10.);
	issued_y = year(issued);

	/* pp_start date */
	pp_start_q = input(put(pp_start,yyq10.), yyq10.);
	pp_start_y = year(pp_start);

	/* pp_end date */
	pp_end_q = input(put(pp_end,yyq10.), yyq10.);
	pp_end_y = year(pp_end);
run;


ods listing close;
ods excel file = "D:\recipient-experience\reports\risk_analysis_v2.xlsx"
			options ( sheet_interval="proc"
					  sheet_name='risk_analysis');


/************************
 FIRST BULLET POINT
************************/
proc summary data=frame_qtr_yr nway;
	class nofo_num stlt_type;
	output out = summary_out1;
run;
proc print data=summary_out1(drop=_type_) noobs; run;

/***************************
 SECOND BULLET POINT
****************************/
ods noproctitle;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type issued_q;
	output out = summary_out2;
run;
proc print data=summary_out2(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr   nway;
	class nofo_num stlt_type pp_start_q;
	output out = summary_out3;
run;
proc print data=summary_out3(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr   nway;
	class nofo_num stlt_type pp_end_q;
	output out = summary_out4;
run;
proc print data=summary_out4(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr   nway;
	class nofo_num stlt_type issued_q pp_start_q;
	output out = summary_out5;
run;
proc print data=summary_out5(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr   nway;
	class nofo_num stlt_type issued_q pp_end_q;
	output out = summary_out6;
run;
proc print data=summary_out6(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr   nway;
	class nofo_num stlt_type pp_start_q pp_end_q;
	output out = summary_out7;
run;
proc print data=summary_out7(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr    nway;
	class nofo_num stlt_type issued_q pp_start_q pp_end_q;
	output out = summary_out8;
run;
proc print data=summary_out8(drop=_type_) noobs; run;


/* BULLET 3 */
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type ISSUED_Y;
	output out = summary_out9;
run;
proc print data=summary_out9(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type PP_START_Y;
	output out = summary_out10;
run;
proc print data=summary_out10(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type PP_END_Y;
	output out = summary_out11;
run;
proc print data=summary_out11(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type ISSUED_Y  PP_START_Y;
	output out = summary_out12;
run;
proc print data=summary_out12(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type ISSUED_Y  PP_END_Y;
	output out = summary_out13;
run;
proc print data=summary_out13(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type PP_START_Y  PP_END_Y;
	output out = summary_out14;
run;
proc print data=summary_out14(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type ISSUED_Y  PP_START_Y  PP_END_Y;
	output out = summary_out15;
run;
proc print data=summary_out15(drop=_type_) noobs; run;


/* BULLET 4.1 */
ods noproctitle;
proc summary data=frame_qtr_yr  nway;
	class  nofo_num stlt_type issued_q PP_TOT_CAT;
	output out = summary_out2;
run;
proc print data=summary_out2(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr   nway;
	class  nofo_num stlt_type pp_start_q PP_TOT_CAT;
	output out = summary_out3;
run;
proc print data=summary_out3(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr   nway;
	class nofo_num stlt_type pp_end_q PP_TOT_CAT;
	output out = summary_out4;
run;
proc print data=summary_out4(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr   nway;
	class nofo_num stlt_type issued_q pp_start_q PP_TOT_CAT;
	output out = summary_out5;
run;
proc print data=summary_out5(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr   nway;
	class nofo_num stlt_type issued_q pp_end_q PP_TOT_CAT;
	output out = summary_out6;
run;
proc print data=summary_out6(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr   nway;
	class nofo_num stlt_type pp_start_q pp_end_q PP_TOT_CAT;
	output out = summary_out7;
run;
proc print data=summary_out7(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr    nway;
	class nofo_num stlt_type issued_q pp_start_q pp_end_q PP_TOT_CAT;
	output out = summary_out8;
run;
proc print data=summary_out8(drop=_type_) noobs; run;



/* BULLET 4.2 */
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type  ISSUED_Y PP_TOT_CAT;
	output out = summary_out16;
run;
proc print data=summary_out16(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type  PP_START_Y PP_TOT_CAT;
	output out = summary_out17;
run;
proc print data=summary_out17(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type  PP_END_Y PP_TOT_CAT;
	output out = summary_out18;
run;
proc print data=summary_out18(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type  ISSUED_Y  PP_START_Y PP_TOT_CAT;
	output out = summary_out19;
run;
proc print data=summary_out19(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type  ISSUED_Y  PP_END_Y PP_TOT_CAT;
	output out = summary_out20;
run;
proc print data=summary_out20(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type  PP_START_Y  PP_END_Y PP_TOT_CAT;
	output out = summary_out22;
run;
proc print data=summary_out22(drop=_type_) noobs; run;
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type  ISSUED_Y  PP_START_Y  PP_END_Y PP_TOT_CAT;
	output out = summary_out23;
run;
proc print data=summary_out23(drop=_type_) noobs; run;


/* Bullet Point 5 */
proc summary data=frame_qtr_yr  nway;
	class nofo_num stlt_type pp_tot_cat;
	output out = summary_out24;
run;
proc print data=summary_out24(drop=_type_) noobs; run;

ods excel close;
ods listing;
