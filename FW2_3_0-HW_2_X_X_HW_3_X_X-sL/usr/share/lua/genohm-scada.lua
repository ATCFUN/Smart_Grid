LJD  	4  7  C =4 7 @ executeosformatstring<    %  $ 4 7  C ? fmtexecos >&- 2>&->    %  $ 4 7  C ? fmtexecos >&- 2>&- &;      T�  7  '  >% $ H  ...subg    4   4   > T�  7 ' 'd >  T�% H unknownsubstring	type_SCRIPTNAMEY   4  % >7% %   >  T� H 	coregenohm-scadagetucirequire� 6+  >4    > T�4 % C ='   T�4 7  C =  T�4   >  +   ' >  4   T�4  7% 3	 :
: 4 7>:>4 % >73 :: >G  � �source action
alert	sendlocalbusrequirealerttime	timeos
alertscriptname  alertsinsertdbtostringformat#selectstring	typeD  4  7+    >4  7+  % >G  �
insert
table�
 .* 4    T�0 (�4 % >4 2  1 5    T�4 C = T�4 C = 5 4   7% 3 +  >:	+ 4
 7	 >'	  >:4 7>:>0  �G  G  � �logtime	timeoslogconcat
tablescriptname  	logsinsertvprinthex 
printvprintrequiredb   +   ) C  = G  �   +   ) C  = G  �� 	
 4    T�4   7% 3 : +  4  >' >:4 7>:	>G   �errortime	timeoserrortexttostringscriptname  errorsinsertdb�   4   7%   >  T�4 7>:H tobooleanactive8SELECT id, type, active FROM scripting WHERE name=?getrowdb�   7   T�4 7>T�7   T�4 7  >T�4 7) >G  reloadcheckresidentresidentreloadgroupmonitorlmscripting
event	type�  	 7   T�H   T�4  7%   T�' T�'  7 >7  T�:  4 7  >H reloadsinglelmscriptingresident	typeid-UPDATE scripting SET active=? WHERE id=?
querydbactivef   4  7  >  T�)  % F 4  7  @ 
dosetscript not foundgetlmscripting+   4  7  ) @ setlmscripting+   4  7  ) @ setlmscripting� 
  +* %    $4 7 >   T�4 7 4 7>'  T�' ' I�4 7	 >   T�4 7'	 >T�T�K�
  T�) T�) H 
sleepSIGTERMsignal	killcheckprocosgs-resident-q   4  7%   $>  T�4  7 4 7>G  SIGKILLsignal	killgs-resident-checkprocosB   	4  7  >  T�7H G  activegetlmscripting�  G* 4    >    	  T�% T�% 4  7% 	 $		  > 4  >T	!�4 7
>:
7
 T�4  7	%
   T�' T�'  7
>7
 T�) T
�7
 T�:
4 7
 >T�) A	N	�  T�4 7>  T�4 7) >G  reloadreloadgroupmonitorcheckresidentlmscriptingresident
event	typeid-UPDATE scripting SET active=? WHERE id=?
querytobooleanactiveipairs<SELECT id, type, active FROM scripting WHERE category=?getalldb OR category IS NULLtostring 3   4  7  ) @ categorysetlmscripting3   4  7  ) @ categorysetlmscripting�  '  '  )  4   7%   > 4  >T�4	 
 >	 	 T
� T	� AN�  F tobooleanipairs2SELECT active FROM scripting WHERE category=?getlistdb�    2*  %   4 7  > T�2  2  4  >T	!�
 7
% > 4 7 >  T�  
 $
4	 4 7

 > =    T	�4 7 4 7 % > =A	N	�H concatinsertreadfiletoboolean	loadremove
table.
splitipairslsio/usr/share/lua/user/�  	  4   7  > 4   >T�%  % $9 AN�4 7  % >  4 7	%
   >G  %/usr/share/lua/user-autoload.luawritefileio
