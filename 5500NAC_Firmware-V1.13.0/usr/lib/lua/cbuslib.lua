LJâ 
  4  7> 4 7% 4 7 > =$ %   $4 7	%
 % > 7 %	 $	> 7>G  
close

writea/tmp/cbuslib.log	openio: 
floor	math.%03d formatstringmicrotimeosÐ¸ #  7  >2  '  'I4 7'	 		>'   T	  7 
  >+	  7		
 >	  9	Ké4 7 @ Àconcat
tableb64submin	mathlenÆ 	 <4    > T
  T4   > '   T% H T*4 7% 4 7 > =5 4 7% 4 74 > =5	 4 7% 4 74  4	 > =5
 4 % 4	 % 4
 $H G  :	secs	mins
hours
floor	math
%02.fformatstring00:00:00Durationtonumber 8xP    4      T 4  % > 4    7  > 5   4   H  new
dbenvrequiredb·  4  7  ' >+  77 T	+  7    >) F T	+  7 4 7  >) F G  À	nonedtdecodeknxdecodeTESTING2_APPname2apprshiftbitÀ  )     T  T  T  T
  T4 % >% Tw  T
  T  T  T
  T4 % >4 7%  > Tc 	 T
  T
  T  T
  T4 %
 >4 7%  	 > TN  T
  T
  T
  T
  T4 % >4 7%  	 
 > T8  T1+  77 T+  77 T
  T
  T
  T  T4 % >4 7%  	 
  > T
  T
  T  T4 % >4 7%  	 
 > T4 %   $>H Àunknown tag type 0net, app and grp must be set for level tags/net=%d AND app=%d AND grp=%d and subgrp=%d8net, app, grp and subgrp must be set for level tagsMEDIA_TRANSPORT_APPAUDIO_APPname2appL!net=%d AND app=%d AND grp=%dJnet app and grp must be set and subgrp must not be set for group tagsSnet=%d AND app=%dCnet and app must be set and grp must not be set for group tagsGnet=%dformatstringInet must be set and app and grp must not be set for application tagsA16net, app and grp must not be set for network tags
errorNû  a+  >+   	 
   >	 7 %
 >5	 5 4 
  T4 %	 4
 $	
	>	 7%
  % $

   >5	 4	   T		 7 %

 >5	 5 4 %	 4
 %  % 4	 $		>3 :: 4	 :	::::
 7	%  >	5
 5	 4	 
	  T	
 7	 %
 >	5
 5	 4	 %
 4 $

>	
 7	 % >	5
 5	 4	 
	  T	4	 %
 4 $

>	4	 H	 ÀÀres%Failed to addtag, commit error: END TRANSACTIONSQL error adding tag: cbus_tag_mapinsertsubgrpgrpappnettagtypetag  ", ID , name "
tagid&Duplicate tag exists with tag ID statusROLLBACK	dupe AND tag LIKE ?7SELECT id FROM cbus_tag_map WHERE tagtype = ? AND getone"Failed to start transaction: 
error
count	stat BEGIN EXCLUSIVE TRANSACTIONexecuteâ  Q+  >  T  T4  %	 >+ 	  
    >
 7	% >	5
 5	 
 7	% 3 :	: 
:::::>	5
 5	 4	 
	  T	4	  %
 4 $

>	4	 '
 
	 T	4	  %
 4   >% 4  >% 4  >% 4  >% 4  >% 4  >% 4  >$

>	4	 H	 ÀÀ, subgrp , grp , app , net , tagid , tag tostring+deleted more than one row for tagtype SQL error deleting tag: subgrpgrpappnet
tagidtagtypetag  cbus_tag_mapdelete
count	stat BEGIN EXCLUSIVE TRANSACTIONexecute.at least one of tag and tagid must be set
errorë  +  > 7 3 ::3 : >5 5 4 
  T4 %	 4
   >% 4
 	 >%	 
 $
>4 H À newtagid , newtag tostring%SQL error in renamebytag for id 
error
count	statid  
tagidtag  updateÇ  A+  >+	 
      >	 7
 % 3 ::3 : ::::	:
>
5 5
 4
 

  T
#4
 % 4   >% 4  >% 4  >% 4  >% 4  >% 4  >% 4  >% 4  >$>
4
 H
 ÀÀ, newtagid , newtag , subgrp , grp , app , net , tag tostring'SQL error in renamebyname tagtype 
error
count	statsubgrpgrpappnettagtype  
tagidtag  cbus_tag_mapupdate  04  '    T'ÿ   T) T) >'   T'   T+  77  T+  77  T+  77  T
+  77  T+  77  T) H T) H G  ÀENABLE_APPTRIGGER_APPHEATING_APPLIGHTING_APP_HIGHLIGHTING_APP_LOWname2appassert 3+  7 7   T+  7 7T)  T)  T%4   >	  T+  7 7T4   >+  7 7 T+  7 7T4   >+  7 7 T+  7 7T4   > H ÀMAXMINtonumberskip_updateDEFAULTemergency_lsl ì  C4   >D<+
  7

6

*   T%   7    +  77
 > T%   7    +  77
  >   T2  5 4 :4 +  77:	4 % :
4 :
4 :4 :	4 :  7 % 4 >5 BNÂG  Àrescbus_tag_mapinsert
tagidtagsubgrpgrpLtagtypeappnet	data}SELECT id FROM cbus_tag_map WHERE tagid = ? AND tagtype = "L" AND net = ? AND app = ? AND grp = ? AND subgrp = ? LIMIT 1SECURITY_APPname2appgetonenSELECT id FROM cbus_tag_map WHERE tagid = ? AND tagtype = "L" AND net = ? AND app = ? AND grp = ? LIMIT 1securityobjs
pairsq   4  7% % > 7  % $> 7>G  
close

