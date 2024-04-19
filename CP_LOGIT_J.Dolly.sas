data logit;
	set "\\apporto.com\dfs\CLT\Users\jdolly_clt\Desktop\hsb2";
	honcomp = (write >= 60);
run;
proc logistic data=logit descending;
	model honcomp= female read science;
run;