concat
table")require("user.ipairsgetautoloadlmscripting�  	 4  7% >  T�4  7    T�4 7  T�4 7>4 7>G  reloadbacnetlmscriptingSIGUSR2SIGUSR1signal	killgs-groupmonitorcheckprocos�  	  &*  4  7>     %  $4 % >7>   T� 7% ) > 7 %	 '�> 7
>4 7%  >G  /tmp/gs-groupmonitor.timewritefileio
close127.255.255.255sendtobroadcastsetoptionudpsocketrequire.microtimeosf    4   7  % >    T�4  7  4 7>G  SIGUSR1signal	killgs-bacnetcheckprocosI   	4  7%    T�  >G  lua -bg %q %qfmtexecquietos�   4  7% 7 >  T�4 7 >  T�4 7 7   T�% >4	 7
 >G  compilelmscriptingscriptwritefileexistsioid'/lib/genohm-scada/scripting/%d.luaformatstring� 	  :* %   % $ % $ % $4 7 >  T�4 7 >  T�4 7%   >   T	�4 7	   >4 7
 >4 7 >  T�4 7 >  T�4 7  >G  compilelmscriptingremovewritefilecp %s %sfmtexecquietosexistsio.default.lua
.luas	.lua(/usr/share/lua/genohm-scada/userlib   3   ,   G   � 
state�  
 6+   7      T �G  +   )  : +   7     T�+   7     '    T 	�+   4 7+  7% >: T �+   )  : +   7      T�+   7     T�+   7     T�+   7     T�4  7 	 + +  > +  > G   ���insertsingleoutputoutput
input
concat
tablecomment
state	nameE    7   ' ) > T�  T�) T�) H 	find� �*   7  >    7 ' ' > T�+  @   7 ' > 7 >    	  T�G    7 > + 7  T�+  % >  T�G    7 ' > 7 >  '   T��+ :+ % :T��+  % >  T�+ %	 :+ 2  :	T��+  %
 >  T
�+   7 ' > 7 >:Tv�+  % >  T�+ % :+ 2  :Ti�+  % >  T�+ ) :T_�+  % >  T�+ ) :TU�+  % >  T�+ % :+ 2  :TH�+ 7 T�4 7+ 7  >T=�+ 7	 T�4 7+ 7	  >T2�+ 7 T%�4   7 % > =     T$�  T"� 7 >  7 >  '   T� '   T�4 7+ 72 ;;>T	�+ 7 T�+ : + % :G  � �� - 
splitunpackinsert
tableoutput[output]singleoutput[single output]inline[inline]
input[input]category[category]comment[comment]
title
state[function]	name
lower---sub	trim �  +    %  $4 7 >  T�G  + >4 7 >T�+  >AN�G  ���
linesexistsio
.luas�   )*  1  1 1 1 1	 2  % 4
 7

>

 4
  >
T	�2  	  > '   T�9AN�4
	 %
 >
7

 >

 4
 7

%  >
0  �G  /data/storage/blocks.jsonwritefileioencode	jsonrequireipairsgetautoloadlmscripting/usr/share/lua/user/     �   -* 4  7 >   T�  T
�4 77 >  T�4 77 >  T�  T�4 7% 7 $>   T�4 7 4	 7
>T�4 7% 7 >G  9lua /lib/genohm-scada/core/scripting-resident.lua %dfmtexecbgSIGUSR1signalgs-resident-checkprocos	killid	stoplmscriptingactivetoboolean�  " Z* 4    T�4 % >4  7>5     T	�4 7>4 7>4 7>2  % 4	 4   7
% > = T#�7		 T	�   T		�4	 7		
 >	T	�4	 7		
 >	7		 T	�4	 7
>	 	 T
�4	 7		%
 7 7>		 4	 7		
  >	AN�4 7 % >4 7%  >4 7%  >   T�4 7!>G  reloadgroupmonitor/etc/init.d/cron reloadexecuteos(/etc/crontabs/store/20-lm-scheduledwritefileioinsert
tableidparams%s %s %sformatstringactivetobooleanscheduled	savecheckresidentresident	typeSELECT * FROM scriptinggetallipairs7lua /lib/genohm-scada/core/scripting-scheduled.luaparseblockscheckuserlibcacheautoloadlmscriptingnew
dbenvrequiredb[     '   T	�  '  T�  7  % >T�) T�) H ^[-_%w]+$
match�  R* 4    > 7% > 2  4  >T=�
 7	% >	 	 T
�4	 7		
 >	T4�  T	�) T	+�	 	 	 7
%	 %
 >

 7

% % >

 7

% % >

 7

% % >

 7

% % >

 7

% % >

 7

% % >

 7

% % >
9
	 T	�) AN�4 7 % @ concatstack traceback: 	%.luas?/usr/lib/lua/Library /usr/share/lua/Common functions./usr/share/lua/genohm%-scada/userlib.luasUser library /usr/share/lua/user/User script*/lib/genohm%-scada/scripting/%d+%.luaResident script%[string "Resident"%]	gsubremove