writea/tmp/cbuslibdebug.log	openioå   * 4   7%   >8
  T	874   7%  > H ?SELECT user_id FROM cbus_emergency_groups WHERE group_id=?getonegroup_id=SELECT * FROM cbus_emergency_group_items WHERE item_id=?getalldb  +  >)   7 %   >   TH T+ 77H G  ÀÀDEFAULTemergency_lsl1SELECT cbus_datahex2 FROM objects WHERE id=?getoneâ " î4  74  7 ' >'ÿ >  7 %  +  77%	 >  T2  +  77:% :	% :
:  7 %  >5   7 %  +  77%	 >
  T\4  74  7 ' >'ÿ >%   7  	 
 +  77>  T2  :+  77:% :	4 +  7>D	
 T	:	
:
  7 %  >5 TB	N	ó+  77 T+   % +	  7		
 >T+  77 T+   % +	  7		
 >T+  77 T+   % +	  7		
 4 7 > =T ) H 2  :+  77:% :	4 +  7>D:
:
  7	 %  >	5	 BNö% :	+  77:4 +  7>D:
:
  7	 %  >	5	 BNö+  77:4 +  7>D:
:
  7	 %  >	5	 BNö+  77:4 7 >: 4 7! >7 T7 
  T4 +  7>D:
:
  7	 %  >	5	 BNö) H ÀÀgetgrpsubgrpgrpLgetsubgrpcbuscoresecurityDefaultZoneStatesZone state$securityDefaultPasswordStatusesPassword statussecurityDefaultArmedStatesArmed statesecurityobjs
pairsappbSELECT id FROM cbus_tag_map WHERE tagid = ? AND tagtype = "G" AND net = ? AND app = ? LIMIT 1GRSELECT id FROM cbus_tag_map WHERE net = ? AND app = ? AND tagtype = ? LIMIT 1rescbus_tag_mapinsertnetSecuritytagtagtype
tagidASECURITY_APPname2appTSELECT id FROM cbus_tag_map WHERE net = ? AND tagid = ? AND tagtype = ? LIMIT 1getonershift	bandbitÁ !Ñ4  7 >* 4  7 >4  7	 >)	  	  T
4
 7>

 T
7

 T
)	 T
)	 4
 7>

 4
 7>
	
 T
  7
 %	 4 7
>4 7> =


  T
 T	) )  % +  76
% $F '
ÿ 
 T
@'
  
 T
=
	 T
;  T
)
 )  % F
  T
  T
 T
 T
 T
 T
	 T

 T
 T
 T
 T
 T

 T
 T
 T
)
 )  % F
 
  T

  T
  T
T
M
  T

  T

  T
T
F)
 )  % F
 T
A	  T
&	 T
$
  T
  T
)
 )  % F
   T
)
 )  %  %  $F
  T
 T
 T
	 T
)
 )  %  %  $F
 )  T
	 T
'
ÿ 
 T
	)  )    T
)
 )  % F
 T
	 T
	 T
)  )  T
)
 )  % F
   7
 %  >
  7
 % 3 ::::::	 >
) H Àisnativechannel
devid
sysidnetworkobject  cbus_error_appinsert1DELETE from cbus_error_app WHERE object == ?
query Invalid error device object4Invalid error object definition: network is nil and devid:\Invalid error object creation: no physical error object with channel exists in network:=Invalid error object definition: network or devid is nil=Invalid configuration: sysid is must be from valid range2Invalid error object definition: sysid is nil*. Please select the same Device type.devicetype2name7This Device Id is already assigned to Device type grpnetASELECT sysid FROM cbus_error_app WHERE network=? AND devid=?getonecbe_errobjtypecbe_devicetypeis_nativetonumbergetsubgrpgetgrpgetnetcbuscoreö 	 °¸ÐØèðþ¶   %  	  7 
      >  T2  ::%	 :	::::	
  7	
 %  >	5	 G  rescbus_tag_mapinsert
tagidtagsubgrpgrpLtagtypeappnetgetone}SELECT id FROM cbus_tag_map WHERE tagid = ? AND tagtype = "L" AND net = ? AND app = ? AND grp = ? AND subgrp = ? LIMIT 1½   4  74  7 ' >'ÿ >+  77 T+     @ T
+  77 T+     @ ) H ÀÀÀERROR_APPSECURITY_APPname2apprshift	bandbit ú   4  7>+  77 Tï4  7>	  T-3 3 3  7%		 '
ÿ %
 >	 7%
 'Î % 'ÿ >
 7	% 'ÿ % 'ÿ 'Î >	  T
 7
%  >
  T
 7
%  >
	  T
 7
%  >
4  7>	 T+3 4  7>:3 4  7>: 7% '	Î %
 4  7> = 7%	 '
ÿ % 4  7>'Î >  T	 7%
  >  T	 7%
  >4  7>	 T4  7>	 T3 4  7>:4  7>: 7% 'þ %	 4
  7>
'Î 4  7> =  T 7% 	 >4  7>	  T3 4  7>:4  7>: 7% 'û %	 4
  7>
'Î 4  7> =  T 7% 	 >4  7>	 T3 4  7>:4  7>: 7% 'ü %	 4
  7>
'Î 4  7> =  T 7% 	 >4  7>	 T3 4  7>:4  7>: 7% 'ý %	 4
  7>
