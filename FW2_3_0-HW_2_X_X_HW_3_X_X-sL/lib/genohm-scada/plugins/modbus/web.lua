LJu   4    > T�  T�  T�  T�  T�  T�H  4   @ tobooleanwbbwwbnstring	type�    1*  4  7% >  T�%    7 >    7 % >  T�' T�  7 % >  T�'
   T�4  7	%
 > 4  > T�'    T�) T�) H ) H tonumber(SELECT COUNT(1) FROM modbus_devicesgetonedb
wiser5500shac	find
lower/lib/genohm-scada/brandreadfileio�  	4  7 >4  > T�'    T�'  T�'  4 % >7%  %   @ gs-modbus127.0.0.1requestrpcrequirenumber	typeportnrtonumber�,� 
  '* 4  7 > 7% > 4 73 8:8:7	 :	7
 :
> % 4 % 4 7	 >$4 7 > 4 7 @ pdecodereadprociostrtohexlmcore/tcp.lua pluginpath	lua map
slave	portip  encode	json:
splitsettingstostring�   4    > T�  7 % >  T�G  4 7% 4   @ profilepath%s/%s.jsonformat^[-_%a%d]+$
matchstring	type�   * 4    >   T�4 7 >  T�G  4 7 > 4 7 > 4  > T�G  H 
table	typepdecode	jsonreadfileexistsiogetprofile�   4  77 >4   >D�4 6  T�)  9 BN�)  : '   T� T�)  : G  idmappingfields
pairsbus_addressnormalizegrp�  	  4   4 % $> 2   5  4  4 77> T
�4  7	%
 > =  4 ) 9AN�G   
splitunpackmodbus_mappingtablesplugindbipairsmappingfields/dbinit.luapluginpathdofile�   Q)  4   > T�G  4 7>TC�: 	 '
  
	 T	�	 %
 7$		:	4	 4
 %	 $

>	7
4	  
 >		 T	�4	 6		 	 T
�4	 6	4	  
 >		 T	�7	 	 T	�%	 :	4	 7		
 >	:	
T	�)	  :	
4	  7
>		 T	�4	 7		7
>	:	T	�)	  :	4	 
 >	4	 
	 7		%  >	AN�G  modbus_mappinginsertdbcheckmappingvalue_nanencode	json?default
enumsstringvalue_custom/enums.luapluginpathdofile - 	namedevicemappingipairs
table	typeJ   4   > T�'  '   T�  %  $ H  _tonumber]  *   7  % >  	  T�4 8>  T�'  H tonumber_
split�   4  74 %   > =   T�4  7   T�4 7  T�4 7>G  SIGUSR1SIGUSR2signal	killgs-modbusgetkeycheckprocosk   	4   7%   >4  @ tonumber1SELECT portnr FROM modbus_devices WHERE id=?getonedb�   4    >  T�'  4  > 4  > T� T�4  >4  >G  reloadnumber	typetonumbergetdevportnr�    '   ' ' I �4   ) >K �4  7  % 4 > 4  7  % 4 > G  sh %s/start.shpluginpathsh %s/stop.shfmtexecquietosreload�    *  4  7% % >  T�2   3 4  >D�6   T�9 BN�H  
pairs port_1parity_12parity_22baudrate_2115200duplex_1Hbaudrate_1115200duplex_2Hport_2rtugs-modbusget_alluci�   ** :  '  ' ' I�4 %  > 4 6 >  T�' T�'  9 K�4   >D�4 7% %	 
  >BN�4 7	% >4
 >) H restartcommitrtugs-modbussetuci
pairstobooleanenabledgetkeyid�   .*  4   7% >  4   >T �7 T�% 7  T	�7	 7%
	 >8% 4	 
 >	$	:
T�4 7	> T	�'  % 4	 
 >	$	:
AN�H  	RTU portnrtonumbertostring	TCP 
group:
splitsettingstcp
protoipairs!SELECT * FROM modbus_devicesgetalldb�   4   7% 7 >7 T�7  T�4	 7 7
% > = ::T�4 % 7>:H portnrrtugetkey:
splitunpack	portipsettingstcp
protoid,SELECT * FROM modbus_devices WHERE id=?getrowdb�  +�* 4  7 >  T
�4  7 >% 4  7 >$'
  T�4  >
 4 7%	 %
 4 % 
 > = 4  >  T�) %
 F %
 4  7 > 3 :::
