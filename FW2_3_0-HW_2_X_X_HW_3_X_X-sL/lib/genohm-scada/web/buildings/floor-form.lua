LJκ   >4     7  > 5  4  7  >    T2   5  2   5  4  7     T(4    7  % 4 7> 5 	 4 	    T4 	 7 
    T 4 	 '  :
 4 	 4	 7 T% T% : 4 	 7     T 4 	 '  : 4  ) : 4  4	 : 4  7  4 @  encodesuccesslayoutLayoutsWidgetswidget	type
bnamebid
floor    SELECT f.*, b.name bname, b.id bid
    FROM visfloors f
    LEFT JOIN visbuildings b ON f.building=b.id
    WHERE f.id=?
  getrowidresult	data	jsondbnew
dbenv 