'Î 4  7> =  T 7% 	 >G  À 
tagidýappÎtagLine B ErrortagtypeS 
tagidüappÎtagLine A ErrortagtypeS 
tagidûappÎtagChannel Aggregate ErrortagtypeSSZSELECT id FROM cbus_tag_map WHERE tagid=? AND tagtype=? AND net=? AND app=? AND grp=?grp 
tagidþappÎtagUnit ErrortagtypeScbe_errtype 
tagidÿappÎtagNetwork ErrortagtypeGnet tag
Error
tagidÎtagtypeAcbus_tag_mapinsertGPSELECT id FROM cbus_tag_map WHERE tagid=? AND tagtype=? AND net=? AND app=?AFSELECT id FROM cbus_tag_map WHERE tagid=? AND tagtype=? AND net=?N<SELECT id FROM cbus_tag_map WHERE tagid=? AND tagtype=?getone 
tagidÿappÎtagProject ErrortagtypeGnetÿ tag
Error
tagidÎtagtypeAnetÿ tagNetwork 255
tagidÿtagtypeNcbe_errobjtypeERROR_APPname2appapptonumber ¸ :Ö7 +  77 T) H 7 +  77 T) H 7 +  77 T) H 7+  77 T) H 2  :7+  77	 T%
 :7+  77 T% :7:4 7>:7:7:% :7	  T% :T% :7	  T% :T% :7	  T% :T% :7	  T% :T% :7	  T% :T% :7	  T% :T% :7	  T% :T% :7 	  T% :!T% :!* 7"	 T7#	 T%$ T7"7#+  > 4&  >:%4&  >:'7	 T%$ :%$ :%$ :%$ :%$ :%$ :%$ :%%$ :'7(+  77) T%* :(T%+ :(%$ :,+  >:-4. 7/%0 >  T+  71%2  %	3 $		  74 %
5  %6 $

>	  77 %
8  >59 ) H À
À	Àrescbus_reportsinsert')kDELETE FROM cbus_reports WHERE datetime(datetime_finish, 'unixepoch', 'localtime') < datetime('now', 'execute month-defaultHistoryPerioddata.no_of_monthsgetstorageuser_idcomment	Pass	Fail	FAILtest_statusmax_light_source_lifetostringlight_source_lifelsl_higherlsl_lowertest_timeoutduration_test_failurecom_lossduration_max_delayfunction_max_delaybattery_failureinverter_statuscircuit_statusbattery_statusYeslamp_statusNocom_failurerated_durationduration_run_timerunning_time	timeosdatetime_finishtest_start_timedatetime_startDurationDURATIONFunctionFUNCTIONobj_idINHIBITemergency_modetest_typeSTOPPEDPENDINGPROGRESSemergency_statusdh_status þã 	 p4  74  7 ' >'ÿ >+  77 TA+  77 T<+  77 T7+  77 T2+  77 T-+  77	 T(+  77
 T#+  77 T+  77 T+  77 T+  77 T+  77 T
+  77 T+  77 T  7 % 3 3 :>T+  77 T
+  77 T+  77 T  7 % 3 3 :>T ) H À   datahex01Normal operationArm readyAll zones OKid   datahex00objectsupdateZone stateZone isolatedTamper
PanicOther alarmMains failureLow batteryLine cut alarmGas alarmFire alarmExit delayEntry delayArm failedAlarm soundingsecurityobjsrshift	bandbitÖ ' 4  7 'ÿ >4  74  7 ' >'ÿ >4  74  7 ' >'ÿ >%   7 	 +
  7

7

 >  T2  :%	 :% :
+  77:	  7 %
  >5 %   7 	 
  +  77>  T2  :+  77:% :% 	 $	:
:	  7 %
  >5 * 4	 +
  7

>	D%   7    +  77 >  T2  :+  77:% :::
:  7 %  >5 BNà4	 
   +  77 ' ' % >	4	 
   +  77 ' ' % >	4	 
   +  77 ' ' % >	4	 
   +  77 ' '  % >	4	 
   +  77 ' ' % >	4	 
   +  77 ' ' % >	4	 
   +  77 ' ' % >	4	 
   +  77 ' 'ÿ % >	4	 
   +  77 ' '  %  >	4	 
   +  77 ' ' %! >	4	 
   +  77 ' ' %" >	4	 
   +  77 ' ' %# >	4	 
   +  77 ' ' %$ >	4	 
   +  77 ' ' %% >	4	 
   +  77 ' ' %& >	)	 H	 ÀSource 7Source 6Source 5Source 4Source 3Source 2Source 15Turn amplifier on, Volume normal and speakers on9Turn amplifier on, Volume at pre-set and speakers on:Turn amplifier on, Volume at pre-set and speakers off6Turn amplifier on, Volume normal and speakers offTurn amplifier offMid PointaddlevelnodegrpSnSELECT id FROM cbus_tag_map WHERE tagid = ? AND tagtype = "S" AND net = ? AND app = ? AND grp = ? LIMIT 1MRAFunctions
pairs
Zone GappbSELECT id FROM cbus_tag_map WHERE tagid = ? AND tagtype = "G" AND net = ? AND app = ? LIMIT 1rescbus_tag_mapinsert
tagidMRAtagAtagtypenetAUDIO_APPname2appgetoneVSELECT id FROM cbus_tag_map WHERE tagid = ? AND tagtype = "A" AND net = ? LIMIT 1rshift	bandbit  , 4  74  7 ' >'ÿ >4  74  7 ' >'ÿ >%   7  +	  7		7		
 >  T2  :%	 :% :
