LJ¯   )  4   7%   > 4  >   T4 %  @ G  schedulerscheckaccesstonumber6SELECT scheduler FROM scheduler_events WHERE id=?getonedb§ 	 M 4   % > 4    7  > 5  4  7  > 5  4  7     T%  5  4 	 4 7
>    T' ÿÿ5 
 )  5  1  5  4    T Y4  % > 5  4     TO2   5  4  4 % > =     T4  ) ;  T 4  4 4 
 T4 8 T) T) >;  4 	 4 %
 > =  5 
 4 
    T4  7  % 4
 >    T%  5  4    7  % 4 $> 5  4  4 > T7
5
 4 
 T4 4
 6  T
4  7% 4
 >:4 4
 9ANêT )  5  T 4    T 4  % '  >    T4    7  %  > 5  T 4   ! T 4  4
 >    Tÿ4    7 " %# 3$ 4
 :
> )  5  T ô4   % T 4  % '  >    Të4    7 " %& 3' 4
 :
> )  5  T à4   ( T +4  % 4
 >    T×4    7 ) % 3+ 4 4 7*>:*4	 4 7,>:,4	 4 7->:-4	 4 7.>:.4	 4 7/>:/30 4
 :
> )  5  T ²4   1 T d3 2 4 4 7*>:* 4 73:3 4 74:4 4	 4 75>:5 4	 4 76>:6 4	 4 77>:7 4	 4 78>:8 4	 4 79>  T'  :9 4 7::: 4 7;:; 4 7<:< 4 7=:= 4 7: 4 7>:> 5 ? 4 
 '    T 4  4
 >    Tk4    7 ) %# 4? 3@ 4
 :
> )  5  T _4  % 4 7A>    TX4 ? 4 7A:A 4    7 B %# 4? > )  5  T K4   C T H3 D 4 73:3 4 74:4 4	 4 7E>:E 4	 4 7F>:F 4	 4 79>  T'  :9 4	 4 7G>  T' :G 4	 4 7H>:H 4	 4 7I>:I 5 ? 4  % '  >    T4 
 '    T 
4    7 ) %& 4? 3J 4
 :
> T 4    7 B %& 4? > )  5  4     T4 K > 4  7 L 4 0  @  encodeclearschedulers  dayweeknrdayofweekduration
monthday  holiday-saveinsertscheduler  dbdata
valuedayweeknrsdaysofweekdaysofmonthmonths	yearoffset_minoffset_hourstart_minstart_hour	name	type  event-save  end_monthend_daystart_monthstart_day  activeupdatescheduler-save  scheduler_holidaysholiday-delete  scheduler_eventsdeleteevent-delete%SELECT * FROM scheduler_holidayscheckaccessholidaysTSELECT * FROM scheduler_events WHERE scheduler=? ORDER BY start_hour, start_mineventsipairsmSELECT s.*, o.datatype, o.visparams, o.units, o.enums FROM schedulers s JOIN objects o ON s.object=o.id getall
whereWHERE s.id=%dformatstring
noholgetvartobooleanresultaclgetaclschedulerscheckeventaccess reloadidtonumberaction	data	jsondbnew
dbenvgenohm-scada.aclrequire 