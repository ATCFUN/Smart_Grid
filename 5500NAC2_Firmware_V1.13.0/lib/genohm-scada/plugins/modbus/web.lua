LJu   4    > T  T  T  T  T  TH  4   @ tobooleanwbbwwbnstring	type±    -*  4  7% >  T%    7 >    7 % >  T  7 % >  T'
 4  7	%
 > 4  > T'    T) T) H ) H tonumber(SELECT COUNT(1) FROM modbus_devicesgetonedb5500shac
wiser	find
lower/lib/genohm-scada/brandreadfileio  4  7 >4  > T'    T'  T'  4 % >7   @ requestrpclocalrequirenumber	typeportnrtonumber, 
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
splitunpackmodbus_mappingtablesplugindbipairsmappingfields/dbinit.luapluginpathdofileÏ  :4    > T4 6   T4 6  4   >  T'   'è  T4 7  >  4 7  T4 7  T4 7 T4 7	  T4 7
  T4 7 T
4 7  T4 7  T4 7 H  float32
int64float16
int32
int16	int8uint32uint16
uint8
floor	mathtonumberdtstring	typeÐ±   W)  4   > TG  4 7>TI: 	 '
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
4	 7
>	:	7	:	4	  7
>		 T	4	 7		7
>	:	T	)	  :	4	 
 >	4	 
	 7		%  >	ANµG  modbus_mappinginsertdbcheckmappingvalue_nan
unitsunitstxtdtsimplifybus_datatypeencode	json?default
enumsstringvalue_custom/enums.luapluginpathdofile - 	namedevicemappingipairs
table	typeJ   4   > T'  '   T  %  $ H  _tonumber]  *   7  % >  	  T4 8>  T'  H tonumber_
split   4  74 %   > =   T4  7   T4 7  T4 7>G  SIGUSR1SIGUSR2signal	killgs-modbusgetkeycheckprocosk   	4   7%   >4  @ tonumber1SELECT portnr FROM modbus_devices WHERE id=?getonedb   4    >  T'  4  > 4  > T T4  >4  >G  reloadnumber	typetonumbergetdevportnr°    '   ' ' I 4   ) >K û4  7  % 4 > 4  7  ' > 4  7  % 4 > G  sh %s/start.sh
sleepngxpluginpathsh %s/stop.shfmtexecquietosreloadÞ    *  4  7% % >  T2   3 4  >D6   T9 BNúH  
pairs port_1parity_12parity_22baudrate_2115200duplex_1Hbaudrate_1115200duplex_2Hport_2rtugs-modbusget_alluciö   ** :  '  ' ' I4 %  > 4 6 >  T' T'  9 Kñ4   >D4 7% %	 
  >BN÷4 7	% >4
 >) H restartcommitrtugs-modbussetuci
pairstobooleanenabledgetkeyid³   .*  4   7% >  4   >T 7 T% 7  T	7	 7%
	 >8% 4	 
 >	$	:
T4 7	> T	'  % 4	 
 >	$	:
ANÞH  	RTU portnrtonumbertostring	TCP 
group:
splitsettingstcp
protoipairs!SELECT * FROM modbus_devicesgetalldbÕ  ,* 4   7% 7 > 7 T7  T	4	 7 7
% > = ::4 7>:T4 % 7>:4 7> T'  	  T% :H stat_addresstonumberportnrrtugetkeytobooleanpersistent:
splitunpack	portipsettingstcp
protoid,SELECT * FROM modbus_devices WHERE id=?getrowdb 
  9Ê* 4  7 >  T4  7 >% 4  7 >$	4 7 > '  T4  > 4	 7
% % 4 %  > = 4  >  T) % F % 4  7 > 3 :::4 7 >  T'  :4 7 >  T'  ::	:4 7 >: 4 77 >   T4 73 : % $:4 7: >   T4! 7" >:4 7# > 4$  >% T'   T'  T:#7& 	  T>4  7' >:'4( 7'>   TA4) >  T) %* F 7+  T4, 7+>:+7#  T7#  T4 7#>:#7-  T4 7->:-' :.4/  70%1  >4/  72>
 43 >44 
   >T7