+  77:  7 %	 
 >5 %   7  	 
 +  77>  T2  :+  77:% :%  $:
:  7 %	 
 >5 * 4 +	  7		>D%   7    +  77 >  T2  :+  77:% :::
:  7 %  >5 BNà4 	  
 +  77 '  '  % >4 	  
 +  77 '  ' % >4 	  
 +  77 ' '  % >4 	  
 +  77 ' 'ÿ % >4 	  
 +  77 ' '  % >4 	  
 +  77 ' 'ÿ % >4 	  
 +  77 ' '  %  >4 	  
 +  77 ' ' %! >4 	  
 +  77 ' 'ÿ %" >4 	  
 +  77 ' '  %# >4 	  
 +  77 ' ' %$ >4 	  
 +  77 ' ' %% >4 	  
 +  77 ' ' %& >4 	  
 +  77 ' ' %' >4 	  
 +  77 ' '
 %( >4 	  
 +  77 ' ' %) >4 	  
 +  77 ' '  %# >4 	  
 +  77 ' ' %$ >4 	  
 +  77 ' ' %% >4 	  
 +  77 ' ' %& >4 	  
 +  77 ' ' %' >4 	  
 +  77 ' '
 %( >4 	  
 +  77 ' ' %) >4 	  
 +  77 '	 '  %* >4 	  
 +  77 '	 'ÿ %+ >) H ÀSource power onSource power off64x speed32x speed16x speed8x speed4x speed2x speedNormal speedRepeat allRepeat currentRepeat offShuffle onShuffle offResume
Pause	Play	StopaddlevelnodegrpSnSELECT id FROM cbus_tag_map WHERE tagid = ? AND tagtype = "S" AND net = ? AND app = ? AND grp = ? LIMIT 1MTCFunctions
pairsMedia Link Group GappbSELECT id FROM cbus_tag_map WHERE tagid = ? AND tagtype = "G" AND net = ? AND app = ? LIMIT 1rescbus_tag_mapinsert
tagidMTCtagAtagtypenetMEDIA_TRANSPORT_APPname2appgetoneVSELECT id FROM cbus_tag_map WHERE tagid = ? AND tagtype = "A" AND net = ? LIMIT 1rshift	bandbitß 	 44  % >4  % % >4 74 7 ' >'ÿ >+  77	 T+     @ T+  77
 T+     @ T+  77 T+     @ T ) H ÀÀÀÀMEDIA_TRANSPORT_APPAUDIO_APPSECURITY_APPname2apprshift	bandbitreload_app_listafternewobjhooksendcustomlocalbusrequirek    
4   % > 4   % % >) H reload_app_listafterdelobjhooksendcustomlocalbusrequire    ) H  	/  +  7 4  > = 4 7 > +  77 T7  T7 T7 T7 T7 T	7 T7 T7	 T'  :' :H H Àstatusprogress	modeEMERGENCY_APPname2appgetappcbuscoretostringencodega 
    G    +  7 7  T+  7 7  T
4 74 7 ' > @ TH G  ÀlshiftborbitERROR_APPTESTING2_APPname2appÅ 	" 4  74  7  ' >'ÿ >+  77 T+  77 T4 7@ To+  77 T)  H Tg+  77	 T)  H T_+  77
 T+  77 T
4 7>% 4 7>$H TK+  77 T'7% 7% $7
  T 7$7
  T 7% $ +  776$7
  T % 7$7  T % $H T+  77 TT+  7 >  T77 T4 7@ T7% 7% 7 %! $H T)  H G  Às)ramprate(	 -> target
levelislightinglikeSECURITY_APP (ack)	ackd
errorseverityerror_severitychannelnetwork/
devid@sysidstrERROR_APPunitstxt MEASUREMENT_APPNETWORK_CONTROL_APPMEDIA_TRANSPORT_APPAUDIO_APP
valuetostringTRIGGER_APPENABLE_APPname2apprshift	bandbit[   4  7  % >
  T4  7 >) H T) H G  
closer	openioÑ    4   7  % % % % > 4   7  % > 4   7  % > 4  7 	 ) > 4 
 '
 % > G  set uci autoadd to 0logreloadgroupmonitorlmscriptingunloadcommit0autoadd	coregenohm-scadasetuci   X' î * +  >   TP 7 %   >   TH2  4  >TA4	 4
 7

7' ' >
' >	:	4	 4
 7

7' ' >
' >	:	4	 4
 7

7' ' >
' >	:		7	
7
+ 77
 T
7
+ 77
 T
7
+ 77
 T
7
+ 77
 T

4
 % >
7

3 7:::	
>
AN½G  ÀÀ	dataaddressid senderusaction
write	sendlocalbusrequirePENDINGPROGRESSemergency_statusFUNCTIONDURATIONemergency_modedatatypeprogressstatusdatahexsubstringtonumber	modeipairsRSELECT * FROM objects WHERE (id >> 24) & 0xff = ? AND (id >> 8) & 0x80 = 0x00getall )	à   7 4 7 >+  >	  TT4 74 7	 '
 >'	ÿ >4 7	 '
 >	 T	D7		 T	A
 7	%	  >	8
	

  T
98
	7


