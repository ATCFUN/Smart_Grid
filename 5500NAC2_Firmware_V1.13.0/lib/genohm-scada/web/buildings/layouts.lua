LJ�   4     7  > 5  4    7  % > 5  4  7  4 ' 3 > 4 	 7 
 3 4 :@    encode	json id 	name-insert
table	datay  SELECT id, name, type
  FROM visfloors
  WHERE building=0 AND type IS NULL OR type=='layout'
  ORDER BY sortorder
getalldbnew
dbenv 