tablexpcall	findipairs

splittraceback� 
  >* 4  74 % >% 4 7% >  T�4 4  	 >    T�4	 %
  >4 4  %	 >    T�4	 %  >   T�G  4 7%   > 4 4  	 >    T�4	   >G  '/lib/genohm-scada/scripting/%d.luaformatstringuser-function-library,/usr/share/lua/genohm-scada/userlib.luauser-librarylogerrordofilexpcallexistsio%/usr/share/lua/user-autoload.luagenohm-scada.platformrequiretracerlmscripting�   * 4    >   T�4  7%  >   T�4  7%   >   T�H T�)  % F G  scene not found&SELECT * FROM scenes WHERE name=?$SELECT * FROM scenes WHERE id=?getrowdbtonumber�  :* 4   7%   >  	  T�)  % F 2  4  >T�4
 	 >
	
  	 T
�4
 7

 	 >
AN� 	  T�)  % F   T�H T�4 7 %	 > %
  % $4   7 @ G  getall)'SELECT * FROM scenes WHERE id IN (,concatinsert
tabletonumberipairstag not found-SELECT scene FROM scene_tags WHERE tag=?getlistdb � 	 *   T�+    >    T�)   F 7  % 4  7   @ �getalldbBSELECT * FROM scene_sequence WHERE scene=? ORDER BY sortorderid�   %* 4  % > 4   >T�77	> 
  T�7 T�4 7	>  T	�4 7	7	

 >T�4 77	

 >AN�G  updateobject
writegrpbus_writetoboolean	null
valuepdecodeipairs	jsonrequire�   !* 4  % > 4   >T�4 77	>   T�74 	 7%
	 3 7
 >:3 7:>AN�G    id
value  encodescene_sequenceupdatedb	nullobjectgetvaluegrpipairs	jsonrequire�  (* +    ) >    T�4   >T	�+ 
 ) > 4  > T�  >A	N	�  T�4 7>) H T�)   F G  ��reloadlmscenes
table	typeipairsi  +    >  T�  >  T�4  7>) H T�)   F G  �reloadlmscenesf    4   7  % >    T�4  7  4 7>G  SIGUSR1signal	killlm-scenescheckprocos   +    + @ 
��   +    + ) @ 
��� 

 +    >  T�4   7% 3 4 	 >:3 7	:	>4 7	>) H T�)   F G  �reloadlmscenes  idactive  tobooleanscenesupdatedb(   4  7  ) @ setlmscenes(   4  7  ) @ setlmscenesN  +    >  T�4  7@ T�)   F G  �activetoboolean� 

 %+    ) >  T�4  7 % > %  % $4  7 4 	 >  T	�' T	�'  >4 7	>T�)   F G  �reloadlmscenestoboolean
querydb)-UPDATE scenes SET active=? WHERE id IN (,concat
table+   4  7  ) @ tagsetlmscenes+   4  7  ) @ tagsetlmscenes� * +    >    T�)   F '  '  4   >T�4
 7	>
 
 T� T
� AN�  F �activetobooleanipairs   +    + ) @ 	��   +    + @ 	��n   4  % >73 4 7:7 :@ addressidsendergrp action	read	sendlocalbusrequireA   	4  77   T�7 % @ datatypeid
writegrpJ   	4  77   T�7 % @ responsedatatypeid
writegrpL 	  
4  77   T�7 % ) @ updatedatatypeid
writegrp5 	  4  77    @ idcheckwritegrp8 	  4  77    @ idcheckresponsegrp6 	  4  77    @ idcheckupdategrp]
 4    >T�6 C	 =4 7(  >AN�G  
sleeposipairs��������"  +    %  >G  �	read+  +    %    >G  �
write.  +    %    >G  �response,  +    %    >G  �update0  +    %    >G  �checkwrite3  +    %    >G  �checkresponse1  +    %    >G  �checkupdate� 
 ^* 4    >   T�4   >  T�%    7 >  4 7  >   T�  T� % F +  %   T�% T	�%	 $4
  7 	 T	�	  >   T�)  % F   T�4  7@ 4 77>:  T�7  T�% T�% F 7  T�7  T�) :4 777	 >:7:   T�% T�% F �	datadecodebusdatatype
