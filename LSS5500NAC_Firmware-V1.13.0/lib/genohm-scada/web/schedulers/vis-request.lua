LJ²   )  4   7%   > 4  >   T4 %  @ G  schedulerscheckaclaccesstonumber6SELECT scheduler FROM scheduler_events WHERE id=?getonedb¬   %    % $H ,    ORDER BY s.category, s.sortorder
  ì    SELECT s.*, o.datatype, o.visparams, o.units, o.enums
    , s.controlobject >> 8 & 0xFF AS enablegrouptagid, s.controlobject >> 16 & 0xFF as enableobjnetid, c.tag AS enablegrouptag
    FROM schedulers s
    JOIN objects o ON s.object=o.id
    LEFT JOIN cbus_tag_map c ON c.app=203 AND c.tagtype="G" AND c.tagid=enablegrouptagid and c.net=enableobjnetid
     4   7%   @ g    SELECT *
    FROM scheduler_events
    WHERE scheduler=?
    ORDER BY start_hour, start_min
  getalldbî  _4     7  > 5  4  7  > 5  4  7     T%  5  4  4 7>    T' ÿÿ5  )  5 	 1 
 5  1  5  1  5  4    T h4  % > 5  4     T^2   5  4  4 % > =     T4  ) : T 4  4 4 
 T4 8 T) T) >: 4  > 5  4     T
%  4 74 % >% $  5  T %  5  4    7   4 4 > = 5 ! 2   5  4 " 4! > T75 4 
 T4 4 6  T	4 4 >:#4 4   9ANë4  4 : 4  7 $    T4  4  7 %% >:$ T x)  5  T u4   & T $4  % > 5  4  
  T 
4 ' 4 >   T f4  4 6     Ta4    7 ( 4 %) >4 > 5  4     TU4  4 4 7>:# T N4    T 4 * % '  >    TE4    7   %+ > 5  T >4   , T 4  4 >    T64    7 - %. 3/ 4 :> )  5 	 T +4   0 T 4 * % '  >    T"4    7 - %1 32 4 :> )  5 	 T 4   3 T 34 * % 4 >    T4    7 4 % 36 4 4 75>:54 4 77>:74 4 78>:84 4 79>:94 4 7:>::4 7; T' T'  :;3< 4 :> )  5 	 T á4   = T 4 > 7 ? 4 7@%A > 
   T 4  7 B 4 7@> 7A 
  T'  :C ' :D 4 4 7E  >:@3 F 4 4 75>:5 4 7':' 4 7G:G 4 4 7H>:H 4 4 7I>:I 4 4 7J>:J 4 4 7K>:K 4 4 7L>  T'  :L 4 7M:M 4 7N:N 4 7O:O 4 7P:P 4 7: 4 7@:@ 5 Q 4 Q '':R 4  4 7S> 
   T 4  4 7S>   T 4 Q 4 4 7S>:R 4  '    T 4  4 >    Tk4    7 4 %. 4Q 3T 4 :> )  5 	 T _4 * % 4 7&>    TX4 Q 4 7&:& 4    7 U %. 4Q > )  5 	 T K4   V T H3 W 4 7':' 4 7G:G 4 4 7X>:X 4 4 7Y>:Y 4 4 7L>  T'  :L 4 4 7Z>  T' :Z 4 4 7[>:[ 4 4 7\>:\ 5 Q 4 * % '  >    T4  '    T 
4    7 4 %1 4Q 3] 4 :> T 4    7 U %1 4Q > )  5 	 4 	    T4 ^ > 4  7 E 4 0  @  clearschedulers  dayweeknrdayofweekduration
monthday  holiday-saveinsert  eventdisablelevelcontrol_object_valuedbdatadayweeknrsdaysofweekdaysofmonthmonths	yearoffset_minoffset_hourstart_minstart_hour	name  encodestatusprogresspdecode	mode
value	findstringevent-save  ignore_enable_groupend_monthend_daystart_monthstart_day  activeupdatescheduler-save  scheduler_holidaysholiday-delete  scheduler_eventsdeleteevent-delete%SELECT * FROM scheduler_holidayscheckaclaccessWHERE s.id=?getrow	typescheduler1SELECT * FROM cbus_tag_map WHERE tagtype="L"levelseventsipairs
itemsgetall
where),concat
tableWHERE s.id IN (idsgetvaridsholidays
noholgetvartobooleanresultaclgetaclschedulersgetevents getquery checkeventaccess reloadidtonumberaction	data	jsondbnew
dbenv 