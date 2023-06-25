LJ 6@usr/lib/lua/se/api/lazyinit/definitions/KnxGrpObj.lua�  ( *+ Q3   3 3 :3 :3 :3 :	3
 :3 3 ::3 :3 :3 :3 :3 :3 :3 :3 :3  3" 3! :#:$3% :&:':$ H  
enumsadditionalProperties descriptionCustomized (named) value	typestringpropertiesdefault   descriptionDefault text	typestring description�Custom values for boolean and integer datatypes in form of `{ "value" => "name" }`
mapping. `value` in mapping is string form of integer in allowed range of object DPT (e.g. boolean `<"0", "1">`,
1 byte unsigned integer `<"0", "255">`) and `name` then text to be displayes insted of object value.	typeobject
value descriptionActual valuereadOnly	typeobjectdecoded description0Set to true when decoded value is availablereadOnly	typebooleandatahex description'Object value in hexadecimal stringpattern^[0-9A-Fa-f]*$readOnly	typestringupdatetime description0Latest update time in UNIX timestamp formatreadOnlyformat
int32	typeintegerexport descriptionExportdefault	typebooleanhighpriolog descriptionHigh priority logdefault	typebooleanlog descriptionLoggingdefault	typebooleanpollinterval descriptionPoll interval (seconds)minimum maximum�	typeintegerformat
int32	tags
items 	typestring description	Tags	type
array
units descriptionKNX object units/suffix	typestringdatatype 	$ref#/definitions/KnxDtcomment descriptionComment	typestring	name descriptionUnique object name	typestringaddress   description_Object group address. If not set the first free address from configured range will be usedformatknx_group_address	typestring 	typeobject	"#&'*,0156:;?@EFIJKNOPQ  