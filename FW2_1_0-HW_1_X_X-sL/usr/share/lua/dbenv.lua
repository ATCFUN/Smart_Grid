LJ�  * 4    > T�  T� T�% 4 2  3 +  :>  7 >H  �	init__index  setmetatable/tmp/scada.dbstring	type     G  � -)  7    T�4  % >:  4 % >7>: 7  77  (  >: 1
 :	 7  7% >   T� 7>7  7% >'  : ) : G  _autoclean_queriesPRAGMA temp_store=MEMORY
closePRAGMA journal_mode=OFFexecute 	nullconnect_dbsqlite3luasql.sqlite3require	_env&[dbenv:init] dbfile not specifiedassert_dbfile��   :  G  _autoclean� �* 2	 C
 <
  	 	 		 T	�
  7	   @	 4	 8
>		 T	�8' ' 2  Q	c�
 7	%  ) >		   T		�4	 7		
  7 > =	T	Q�4	 7		
  7 > =	6
  T	=�7	 	 T	:�4	 
 >		  T	� T	�4		 7	
		 T	�4		 7	
			 	 T	�4	 7		
  >	T	(�4	 7		
 % >	T	"� T	
�4	 7		
   T�' T�'  >	T	�4	 
 >		 4	 7		
 % 7  7 >% $>	T	�4	 7		
 % >	T	�4	 7		
 >		 
  7	   @	 concatescape_db'tostringboolean	NULL	huge	mathnumber	nullsubinsert?	find
table	typeexecute���� �  ** 2  2  '  4   >D
�4 7 
 >4 7  > B
N
�4 7% 	 4
 7

 % >
4 7%	  > =   7
 	 
 @ 
query,?rep,concat%INSERT INTO %q (%s) VALUES (?%s)formatstringinsert
table
pairs�   A* 4    > T'�7   T�% 7 % $)  : T�% 2  4   >D�4
 7

 4 7%	  > =
4
 7

 	 >
BN�4 7
  >  T�4   > T�4  >T�4
 7

 	 >
AN�  T�% H 1ipairsconcat	%s=?formatstringinsert
pairs
 AND  
_mode
table	type� 
 ,* 2  2  4  	 >D�4 7 4 7%  > =4 7  >BN�4 7%	 
 4 7 % >+     > = 	  7	 
  @ �
query,concatUPDATE %q SET %s WHERE %s	%s=?formatstringinsert
table
pairs}  * 2  4  7%  +	  
   >	 =   7  	 @ �
queryDELETE FROM %q WHERE %sformatstring�  
+* 7    T�7 'd  T�  7 >  7 >) :  Q�7  7 >   T� T�4 7	(  >T�T�T�  T�7 :   F 
sleepos(LuaSQL: database schema has changedLuaSQL: database is lockedexecute_db	init
close_queries_autoclean��������&   7   7 @ escape_db-   7   7 @ getlastautoid_dbw  *   7   C = 4  > T� 7>  7>H 
close
fetchuserdata	type
query�  *   7   C = 4  > T	� 72  % >  7>H 
closea
fetchuserdata	type
query�	   * 2    7   C = 4  > T�2   7 % >  T�Q�4 7 8>T� 7>H 
closeinsert
tablen
fetchuserdata	type
query�	  "* 2    7   C = 4  > T�Q�2   7 % >  T�4 7  >T�T�T� 7>H 
closeinsert
tablea
fetchuserdata	type
queryd   7   7% >  T� 7>) H G  
closePRAGMA integrity_checkexecute_db�   4  7% 7  >  7 % >4 7 >  7 % >) H COMMITosBEGIN EXCLUSIVEexecute_dbfilecp %q %qformatstringN   7    T
�7   7>7  7>)  :  G  	_env
close_db�  % (2   1 :  1 : 1 : 1 : 1	 : 1
 1 : 1 : 1 : 1 : 1 : 1 : 1 : 1 : 1 : 1 : 1  : 1" :! 4# : $0  �H  
dbenv_G 
close backup 
check getall getlist getrow getone getlastautoid escape execute delete update  insert 
query setautoclean 	init new 