valuedecodeddatahexdatatype	namedecodegaidnot foundgetrowdbname LIKE ?	id=? WHERE addressencodegabuslib	trimtostringtonumber�  5*   T�)  %  F   T�  T�+    )	 > T�+    )	 >    T�)   F 7  T�  T�  T�74 7 	 
 > 7  T�)  7F  7	 
 F �datahex
errorencodebusdatatypedatatypeidcannot send nil valueg  +    ) >  T�4   3 + :@ T�)   F G  ��__index  setmetatable� 
  2  4    > T�4   7 % > = T� 7>  '   T�4 7 	 >AN�H insert
table	trim,
splitipairsstring	type�  4    > T�4 7  >  4    > T�)  % F   T�  	  T�)  % F H  no tags specified$tag must be a string or a table
tableparsetagsgrpstring	type O   4  7  >  T�4  77@ G  tagcacheparsetags	findgrp�  a* +  	  )
 ) >   T�)  %	  F 4 7	 )
 >	    T�)  	 F   T�4 	 7%
 3 :>T�4 	 >T�4  7% 3	 ::
>AN�  T�4 	 >T�4  7% 3 ::
>AN�4 	 7%
  > 4 7	 %
 > 4 	 7%
 3 :4 7>:3 :>  T�4 7>) H �reloadgroupmonitorlmscriptingid  updatetime	timeostagcache  objectsupdate, concat
table;SELECT tag FROM objecttags WHERE object=? ORDER BY taggetlist  inserttag  ipairsobject  objecttagsdeletedbchecktagsgrpobject not found*   4  7   ) @ settaggrp*   4  7   ) @ settaggrp.   4  7  2  ) ) @ settaggrp2 	  4  7   ) )  @ settaggrp� 	  4  7  >  T�4  7% 3 :4 7>:	3 7
:
>) H T�)  % F G  object not found  idupdatetime	timeoscomment  objectsupdatedb	findgrp�   )  4    > T�4    > T�'  H 4 7  >   T
�4 74   >  T�'  > H tonumber
floor	mathencodegabuslibnumberstring	type� 
 V* 4  7    > 4  > T� TF�4  > T�4 7 T�4 7%	  > T6� T4�4  > T� 7
% % > T(�4  > T#�4 7 T	�4 7% 777	> T�4 7 T�4 7% 777	> 7'   T� % +  76$H � secondminute	hour%.2d:%.2d:%.2d	time	year
monthday%.2d.%.2d.%.4d	date
table%z+	gsub
#%06Xformatstringrgbdtnumberboolean	typedecodebusdatatype� 
5*    T�4  7% >  T�+  % % > 4  7 > T�' 4 7 ( > 4  7%	   > 4
  >T� T	�T	�T�AN� T� T�'  H �ipairsDSELECT id FROM objects WHERE id BETWEEN ? AND ? ORDER BY id ASCgetlistdbmin	math
1/1/1autorange32/1/1encodegabuslib�����  $* 4    > T�  	  T�G  '  '
 ' I�'   T�  %	 
 $
T�  4 	 7%
   >   T�T�K�H 4SELECT name FROM objects WHERE name=? AND id!=?getonedb #string	type L    T�+    T�%  T�  T�  > + 9 G  ���   4    > T�4 % >7  >  4    > T�4 % >7  >  T�)   H  encode
tablepdecode	jsonrequirestring	type�
5 �*	 4
    >

 T
�)
  % 0 ˀ7
  
 T�4
 7

7 >

 T
�4
 7

7 >

   T
�'
  
 T
�)
  % 0 ��2  4
	 
 7


%  >

 7 4
   >

 T
�4
 6

 
 T�4
 6
T
�4
 7 >

   T
�  T
�'
  
 T
�)
  % 0 ��1
 1  7 >  7 >   T�4 7 >  T�7   T�+    > 7 
  T�4 7 >	 T�  T	�+ % % > T�)	 T�)	 
 % 7 >
 % 7 4 >
 %  >
 % 	 >
 %  >
 % 7 4 >
 %  7  4 >
 %! 7! 4 >
 %  >
 %" 7" 4 >
 %# 7# >
 %$ 4% 7&> =
 %  >  T
�%' 4	  7(%)  3* :+>T�:+:% :,% :-4	  7.%)  >7/   T�4 70 7/ ) >41 72>43 74 > 0  �F F
 F
 F
 ��decodegabuslibreloadgroupmonitorlmscriptingsettags	tagsinserttagcachedatahexid  objectsupdateobject already exists	timeosupdatetime
