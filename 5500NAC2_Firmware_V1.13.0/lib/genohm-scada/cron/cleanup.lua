LJ7   4  4 6 >  T� H configtonumber�   4   7%   % $ >  T	�4   7%   % $ >G   WHERE id < ?DELETE FROM 
query ORDER BY id DESC LIMIT ?))SELECT MIN(id) FROM (SELECT id FROM getonedb�    Y4   % > 4   % > 4    7  > 5  4  7  % >    T�2   5  1  5 	 1 
 5  4    7  % 4	 % '�> = 5  4     '    T �4  7  4 % > 5  4    7  % 4 % $> 4  % 4	 % '� > = 4  % 4	 % '� > = 4  % 4	 % '� > = 4  % 4	 % '� > = 4  % '� > 4    7  > G  
closemodbus_errorslogusersuser_logslogerrorserrorsloglogslogalertsalerts)(DELETE FROM objectlog WHERE id IN (
query	list,concat
table	logslogobjects�  SELECT ol.id
  FROM objectlog ol
  LEFT JOIN objects o ON ol.address=o.id
  ORDER BY o.highpriolog DESC, ol.id DESC
  LIMIT ?, 100000
getlistcleanup 
limit configgenohm-scada.coreget_alldbnewuci
dbenvrequire 