2  4 4 7 ' ' >' >:4 4 7 ' ' >' >:4 4 7 ' ' >' >:7	 T74 % >73 8	7
:::>) ) 7 Tï2  7:7:7: 7% 8	7
>4  >T?7 T< 7% 7>4 4 7 ' ' >' >	 T,4 4 7 ' ' >' >:4 4 7 ' ' >' >:4 4 7 ' ' >' >:74 % >73 8	7
:::>) TAN¿ TB4  >T< 7% 7>4 4 7 ' ' >' >	 T,4 4 7 ' ' >' >:4 4 7 ' ' >' >:4 4 7 ' ' >' >:74 % >73 8	7
:::>) TANÂ TC4  >T= 7% 7>4 4 7 ' ' >' >	 T-4 4 7 ' ' >' >:4 4 7 ' ' >' >:4 4 7 ' ' >' >:74 % >73 8	7
:::>) ) TANÁ T;4  >T5 7% 7>4 4 7 ' ' >' >	 T%4 4 7 ' ' >' >:' :4 4 7 ' ' >' >:74 % >73  8	7
:::>) ) TANÉ TC4  >T= 7% 7>4 4 7 ' ' >' >	 T-4 4 7 ' ' >' >:4 4 7 ' ' >' >:4 4 7 ' ' >' >:74 % >73! 8	7
:::>) ) TANÁ TB4  >T< 7% 7>4 4 7 ' ' >' >	 T,4 4 7 ' ' >' >:4 4 7 ' ' >' >:4 4 7 ' ' >' >:74 % >73" 8	7
:::>) TANÂ TB4  >T< 7% 7>4 4 7 ' ' >' >	 T,4 4 7 ' ' >' >:4 4 7 ' ' >' >:4 4 7 ' ' >' >:74 % >73# 8	7
:::>) TANÂ T 7$%% 4&  8	7
>7 T7 T7	 T  T
+ 7'8	7
>+ 7(8	7
>G  ÀÀsend_group_reportcreate_group_report	time:UPDATE objects SET updatetime=?, datahex=? WHERE id=?
query sendercbaction
write sendercbaction
write sendercbaction
write sendercbaction
write sendercbaction
write sendercbaction
write sendercbaction
write+SELECT datahex FROM objects WHERE id=?getoneitem_idipairs?SELECT * FROM cbus_emergency_group_items WHERE group_id=? 	dataaddress sendercbaction
write	sendlocalbusrequiredatatype	modestatussubstringtonumberprogressgroup_id>SELECT * FROM cbus_emergency_group_items WHERE item_id=? getallcbsenderrshift	bandbitgetappcbuscoredatahexÜ      4  7 >+  77 T7 T) H T) H G  ÀussenderERROR_APPname2appgetappcbuscoreõ  	 *%  
   T&  7 % % > T
  T 7% % > T%   %  % $4  >4   >'m T%   %  % $H #<span style="color: #ED8023;">tonumber</span>/<span>%s+	gsubNAS  %  4   >
  T %  % $H </span><span>tonumberNAx¦F Bm2  +  >   7 %  4 7> =4 7 >4 7 >4 7 >4 74		 
 >		
 7	
%    >		  T
%	 4
 7

% 	 >
 7

% 4 7> >
 7
% 4 7> > 7
% 4 7> >% 4 7% 7>% $:4 7% 7> 7% 4 7> >87%  7 %  >
  T 7
%  >
  T%   %! $	  T%" 	 T
  T7#
  T%  7#%! $T	
  T7#
  T%  7#%! $% 4 7$%% > 
  T T%& 4 7%'  >4 7%( 4 7%) 7> = 7
%* 4 7> >%+ '   T%, 4- 7.%/ >4- 70%1 7$%2 >%3 %4 4- 70 %5 >
  T 76%7 >4- 78 >)  + 79 > %:  %; $%< 4 7%= 7>%>  %? 	 %@ 
 % A ! %"B # %$C % %&D $&%E %F % 4G  >D4! 7!!7"H >!4" 7""7#H >"4# 7##7$H >#4$ 7$I$7%H >$4% 7%J%7&H >%4&	 '# >&( 7'
