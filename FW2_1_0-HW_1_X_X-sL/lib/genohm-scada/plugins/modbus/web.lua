LJu   4    > T  T  T  T  T  TH  4   @ tobooleanwbbwwbnstring	typeÙ    5*  4  7% >  T%    7 >    7 % ' ) >  T' T	  7 % ' ) >  T'
   T4  7	%
 > 4  > T'    T) T) H ) H tonumber(SELECT COUNT(1) FROM modbus_devicesgetonedbwiser for knx5500shac	find
lower/lib/genohm-scada/brandreadfileioS   	4  % >7% '%   @ gs-modbus127.0.0.1requestrpcrequire 
  '* 4  7 > 7% > 4 73 8:8:7	 :	7
 :
> % 4 % 4 7	 >$4 7 > 4 7 @ pdecodereadprociostrtohexlmcore/tcp.lua pluginpath	lua map
slave	portip  encode	json:
splitsettingstostring   4    > T  7 % >  TG  4 7% 4   @ profilepath%s/%s.jsonformat^[-_%a%d]+$
matchstring	type¹   * 4    >   T4 7 >  TG  4 7 > 4 7 > 4  > TG  H 
table	typepdecode	jsonreadfileexistsiogetprofile    4  77 >4   >D4 6  T)  9 BNø)  : '   T T)  : G  idmappingfields
pairsbus_addressnormalizegrpÐ  	  4   4 % $> 2   5  4  4 77> T
4  7	%
 > =  4 ) 9ANôG   
splitunpackmodbus_mappingtablesplugindbipairsmappingfields/dbinit.luapluginpathdofileò   Q)  4   > TG  4 7>TC: 	 '
  
	 T		 %
 7$		:	4	 4
 %	 $

>	7
4	  
 >		 T	4	 6		 	 T
4	 6	4	  
 >		 T	7	 	 T	%	 :	4	 7		
 >	:	
T	)	  :	
4	  7
>		 T	4	 7		7
>	:	T	)	  :	4	 
 >	4	 
	 7		%  >	AN»G  modbus_mappinginsertdbcheckmappingvalue_nanencode	json?default
enumsstringvalue_custom/enums.luapluginpathdofile - 	namedevicemappingipairs
table	type   4  7% >  T4  7    T4 7  T4 7>G  SIGUSR1SIGUSR2signal	killgs-modbuscheckprocos~    4   ) > 4  7  % 4 > 4  7  % 4 > G  sh %s/start.shpluginpathsh %s/stop.shfmtexecquietosreloadä 0+   ,  +  '  T/ +   TG  /    T+   T/ T2  , T T+   T
+ 7  T+ 2  :2  , T	/ T+   T+  	 T, G  mappingprofile +   ,  /  +   TG    T+   T
+ 7   T4 7+ 7 + >/  G  insert
tablemappingx   )    7  >    T) H T  T) H 4   >   TH H  tonumber
false	true	trim  !+    TG  +   T+ 	  T
+   T+ + +  >9T+ 	 T	+   T+ + +  >9G  ÀÚ  !* 1	  1
 1 1 '  4 % > 73 :	:
	:
>  7  >   T) 4 7 > 0  E 0  G  encode	json
parseCharacterDataEndElementStartElement  newlxprequire    E    	4   7  % % >    T2   H  rtugs-modbusget_alluciÇ  
  )  :  4 7 >  T' T'  : 4   >D4 7% % 	 
 >BN÷4 7% >4	 >) H restartcommitrtugs-modbussetuci
pairstobooleanenabledidù  
  $*  4   7% >  4   >T7 T% 7  T7 7%		 >8% 4 	 >$:
T% :
ANèH  RTUtostring	TCP 
group:
splitsettingstcp
protoipairs!SELECT * FROM modbus_devicesgetalldb¾   4   7% 7 >7 T7  T	4	 7 7
% > = ::H :
splitunpack	portipsettingstcp
protoid,SELECT * FROM modbus_devices WHERE id=?getrowdb  '*	 4
  7 >

 T