4 7 >  T�'  :4 7 >  T�'  :: 4 7 >	 4 	 > T�'  	 T�' 	 T�:	7 	  T>�4  7 >:4 7>   TA�4 >  T�) % F 7  T�4 7>:7  T�7  T�4 7>:7  T�4 7>:' : 4!  7"%#  >4!  7$> 4% >4&    >T�7 4'  > 4!  7(%#  3) :>  T�4*   >) H reloaddev  updategetdevportnrcreatemappingloadmappingfieldsgetlastautoidmodbus_devicesinsertdbactiveread_delaygetswapread_swap
limitchecklimitgetprofiledataprofileidnumber	typetimeoutsettings
slavepollintervaltonumberportnr  	nametobooleanenabledgetkeyrtugs-modbusgetucigetportnr	port:iptcp
prototostring �   * 7  4  > 4  7%  >4  7%  >4  7%  >4  >) H reload4DELETE FROM modbus_device_config WHERE device=?.DELETE FROM modbus_mapping WHERE device=?*DELETE FROM modbus_devices WHERE id=?
querydbgetdevportnrid�   * 4  3 7 :7 :> 4  > T�8  T�8T�) H T�% )  F  RTU (serial) is not enabled
table	typeportnrparamsid fnwriteaddressproxyrequest�   4    >  4   > T�4 7  >  T�  4 7   >  4 7   >  H  minmax
floor	mathnumber	typetonumber�  n*	 4
  7 '  '� >

 4
  7 '  (  >

 4
  7 ' '  >

 4
 7 >

  T
� T
.�7 4
	  >


 T
#� T
!� 7
% >
 
 T�' T
	� 7
% >
 
 T�' T
�'  T
�% T
�% 4
 7 >

 2
 ;
;
;
;
	
 T
�2
 ;
;
	
 T
� T
� T
�2
 ;
;
	
 T
�)
 % F
 4
 3 ::	:7 :>

 4
	  >

 T
�8

  T
�8T
�H T
�% )
  F
  RTU (serial) is not enabled
tableportnrparams  proxyrequest
errorreaddiscreteinputsreadcoils	swapreadinputregistervaluereadregistervalue3264	find-string	typedatatypereadinputregistersreadregistersfntostringlengthaddressslaveidgetnumparam���   =* 4  7 > T�'  4 3 2 7 ;7 ;::> 4  > T�) H 88  T�) 8F 4	 7
; 4  7%  > 4  >T�4
  7	>
) 9
AN�3 :7 :7 ::H 	list  
slaveipairsDSELECT slave FROM modbus_devices WHERE proto="rtu" AND portnr=?getalldb	null	json
table	typeparamsmaxmin fn	scanproxyrequestportnrtonumber�   T* 4  7 > T�'  4  7 > T�'  4  7 > T�'  '   T�'�  T�) H T�'   T�'�  T�) H T� T�) H   '	 I%�% 
 $6 % 
 $6   T�  T�3 :
4 %	  >:
:% 
 $6 :% 
 $6 : 4 7 ) >K�) H device-savehandlerspollintervalpollinterval_profileprofile_	name
protortugetkey
slave id 
name_	add_portnrmaxmintonumber�    4   % > 4  7% 4   >  T�'  @ tonumberUSELECT * FROM modbus_mapping WHERE device=? AND (internal IS NULL OR internal=0)getalldbidgetvar� 	  3* 4   7% 7 >   T(�4 7> T�'  3	 4   7% >:4   7%
  >::'   T�4   7%  >   T�7:7:T�% :H commenttagcache%SELECT * FROM objects WHERE id=?