unitspollintervalhighpriologexportreadoninitdisablelogcovincrcommentacceptlogpolicylog	nameforcenametoboolean
enumsvisparams  #datatype is missing or invalidtonumberdtstringdatatype&SELECT id FROM objects WHERE id=?getonedb%invalid address or range is fullvirtualgetrangenextnormalizegrpaddressconfig must be a table
table	type�   4  7  >  T�4  7% 3 7:>4  7% 3 7:	>4
 7>4  @ tobooleanreloadgroupmonitorlmscriptingobject  objecttags  idobjectsdeletedb	findgrp� 
 ,4    >T �4 77>:7  T�7  T�) :4	 7
777	>:7:)  :)  :4  3 +	  :	>AN�4   3 + :@ ��  __index  setmetatable
enumsvisparams	datadecodebusdatatype
valuedecodeddatahexdatatypeiddecodegabuslibaddressipairs�  2* 4  7  >      T�)   F +  % $% 4 7% 	  >$ T� T�  '  T� %	   $4
  74 7	 
 >4	 
  >	 = +  @ ��unpackformatgetalldb+ GROUP BY object HAVING COUNT(object)=andall OR tag=?repstring*SELECT object FROM objecttags WHERE 0 WHERE id IN (%s)checktagsgrp� 8* 4    > T�4 6   T�4 6  4   >  T�'   4 7  >  4 7%   > '�  T�  T
�   4 7% 	 
 >$4	  7
+  %	 
 $
> +  @ �� WHERE getalldb# OR datatype BETWEEN %d AND %ddatatype=%dformat
floor	mathtonumberdtstring	type��5   4     7  +  > +   @ ��getalldbV  +    ) >  T�)   F   T�7  T�7 H �address	name�  +    ) >  T�)   F 7   T�  T�)  % F 4 77 7>: 7 H �iddatahexdecodebusdatatypeno datatype specified	data� +    ) >  T�	  T�)   F 4  % >73 4 7::@ �addresssendergrp action	read	sendlocalbusrequire � +      >  T�	  T�)  	 F 4  %	 >73	 
 T
�%
 :
	:	:	:	4
	 7


:

	:	@ �islocalsendergrpdatatype	dataaddressaction
write  	sendlocalbusrequire 6   4  7    % @ response
writegrp8 	  4  7    % ) @ update
writegrpX   4    >  4   >   T� T�  T�) T�) H tonumber� m4    >4   > T�) H Ta� T�4  > T�(  4 7 >  T�) T�) H TN� TF�7   T�+  7 7>  T
�+  7 7>  T�+  7 7>H T7�4  7	> T�7		 T�' :T�7	'  T�7	'  T�7	:+  7 7  T�'  >  T�+  7
 7
  T�7>  T�+  7 7  T�7>H T�  T�) T�) H G  �secsecondminminute	wday
monthday	year
tableabs	mathtonumbernumber	type��̙�����  4  7  >  T�7  T�)  % F +  7  >   F �
value+object not found or no datatype is setdecoded	findgrp�   %* 4   > T�4 7 	 
 > T�4 7 	 
 >    T�  T�6  	 @ T�4 6  	 @ G  checkvaluegrpstring	type  +   %  C  ?  �
write   +   %  C  ?  �update"  +   %  C  ?  �response|      T�  T�4 7 @ T�  T�4 7  @ )  % F unknown gettertag	findgrp	nameaddressp    4   4 % >7>    T�4 :H T�)   F G  	connstorageconnect
redisrequire
pcallN    4   7     T�4   7    7  > 4   )  : G  
close	connstorageb     7  ' ' > T�  7  ' '	 > T�) T�) H fbeditor:	app:sub� 
 '2  )  4    > T�+   4 7>  T�4 7> T�2  4  >T
