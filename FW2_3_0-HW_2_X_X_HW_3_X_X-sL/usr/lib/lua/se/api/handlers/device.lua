LJ '@usr/lib/lua/se/api/handlers/device.lua�   4  7%   $> 7' ' > T�) T�) H 1sub'sh /lib/flashsys/upgrade/check.sh readprociofile   c    4   7  % @  =reboot -d 5 & TASK_PID=$!; sleep .3 && kill -0 $TASK_PIDexecuteos �   c4  % >4  % >4 7   >2  4 7>D�7
	
 T
�6
 
 T�)
 9
T
�6
9
BN�H boolean	typeproperties
pairssearchse.api.utils.uci-searchucirequire						config  section  schema  cfg data   prop_name def   �   !Y4  % >4  >D�4 	 > T�  T�' T�'  4 7	  
   >  T�G  BN�4 7  @ commitsetboolean	type
pairsucirequire	config  "section  "data  "  prop_name value   �    +9/4   % > 4   % > 4   % > 4  7  % )  % > 4 >7'� 3 7 :7	:
7:4 7% > 7>:4 7% > 7>:F firmware/lib/genohm-scada/version
brand	trim/lib/genohm-scada/brandreadfileiomachwipinetaddr  hostname	eth0systemsearchse.api.utils.uci-searchuciifinforequire		

cfg eth0  � 	  !8@4  % >4  % >4 7% )  % >4 7% 7% 7>4 7% >  T�G  4	 7
% 7>'� H /proc/sys/kernel/hostnamewritefileiocommithostname
.namesetsystemsearchse.api.utils.uci-searchucirequire




oo  "r  "args  "cfg  E   N+   > 	   T�'� T�'�H � _reboot code  � ;S4  7% >	  T�7  T�+  > 	  T�'� T�'�H �reboot"sh /lib/genohm-scada/reset.shreadprocio _reboot oo  r  args  output code   � 
 'P]%  4 77 7 > = 7)  :4 7 >'   T�'�H +   >  T�4 7 >'�H 4 7	 + >'� H � �renameremoveos	statio	save	filefirmwareassert/tmp/fsfirmware.tmp




_fw_check FW_FILE oo  (r  (args  (dst & �  )q4   7  +  >    T �' �H  4   7  % > 4  7  % +  % $> 	   T�'� T�'�H  � &sleep 5 && sysupgrade executeos*lua /lib/genohm-scada/cron/backup.luareadprocexistsio 				






FW_FILE code  �    4;�4   % > 4   % > 4  7  % )  % > '� 3 4 4 7% % %	 > =   T�%
 T�% :	4 7> 7% % >% $:   T�4 7 >  T�7   T�% :F timezoneUTCtznamedatetimeZT 	gsublocaltimengxsun  monfirstday	coregenohm-scadagettobooleansystemsearchse.api.utils.uci-searchucirequirecfg ( �  ! o��07 7  T=�4 % >4 % >4 7% )  % >  T/�)  4 4 >T�7
	
 T
�4
	 6
T�AN�  T�%
 4 7% 7% 	 T	�%	
 >4 7% 7% 7	>4 7% >4 7%  % $>4 7% >7  T�4 7% 4 7> 7' ' > 7% % >% $>7  T�4 % >4 7% % % 7  T�'  T�' >4 7% >'� H sun	coregenohm-scadafirstday' T	gsubsubtostringdate -s 'datetimedate -kreadproc
/tmp/TZwritefileiocommittzname
.namesetUTCTZOFFSETSTZNAMESipairssystemsearchse.api.utils.uci-searchucirequiretimezonesettings	       !!!!%%%&&&&&&&&&&&&&&&&&&&)))***++++++++++++,,,,//oo  pr  pargs  pcfg 1timezone .	 	 	i name   �  	.�'� +  %  % 7 77> E �schema200responsesgeneralapi_generic_config_get oo  
r  
args  
 r  	.�+  %  % 7>  T�'� H �configgeneralapi_generic_config_set oo  
r  
args  
 �  ;�	+  %  % 7 77>7  T�% :'�  F �englishlanguageschema200responses	coregenohm-scada_generic_config_get oo  r  args  data  �  5�7 7 T�7 % :+  % % 7 >  T�'� H �	coregenohm-scadaenglishlanguageconfig_generic_config_set oo  r  args   u   
�4  7%   %  T�% $@ restart /etc/init.d/readprocioservice  command   �   
�3  3 +  7 :+  7:: H  �values  admin_passwordnew_passwordset_password  current_passwordargs  �  /�4  % >4  % >4  % >4 % >1 5 4 1	 :4 7
4 % > =   T�'� T�'�0  �H !/lib/flashsys/login/save.luadecode 	dataservice "/lib/genohm-scada/web/lib.luadofileuci	jsonencdecrequire		oo  r  args   �    "� �%   1 1 1 1 3 1 :1 :	1
 :1 :1 :1 :1 :1 :1 :1 :1 :1 :1 :0  �H user.admin.patch config.general.set config.general.get config.api.set config.api.get datetime.set datetime.get firmware.upgrade firmware.put factory-reset reboot hostname 	info       /tmp/fsfirmware.img  	  + . > > L L Q Q [ [ o o ~ ~ � � � � � � � � � � � � � �   FW_FILE !_fw_check  _reboot _generic_config_get _generic_config_set   