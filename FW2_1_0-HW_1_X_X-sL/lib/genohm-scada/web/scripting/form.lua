LJ�  Q �4     7  > 5  4  % > 5  4  4 % > =  5  4     TB�4  7  4 > 5 	 4    7 
 % 4	 > 5  4     T 3�4  7  4	 > 5  4    7 
 % 4 > 5  4  4 >   T �4     '    T �4  7  % 4 4	 > 5  T �4  7  % 4	 > 5  4    7  % 3 4	 :4 :> 4    7  > 5  4     T 
�4  7  >    T�2   5  4  7  5  2   5  4    T �4  ) :  4  3$ 4! 7"%# >  T�%% :&: T ��4   ' T �4  ) :  4  3) 4! 7"%( >  T�%% :&: T �4   * T �4  ) :  4  ) :+ 4  3- 4! 7"%, >  T�%% :&: T ׀4   . T �4 ! 7 " %/ >    T�% % 5 & 4 &  % T �% 0 5 & 4  ) :  4  ) :+ 4  31 4& :&: T ��4  4 >   T N�4    7 2 ' ' >  3 T F�4    7 2 ' > 5  4 4 7 5 4 >    T��4  ) :  % 6 4 $  5 7 4 7 %8 $  5 9 4 7 %: $  5 ; 4 7 %< $  5 = 4  3> 4! 7"49 >  T�%% :&4! 7?49 >:94 :4 :4! 7"4; >  T�%% :@4A 4! 7"4= >  T�%% >:=: T h�4  4 >    T�'   5  4  '    T 8�4    7 B %C 4 > 5 & 4 &    T4�4  ) :  4  4& : 4 & 7   D T *�4 E    T'�4  7  4& 7> 5 	 4 	    T �4    7 
 %F 4& 7> 5 	 4  4	 > 5 	 4 	    T�4  4  7B%G 4	 >: T �4  ) :  4  2  : 4  7     T�4 E    T �4  7  4  7I%J >:H 4  7  4  7I%L >:K 4  7  4  7N%O >:M 4 E    T�4  H  T �4  7 P 4 @  G  encode-SELECT id, name FROM objects ORDER BY idgetallobjects9SELECT DISTINCT tag FROM objecttags ORDER BY tag ASC	tagsUSELECT DISTINCT category FROM scripting WHERE category!="" ORDER BY category ASCgetlistcategories%SELECT * FROM objects WHERE id=?3SELECT MIN(object) FROM objecttags WHERE tag=?editor
event'SELECT * FROM scripting WHERE id=?getrowtobooleandescriptionexists  	load
.load	meta
.metasource
.luasprefix/usr/share/lua/user/isvalidnamelmscripting
user.sub idjs,$(function(){
  // your code here
});(/lib/genohm-scada/storage/custom.jsjs idcss)/lib/genohm-scada/storage/custom.cssskipaccss idinitscript//usr/share/lua/genohm-scada/initscript.luainitscriptscript iduserlib-/usr/share/lua/genohm-scada/userlib.luasreadfileiosuccessuserlibresult	data	jsongetlastautoid	nameparams 	type
eventscriptactivescriptinginsertEvent for %sscrnameEvent for %s (%s)formatstring	typeobjname(SELECT name FROM objects WHERE id=?
objidencodega,SELECT id FROM scripting WHERE params=?getoneaddressdecodegabuslibobjecttonumberidgetvardbnew
dbenv 