%)K *! +" ,% -$ .& >''  T(%' 7(L 7)M +* 7*N*+( ,) >*++ 7+O+7,P >+, %-Q .' %/R $/,, %-S 7.T %/U 40 700%1= 72V >0%1U 42 722%3= 74 >2%3W +4 45 75X576 77V >576T 77Y >4%5Z 6+ %7U 78[ %9W 7:\ %;W 7<] %=Z 7>^ %?Z @* %AR $A,7,_ ,` T,, %-a 7._ %/R $/,T,7,b ,c T,, %-d $-,T,7,e ,c T,7,T ,f T,, %-g $-,T,	, %-h $-,T,, %-i 7._ %/R $/,, %-j $-,BN~%k  7l   ! " # $ % $%> 78>G  ÀÀÀÀ
writeý<tr height='50px'><td colspan='6' width ='35%'><strong style='margin-left: 8px;'>Comment</strong></td><td colspan='7' width='36%'></td></tr><tr height='100px'><td colspan='6' width ='35%'><strong style='margin-left: 8px;'>Maintenance Inspector (Full Name and Signature)</strong></td><td colspan='7' width='36%'></td></tr></tbody>
      </table>
    </div>
   </body>
  </html>C<td width='9%' style='text-align: center;'></td>
        </tr>A<td style='text-align: center; background: red;' width='5%'>[<td style='text-align: center; background: red;' width='5%'>Function Test Timeout</td>[<td style='text-align: center; background: red;' width='5%'>Duration Test Timeout</td>Durationtest_timeoutX<td style='text-align: center; background: red;' width='5%'>Communication Loss</td>Yescom_failureC<td style='text-align: center; background: green;' width='5%'>	Passtest_statusbattery_statusinverter_statusbattery_failurelamp_status></td>
        <td width='7%' style='text-align: center;'>running_timedifftime></td>
        <td width='6%' style='text-align: center;'>datetime_start></td>
        <td width='8%' style='text-align: center;'>test_type0<td width='5%' style='text-align: center;'>
</td><tr style='page-break-inside:avoid; page-break-after:auto; height: 40px;'>
        <td width='8%' style='text-align: center;'>rated_durationgetrdstrgetlslstrmax_light_source_lifelight_source_lifeZSELECT tag FROM cbus_tag_map WHERE net=? AND app=? AND grp=? AND subgrp=? AND tagid=?getsubgrpgetlineobj_id
pairs¤<thead>
        <tr style='page-break-inside:avoid; page-break-after:auto'>
        <th width='8%'>Lamp Name</th>
        <th width='5%'>Test Type</th>
        <th width='8%'>Start Time</th>
        <th width='8%'>Finish Time</th>
        <th width='6%'>Running Time</th>
        <th width='7%'>Rated Duration (min)</th>
        <th width='8%'>Emergency lamp failure</th>
        <th width='6%'>Battery failure</th>
        <th width='6%'>Circuit failure</th>
        <th width='7%'>Battery Duration Failure</th>
        <th width='7%'>LSL/Max LSL (Days)</th>
        <th width='5%'>Status</th>
        <th width='9%'>Comment</th>
        </tr>
      </thead>
    <tbody>|<table border='1' style='border-collapse: collapse;margin: 0 auto; font-size: 14px;page-break-inside:auto' width='95%'>3</div>
        </div>
      </div>
      <br/>Ô</div>
        </div>
    <div style='clear: both;'>
          <div style='color: #3E6266; font-weight: bold; width: 42%; float: left;'>Overall Status :</div>
          <div style='width: 58%; float: left;'>ó</div>
        </div>
        <div style='clear: both;'>
          <div style='color: #3E6266; font-weight: bold; width: 42%; float: left;'>Total Emergency Light with fault detected :</div>
          <div style='width: 58%; float: left;'>ó</div>
        </div>
        <div style='clear: both;'>
          <div style='color: #3E6266; font-weight: bold; width: 42%; float: left;'>Total Emergency Light on normal operation :</div>
          <div style='width: 58%; float: left;'>è</div>
        </div>
        <div style='clear: both;'>
          <div style='color: #3E6266; font-weight: bold; width: 42%; float: left;'>Total Emergency Light Included :</div>
          <div style='width: 58%; float: left;'>±</div>
        </div>
          <div style='color: #3E6266; font-weight: bold; width: 42%; float: left;'>Group Name :</div>
          <div style='width: 58%; float: left;'>Ï</div>
        </div>
        <div>
        <div>
          <div style='color: #3E6266; font-weight: bold; width: 42%; float: left;'>Site Id :</div>
          <div style='width: 58%; text-align: left;'>%d/%m/%Y %H:%M:%Sí<div style='width:100%;height:30px;font-size: 22px;font-weight: bold;text-align: center;'>Emergency and Exit Lighting - Group Test Report</div><div style='margin: 5px 45px 10px; height: auto;'>
        <div>
          <div style='color: #3E6266; font-weight: bold; width: 42%; float: left;'>Conducted On :</div>
          <div style='width: 58%; float: left;'>4'
        'width='80' height='60'>
      </div>h<div style='width:100%;height:65px;text-align:center;'>
          <img src='data:image/jpeg;base64,encode
close*a	readrbù<body><div style='padding:10px; border:1px solid black;width:98%;min-height:680px;margin:auto;'><span style='width:20px;height:15px;float:right;position: relative;left: -25px;'><input type='button' value='Print' onClick='window.print()'></span>3<html><head><title>Group Report</title></head>w/www/emergency_reports/	open%mkdir -p /www/emergency_reports/readprocio1<font color=red><strong>Fail</strong></font>3<font color=green><strong>Pass</strong></font>«SELECT COUNT(*) AS fail_status FROM ( SELECT MAX(CR.datetime_finish) as datetime_finish, CR.test_status FROM cbus_reports AS CR WHERE datetime_finish <= ? AND obj_id IN (SELECT item_id FROM cbus_emergency_group_items WHERE group_id = ? ) GROUP BY CR.obj_id) AS v1 WHERE v1.test_status == "Fail"%d/%m/%Yemailform.datetime_finishemailform.sid_name--rdef.siteid_nameget
login=/data/storage/emergency/user/logo/default_admin_logo.jpg	.jpg'/data/storage/emergency/user/logo/(SELECT login FROM users WHERE id =?ðSELECT U.login, CEGI.group_id,CEG.default_user_id FROM cbus_emergency_group_items AS CEGI INNER JOIN cbus_emergency_groups AS CEG ON CEG.group_id = CEGI.group_id INNER JOIN users AS U ON U.id=CEG.default_user_id WHERE CEGI.group_id = ?user_idáSELECT CR.report_id, CR.obj_id, CR.user_id, U.name, MAX(CR.datetime_finish) as datetime_finish, CR.test_status, CR.test_type, CR.datetime_start, CR.lamp_status, CR.battery_status, CR.inverter_status, CR.battery_failure, CR.function_max_delay, CR.duration_max_delay, CR.running_time, CR.com_failure, CR.test_timeout, CR.light_source_life, CR.max_light_source_life, CR.rated_duration FROM cbus_reports AS CR LEFT JOIN users AS U ON U.id = CR.user_id WHERE datetime_finish <= ? AND obj_id IN (SELECT item_id FROM cbus_emergency_group_items WHERE group_id = ? ) GROUP BY CR.obj_id ORDER BY CR.test_status ASCgetallemailform.filename
.htmldatetime_finish%Y%m%d%H%M%S	dateGroup_filenameåSELECT COUNT(T1.test_status) AS count FROM (SELECT CR.report_id, CR.user_id, CR.obj_id, MAX(CR.datetime_finish) AS latest, CR.test_status FROM cbus_reports AS CR WHERE datetime_finish <= ? AND CR.obj_id IN( SELECT item_id FROM cbus_emergency_group_items WHERE group_id = ? ) GROUP BY CR.obj_id ORDER BY latest DESC) AS T1 WHERE T1.test_status == "Fail"åSELECT COUNT(T1.test_status) AS count FROM (SELECT CR.report_id, CR.user_id, CR.obj_id, MAX(CR.datetime_finish) AS latest, CR.test_status FROM cbus_reports AS CR WHERE datetime_finish <= ? AND CR.obj_id IN( SELECT item_id FROM cbus_emergency_group_items WHERE group_id = ? ) GROUP BY CR.obj_id ORDER BY latest DESC) AS T1 WHERE T1.test_status == "Pass"µselect Count(DISTINCT CR.obj_id) AS count from cbus_reports AS CR WHERE datetime_finish <= ? AND obj_id IN ( SELECT item_id FROM cbus_emergency_group_items WHERE group_id = ? )emailform.group_namesetstorage CSELECT tag FROM cbus_tag_map WHERE net=? AND app=? AND tagid=?getonetonumbergrpobject_tagid_basegetgrpgetappgetnetcbuscore	timeosôSELECT EGI.group_id, EGI.item_id, CR.datetime_finish FROM cbus_emergency_group_items AS EGI INNER JOIN cbus_reports AS CR ON CR.obj_id = EGI.item_id WHERE EGI.group_id = ? AND datetime_finish <= ? ORDER BY CR.datetime_finish DESC LIMIT 0,1getrowÒ   o  2  +  >)  :  7%  >: )  : 7% >:7   T7  TU7   T7  7% % >: 4 7	%
 7 >7  T7 7% % >:4 7	% 7>4 7% >4 7% >4 7% >%  T %	 
 % $ %	 
 %  $:4 7	%	 7
