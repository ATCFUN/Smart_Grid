LJ�  1 z4     7  > 5  4  % % % > 4  7  %	 > % 
 5  4    7  4 > 5  Q ^�2   4  7  % >  T�T T�4 7 >  T�'  5 4 7 >  T�'  5 4 7% 4 77 > =5 7 5 4  T�4  T�7   T�4  7!7" 7 4 >5# T�%$ 5# 4 74% 7&%' 4 4 4( 7)4 >7*   T�%$ 4+ 4	# >4	 '
  
	 T	�4	( 7	,	4
 >	 	 T
�%	- 7
.  
 T�%
$ 7/   T�%$ >
 = T �4    7 0 > G  
close	metasender
localdecodeiatostring	namedecodegabuslib%q,%q,%q,%q,%q,%q,%q,%qformatstring
valuedatahexdecodevaluegrpdatatyperesponse
write
etypeeventtypelogdatelogtime
floor	math%Y.%m.%d %H:%M:%S	dateosiasrcidaddresstonumbera
fetchcur
queryoSELECT ol.*, o.name, o.datatype
FROM objectlog ol
LEFT JOIN objects o ON ol.address=o.id
ORDER BY id DESC
N"date","type","destination","name","value","source","sender","login/meta"sayngxcsv	Logstext/csv; charset=utf-8setdlheaderdbnew
dbenv 