% T
%  T
4
 7

% % % >

 4
  >
 
 T
)
 % F
 T
4
  7	 >
%
 4  7 >$
4
  7 >

 3
 :
:
4 7 >  T'  :
4 7 >  T'  :
:

 4
 7 >
	
 4
 	 >

 T
'
  
	 T
'
 	
 T
:	7
 	
  T
>4
  7 >
:
4
 7>

   T
=4
 >
 
 T
)
 % F
 7
 
 T4
 7>
:
7
 
 T
7
 
 T4
 7>
:
7
 
 T4
 7>
:
'
 :
4
 
 7

%   >
4
 
 7
!
>

 4
" >
4
#    >
T
	4
 
 7
$
%   3% 7 :>
  T
4
& >
)
 H
 reload  updatecreatemappingloadmappingfieldsgetlastautoidmodbus_devicesinsertdbactiveread_delaygetswapread_swap
limitchecklimitgetprofiledataprofileidnumber	typetimeoutsettings
slavepollintervaltonumber  	name	port:iptobooleanenabledgs-modbusgetucirtutcp
prototostring ö   7  4  7%  >4  7%  >4  7%  >4 >) H reload4DELETE FROM modbus_device_config WHERE device=?.DELETE FROM modbus_mapping WHERE device=?*DELETE FROM modbus_devices WHERE id=?
querydbid¸   * 4  3 7 :> 4  > T8  T8T) H T% )  F  RTU (serial) is not enabled
table	typeparamsid fnwriteaddressproxyrequest£   4    >  4   > T4 7  >  T  4 7   >  4 7   >  H  minmax
floor	mathnumber	typetonumberÆ  p*	 4
  7 '  'ÿ >
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
 T
27 4
	  >


 T
' T
% 7
% ' ) >
 
 T' T
 7
% ' ) >
 
 T' T
'  T
% T
% 4
 7 >

 2
 ;
;
;
;
	
 T
2
 ;
;
	
 T
 T
 T
2
 ;
;
	
 T
)
 % F
 4
 3 ::	:>

 4
	  >

 T
8

  T
8T
H T
% )
  F
  RTU (serial) is not enabled
tableparams  proxyrequest
errorreaddiscreteinputsreadcoils	swapreadinputregistervaluereadregistervalue3264	find-string	typedatatypereadinputregistersreadregistersfntostringlengthaddressslaveidgetnumparamþÿ  
  8*  4  3 2 4 7;4 7;:>  4   > T) H 8 8   T) 8 F 4 7	; 4
  7% > 4  >T4 7	>)	 9	ANù3 :4 7:4 7:H 	list  
slavetonumberipairs7SELECT slave FROM modbus_devices WHERE proto="rtu"getalldb	null	json
table	typeparamsmaxmin	data fn	scanproxyrequestÂ    O*  4  4 7>  T'   4  4 7> T'  '    T'÷   T) H T'   T'÷  T) H T  T) H    ' I$4	 %
  $

6
	4	 %
  $

6
	  T	  T	3	 :	:	4
 %	  $6

:

	4
 %  $6

:
		 4	 7		
 ) >	KÜ) H device-savehandlerspollintervalpollinterval_profileprofile_	name
slave 
protortuid 
name_	add_maxmin	datatonumber­    4   % > 4  7% 4   >  T'  @ tonumberUSELECT * FROM modbus_mapping WHERE device=? AND (internal IS NULL OR internal=0)getalldbidgetvar¼ 	  3* 4   7% 7 >   T(4 7> T'  3	 4   7% >:4   7%
  >::'   T4   7%  >   T7:7:T% :H commenttagcache%SELECT * FROM objects WHERE id=?
value7SELECT DISTINCT tag FROM objecttags WHERE object=?  (SELECT DISTINCT tag FROM objecttagsgetall	tagsbus_addresstonumberid,SELECT * FROM modbus_mapping WHERE id=?getrowdbµ  " b* 4   7% 7 > 4 77 >   TO  TM3	 4 7 >  T%
 ::4 7 >  T' T'  : 7 T7 T4 7 >  T'  :7   T%
 :7:4 73 :7:7:7:7:7   T%
 :>   T4   7%  3	 7
 :
	>4 7 4 77  > =4! >) H reload	tagsparsetagssettags  modbus_mappingupdatecomment