& 45 
 > 4/  76%1  37 :
&>  T48 
  >) H reloaddev  updategetdevportnrcreatemappingloadmappingfieldsgetlastautoidmodbus_devicesinsertdbactiveread_delaygetswapread_swap
limitchecklimitgetprofiledataprofileidnumber	typetimeoutencodegabuslibdatatype	booldt - Statusaddress  createstat_addressnormalizegrpstat_bus_writesettings
slavepollintervaltonumberportnr stat_address 	nameenabledgetkeyrtugs-modbusgetucigetportnrpersistenttoboolean	port:iptcp
prototostring    * 7  4  > 4  7%  >4  7%  >4  7%  >4  >) H reload4DELETE FROM modbus_device_config WHERE device=?.DELETE FROM modbus_mapping WHERE device=?*DELETE FROM modbus_devices WHERE id=?
querydbgetdevportnridÇ   * 4  3 7 :7 :> 4  > T8  T8T) H T% )  F  RTU (serial) is not enabled
table	typeportnrparamsid fnwriteaddressproxyrequest£   4    >  4   > T4 7  >  T  4 7   >  4 7   >  H  minmax
floor	mathnumber	typetonumber¢  * +  7    T% 6  T) % F 4 7 '  'ÿ > 4 7 '  (  > 4 7 ' '  >	 4 7 > 	 T
 T.7 4  > T# T! 7% >  T'	 T	 7% >  T'	 T'	 	 T% T% 4 7 > 2 ;;;;	 T2 ;;	 T T T2 ;;	 T) % F 4 3 ::::7   T) T) :7 :7 :> 4  > T8  T8
TH T%
 ) 
 F  ÀRead test failed
table	portiptcpportnrparams  proxyrequestreaddiscreteinputsreadcoils	swapreadinputregistervaluereadregistervalue3264	find-string	typedatatypereadinputregistersreadregistersfntostringlengthaddress
slavegetnumparam
error
protoþÿ¦   =* 4  7 > T'  4 3 2 7 ;7 ;::> 4  > T) H 88  T) 8F 4	 7
; 4  7%  > 4  >T4
  7	>
) 9
ANù3 :7 :7 ::H 	list  
slaveipairsDSELECT slave FROM modbus_devices WHERE proto="rtu" AND portnr=?getalldb	null	json
table	typeparamsmaxmin fn	scanproxyrequestportnrtonumberß   T* 4  7 > T'  4  7 > T'  4  7 > T'  '   T'÷  T) H T'   T'÷  T) H T T) H   '	 I%% 
 $6 % 
 $6   T  T3 :
4 %	  >:
:% 
 $6 :% 
 $6 : 4 7 ) >KÛ) H device-savehandlerspollintervalpollinterval_profileprofile_	name
protortugetkey
slave id 
name_	add_portnrmaxmintonumber­    4   % > 4  7% 4   >  T'  @ tonumberUSELECT * FROM modbus_mapping WHERE device=? AND (internal IS NULL OR internal=0)getalldbidgetvar°  "* 4   7% 7 >   T4 7> T'  3	 4   7% >::	  T%
 :7:4 7:H unitsnonecbuscore
unitsunitstxt  (SELECT DISTINCT tag FROM objecttagsgetall	tagsbus_addresstonumberid,SELECT * FROM modbus_mapping WHERE id=?getrowdb Ã  M* 7  4 77 >   T=4  > T84  >T
24  > T'  4  7	%
  >   T#4 73 4 7 >:7:7:7:7:>   T4 7 > 4  7% 3 :3 :> A
N
Ì  T4 7>) H devicereloaddevid  bus_address  modbus_mappingupdateencodega
units
enumsvalue_customdatatypebus_datatype	namerangeaddress  decodegabuslibcreate,SELECT * FROM modbus_mapping WHERE id=?getrowdbtonumberipairs
table	typeaddressnormalizegrpidsê  ) * 7  4  7% 	 > 4 77 >   Tk  Ti3	 4 7 >  T%
 ::4 7 >  T' T'  : 7 T7 T+4 7 >  T'  :7   T%
 :7:7  T%
 :4 7 >4 7 T4  > T	 '   T%  $:T%
 :4 73 :7:7:7:7:7    T	%
 : >   T4  7!%" 	 3
