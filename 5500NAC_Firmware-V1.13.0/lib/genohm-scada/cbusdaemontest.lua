LJΔ    8)  4  4  4  4  4 74 >  T'4 7 >
  T!77 T4  77 T4  7	7 T4  7
7 T4  4   T
4   T4   T4  T)      	 
 F undfinedcbus_ncc_verupdatetimesn
value
statepdecode	jsonstatsfilereadfileioundefined»  Kε4   % > %  5  %  5  '  5  1  5  )  5  4 	    T4 	    '   T 	4 	 8    7 
 >   T )  5  4  7  % > 4  7  ' > 4  7  % > 4  7  % > 4     T4  7  % > 4  7  % > 4  7  4 > )  5  )  5  4  5  '  ' ' I ς) 5 ' ' ' I4 7%	 >5	 5 4 4	 >
  T4 	  T) 5 T4 7(	 >Kκ4   T4 % >4 7'e >) 5 ' ' ' I4 7%	  >5	 5 4 4	 >
  T4 	  T) 5 T4 7(	 >Kκ4   T4 %! >4 7'f >) 5 ' ' ' I4 7"4	 >  T	) 5 T4 7(	 >Kς4   T4 %# >4 7'g >) 5 ' ' ' I4 >5$ 5% 5
& 5	' 5( 4(   T4 %	) >4 7'	h >4' 	 7
>* T) 5 T4 7(	 >Kα4$ + T\4   TQ4 7% >5 5 4   T:4 7%, >5 5 4- 7.4 4 >' >5 4 	  T) 5 4 5 T$4 	 T4  7/>5 T4 	 T4 7%0 4  7/>%1 $>5 4 %2 4  7/>$>4 7'i >T 4 7% >5 5 4 74 >T4 %3 >4 7'  >T) 5 T K 4     T % 4 4' %5 4& %6 4$ %7 $  5 8 4  4   T 4 8 %9 4 $  5 8 4  48 > 4  7  'j > )  5  '   '; ' I 0	  T4 7%: >5 5 4 7( >4 >5; 5< 5= 5> 5? 4?   T4 %) >4 7'k >4< 4%  T4>  7
>* T4= 4  T) 5 T K Π4     T 4  %@ 4> %5 4= %6 4; $> 4  7  'l > 4 =  A T 4     T 
4  %B 4= $> 4  7  '  > T 	4  %C 4= $> 4  7  'm > 4 =  D T 4     T 4  %E 4= %F $> 4  7  '  > T 
4  %G 4= %F $> 4  7  'n > 4  %H > 4  %I 4; $> 4  4> > 4  4= > 4  %J > 4  7  '  > G  OKvNCC:ERROR - C-Bus serial number storage worn out in NCC: ). The chip will need to be replaced!<WARNING - C-Bus serial number storage worn out in NCC: 0000000000008ERROR - Unprogrammed C-Bus serial number from NCC: :WARNING - Unprogrammed C-Bus serial number from NCC: 010485754095HERROR - Failed to get a useful response from the cbusdaemon: State=newresnewstate
newsnnewupdatetimenewnccver5kill -SIGUSR1 `pidof cbusdaemon` >/dev/null 2>&1. Log: errmsgs. It appears the chip firmware is unprogrammed, or the comms path or chip is faulty, or the C-Bus power is off
 Ver= Serial=@ERROR - Failed to get a response from the C-Bus NCC: State=¨WARNING - Failed to get a response from the C-Bus NCC. It appears the chip firmware is unprogrammed, or the comms path or chip is faulty, or the C-Bus power is offERROR - Wrong NCC chip: " | grep -i "not suitable"echo "	trimrshiftbit1cbusdaemon /dev/CBusNCC bootloadermagic 2>&1
0.0.0online'ERROR - Could not parse stats fileoldresoldstate
oldsnoldupdatetimeoldnccverCERROR - Timed out waiting for cbusdaemon to create stats file.exists`ERROR - cbusdaemon is currently stopped, and has not yet been restarted by pcsk supervisor!"pgrep -x /usr/sbin/cbusdaemon	exit#ERROR - cbusdaemon is stopped!
printtonumberres	statCpgrep -lf /usr/sbin/pcsk.*/usr/sbin/cbusdaemon | grep -v pgrepgotonenccerrorgotnccverprogrammedit!/etc/init.d/cbusdaemon start rm -f /data/cbus-params.binrm -f /tmp/cbusstats.txt<kill -9 `pgrep -x /usr/sbin/cbusdaemon` >/dev/null 2>&1
sleepos /etc/init.d/cbusdaemon stopreadprocio	safe
lowerargdoprogramitgetstats cbusdaemonstarttimeundefinedstatsfile/tmp/cbusstats.txt	jsonrequire ΅ζΜ³¦ώ 