value7SELECT DISTINCT tag FROM objecttags WHERE object=?  (SELECT DISTINCT tag FROM objecttagsgetall	tagsbus_addresstonumberid,SELECT * FROM modbus_mapping WHERE id=?getrowdb�  # e* 7  4  7% 	 > 4 77 >   TN�  TL�3	 4 7 >  T�%
 ::4 7 >  T�' T�'  : 7 T�7 T�4 7 >  T�'  :7   T�%
 :7:4 73 :7:7:7:7:7   T	�%
 :>   T�4  7% 	 3
 : 
>4 7 4 77	  > =  T�4! 7">) H devicereloaddev	tagsparsetagssettags  modbus_mappingupdatecomment
enumsvalue_customdatatypebus_datatypeaddress  create
unitstonumbervalue_deltainputregisterregister	typebus_writetoboolean  	nametostringbus_addressnormalizegrp,SELECT * FROM modbus_mapping WHERE id=?getrowdbid�   4   7% 7 >4   7% 7 >4  >) H reloaddev8UPDATE modbus_mapping SET bus_address="" WHERE id=?
queryid1SELECT device FROM modbus_mapping WHERE id=?getonedbQ    4     7  % @  0SELECT * FROM modbus_profiles ORDER BY namegetalldb�   4  7 >  T�4 7 >  T�4 7 % >4  7% 3	 7 :
>G  	name  modbus_profilesdeletedbwritefileexistsioprofilegetprofile�    #*  ) 5  4 % >  4   >   T�4 7 >  T�4 7%	 :4 7%   % $:
4 7 @ G  readfile.json"attachment; filename="content_dispositionapplication/jsoncontent_typeheaderngxexistsiogetprofileprofilegetvarcustom�   l*  4  >4 % > T�% 4 % > T�% 4 7 '��> T� 7' 	 	 	>  7' '	 >4 7'� '	� '
� > T� 7' > T�) H  7	%
 %	 > 4  >     T�) H 4 7 >  4  > T�)  F 4 7   >4  7% 3	 :	>4  7% 3	 :	7
 
 T�%
 :
	7
 
 T�%
 :
	>G  manufacturerdescription  insert	name  modbus_profilesdeletedbwritefileio
table	typepdecode	jsongetprofile_[^%w-]+	gsub	char
.jsonsubstringfile_filename	filegetvarupload
X   	4  4 % $>4 77 @ id	formsim10m/sim10m.luapluginpathdofile~   )  4  4 % $>4 77   > 4 7 >H reloaddevid	savesim10m/sim10m.luapluginpathdofile^   	4  4 % $>4 77 @ id	formsmartlink/smartlink.luapluginpathdofile�   )  4  4 % $>4 77   > 4 7 >H reloaddevid	savesmartlink/smartlink.luapluginpathdofile�  	  $)  5   4  7  3 4 4  7% > = :4  7	%
 4 4 % > =   T�'  4 4 % > =   T�'  >:@  	data
limit
startgetvar<SELECT * FROM modbus_errors ORDER BY id DESC LIMIT ?, ?getall
total'SELECT COUNT(*) FROM modbus_errorsgetonedbtonumber successencode	jsoncustomF    4     7  % > )  H  DELETE FROM modbus_errors
querydb�  h �4     7  > 5  %  5  %  5  1  5  1 	 5 
 1  5  1  5  1  5  1  5  1  5  1  5  1  5  1  5  1  5  1  5  1  5   1 ! 5 " 1 # 5 $ 2   5 % 4 % 1' :& 4 % 1) :( 4 % 1+ :* 4 % 1- :, 4 % 1/ :. 4 % 11 :0 4 % 13 :2 1 4 5 5 4 % 17 :6 4 % 19 :8 4 % 1; :: 4 % 1= :< 4 % 1? :> 4 % 1A :@ 4 % 1C :B 4 % 1E :D 4 % 1G :F 4 % 1I :H 4 % 1K :J 4 % 1M :L 4 % 1O :N 4 % 1Q :P 4 % 1S :R 4 % 1U :T 4 % 1W :V 4 X %Y >    T�% Z 5 Y 4 [ 7 \ >    T�2   5 \ 4 \ 4^ 4\ 7]>  T�'  :] 4 % 4Y 6     T#�4 % 4Y 6  4\ > 5_ 5 ` 4 a    T�4 ` 0  �H  4 b 4` >  c T �3 d 4` :e 4_ :_ 5 ` T �3 f 4` :\ 5 ` 4 [ 7 g 4` > 5 ` T �% Z 5 ` 4 ` 0  �H  encode successsuccess  boolean	typecustomresultstatustonumberid	data	jsonrequestgetvar errors-reset errors-list smartlink-save smartlink-form sim10m-save sim10m-form profile-save profile-download profile-delete profile-list mapping-delete mapping-save mapping-form mapping-list rtu-scan-save rtu-scan rtu-testgetnumparam  device-address device-delete device-save device-form device-list config-save config-formhandlersrestart reloaddev getdevportnr reload getportnr getkey createmapping loadmappingfields checkmapping getprofiledata getprofile tcprequest proxyrequest checklimit getswap pluginpath%/lib/genohm-scada/plugins/modbusprofilepath%/lib/genohm-scada/storage/modbusdbnew
dbenv 