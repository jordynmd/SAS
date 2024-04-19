data logit;
	set Work.S;
	hits = (ratings >= 6.0);
run;
proc logistic data=logit descending;
	model hits= likes comments screens;
run;
