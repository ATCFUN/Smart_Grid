LJL    4      T 4  % >   7  > 5   4   H  new
dbenvrequiredb-   	+    T) H T) H G  	¬ 
+4    >  TG  4 7>4 7%   4 	 > =+   T4  >T+  	 T4
 7% % > 7 %	 $	> 7>G  À
close

writea/tmp/cbushandler.log	openio	file
printstdouttostring%d.%03d: %sformatstringmicrotimeos
iflogÐ(   +   7     7  @  
getfd	socke   4  7  >4  > T 7>  T% H 	trimstring	typereadfileioì  ^4  7  ' >+  77 T4 '
 %   $>4    >G  +  77 T4 '
 %   $>4    >G  4	 7
%    >4 ' >  T&4  > T*  % $4  >D
 
 % 4  >% $B
N
ö % $T % 4  >% $4 '
  >+ 73 : ::>G  À Àdatatype	dataaddress sendercbaction
write	send],tostring=
pairs[
table	type
ifloglocalbus.send:[%08X] %d: formatstringsend_lb_emergencyEMERGENCY_APPsend_lb_error_modifiedlbSend id=logERROR_APPname2apprshiftbitÆ 	 (+  7 3 : :4 7:>4 6 
  T4 4 6 >	 T+ 7
 4 7  >74 6 :4 4 4 4  >9 9 9 G   ÀÀgetb4b5b6errobjsackederrobjsseverityerrobjsdata2datahexencode
table	typeerrobjserrtabledatatype	nonedt	dataaddress sendercbaction
write	sendn  
+  7 3 : :4 7:>G   Àdatatype	nonedt	dataaddress sendercbaction
write	send`   %  4  7   >H getonedb3SELECT datahex FROM objects WHERE address == ?#   4  6 H errobjschildren   'ÿÿ)     TH 4    >D4 	 >4	 
 >	
  T
 T
 	 BNò  F getDataHexgetErrSevLev
pairso      T) H 4    >D	4  >
  T T) H BNõ) H getErrIfAcked
pairsq      T) H 4    >D	4  >
  T T) H BNõ) H getErrIfCleared
pairs© §4   > T7
  T7  T4 '
 % >G  )  4   >   T4 '
 % >G  2  7:7 : 4  >:
:	:4  >:
::7  T'ÿ :7	  T'ÿ :	7  T'ÿ :7  T'ÿ :7
  T'ÿ :
7  T)7:7:7
  T7
  T7
  T4 77
' >:
T4 77
'þ >:
7
	  T7
  T4 77
' >:
T7
:
7  T)7:7:	7
  T7
  T7
  T4 77
' >:
T4 77
'ý >:
7
	  T7
  T4 77
' >:
T7
:
+     >4    >G  À update_virtual_error_objectmost_severe	bandborbitseverity
data2most_recentgetmrdatahexseverity_mrdata2_mrgetmsdatahex	ackdseverity_msdata2_msObject doest not existgetDataHexFromObj&Invalid error application messagelog
sysidnetwork
table	typeþË q+  >4  74  7  ' >'ÿ >4  74  7  ' >'ÿ > 7%  >)  4  >   T4 '
 %	 >T2  4 	 
 >   T+ 	 
 > 7%		 >)  4	 
 >		   T	4	 '

 % >	T	2	  4
   >
	
  	 T
+
  	 >

 7	%
   >	)
  4 	 >
 
  T4 '
 % >T4 	 >  T2  4 	  >   T+ 	  >G  ÀÀisnativeunitSELECT id FROM objects WHERE (id >> 24) & 0xff == 0xCE and (id >> 8) & 0xff=? and id & 0xff == 0xFB and  (id >> 16) & 0xff=?SELECT id FROM objects WHERE (id >> 24) & 0xff == 0xCE and (id >> 8) & 0xff == 0xFF and id & 0xff == 0xFF and  (id >> 16) & 0xff == 0xFF"create_newvalue_error_datahexObject doest not existloggetDataHexFromObjSELECT id FROM objects WHERE (id >> 24) & 0xff == 0xCE and (id >> 8) & 0xff == 0xFF and id & 0xff == 0xFF and  (id >> 16) & 0xff=?getonershift	bandbitc  +  > 7 %   >H À7SELECT isnative FROM cbus_error_app WHERE object=?getoneû  )  4    >   T4 '
 % >G  2  7:7:4  >:::4  >::
:	7  T'ÿ :7  T'ÿ :7	  T'ÿ :	7
  T'ÿ :
7  T'ÿ :7  T)7:	7:
7  T7  T7  T4 77' >:T4 77'þ >:7	  T7  T4 77' >:T7:7  T)7:7:7  T7  T7  T4 77' >:T4 77'ý >:7	  T7  T4 77' >:T7:H most_severe	bandborbitseverity
data2most_recentgetmrdatahexseverity_mrdata2_mrgetmsdatahex	ackdseverity_msdata2_ms	type
sysidObject doest not existloggetDataHexFromObjþ¡ 
 2  7: 7:'þ :+  73 : ::	>G   Àdatatype	dataaddress sendercbaction
write	sendprogressdh_statusstatusdh_mode	modeÁ 	. þ2  7 : 7:7:7:7:7:7:7:7:7	:	7
:
7:7:7:7:7:7:7:7:7:7:7+  77 TD7+  77 T7+  77 T84   >74 7> T.+  77:+  77:+  77:+  77:+  77:+  77:2  5 4 +  77: 4 7: 4 7:!+ 7"3# : $4 :%4& :&>7+  77' TC7+  77 T7+  77 T7+  7(74 7> T.+  77:+  77:+  77:+  77:+  77:+  77:2  5 4 +  77: 4 7: 4 7:!+ 7"3) : $4 :%4& :&>7+  77 T$7+  77 T+  77:+  77:2  5 4 +  77: 4 7: 4 7:!+ 7"3* : $4 :%4& :&>+  7+4,    >2  7: 7: 7:!+ 7"3- : $:%4& :&>G  À À sendercbaction
writedb_updatehookEmergency senderusaction
write senderusaction
writefunctionTestTimeoutFUNCTIONdatatype	dataaddress senderusaction
write	sendprogressstatusINTERNAL_STOP	val2NORMAL	FAIL	timeosgetDTTPENDINGPROGRESSDURATIONemergency_modelsl_higherlsl_lowerduration_test_failurecom_losstest_start_timetest_statusduration_max_delayfunction_max_delaybattery_failuretest_typelamp_statuscircuit_statusbattery_statusrated_durationduration_run_timedh_progressdh_modedh_statusfailure_statusemergency_status	modeæ    4   ' % > 4    7  % > 4    7  % >  T4  7% >G  ;    ALTER TABLE cbus_tag_map ADD COLUMN subgrp INTEGER#LuaSQL: no such column: subgrp.  select subgrp from cbus_tag_map limit 1åCREATE TABLE IF NOT EXISTS cbus_tag_map (
      'id INTEGER PRIMARY KEY',
      'tagid INTEGER',
      'tagtype TEXT',
      'tag TEXT',
      'net INTEGER',
      'app INTEGER',
      'grp INTEGER',
      'subgrp INTEGER'
)executedbUpdating cbus_tag_maplog×  "   T* F 2  )  '    7  % >T4 	 '
 >9 ANø T4 '
 %  $>* F 888F /wrong data hex length, should be 8 but is logtonumber(%x%x)gmatchÓ  !   T* F 2  )  '    7  % >T4 	 '
 >9 ANø T4 '
 %  $>* F 88F /wrong data hex length, should be 8 but is logtonumber(%x%x)gmatchÓ  !   T* F 2  )  '    7  % >T4 	 '
 >9 ANø T4 '
 %  $>* F 88F /wrong data hex length, should be 8 but is logtonumber(%x%x)gmatchÁ (* 7  7  TG  4 '
 4 7%  7 7	 7
	 7
 7 > =+  77 4 7 >   T4 '  % >G  4 7 ' >4 74 7 ' >'ÿ >+ 6
  T-4 + 6>D&	 T
$4
 7

4 7 (  >4 7	 ' > =
4 ' 4 7%   	 
 4  > = =+ 73 :
:4 7:>BNØ7  TG  4 ' >  T(4  > T* 4  7!%" >4  >D

4  7!
 %# 4$  >%% $>B
N
ô4  7!%& >T	4  7!%" 4$  >%& $>4'   >G  À ÀlbReceive]
,tostring=	   [
writeio
table
iflogcbdatatype	dataaddress senderfwaction
write	sendtab2str<lbEvent: forwarding event %d/%d to net %d ID 0x%08x: %slshiftbor
pairs	bandrshiftbitdata decode error	nonedtdecodedatahexdatalendstsrc	type#busevent:[%08X] %s %s %s %s %sformatstringlogfwsenderdstrawþÀ¿ 
  S4  '
 % >4   >  T4  '
 % >G  4  '
 %  % 	 $	>4 '< >  T
  T4  > T4	 >T-
 T4 >T( T4  >T" T4  >T T4  >T T4  >T T4 >T T4  >T T4  >G  mtc_send_enum_sizemra_send_cur_feedmra_resp_current_feedupdate_app_listreload_app_listsend_errorset_timersend_languagesend_labelupdate_network_routesreload_network_routesupdate_unit_paramsreload_unit_paramprinttab
iflog, action: custom mesage - sender: #Failed to parse custom messageparsecustomin customEventlogï   44   '  % > +      T +    7  % 4 > +    7  % 4 > +    7  % 4 > /  4  > 4 	 > 4 
 % > 4  > 4 
 % > 4   '
 % 4 % >% $> 4  > 4  > G  getUnitTypeupdate_cbus_tag_map KB
count(*** after collectgarbage: lua used *** after collectgarbagecollectgarbage*** before collectgarbagerecordMemupdate_app_listupdate_network_routescustomEventcustomgroupresponselbEventgroupwritesethandlercbushandler:initlog  E4   7  % >    T%    7 % > )  +  > 7% > 7%	 >  T 4
 '2 %	 
 $	
	> 4
 '	2 %
  % $

>4
 '	2 %
  % $

>  T) T) T4
 '  % >) 4
 '2 % 4	 
 >	$	>H Àprintallmemcheck pass=?error when query num of records in db table cbus_error_appmem free:MBmem needs:num of err objts is:log2SELECT COUNT(*) as count FROM cbus_error_app;getone÷CREATE TABLE IF NOT EXISTS cbus_error_app (
        object  INTEGER NOT NULL,
        most_recent BOOLEAN NOT NULL,
        network INTEGER,
        sysid   INTEGER,
        devid   INTEGER,
        channel INTEGER,
        isnative BOOLEAN
)executeMemFree:%s+(%d+)
match/proc/meminforeadfileio
     G  "   +     7   > G  	stepö 
 	 )     T	4 7%   	 > T  T4 7%  > 4 '   >4 %  >G  cbushandlerlogerrorlogC-Bus Tx Failure: %stx_failure0C-Bus Failure: Code: %d, Unit: %d, Type: %dformatstringfailure]   4  '
 %   % 	 %
  %  $>)  H , calGenericReadHandler logz   4  '
 %   % 	 %
  % 4 7 >$>) H strtohexlmcore, calGenericWriteHandler log   4  '2 %   %  %	 4
  >
$
>4     >G  !process_unit_param_cal_replyhex_dump: /CAL reply from log " 7 ' >	  TE 7 ' >	 T?4 +  >D8+  67  T3+  67 T.+  67 T)+  64 
 7	' ' >	 = :+  6%	 :+  6'  :
+  64 7>:4 ' %	 +
  6

7

% +  67% +  67% $		>BNÆTÎ 7 ' >	  TP 7 ' >	 TJ4 +  >DC+  67  T>+  67 T9+  67	 T4+  64 
 7	' ' >	 = :+  6+  67	 7%
 % >:+  6% :+  6'  :
+  64 7>:4 ' %	 +
  6

7

% +  67% +  67% $		>BN»Tx 7 ' >	 T 7 ' >	 T4  7' ' > = 4     ' +	 7		7		>T[ 7 ' >	 T 7 ' >	 T4 7 7 ' >>4     ' +	 7		7		>T< 7 ' >		 T 7 ' >	
 T 7 ' > 7 ' >4     '  +	 7		7	 	>T 7 ' >	 T 7 ' >	 T4  7' ' > = 4     '$ +	 7		7	!	>G  ÀVOLTAGETEMPERATUREexp	mathLIGHT_LEVELunitparamsendUPValuetonumberdiscovered2...type running%.	gsubversion_nunmberversion'
 as ', discovered...type log	timeoslast_messagelast_updatediscovery2sub	trim	typediscovery
state
uaddrnet
pairs	byte*²h2ÿ  I4  +  >DB+	  6		7			  T	=+	  6		7			 T	8+	  6		7			 T	3+	  6		7			 T	.+	 7		
  % + 77	%  %  $

>	+
  6

4 7>:

4
 ' %   %  % 	 %  %  $>
+
 7

3 :	3 :::4 7:>
G  BN¼G  À Àdatatype	nonedt	data
units
value  address sendercbaction
write	send, ):  (Sending value for log	timeoslast_messageNETWORK_CONTROL_APPname2app/encodegarunning
state
param
uaddrnet
pairsÎ  -%  4  >  T4 '  %  $>4 4  >5 5 4 7	 >4  T4 '  %
 4 $>   TG  +    T/  4 >4 >4 >G  
check_timeout_intervalprocess_unit_paramsupdate_unit_paramsFailed: removeosstatuserrdofile
pcallRunning logfile_exists/tmp/runme.lua±  1 4   7  > 4 +  >Dù)  4 7+  67 >+  67 Tì+  6: +  67 T4	 ' %
 +	  6		7		%
 +  67$>+  6% :% T´+  67 T% T­+  67 T¨+  67+ 77 Tj+  67 T+  67 T4	 ' % +	  6		7		%
 +  67$>% T+  67 T4 +  67>4 + > T% Tw4 +  67>4 + > Tm% Tk+  67 T+  67  T4 +  67>4 + > TW% TU+  67! T+  67" T4 +  67>4 + > TA% T?4	 ' %# +	  6		7		$	>T6+  67+ 77$ T%% T,+  67+ 77& T+  67' T4	 ' %( +	  6		7		%
 +  67$>%) T4	 ' %* +	  6		7		$	>T4	 ' %+ +	  6		7		$	>
  T4, 4- +  67+	  6		7		
 >  T+  6%	. :	4	 '	 %
/ +  67%0 +  67$

>BNG  ÀÀ/Unable to send CAL for 	deadsendCAL
pcall*Don't know how to get parameter type .Don't know how to get temperature from a */Getting temperature using get status from SENTEMPTEMPERATURE!VOLTAGE.Don't know how to get light level from a SENPIRIBSENPIRIASENPILLASENLLA*version_nunmbertonumber
SENLL!-Getting light level using identify from SENPIRICSENPILL	typeLIGHT_LEVELunitparam
paramrunning!discovery2!discovery
uaddr, netIdentifying log	init
stateupdate_intervallast_updateabs	math
pairs	timeos  Z4   7  > 4 7+   >'  TN,   4 >4  7% + 77	+ 77
>
  T>4  >D867	  T67 T04 67>  T'    T'4 6	7		>4	  7		>		 T	)	  4
 67>
	
 	 T
+
 7

3 67:4 7:>
4
 
 7

% 3 3 67:>
BNÆG  À À   datahexobjectsupdatedatatype	nonedtaddress sendercbaction
write	sendidgetDataHexFromObjupdatetimecbus_timertonumber
uaddrnet
pairsMEASUREMENT_APPNETWORK_CONTROL_APPname2appSELECT DISTINCT id, (id >> 24) & 0xff AS app, (id & 0x00ff0000) >> 16 AS net, updatetime, datatype, cbus_timer  FROM objects WHERE app == ? OR app == ?getalldbgetUnitAddressabs	math	timeos x  
 2   ,   +  >   7  % >4  >D+  76  T+  72	  9	4 7+  7	6	7	>BNîG  Ànetinsert
tableapp
pairstSELECT DISTINCT (id >> 24) & 0xff AS app, (id >> 16) & 0xff AS net FROM objects WHERE app != 250 and app != 255getall +  > 7 %   >5  7 % 4 >  T H T+ 7 H G  ÀÀdefaultDurationTestTimeoutKSELECT duration_delay_time FROM cbus_emergency_groups WHERE group_id=?grp_objDSELECT group_id FROM cbus_emergency_group_items WHERE item_id=?getonexÝ   04   4 7% > =  +  % >)    T% T!  T 7%	 >  T%
 T  T% T  T% T  T 7%	 >  T% T  T% T% H ÀSYS_NAC2LSS5500NACSYS_NAC5500NACSYS_AC2MX6	findLSS5500SHACSYS_SHAC5500SHAC/proc/device-tree/model/lib/genohm-scada/brandreadfileio	trim¡    4   7  % >   T   T' Ð4   >  'ô  T'  TH  T'ÐH G  tonumber(emergency_data.eel_cmd_timeintervalgetstoraged   %  4  7   >H getonedb7SELECT sysid FROM cbus_error_app WHERE object == ?µ  I4   > 4  7% +  77+  77+  77+  77	>2  , 4
 7>, 4  >D)67	  T67  T!4 67>4 67>  T',  T'  4 7+	 3
 67:
67:
67:
67:
:
:
>BNÕG  Àtimeout_periodupdate_interval
paramid 
state	initlast_update last_message insert
tablecbus_timerpollintervaltonumber
uaddrnet
pairs	timeosVOLTAGELIGHT_LEVELTEMPERATUREunitparamNETWORK_CONTROL_APPname2appSELECT (id & 0xff000000) >> 24 AS app,
			(id & 0x00ff0000) >> 16 AS net,
			(id & 0x0000ff00) >> 8 AS uaddr,
			(id & 0x000000ff) AS param,
			pollinterval,
            cbus_timer,
 			id FROM objects WHERE app == ? AND
			(param == ? OR param == ? OR param == ?)getalldbgetUnitAddress Þ  >4   > +   7  >    ' 4  7% >4  >D+  T4 '	  %
 7$

>T"%	 '	 7



 ' I	 4 7% 4 77
 > =$K	ô4	 '
 % 7%  %  $>	4	 
 77
>	 BNÓG  ÀnetworkRegister route  in slot Adding network 	byte
%02x formatstring
route	dest6Warning: too many networks in database, ignoring log
pairs)SELECT dest, route FROM cbus_routinggetalldbnetworkCountnetworkFlush    S
   T7  
  T7 
  T7 
  T7 
  T7 
  T	7 
  T7 
  T7   T4 '  %	 >G  4 '
 4
 7% 7 7 7 7 4	 7
 >	7
  7 7 >
 =4 4 7  7 7 7 7 7 7	 7
 >
5 5 4   T4 '  4
 7% 7 7 7 7 4	 7
 >	7
  7 7 4 > =G  lFailed to send label "%s" for language %s, variant %d, action selector %d, isunicode %s to %d/%d/%d: %sstatuserrsendLabel
pcalltostringaSending label "%s" for language %s, variant %d, action selector %s, isunicode %s to %d/%d/%dformatstring!Malformed send_label commandlog
labelisunicodeactionselvariant	lang
groupappnetË   07  
  T7 
  T7   T4 '  % >G  4 '
 % 7 % 7  % 7 $>4 4	 7  7 7 >5
 5 4   T4 '  % 7 % 7  % 7 %	 4

 $
>G  : Failed to send language statuserrsendLanguage
pcall/	 to Sending language $Malformed send_language commandlog	langappnet 
 
&
   T'     T'ÿ   T4  '  %   % $>4 %   $>2  '  4  7%   >4  >D7		9	 BNûH 	zone
pairsSELECT DISTINCT (id >> 24) & 0xff AS app, (id >> 16) & 0xff AS net, (id >> 8) & 0xff AS zone FROM objects WHERE app == 0xCD and net=?getalldberr network value 
error% in update_MRA_zone_list commandinvalid network logË 	  4  4 7 7 7 7 7 7 >5 5	 4	   T4
 '  % 4 $>G  &Failed to process timer command: logstatuserrresettablefinallevelramprate
level
timeriddoTimerCmd
pcallß   4  4 7 7 7 7 7 7 7	 7
	 7
 >5 5 4   T4 '  % 4 $>G   send_error command failed: logstatuserr
data2
data1sev	ackdmost_severemost_recent
devid
sysidnetsendError
pcall·   =7  
  T	7 
  T7 
  T7   T4 '  % >G  4 '
 % 7  % 7 % 7 %		 7
 %
 7  % % $>4 4 7  7 7 7 >5 5 4   T4 '  % 7 % 7 %	 7 %	
 7
  % % 4 $>G  MRA. err=#Failed to send cur feed: zone=statuserrMRASendCurFeed
pcallMRA/	 to  gain= feed= zone=mra send cur feed: net=(Malformed mra_send_cur_feed commandlog	gain	feed	zonenet   C7  
  T7 
  T	7 
  T7 
  T7   T4 '  % >G  4 '
 % 7 % 7 %	 7 %	
 7
 % 7  % % $>4 4 7  7 7 7 7 >5 5 4   T4 '  % 7 % 7 %	 7 %	
 7
 % 7  % % 4 $>G  MTC. err=0Failed to send enum size: media_link_group=statuserrMTCSendEnumSize
pcallMTC/	 to  size= start= enum_kind=*mtc send enum size: media_link_group=)Malformed mtc_send_enum_size commandlog	size
startenum_kindmedia_link_groupnet"    4   @  get_ip_netmask_bin     4   @  get_mac_addr_binë 	  %4   ' % > 4  1 >    T	4  '  %  $>)  0  H 4 1 >  T	4  '  %  $>)  0  H   $0  H Failed to get MAC:  #Failed to get IP and netmask:  
pcallIP/MAC requestedlog    G  .    4   > 8 8 8 F get_fw_version«  &4   7  % >    T%    7 % >  7 % >  7 % >  7 % >4	 7
 >+  7 T+  7>G  ÀdisablesniffermemMinLeftMB	ceil	mathShmem:%s+(%d+)Cached:%s+(%d+)Buffers:%s+(%d+)MemFree:%s+(%d+)
match/proc/meminforeadfileio|   4  4   >  T4 '  %  $>G  *Failed to call getProcessMemory. err=loggetProcessMemory
pcallù  { 4   % > 4  % >4  % >4  % >4  % >4  % >4  % >4  % >1	 * 2  %
 4	 7		%
 >	4
 	 >
	
 	  T
'	  )
 % 1 5 1 5 7 '  > 4  7>5 1 5 1 1 5 1 1 1 5 1 1  1! 1" 1# 5$ 1% 5& 1' 5( 1) 5* 1+ 5, 1- 5. 1/ 50 11 52 13 54 15 56 17 58 19 5: 1; 5< 1= 5> 1? 5@ 1A 5B 1C 5D 1E 5F 1G 5H 1I 5J 1K 5L 1M 5N 1O 5P 1Q 5R 1S 5T 1U 5V 1W 5X 1Y 5Z 1[ 5\ 1] 5^ 1_ 5` 1a 5b 1c 5d 1e 5f 1g 5h 1i 5j 1k 5l 1m 5n 1o 5p 1q 5r 1s 5t 1u 5v 1w 5x 1y 5z 0  G  recordMem memMonitor getAppVer cbusStatsWrite getIPHandler mtc_send_enum_size mra_send_cur_feed send_error set_timer update_MRA_zone_list send_language send_label update_network_routes update_unit_params getDevTypeErrObject getFifoInterval getUnitType getDTT update_app_list check_timeout_interval process_unit_params cbusTick sendUPValue !process_unit_param_cal_reply cbusCALReply calGenericWriteHandler calGenericReadHandler lbFailure 	step restart checkmem 	init customEvent lbEvent getmsdatahex getmrdatahex getb4b5b6 update_cbus_tag_map send_lb_emergency send_lb_emergency_status "create_newvalue_error_datahex isnativeunit  update_virtual_error_object send_lb_error_modified     getDataHexFromObj   lbSend  lbGetSocket dbnewlog 
iflog 	2000tonumberDEBUGMEgetenvosstdout ucihelperlmcore	json
dbenvgenohm-scadacbusliblocalbusrequire 