/*
The CDC launched the Moving Forward initiative to update and enhance its internal systems and processes. 
The National Center for State, Tribal, Local, and Territorial Public Health Infrastructure and Workforce (PHIC) 
is responsible for executing the "Moving Forward Recommendation" aimed at improving support for recipients of 
CDC funding through a comprehensive survey. This program will read in the survey data to facilitate analysis and insights.
*/

/* filepath where COMPLETERS_CDC.csv is located.*/
%let completers_cdc = %bquote(C:\Users\pqn7\OneDrive - CDC\projects\recipient-experience\data\rfc4180\completers_cdc_rfc4180.csv);

data work.completers_cdc    ;
infile "&completers_cdc" delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
   informat index $16. ;
   informat Variable $24. ;
   informat Item $5. ;
   informat Short_Label $85. ;
   informat Survey_Model_Label $140. ;
   informat Value_Set $890. ;

   format index $16. ;
   format Variable $24. ;
   format Item $5. ;
   format Short_Label $85. ;
   format Survey_Model_Label $140. ;
   format Value_Set $890. ;
input
            index $
            Variable  $
            Item  $
            Short_Label  $
            Survey_Model_Label  $
            Value_Set  $
;
run;
