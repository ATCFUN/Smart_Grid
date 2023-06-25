LJ :@usr/lib/lua/se/api/lazyinit/definitions/ModbusMapping.lua�  , 01 �3   3 3 :3 :3 :3 :	3
 2 3 ;::3 :3 :3 3 ::3 :3 :3 :3 3 ::3  3! ::"3# :$3% :&3' :(3) :*:+ H  propertieswrite_only descriptionZ*True* means that reading coil or register value is disabled when writable is enabledreadOnly	typebooleanwritable descriptionr*True* if writing to coil or register is available. If *false* then writing to the register is not available.readOnly	typebooleanvalue_delta description�Value send delta is used as kind of threshold - when newly read
value from MODBUS register does not exceed this threshold in comparing to previously
read value, then such value is not written to the mapped virtual KNX object.minimum maximum��	typenumberformatdouble
units descriptionKNX object units/suffix	typestring	type  	coildiscreteinputregisterinputregister descriptionModbus register typereadOnly	typestring	tags
items 	typestring description0List of tags for mapped virtual KNX object.	type
array	name descriptionKMapping (and virtual KNX object if object is going to be created) name	typestringid description-Internal database #id of mapping record.readOnlyformat
int32	typeintegerdevice descriptionRelated MODBUS devicereadOnlyformat
int32	typeintegerdatatype	enum  uint16
int16float16uint32
int32float32uint64
int64quad10k	s10k description Datatype of mapped registerreadOnly	typestringcomment descriptionIMapping commentary. Is actually stored by mapped virtual KNX object.	typestringbus_write description�Allow/disallow writing value to the bus via mapped KNX virtual object.
That means when a value is read from device register its value is send to the KNX bus and not just
internally updated in device database (*grp.write()* is used instead of *grp.update()*).	typebooleanbus_datatype
allOf 	$ref#/definitions/KnxDt description.KNX datatype required by device register.readOnlybus_address description&Virtual KNX objects group addressformatknx_group_address	typestringaddress_scale descriptionMAddress of register containing value scale `value = value \* 10 ^ scale`readOnly	typeintegeraddress descriptionRegister address (0-based)readOnly	typeintegeractive   readOnly	typeboolean 	typeobject	!#(*-/1146;=BDGIKKMOQQTVY[cgklpr�  