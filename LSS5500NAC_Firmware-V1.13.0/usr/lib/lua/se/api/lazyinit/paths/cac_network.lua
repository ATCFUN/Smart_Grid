LJ�   ,3  3 3  :2  :3	 3 3 3 :::
:: 3 3 :3 :3 3 ::2 3 3 3 ::;:: 3 3 :2  :3 3 :
:: H  delete   descriptionOK description*Delete all entries from routing tableoperationIdnetwork.route.delsummaryDelete routing table  Network (Routing Table)	post 	$ref##/definitions/CacNetworkCreate 	type
array description$Data for routing table creation	name	datarequiredin	body201   descriptionCreatedconsumes  application/json description=Create routing table with network, destination and routeoperationIdnetwork.route.postsummaryCreate routing table  Network (Routing Table)get  responses200  schema
items 	$ref##/definitions/CacNetworkCreate 	type
array descriptionOKparameters	tags description"List of routing table entriesoperationIdnetwork.route.listsummary#List of routing table entries.  Network (Routing Table) 