LJ @@usr/lib/lua/se/api/lazyinit/paths/scheduler_scheduler_event.lua�    !3  3 3  :3 :2 3 ;3 3 :;:	3 3
 3 ::3 ::: H  	post  responses404 description,Not Found when scheduler does not exist201   format
int32	typeinteger descriptionCreatedparametersschema 	$ref'#/definitions/SchedulerEventCreate descriptionScheduler event info	name
eventrequiredin	body descriptionScheduler database #id	nameschedulerrequiredin	path	typeintegerformat
int32consumes  application/json	tags description<Will create new record for scheduler event in database.operationIdscheduler.event.postsummaryCreate new scheduler event  scheduler !  