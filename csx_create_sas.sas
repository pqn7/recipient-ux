/*
	csx_create_sas.sas
	author: alan hamm
	date: dec 2024
*/

libname x xlsx "C:\Users\pqn7\OneDrive - CDC\projects\recipient-experience\data\column-order-cdc-internal.xlsx";


data csx_unordered(keep=variable);
	set x.'cdc column order'n;
run;


/* create input sas program */
filename _o "C:\Users\pqn7\OneDrive - CDC\projects\recipient-experience\recipient_input.sas";

data csx_ordered;
	file _o;
	set csx_unordered end = last;
	by variable notsorted;

	if _n_ = 1 then do;
		put "data csx;";
		put @5 "infile 'C:\csx_recipient.csx';";
		put;
		put @5 "input" @;
		put;
		retain col1 0;
	end;

	variable = strip(variable);


	col1 = col1 + 10;
	if first.variable then put @col1 variable @;
	col1 = col1 + 25

	if col1 > 90 then col1 = 10;

	if last then do;
		put ';';
		put 'run;';
		put;
	end;
run;
