LJ7   4  4 6 >  T� H configtonumber�
  $ �4   % > 4   % > 4    7  > 5  4  7  % >    T�2   5  1  5 	 4    7 
 % 4	 % '�> = 5  4     '    T �4  7  4 % > 5  4    7  % 4 % $> 4    7  % 4	 % '� > = 5  4     T�4    7  % 4 > 4    7  % 4	 % '� > = 5  4     T�4    7  % 4 > 4    7  % 4	 % '� > = 5  4     T�4    7  % 4 > 4    7  %  4	 %! '� > = 5  4     T�4    7  %" 4 > 4    7 # > G  
close'DELETE FROM user_logs WHERE id < ?logusersLSELECT MIN(id) FROM (SELECT id FROM user_logs ORDER BY id DESC LIMIT ?)$DELETE FROM errors WHERE id < ?logerrorsISELECT MIN(id) FROM (SELECT id FROM errors ORDER BY id DESC LIMIT ?)"DELETE FROM logs WHERE id < ?loglogsGSELECT MIN(id) FROM (SELECT id FROM logs ORDER BY id DESC LIMIT ?)$DELETE FROM alerts WHERE id < ?idlogalertsISELECT MIN(id) FROM (SELECT id FROM alerts ORDER BY id DESC LIMIT ?)getone)(DELETE FROM objectlog WHERE id IN (
query	list,concat
table	logslogobjects�  SELECT ol.id
  FROM objectlog ol
  LEFT JOIN objects o ON ol.address=o.id
  ORDER BY o.highpriolog DESC, ol.id DESC
  LIMIT ?, 100000
getlist
limit configgenohm-scada.coreget_alldbnewuci
dbenvrequire 