proc import datafile='\\apporto.com\dfs\CLT\Users\jdolly_clt\Desktop\wholesale_customers.xls' 
DBMS=xls out = wscust replace; 

proc univariate data=wscust normal plot;
var milk detergents_paper frozen;
run;

data mod_wscust; set wscust;
if milk > 15000 then delete;
if detergents_paper > 10000 then delete; 
if frozen > 8000 then delete; 
run;

proc fastclus data=wscust maxclusters=7 out=clust  MAXITER=20;
var frozen milk detergents_paper  ;
run;

proc freq data=Clust;
   tables region*Cluster;
run;