enumsvalue_customdatatypebus_datatypeaddress  create
unitstonumbervalue_deltainputregisterregister	typebus_writetoboolean  	nametostringbus_addressnormalizegrpid,SELECT * FROM modbus_mapping WHERE id=?getrowdbv   
4   7% 7 >4 >) H reloadid8UPDATE modbus_mapping SET bus_address="" WHERE id=?
querydbQ    4     7  % @  0SELECT * FROM modbus_profiles ORDER BY namegetalldbµ   4  7 >  T4 7 >  T4 7 % >4  7% 3	 7 :
>G  	name  modbus_profilesdeletedbwritefileexistsioprofilegetprofile¢    #*  ) 5  4 % >  4   >   T4 7 >  T4 7%	 :4 7%   % $:
4 7 @ G  readfile.json"attachment; filename="content_dispositionapplication/jsoncontent_typeheaderngxexistsiogetprofileprofilegetvarcustomæ   *  4  >4 % > T% 4 % > T% 4 7 'üÿ> T4  >    T) H  7' 	 	 	> T#4 7 'ûÿ>	 T 7' 	 		>  7' '	 >4 7
'ï '	» '
¿ > T 7' > T) H  7% %	 > 4  >     T) H 4 7 >  4  > T)  F 4 7   >4  7% 3	 :	>4  7% 3	 :	7
 
 T%
 :
	7
 
 T%
 :
	>G  manufacturerdescription  insert	name  modbus_profilesdeletedbwritefileio
table	typepdecode	jsongetprofile_[^%w-]+	gsub	char
.jsonconvertxml	.xmlsubstringfile_filename	filegetvarupload
X   	4  4 % $>4 77 @ id	formsim10m/sim10m.luapluginpathdofilew   )  4  4 % $>4 77   > 4 >H reloadid	savesim10m/sim10m.luapluginpathdofile^   	4  4 % $>4 77 @ id	formsmartlink/smartlink.luapluginpathdofile}   )  4  4 % $>4 77   > 4 >H reloadid	savesmartlink/smartlink.luapluginpathdofileã
  ^ «4     7  > 5  %  5  %  5  1  5  1 	 5 
 1  5  1  5  1  5  1  5  1  5  1  5  1  5  1  5  1  5  1  5  2   5  4  1! :  4  1# :" 4  1% :$ 4  1' :& 4  1) :( 4  1+ :* 4  1- :, 1 . 5 / 4  11 :0 4  13 :2 4  15 :4 4  17 :6 4  19 :8 4  1; :: 4  1= :< 4  1? :> 4  1A :@ 4  1C :B 4  1E :D 4  1G :F 4  1I :H 4  1K :J 4  1M :L 4 N %O >    T% P 5 O 4 Q 7 R >    T2   5 R 4 R 4T 4R 7S>  T'  :S 4  4O 6     T#4  4O 6  4R > 5U 5 V 4 W    T4 V 0  H  4 X 4V >  Y T 3 Z 4V :[ 4U :U 5 V T 3 \ 4V :R 5 V 4 Q 7 ] 4V > 5 V T % P 5 V 4 V 0  H  encode successsuccess  boolean	typecustomresultstatustonumberid	data	jsonrequestgetvar smartlink-save smartlink-form sim10m-save sim10m-form profile-save profile-download profile-delete profile-list mapping-delete mapping-save mapping-form mapping-list rtu-scan-save rtu-scan rtu-testgetnumparam  device-address device-delete device-save device-form device-list config-save config-formhandlersconvertxml restart reload createmapping loadmappingfields checkmapping getprofiledata getprofile tcprequest proxyrequest checklimit getswap pluginpath%/lib/genohm-scada/plugins/modbusprofilepath%/lib/genohm-scada/storage/modbusdbnew
dbenv 