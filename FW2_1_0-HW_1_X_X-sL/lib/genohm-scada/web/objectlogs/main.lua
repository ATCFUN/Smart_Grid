LJ: 	   4  7 C =9 G  formatstringH   
  7  % % >  4 7  @ encodegabuslib1*	gsub  
 X* 4  7> 4   T4 77>  74 >  TG  7  T
7  T4	 7
77	 >:4   T7 T4 7> T74  T) T) T74  T) T)   TG  4   T4  5 4 '   T4  5 G  4  5 4 '   TG     9 G  pagelimitpagestart
totalfilterallfilterboolboolean	type	readeventtypefilterdatadecodebusdatatypedatadecdatatypedatahex
matchdecodegabuslibfilteraddrmaskaddresstonumberÒ  c4   1 : 4    7  > 5  4  4 % > =     T'   5 	 4  4 %
 > =     T'  5  3  5  4  4 % > =  5  4  4 % > =  5  4     T4     T4   7  4 % 4 4 > T 4     T4   7  4 % 4 > T 	4     T4   7  4 % 4 > 1  5  4  4 % >  T% > 5  4  7  4 > 5  4    7  % >    T4  4 >    T;%   4  7!% %" >%# $  5 $ T 04     T4   7  4 %% 4 > T &4     '    T !4    7 & %' %( 4 %( $> 5 ) 4 )    '    T 4   7  4 %* 4  7+4) %, >%- $> T 4   7 . 4 %/ > 4  4 %0 > =  5 1 4 1    T4   7  4 %2 41 > 4  4 %3 >  T% > 5 4 '   5 5 2   5 6 4 4   7 7 %, > 5 3 2   5 4 4 8 43 > T" 79>  7:>'   T45  55 4  7&%;  >5< 48 4< >T4
6 46 6	  T'   9	
ANöANÜ4 5 '    T '2   5 < 4 = 46 > D45  T4  7.4<  >BNö4 <    '    T 4   7 . 4 %> 4  7+4< %, >%- $> T 4   7 . 4 %/ > 4   7 + 4 %? > 5  % @ 5 A % B 4A %C 4 %D $  5 E '   5 F 4  %G >    T%  5 H 4 H   7 9 > 5 H 4 H   T 4 I 7 J 4H > 5 K 4 L 4K > 5 M 4 M  N T 4 M  O T 4 M  P T 4 K 5 H 4 Q 4H > 5 R T )   5 H 4 H    T4 $ 5 S 4 S    T 4 O 7 T %U 4E 4	 4 > 5 E 2   5 V 1 W 5 X 4    7 Y 4E > 5 Z 4 Z    T2   5 [ 4 Z   7 \ 4[ %] >    TQ 4 X 4V 4[ > 2   5 [ T ð4 Z   7 ^ > 4 S    T 4    7 _ %` 4 $> 5 F 4 I 7 a 3b 4 4F >  T'  :F4V :G0  @    encode-SELECT COUNT(*) FROM objectlog ol WHERE getone
closea
fetchrow	logsexecuteparserow result%s LIMIT %d, %dformatfilterallfilterbooltobooleannumberstringbooleant	typetmppdecode	jsonfilterdata	data
total
query  ORDER BY id DESC
J  FROM objectlog ol
  LEFT JOIN objects o ON ol.address=o.id
  WHERE   SELECT ol.*, 
extra4o.datatype, o.name objectname, o.units, o.enums
 AND ol.address IN(
pairstagged7SELECT DISTINCT object FROM objecttags WHERE tag=?len	trimipairs
splittagobjectstagcountfiltertags	tagsol.src=%dfiltersourcesource0insert),concatol.address IN (	objs%-SELECT id FROM objects WHERE name LIKE ?getlistol.address=%dfilteraddrmask$[0-9]+	gsub^*
matchrawaddressencodegabuslibfilteraddressaddresstostringcheckaddr ol.logtime<=%dol.logtime>=%d!ol.logtime BETWEEN %d AND %dfiltertotimestamp_tofilterfromtimestamp_from
where  pagelimit
limitpagestart
startgetvartonumberdbnew
dbenv finsert
table 