/*
	!NOTE: must use SAS Unicode version!

	recipient-experience-meta.sas
	description: metaprogram to generate input statements for recipient experience data

	author: alan hamm(pqn7)
	date oct 2024
*/

proc import out= work.survey_items 
     datafile= "c:\users\pqn7\onedrive - cdc\projects\recipient-experience\from_chad\survey-items-to-data-columns.xlsx" 
     dbms=excel replace;
     range="'data dictionary$'"; 
     getnames=yes;
     mixed=no;
     scantext=yes;
     usedate=yes;
     scantime=yes;
run;

/* create formats */
proc import out= work._formats_(keep= variable survey_value_label)
     datafile= "c:\users\pqn7\onedrive - cdc\projects\recipient-experience\from_chad\survey-items-to-data-columns.xlsx" 
     dbms=excel replace;
     range="'data dictionary$'"; 
     getnames=yes;
     mixed=no;
     scantext=yes;
     usedate=yes;
     scantime=yes;
run;

data _formats(drop=position start stop length regex);
	set _formats_(keep=variable Survey_Value_Label);
	length 	found $ 32
			val $ 8
			labl $ 32;

	if _n_ = 1 then do;
		regex = prxparse('/(([0-9]+)\s*\"([A-Za-z0-9\s]+))\"/i');
		retain regex;
	end;
	if not missing(survey_value_label);
	position = 0;
	start = 1;
	stop = length(strip(survey_value_label));

	call prxnext(regex, start, stop, survey_value_label, position, length);
	do while(position > 0);
		found = substr(survey_value_label, position, length);
		val = prxposn(regex,2,strip(found));
		labl = prxposn(regex,3,strip(found));
		output;
		call prxnext(regex, start, stop, survey_value_label, position, length);
	end;
run;

/* create formats sas program */
filename _o "c:\users\pqn7\onedrive - cdc\projects\recipient-experience\recipient_input.sas";
proc sort data=_formats out=_formats_sorted; by variable; run;
data formats;
	file _o;
	set _formats_sorted end = last;
	by variable;
	length var_label $ 64;

	if _n_ = 1 then do;
		put "proc format;";
	end;
	
	var_label = quote(strip(labl));

	if first.variable then do;
		put @5 "value " @@;
		put @15 variable @@;
	end;

	put @30 val @@;
	put @35 " = " @@;
	if not last.variable then do;
		put @40 var_label @@;
		put;
	end;
	else if last.variable then do; 
		put @40 var_label;
		put @40 ';';
		if not last then put;
	end;
	if last then do;
		put 'run;';
		put;
	end;
run;


filename _o "c:\users\pqn7\onedrive - cdc\projects\recipient-experience\recipient_input.sas";
data _null_;
	file _o mod;
	set survey_items end=last;
	length survey_labl $ 256;
	if _n_ = 1 then do;
		regex  = prxparse('s/[\"]/''/');
		retain regex;
		put "data survey;";
		put ;
		put @5 "label " @@;
	end;
	
	if not missing(survey_label) and length(variable) > 0 then do;
		survey_labl = '"' || prxchange(regex,-1, strip(survey_label)) || '"';

		put @15 variable @@;
		put @32 " = " @@;
		put @37 survey_labl; /*@28 " = " @40 """" string(survey_label) @100 """";*/
	end;
	
	if last then do;
		put @10 ";";
		/*put 'run;';*/
		put;
	end;
run;





filename _o "c:\users\pqn7\onedrive - cdc\projects\recipient-experience\recipient_input.sas";
data _null_;
	file _o mod;
	if _n_ = 0 then set formats(rename=(variable=_variable));
	set survey_items(keep=variable) end=last;
	length format_name $ 64;

	if _n_ = 1 then do;
	    declare hash myhash(dataset: "formats(rename=(variable=_variable))");
	    myhash.definekey('_variable');
	    myhash.definedata('_variable');
	    myhash.definedone();
		
		put "data survey;";
		put @5 "input";
		put;
	end;

	retain colplace 5 ;

	rc = myhash.find(key: variable);
	if rc = 0 then format_name = strip(variable) || '.';

	if colplace > 45 then do;
		if rc = 0 then put @colplace variable "3" /*format_name;*/;
		else put @colplace variable "$";
		put;
		colplace=5;
	end;
	else if colplace <= 45 then do;
		if rc = 0 then put @colplace variable "3" /*format_name*/ @;
		else put @colplace variable "$" @;
		colplace = colplace + 40;
	end;
	if last then do;
		put;
		put @5 ";";
		put 'run;';
	end;
run;