# : 
>4 7$ 4 7%7	& > =  T4' 7(>) H devicereloaddev	tagsparsetagssettags  modbus_mappingupdatecomment
enumsvalue_customdatatypebus_datatypeaddress  create stringappusergetappcbuscoreunitstxt
unitstonumbervalue_deltainputregisterregister	typebus_writetoboolean  	nametostringbus_addressnormalizegrp,SELECT * FROM modbus_mapping WHERE id=?getrowdbidÉ   4   7% 7 >4   7% 7 >4  >) H reloaddev8UPDATE modbus_mapping SET bus_address="" WHERE id=?
queryid1SELECT device FROM modbus_mapping WHERE id=?getonedbQ    4     7  % @  0SELECT * FROM modbus_profiles ORDER BY namegetalldbµ   4  7 >  T4 7 >  T4 7 % >4  7% 3	 7 :
>G  	name  modbus_profilesdeletedbwritefileexistsioprofilegetprofile¢    #*  ) 5  4 % >  4   >   T4 7 >  T4 7%	 :4 7%   % $:
4 7 @ G  readfile.json"attachment; filename="content_dispositionapplication/jsoncontent_typeheaderngxexistsiogetprofileprofilegetvarcustom&  +  +    9 +  H ÀC   4    > T  '   T) H G  string	typeP   4    >  4   > T) T) H number	typetonumbere  4    > T4    > T   T  T) T) H numberboolean	type ^   4    > TG  4  >T  T) H ANúG  ipairsstring	type#  4    +  @  Àcheckenum  1  0  H  j   3  4   > T4    >T) T) H checkenumboolean	type  nwbbwwbS  4    > T+    T+   T) T) H  ÀÀnumber	type  1  0  H  Æ  %4    > T4 6   T) H 4   >     TG  'è  T4 7  >  4 4 >D  T) H BNúG  
pairs
floor	mathtonumberdtstring	typeÐ  4    > T+  6   T) H 4 7  >  4    > T) T) H 
tablepdecode	jsonstring	typeÃ  '4    > TG      T
   T   T   TG  4   >T4   > T'    T(  TG  ANò) H numberipairs
table	typeþÿv  +  6   >  T4  + %   % $>G  " is missing or invalid: required field "errs  +  6 
  T  >  T4  + %   % $>G  " is invalid: optional field "erró Jö2  * 4  4 % $>4 1 5 1 5 1 5	 1
 5 1 5 1 5 1 5 1 5 1 5 1 5 1 5 1 5 1 5 4   > T4 %  0  @ %!   4 %" 4 >4 %# 4 >4 %$ 4 (  '	 > =4 %% 4 >4 %& 4 >4 %' 4 '  '	 > =3( 3) 7* 4 	 > T 	 T4 %	+ 0  @ 4, 	 >T4  > T%-  $ 4 7.>/ T %0 7.%1 $4 %. 4 >4 %2 4 >4 % 4  > =4 %3 4 '  ( > =4 %4 4 >4 %5 4 >4 %6 4 >4 %7 4 >4 %8 4 >79 T7: T4 %; 4 >TC4 %< 4 >4 %; 4	 >4 %= 4  > =4 %> 4	 >4 %? 4	 >4 %@ 4	 >4 %A 4	 >4 %B 4 >4 %C 4 >4 %D 4 >4 %E 4 '  ( > =4 %F 4 ' ( > =4 %& 4 >4 %G 4 '  ( > =4 %H 4 >T4 %I  $>ANj0  H invalid mapping entry bus_addressread_offsetread_countaddress_scale
