LJ A@usr/lib/lua/se/api/lazyinit/paths/scheduler_scheduler_events.lua�    3  2 3  ;: 3 3 :3 3 3 3 :	:
:3 ::: H  getresponses404 description,Not Found when scheduler does not exist200  schema
items 	$ref!#/definitions/SchedulerEvent 	type
array descriptionOK	tags descriptionQReturns list of events existing for scheduler specified by its schedule #id.operationIdscheduler.event.listsummary,Lists all events of specified scheduler  schedulerparameters   descriptionScheduler database #id	nameschedulerrequiredin	path	typeintegerformat
int32		  