�  	 >  T	�4 7	 >9AN�4 7>H �closeconngetipairs	keysopenconnstoragefunction	type� 	  2  4    > T�H 4 7>  T�4   >T�4 7 >9AN�4 7>H closeconngetipairsopenconnstorage
table	type�  -* 4  7  T�) 4  7 T�4 4 % >7>    T�)   F 4 6  C =  4  7  T� 7>  T�H T�)   F G  
closeconnect
redisrequire
pcall	connstorage7   4  7%   T�% @ *	keys	execstorage-    4   7  % @  flushall	execstoragej   
4  % >73 : ::>G  	datakeysubaction actionstorage	sendlocalbusrequire� 	 
 ,* 4  7%   >  T�4  7%   @ T� T� % F 4  7%   >    T�  F 4 7	 >    T�   F decodeserializeget"key not found or invalid typestringhgetall	hash	type	execstorage� 
 #* 4  7 >   T�) % F 4 7%   	 >    T�+    >  T�4 7%   	 >  F �notifyset	execstorageinvalid dataencodeserialize�  4  7%   >  T�+    >  T�4  7%   >4  > F �tobooleandeletenotifydel	execstorage5   4  % >7  @ 	pinglocalbusrequire8   4  % >7  @ restartlocalbusrequirer  4  % >7  >  T�4 7 >H G  
floor	mathadcreadlocalbusrequire������Հr    4   7  % > 4   > T�  T�) T�) H G  1string	type/tmp/tpuart.statreadfileioK    4   7  % >    T�%  H  /tmp/eibd-stats/totalsreadfileio�   )4   % > 7  % ' 1 >   7 % >    '  T�3 4 8 >:	4 8 >:
4 8 >:4 8 >:4 8 >:0  �H G  repeats	iptx	iprx	tptx	tprx  tonumber 
split eibd-statsrunlockedsemrequire�  � �4   1 : 4   1 : 4   1 : 1  1 1	 1
 5 1 1 5 1 5 1 5 2  5 4 1 :4 1 :4 1 :4 1 :4 1 :4 1 :4 1! : 4 1# :"4 1% :$4 1' :&4 1) :(4 1+ :*4 1- :,4 1/ :.4 11 :04 13 :24 15 :44 17 :64 19 :84 1; ::4 1= :<4 1? :>4 1A :@4 1C :B4 1E :D4 1G :F4 1I :H2  5J 1K 1L 1M 1N 1O 1	P 1
Q 4J 1R :B4J 1T :S4J 1V :U4J 1W :4J 1X :4J 1Y :4J 1Z :$4J 1\ :[4J 1^ :]4J 1` :_4J 1b :a4J 1d :c4J 1f :e4 5g 4J 5h 4i 5j 4  7k5k 2  5l 2  2  1n :m1p :o1r :q1t :s1v :u1x :w1z :y1{ 1| :m1} :o1~ :q1 :s1� :u1� :w1� :y%� 1� 1� 4l 1� :�4l 1� :�4l 1� :�4l 1� :�4l 1� :�4l 1� :�4l 1� :�4l 1� :�4l 1� :�4l 1� :�4l 1� :�3� 4l 1� :�4l 1� :�1� 4l 1� :�4l 1� :�1� 4l 1� :�4l 1� :j4l 1� :�4l 1� :�4l 1� :�4l 1� :m4l 1� :o4l 1� :q4l 1� :s1� 1� 4l 1� :�1� 4l 1� :u4l 1� :y4l 1� :w3� 4l 7m:m4l 7o:o4l 7q:q5� 4� 1� :2  5� 4� 1� :�4� 1� :�1� 4� 1� :�4� 1� :�4� 1� :�4� 1� :�4� 1� :�4� 1� :�4� 1� :4� 1� :4� 1� :�4� 1� :�4� 1� :�4� 1� :�4� 1� :�4� 1� :�0  �G   getstats isconnected readbusvoltage restart 	pingbuslib    notify 
clear 	keys 	exec 	mget   closeconn openconnstorage knxobject       checkvalue       getvalue 
alias all  tag  delete create  getrangenext decodevalue  MondayTuesdayWednesdayThursdayFridaySaturdaySunday normalize setcomment settags removealltags removetags addtags settag gettags checktags parsetags 	find  SELECT * FROM objects         checkupdate checkresponse checkwrite update response 
write 	readgrp
sleepdptbusdatatype
scenescript tagrun tagsavelive tagstatus tagdisable tagenable tagset     savelive run        lmscenes bootstrap tracer isvalidname reload checkresident parseblocks checkuserlib 	save compile reloadbacnet updategroupmonitor reloadgroupmonitor cacheautoload getautoload categorystatus categorydisable categoryenable categoryset status 	kill 	stop disable enable set 
doset reloadsingle getlmscriptinglogerror loghex log  
alert     fmtexecbg fmtexecquiet fmtexecos 