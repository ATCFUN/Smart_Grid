LJ�    �4     7  > 5  4  7  >    T�2   5  4  4 7>    T�'   5  4    7  % 4 > 5 	 4 	    T �G  4  4	 7
> 5  4  4	 7> 5  %  5  4  7  4 4 7  T�% T�% 4 7  T�% T�% > 5  4    7  4 4 4 4 > 5  4  4 > 5  4     T �G  T '�4  4   T �4  4 7  T�'��T�'   5  4  7  4 ' > 5  4  7  4 '�> 5  T �%  5  4    7  4 4 4 4 > 4  5  4    7  % 3 4 :
3 4 :> G      scene_sequenceupdateHUPDATE scene_sequence SET sortorder=? WHERE scene=? AND sortorder=?minmax	mathnearestgetone>=<=MINMAXupformatstring
queryVSELECT %s(sortorder) FROM scene_sequence WHERE scene=? AND sortorder%s? AND id!=?
scene
ordersortorder	node;SELECT scene, sortorder FROM scene_sequence WHERE id=?getrowidtonumber	data	jsondbnew
dbenv 