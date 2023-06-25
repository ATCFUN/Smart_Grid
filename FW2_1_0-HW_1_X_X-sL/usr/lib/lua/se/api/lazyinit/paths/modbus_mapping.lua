LJ 5@usr/lib/lua/se/api/lazyinit/paths/modbus_mapping.lua�   ,- 53  2 3  ;: 3 3 :3	 3 3 ::
3 ::: 3 3 :3 :2 3 3 :;:3 3 :
3 ::: 3 3 :3 3 ::: H  delete204   descriptionUnmapped description�Deletes MODBUS device mapping specified by its #id.
Method does not delete mapping in real just do unmapping from currently specified KNX virtual object.operationIdmodbus.mapping.delsummary!Delete MODBUS device mapping  modbus
patch descriptionNot Found   descriptionModified 	$ref #/definitions/ModbusMapping 	namemappingrequiredin	bodyconsumes  application/json description�Modifies/creates existing MODBUS device mapping identified by its #id.
Register mappings actually already exist and are available just for assigning to any virtual KNX object
and some other attributes (e.g. name) can be changed as well. If virtual KNX object with given bus_address
does not exist it is automatically created with appropriate bus datatype and is named the same way as mapping itself.operationIdmodbus.mapping.patchsummary!Modify MODBUS device mapping  modbusgetresponses404 descriptionNot Found200  schema 	$ref #/definitions/ModbusMapping descriptionOK	tags descriptionCDetailed information about particular mapping of MODBUS deviceoperationIdmodbus.mapping.getsummaryMapping detail info  modbusparameters   descriptionMapping #id	nameidrequiredin	path	typeintegerformat
int32		##$$%&&''()+,,122345  