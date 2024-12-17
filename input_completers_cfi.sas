/*
The CDC launched the Moving Forward initiative to update and enhance its internal systems and processes. 
The National Center for State, Tribal, Local, and Territorial Public Health Infrastructure and Workforce (PHIC) 
is responsible for executing the "Moving Forward Recommendation" aimed at improving support for recipients of 
CDC funding through a comprehensive survey. This program will read in the survey data to facilitate analysis and insights.
*/

/* filepath where the COMPLETERS_CFI.csv file is located.*/
%let completers = %bquote(C:\Users\pqn7\OneDrive - CDC\projects\recipient-experience\data\rfc4180\completers_cfi_rfc4180.csv);

data work.completers_cfi    ;
infile "&completers" delimiter = ',' missover dsd lrecl=32767 firstobs=2 ;
   informat index $12.;
   informat variable $21. ;
   informat item $5. ;
   informat short_label $78. ;
   informat survey_model_label $140. ;
   informat value_set $890. ;
   format index $12.;
   format variable $21. ;
   format item $5. ;
   format short_label $78. ;
   format survey_model_label $140. ;
   format value_set $890. ;
	input
			index	$
            variable  $
            item  $
            short_label  $
            survey_model_label  $
            value_set  $
;
run;
