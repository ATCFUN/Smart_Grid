LJ 2@usr/lib/lua/se/api/lazyinit/paths/network_lan.lua�    )3 	 3 3  :3 3 3 ::::
 3 3 :3 :2 3 3 :;:3 3 :3 ::: H  	post400 description6Required parameter/property/attribute is missing!   descriptionOKparameters 	$ref%#/definitions/NetworkLanSettings 	namesettingsrequiredin	bodyconsumes  application/json description�Stores device network configuration.
Together with "dhcp" can only dns, dns_alt and mtu parameters can be set, others are ignored.
In case when proto is set to "static" and neither dns and/or dns_alt are not given these
attributes are defaultly set to google's DNS servers "8.8.8.8 8.8.4.4".operationIdnetwork.lan.setsummary(Stores device network configuration  networkget  responses200  schema 	$ref%#/definitions/NetworkLanSettings descriptionOK	tags descriptionTReturns IP network settings currently set on the device in form of JSON object.operationIdnetwork.lan.getsummary/Returns current device IP network settings  network

'()  