LJî 
 +* 4  7 	 > 4 7>4 7 > T'  4  7 	 > 4 7% 	 > '  '  '	  :	
:	:4 7 )	 > F secmin	hour*t	datecreatedtonumber	timeosmax	math0Æ
½   :* 7   T% '  T7   T% T% 4 	  
  > 4 7%	 7
	 > 4
 7	 %
 4 7%  >4 7%   T% >4 7% >4 7% 7 >4 7% 7 > =H count_dailyRRA:AVERAGE:0.5:24:%dcount_hourlyRRA:AVERAGE:0.5:1:%dRRA:AVERAGE:0.5:1:1UDS:trend:%s:7200:%s:U
-b %d-s 3600createrrdid/tmp/trends/t%d.trendformatstringgettime
GAUGEDDERIVEC	type  L* 7  7  	 		  T'
 T'
 '  ' 	 ' I<)  68
  T T  T  T
7  : 4 77 > T	 T4 7  >   T' 
 ' I  T4 74 7	%
  >) > 4 4 7  %  $>KéKÄH :updaterrd
pcall*t	date	timeosformatstring
floor	math	cvalfmtiscounter 8ß  	%*	  4
  7

 % %  %  % '>
	 	  
   T
4
  >

 T
4
       >

 
  T'  F
 copydata
table	type--resolution
--end--startAVERAGE
fetchrrdÆ
   *	 4
      >
 
 4
 7

>
	
 '  '
  ' I
4      >  	 TT
K
óH copyday	timeosgettime( 
  4     )   	 @ 	copyí  #t* 4	  7
 >		 4	  7
 >		 4	 7		%
 7 >		 4	 7		
 >	 	 T	G  T	  T	  T	G  4		 7	
	
 >		 4	 
 >		 T	G  7		 T	7		 T	)	 T
)	 :	 4	  7
>		 T
'  4	  7
 >		 4	 
 >		 T	'	   	 T	'	 	 T	' %	 
 % $		:	 4	 
    >		 7	  	 T
4	 
     >			:	 4	 
      >	4	 7		
 >	4	 
	 7		% 3   :!3" 7 :>	G    count_resolution resolution<trendsupdatedbremoveos	copygetsum	cvalcreatef%.fmtnumberprecisionds[trend].last_dsDERIVECOUNTERds[trend].typeiscounter
table	type	inforrdexistsioid/tmp/trends/trend-%d.rrdformatstringcount_dailycount_hourlytonumberB    4   7  % > G  killall -SIGUSR2 gpiodfmtexecquietosç   <4   % > 4   % > 4   % > 1  5  1  5  1  5 	 1 
 5  1  5  1  5  1  5  1  5  4    7  > 5  4    7  % > 5  4     '    T 4  > 4  4 > T4 4  >ANú4  7  % > 4  > G  *lua /lib/genohm-scada/cron/backup.luaexecuteos
pcallipairstrendsBSELECT * FROM trends WHERE resolution IS NULL OR resolution=0getalldbnew
blink 
fixup getsum 	copy copyday copydata create gettime genohm-scada
dbenvrrdrequire 