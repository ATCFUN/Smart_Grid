LJ ;@usr/lib/lua/se/api/lazyinit/definitions/SchedulerEvent.lua�	  % 3> l4   % > 3 3 3 :3 :3 :	3
 3 ::3 :3 :3 :3 :7  7>:7  7>:7  7>:7  7>:3 3  ::!3" :#:$H properties
value 	typestringholidays  yn description�How to behave/run event during holidays:
* `""` - No effect
* `"y"` - Run only on holidays
* `"n"` - Do not run on holidays	typestringdayweeknrsMonthWeeksdaysofweekWeekDaysdaysofmonthMonthDaysmonthsto_swaggerMonths	year maximum�minimum format
int32	typeintegertime_offset format	time	typestring	time format	time	typestringscheduler readOnlyformat
int32	typeinteger	type	enum  sunrisesunset description�Scheduler event type - run at:
* `""` - Specific time: property `time` should be filled
* `"sunrise"` - Sunrise: property `time_offset` should be filled
* `"sunset"` - Sunset: property `time_offset` should be filled	typestringactive 	typeboolean	name 	typestringid   readOnlyformat
int32	typeinteger 	typeobject)se.api.utils.scheduler_named_bitmapsrequire
!FIKNPUWWWWWYYYYY[[[[[]]]]]_aafhjklBitMaps 0  