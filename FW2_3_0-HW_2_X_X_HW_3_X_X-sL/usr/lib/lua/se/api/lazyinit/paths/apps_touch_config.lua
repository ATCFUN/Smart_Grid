LJ 8@usr/lib/lua/se/api/lazyinit/paths/apps_touch_config.lua�     3  3 3  :3 3 3 ::3 :	:
: 3 3 :3 :2 3 3 :;:3 3 ::
: H  put   descriptionConfiguration savedparameters 	$ref!#/definitions/TouchAppConfig description!Touch app JSON configuration	nameconfigrequiredin	bodyconsumes  application/json descriptionQMethod sets provided Touch app configuration (in JSON format) to the device.operationIdapps.touch.config.putsummary Set Touch app configuration  	apps
touchget  responses404 descriptionNot Found200  schema 	$ref!#/definitions/TouchAppConfig descriptionOK	tags descriptionGServes Touch app configuration if any is available in JSON format.operationIdapps.touch.config.getsummary%Provides Touch app configuration  	apps
touch

   