unitsinternalwrite_bitmaskvalue_bitmaskvalue_multipliervalue_base value_deltadatatypevalue_nanvalue_defaultdiscreteinput	coilvalue_customvalue_convwrite_multiplewrite_onlywritableaddressbus_datatype) (string	namemapping entry ipairs mapping entries are missingmapping  
int16int16muint16uint16mfloat16	s10k
int32uint32
floatfloat32
int64uint64quad10kfloat64double  	coildiscreteinputregisterinputregisterread_delayread_swapproduct_codetimeoutdescriptionmanufacturerprofileinvalid profile
table	typeopt req isnantable isjsontable isdatatype isnumrange isswap isenum checkenum isbool isnumber isstring err 
enums/enums.luapluginpathdofileµæÌ³æý þÿ   p*  4  >4 % > T% 4 % > T%  7'ûÿ> 7> T) H  7' 	 	 	>  7' '	 >4 7	'ï '	» '
¿ > T 7' >  7
% %	 > 4  >     T) H 4 7 >  4  >  '   T)  F 4 7   >4  7% 3	 :	>4  7% 3	 :	7
 
 T%
 :
	7
 
 T%
 :
	>G  manufacturerdescription  insert	name  modbus_profilesdeletedbwritefileiocheckprofilepdecode	jsongetprofile_[^%w-]+	gsub	charstring
.json
lowersubfile_filename	filegetvarupload
X   	4  4 % $>4 77 @ id	formsim10m/sim10m.luapluginpathdofile~   )  4  4 % $>4 77   > 4 7 >H reloaddevid	savesim10m/sim10m.luapluginpathdofile^   	4  4 % $>4 77 @ id	formsmartlink/smartlink.luapluginpathdofile   )  4  4 % $>4 77   > 4 7 >H reloaddevid	savesmartlink/smartlink.luapluginpathdofileÉ  	  $)  5   4  7  3 4 4  7% > = :4  7	%
 4 4 % > =   T'  4 4 % > =   T'  >:@  	data
limit
startgetvar<SELECT * FROM modbus_errors ORDER BY id DESC LIMIT ?, ?getall
total'SELECT COUNT(*) FROM modbus_errorsgetonedbtonumber successencode	jsoncustomF    4     7  % > )  H  DELETE FROM modbus_errors
querydbº  o ¿4     7  > 5  %  5  %  5  1  5  1 	 5 
 1  5  1  5  1  5  1  5  1  5  1  5  1  5  1  5  1  5  1  5  1  5   1 ! 5 " 1 # 5 $ 1 % 5 & 2   5 ' 4 ' 1) :( 4 ' 1+ :* 4 ' 1- :, 4 ' 1/ :. 4 ' 11 :0 4 ' 13 :2 4 ' 15 :4 1 6 5 7 3 8 4' 1: :94' 1< :;4' 1> :=4' 1@ :?4' 1B :A4' 1D :C4' 1F :E4' 1H :G4' 1J :I4' 1L :K4' 1N :M1O 5P 4' 1R :Q4' 1T :S4' 1V :U4' 1X :W4' 1Z :Y4' 1\ :[4' 1^ :]4_ %` >  T%a 5` 4b 7c>  T2  5c 4c 4e 4c 7d>  T'  :d4' 4` 6  T#4' 4` 64c >5f 5g 4h   T4g 0  H 4i 4g >j T3k 4g :l4f :f5g T3m 4g :c5g 4b 7n4g >5g T%a 5g 4g 0  H encode successsuccess  boolean	typecustomresultstatustonumberid	data	jsonrequestgetvar errors-reset errors-list smartlink-save smartlink-form sim10m-save sim10m-form profile-savecheckprofile  profile-download profile-delete profile-list mapping-delete mapping-save mapping-multiple mapping-form mapping-list rtu-scan-save rtu-scan read-test 
rtu_1
rtu_2tcp rtu getnumparam  device-address device-delete device-save device-form device-list config-save config-formhandlersrestart reloaddev getdevportnr reload getportnr getkey createmapping dtsimplify loadmappingfields checkmapping getprofiledata getprofile tcprequest proxyrequest checklimit getswap pluginpath%/lib/genohm-scada/plugins/modbusprofilepath%/lib/genohm-scada/storage/modbusdbnew
dbenv 