>4 7	%	 %
 >% 5 % 5 4   T	4 74	 >  T4 74	 >T G  Àfmtexecbgcheckprocoscmd)lua /lib/genohm-scada/core/email.luaprocnameemailscriptemailform.contentemailform.subject , subject , --)Emergency and Exit Lighting Report -emailform.datetime_finishemailform.group_nameemailform.sid_namegetemailform.ccemailform.tosetstorage;,	gsubWSELECT GROUP_CONCAT(U.email) as email FROM users AS U WHERE access_emergency = "F"email_id_cczSELECT GROUP_CONCAT(U.email) as email FROM user_acl AS UA LEFT JOIN users AS U ON U.id = UA.user_id WHERE item_id = ?getoneemail_idª M   4  7 >+  >) 	  TA4 4 7%	 > =  T T) H 4 7	4	 7	
	
 ' >	'
ÿ >4	 7	
	
 ' >			 T
%)
  7
+ 77
 T+ 77
 T 7%  >4 4 7 ' ' >' >+ 77 T+ 77 T) H ÀÀPENDINGPROGRESSemergency_statussubstringtonumber+SELECT datahex FROM objects WHERE id=?getoneDURATIONFUNCTIONemergency_mode	modershift	bandbitLSS5500SHAC5500SHAC/lib/genohm-scada/brandreadfileio	trimgetappcbuscoreÜ $    	 
  4  7 >+  >	  Ts4 74 7 ' >'ÿ >4 7 ' >)  7  T4 77)    T''T	 T''T	 7
% 4  > =  )  	 T  7%  >4  >T4 % >73 	 T% :7:::7::
>ANí	 T 7%  >8
  T877	 T4 % >73 	 T% :87:::7::
>  T	 7%  3! :"3# :>T G  À  user_id  cbus_emergency_groupsupdate  statusgroup_id>SELECT * FROM cbus_emergency_group_items WHERE item_id=? islocaldatatype	dataaddressitem_idaction
write  	sendlocalbusrequireipairs?SELECT * FROM cbus_emergency_group_items WHERE group_id=? getalltostring.SELECT id, login FROM users WHERE login=?getone
admin	userctxngxsenderrshift	bandbitgetappcbuscoreÜ c  	+  >%   7   >H Àgetone3SELECT datahex FROM objects WHERE address == ?g  	+  >%   7   >H Àgetone7SELECT sysid FROM cbus_error_app WHERE object == ?Ó  !   T* F 2  )  '    7  % >T4 	 '
 >9 ANø T4 '
 %  $>* F 88F /wrong data hex length, should be 8 but is logtonumber(%x%x)gmatchÓ  !   T* F 2  )  '    7  % >T4 	 '
 >9 ANø T4 '
 %  $>* F 88F /wrong data hex length, should be 8 but is logtonumber(%x%x)gmatchÁ'   ¸1   4 % >4 % >2  1 :1 1 4 % >4
 7:	4
 7:4 7:4 7:4 7:4 7:4 7:4 7:4 7:4 7:4
 7:4
 7:4 7:4 7:1 :3 :3 :3 :3 :3! : 3# :"3% :$3' :&3) :(3+ :*3- :,3/ :.31 :033 :235 :437 :639 :8'X::'ð :;'T :<'þ :='8 :>%@ :?'Ð:A' :B1C 1E :D1G :F1I :H1K :J1M :L1O :N1P 1Q 1	R 1
