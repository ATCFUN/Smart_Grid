LJ�   :4     7  > 5  4  7  >    T�2   5  4  4 7> 5  4     T%�4    7  % 4 > 5 	 4 	    T�4    7 
 % 4	 7> 4    7 
 % 4 > 4    7 
 % 4 > 4    7 
 % 4 > 4  > G  clearschedulersADELETE FROM user_acl WHERE module="schedulers" AND item_id=?3DELETE FROM scheduler_events WHERE scheduler=?&DELETE FROM schedulers WHERE id=?sortorderBUPDATE schedulers SET sortorder=sortorder-1 WHERE sortorder>?
query	item0SELECT sortorder FROM schedulers WHERE id=?getrowidtonumber	data	jsondbnew
dbenv 