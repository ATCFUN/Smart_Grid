LJ: 	   4  7 C =9 G  formatstring¬ 	  !  7  % % >    7 % > '   T '  TG  4  >T4  >  TG  ANø) H tonumberipairs/
split1*	gsubR     7  % 3 >  %   % $H % %\%\\\_\_*%.	gsubà 
 y* 4  7> 4   T4 77>  74 >  TG  4   T4 4 7 > TG  4	   T4	 4 7
 > TG  4   T4 4 7 > TG  7  T
7  T4 777	 >:4   T7 T4 7> T74  T) T) T74  T) T)   TG  4   T4  5 4 '   T4  5 G  4  5 4 '   TG     9 G  pagelimitpagestart
totalfilterallfilterboolboolean	type	readeventtypefilterdatadecodebusdatatypedatadecdatatypedatahexgetgrpfiltergrpgetappfilterappgetnetcbuscorefilternet
matchdecodegabuslibfilteraddrmaskaddresstonumberê  h«4   1 : 4    7  > 5  4  4 % > =     T'   5 	 4  4 %
 > =     T'  5  3  5  4  4 % > =  5  4  4 % > =  5  4     T4     T4   7  4 % 4 4 > T 4     T4   7  4 % 4 > T 	4     T4   7  4 % 4 > 1  5  1  5  4  4 % >  T% > 5  4  7  4 > 5  4    7   %! >    T4  4 >    T% " 4  7#%! %$ >%% $  5 & T 	4     T4   7  4 %' 4 > 4  %( > 5 ( 4 ) 4( >  * T 4 (   7 + > 5 ( 4 (    '    T 4  4( > 5 ( 4  4   %, 4  7-4( >%. $9 4  4 %/ > =  5 0 4  4 %1 > =  5 2 4  4 %3 > =  5 4 4  4 %5 >  T% > 5 6 '   5 7 2   5 8 4 6   7 9 %: > 5 5 2   5 6 4 ; 45 > T" 7+>  7<>'   T47  57 4  7=%>  >5? 4; 4? >T4
8 48 6	  T'   9	
ANöANÜ4 7 '    T '2   5 ? 4 @ 48 > D47  T4  7A4?  >BNö4 ?    '    T 4   7 A 4 %B 4  7C4? %: >%D $> T 4   7 A 4 %E > 4   7 C 4 %F > 5  % G 5 H % I 4H %J 4 %K $  5 L '   5 M 4  %N >    T%  5 O 4 O   7 + > 5 O 4 O   T 4 P 7 Q 4O > 5 R 4 ) 4R > 5 S 4 S  T T 4 S  * T 4 S  U T 4 R 5 O 4 V 4O > 5 W T )   5 O 4 O    T4 & 5 X 4 X    T4 0    T4 2    T4 4 5 X 4 X    T 4 * 7 Y %Z 4L 4	 4 > 5 L 2   5 [ 1 \ 5 ] 4    7 ^ 4L > 5 _ 4 _    T2   5 ` 4 _   7 a 4` %b >    TQ 4 ] 4[ 4` > 2   5 ` T ð4 _   7 c > 4 X    T 4    7 d %e 4 $> 5 M 4 P 7 f 3g 4 4M >  T'  :M4[ :N0  @    encode-SELECT COUNT(*) FROM objectlog ol WHERE getone
closea
fetchrow	logsexecuteparserow result%s LIMIT %d, %dformatfilterallfilterbooltobooleannumberbooleanttmppdecode	jsonfilterdata	data
total
query  ORDER BY id DESC
J  FROM objectlog ol
  LEFT JOIN objects o ON ol.address=o.id
  WHERE   SELECT ol.*, 
extrao.datatype, o.units
 AND 0)concatol.address IN(insert
pairstagged7SELECT DISTINCT object FROM objecttags WHERE tag=?getlistlenipairs,
splittagobjectstagcountfiltertags	tagsfiltergrpgrpfilterappappfilternetnet' ESCAPE "\"escapeol.meta LIKE '	trimstring	type	metaol.address=%dfilteraddrmask$[0-9]+	gsub^*
matchrawaddressencodegabuslibfilteraddressaddresstostringescapelike checkaddr ol.logtime<=%dol.logtime>=%d!ol.logtime BETWEEN %d AND %dfiltertotimestamp_tofilterfromtimestamp_from
where  pagelimit
limitpagestart
startgetvartonumberdbnew
dbenv finsert
table 