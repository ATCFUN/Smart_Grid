LJ .@usr/lib/lua/se/api/lazyinit/paths/user_id.lua�  $ 23 33  2 3  ;: 3 3 :3	 3 3 ::
3 ::: 3 3 :3 :2 3 3 :;:3 3 :
3 :3 :3 ::: 3 3 :3  3 :!3" :::# H  delete descriptionNot Found204   descriptionDeleted descriptionJRemoves user specified by his #id from database if such record exist.operationIduser.delsummaryDelete user  
users
patch409 descriptionDuplicity descriptionNot Found400 descriptionCorrupted data   descriptionModified 	$ref#/definitions/User descriptionUSer info	name	userrequiredin	bodyconsumes  application/json descriptionmModifies user specified by his #id. Only given user attributes are modified, the rest is kept unchanged.operationIduser.patchsummaryUser modification  
usersgetresponses404 descriptionNot Found200  schema 	$ref#/definitions/User descriptionOK	tags descriptionBReturns detailed information about user specified by his #id.operationIduser.getsummaryUser info  
usersparameters   	$ref#/parameters/DbItemId	
 !""##$$%%&')**.//00123  