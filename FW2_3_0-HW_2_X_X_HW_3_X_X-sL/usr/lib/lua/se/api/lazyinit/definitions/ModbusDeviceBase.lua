LJ =@usr/lib/lua/se/api/lazyinit/definitions/ModbusDeviceBase.lua�    		4   % > 4    7  % @  BSELECT name FROM modbus_profiles ORDER BY name COLLATE NOCASEgetlistdbse.api.loaddbrequire �    ! 3   3 : 3 3 :3 :3 1	 >:
:3 3 :
:3 :3 :3 :3 :3 :3 :: 0  �H  propertiesconfig descriptionLTODO: model all available structures for Smartlink TCP/RTU (and Sim10?)	typestringactive readOnly	typebooleanpollinterval defaultminimummaximum�	typeintegerformat
int32
slave defaultminimummaximum�	typeintegerformat
int32	port default�format
int32	typeintegerip format	ipv4	typestring
proto  rtutcp 	typestringprofile	enum  	typestring	name 	typestringid   readOnlyformat
int32	typeintegerrequired  	name
proto
slavepollinterval 	typeobject  