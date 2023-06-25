LJ 4@usr/lib/lua/se/api/lazyinit/definitions/Holiday.lua�
    W3   3 3 :3 3 ::3 :	3
 :3 :3 :3 :3 :3 :: H  propertiesduration description Duration of holiday in daysminimummaximumZ	typeintegerformat
int32dayweeknr descriptionVWeekday:
* `1` - 1st
* `2` - 2nd
* `3` - 3rd
* `4` - 4th
* `5` - 5th
* `6` - Lastminimummaximum	typeintegerformat
int32dayofweek description~Weekday:
* `1` - Monday
* `2` - Tuesday
* `3` - Wednesday
* `4` - Thursday
* `5` - Friday
* `6` - Saturday
* `7` - Sundayminimummaximum	typeintegerformat
int32day descriptionDay in the monthminimummaximum 	typeintegerformat
int32
month description�Month:
* `1` - January
* `2` - February
* `3` - March
* `4` - April
* `5` - May
* `6` - June
* `7` - July
* `8` - August
* `9` - September
* `10` - October
* `11` - November
* `12` - Decemberminimummaximum	typeintegerformat
int32	year descriptionJWhen year is 0 or not given/set then it means holidays are recurring.minimum format
int32	typeinteger	name 	typestring	type	enum  dayweeknr description�Holiday type:
* `""` - Specific date: property `day` is required
* `"dayweeknr"` - Day of the week: properties `dayweeknr` and `dayofweek` are required	typestringid   descriptionDatabase #idreadOnlyformat
int32	typeinteger 	typeobject	
,-34ABNOUVW  