S 1T 1U 1V 5W 1Y :X1[ :Z1] :\1^ 1_ 1` 1b :a1d :c1f :e1h :g1i 1k :j1m :l1o :n1q :p1s :r1u :t1w :v1y :x1{ :z1} :|1 :~1 :1 :1 :1 :1 :1 :0  H  getmsdatahex getmrdatahex get_sysid getDataHexFromObj emergency_group_update  skip_emergencygroup_command send_group_report create_group_report getrdstr getlslstr skip_error_command update_emergency_status test_restart_trigger disablesniffer file_exists getvalueastext getgroupforapp  _emergencyvaluehook _setvaluehook _afterdelobjhook _afternewobjhook    _updatehookEmergency _errortagcreationhandler _newobjecthookaddlevelnode        getvalidlsl islightinglike renametagbyname renametagbyid deletetag addtag memMinLeftMBtotalErrObjNumMax/tmp/errobjsnumerrerrornumwarningfiledefaultApplicationdefaultNetworkdefaultHistoryPerioddefaultDurationTestTimeoutfunctionTestTimeout !Previous2 Selection NameForwardCurrent Track Name
TrackNext2 Selection NameNext Category NamePrevious Selection NameEnum Selection SizeCurrent Category NameShufflePause ResumePlay Stop Total Tracks
Next2 Category NameEnum Track Names Enum Category SizeCurrent Selection NameEnum Track SizeEnum Category NamesNext2 Track NameCategoryRepeatPrevious Category NameMTC CommandPrevious Track NameSelectionSource Power Control	Enum Selection NamesNext Track NamePrevious2 Track NameNext Selection NamePrevious2 Category NameRewindMTCFunctionNames! Play StopPause ResumeCategorySelection
TrackShuffleRepeatForwardRewindSource Power ControlTotal TracksCurrent Track NameCurrent Selection NameCurrent Category NameNext Track NameNext Selection NameNext Category NamePrevious Track NamePrevious Selection NamePrevious Category NameNext2 Track NameNext2 Selection NameNext2 Category NamePrevious2 Track NamePrevious2 Selection NamePrevious2 Category NameMTC CommandEnum Category SizeEnum Selection SizeEnum Track SizeEnum Category NamesEnum Selection NamesEnum Track NamesMTCFunctions 	BassD1 Dynamic LabelZone Descriptor	Volume 	MuteMRA Command
BalanceSource NumberTrebleD2 Dynamic LabelSource DescriptorMRAFunctionNames VolumeBalance	BassTreble	MuteSource NumberD1 Dynamic LabelD2 Dynamic LabelSource DescriptorZone DescriptorMRA CommandMRAFunctions SealedUnsealed	Open
ShortsecurityDefaultZoneStates  SuccessFailedDisabledEnabled$securityDefaultPasswordStatuses DisarmedFully armedPartially armedsecurityDefaultArmedStates 	 ÀArm 	Fire À
Panic 
Shift ÀVacation Day À
Night ¨
Enter 	AwaysecuritySpecialKeys All OKOKMinor failureGeneral failureExtreme failureerror_severity 	BASE emergency_virtual_group_tag MINDEFAULTMAX9emergency_lsl 
FUNCTIONEXT_EMERGENCYRELIGHTDURATIONIDENTIFYINTERNAL_STOP	NORMAL INHIBIT	RESTEMERGENCYemergency_mode STOPPEDPENDING	FAIL	PASSCOMMUNICATION_LOSSPROGRESSNORMAL COMMUNICATION_LOSS_GENERICemergency_status LIGHT_LEVELTEMPERATUREVOLTAGEunitparam SECURITY_APPÐLIGHTING_APP_LOW0HEATING_APPTRIGGER_APPÊAIR_CONDITIONING_APP¬TESTING1_APPðTEMP_BC_APPLIGHTING_APP_HIGHTESTING2_APPúLIGHTING_APP8MEASUREMENT_APPäTELEPHONY_APPàMEDIA_TRANSPORT_APPÀERROR_APPÎINFO_MESSAGES_APP­EMERGENCY_APPîENABLE_APPËTIME_APPßNETWORK_CONTROL_APPÿAUDIO_APPÍname2app  PSU ÒTemperature Sensor ­DALI/DSI BMS Reporting À­Modular Dimmer ÐKey unit ¨LE Dimmer «PWM/LED Dimmer À¨TE Dimmer ¸A/C System Ñ!Telecommand and Remote Entry ¯Device Controller À«Sinewave Dimmer À®Universal Dimmer ª
Relaydevicetype2name  °LIGHTING_APP ¥TRIGGER_APP AIR_CONDITIONING_APP À¦AUDIO_APP À¯TIME_APP ÀINFO_MESSAGES_APP ÿLIGHTING_APP_HIGH ·EMERGENCY_APP À¿NETWORK_CONTROL_APP §ERROR_APP  MEDIA_TRANSPORT_APP ¨SECURITY_APP °TELEPHONY_APP ¸TESTING1_APP  LIGHTING_APP_LOW HEATING_APP ²MEASUREMENT_APP äTEMP_BC_APP ½TESTING2_APP À¥ENABLE_APPapp2name decodewrapperbusdatatypedecodegaencodegabuslibdecodeuadecodeiaencodeuaencodeiaknxlibdecodeknxdecodeknxdatatypeknxencodecbuslib.core   encode	mimehelperrequire  