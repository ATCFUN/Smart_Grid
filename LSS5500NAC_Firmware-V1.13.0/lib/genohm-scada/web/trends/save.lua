LJò   @4  7%   > % $ % $4 7%  >4 7%  	 >4	  >T	4 7%
   
 >4 7%   >A	N	ñ4 7%   >4 7%  	  >4 7%  	 >4 7%  >G  rmdir %q8cp %q /lib/genohm-scada/storage/db/trends/t%d.trend5rm /lib/genohm-scada/storage/db/trends/t%d.trendmv %q %q"cd %q && rrdtool resize %q %sipairscp %q %qmkdir %qfmtexecosresize.rrdinput.rrd/tmp/trend-%d/formatstringÃ  G4  7  >4 7 >2    TG  3 4  >T
** 4 %  $6>  T7 !4	 7
% 
 > 6 T4 7 4	 7
% 
 '   T% T% 4 7 > = =A
N
Ô '   T4   	 
 >G  doresizeabs	mathSHRINK	GROW%d %s %dinsert
tablerra[%d].rowsformatstringresolutioncount_tonumberipairs  resolution
daily	inforrdgetfiletrends
 ,   4    >  T'  H tonumber¢  *   T7  T7  4 7 >4  > !4 74 7 >@ count_daily
floor	mathcount_resolutionnumresolution
ø  
 +*  %   4 7% >  7	  >  T4 7  >	   4 7% >	     T	'   T  H T  H G  	/tmpstatfs	find/proc/mountsreadfileio/data/storage/dbÿ   *  '   %  4 7 > 4  >T
4 7	 
 $	
	>  T	'    ANô  H 	statipairslsio/tmp/trends/{   4  >  T4  >4    >4 >  T) T) H allowedsizetrendsizetotalsizek   7  7  T T T T% T% :  G  AVERAGE	LASTMAXMING	typeaggregation  4   7%   >4  >  T'   H tonumber7SELECT MAX(sortorder) FROM trends WHERE category=?getonedbä  % |* 4  7	 >   T
4 	 7%
  >   TG  4 	  
 >  T3 H 4  7	 > 4 7		 > 7
  T	%   T(4 	 7%
  >   T T4 	 > 4 	 7%
 3 7 ::7 :7 ::	7
 :
:3 :>4 	 
   >T+4 	  >4 	 7%
 3 7 :7 :7 ::7 :7 :7 :7 :4  >:4 7 >:!:	7
 :
>4 7"4	 
	 7	#	>	
  >3$ H  successgetlastautoidcreatecreated	timeosprecisionresolutionaggregation	type  insertcheckaggregationresize  sortordercount_dailycount_resolution  	nametrendsupdategetsortorder+SELECT category FROM trends WHERE id=?getonecategoryshow_zerotobooleanobject success	sizecheckcreate$SELECT * FROM trends WHERE id=?getrowdbidtonumber   24   % > 4   % > 4    7  > 5  4  7  > 5  1  5 	 1 
 5  1  5  1  5  1  5  1  5  1  5  1  5  1  5  1  5  4     T4  4 > 5  4  7  4   T3 0  @   successencoderesult	save getsortorder checkaggregation checkcreate totalsize allowedsize trendsize num resize doresize 	data	jsondbnew
dbenvtrendsrrdrequire 