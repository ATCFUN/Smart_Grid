LJÔ    8)  4  4  4  4  4 74 >  T'4 7 >
  T!77 T4  77 T4  7	7 T4  7
7 T4  4   T
4   T4   T4   T)      	 
 F updatetimencc_remote_on_sensencc_remote_off_sense
value
statepdecode	jsonstatsfilereadfileioundefinedã   =4   > *	 )
 5
 '
  '; ' I
! 	 T4 7% >5 5 4 7( >4  >	       T
	 T 7	>
 T) 5 T
K
ß4
  
 T
4
 %  %  %  $>
4
 7

' >

  F
 	exit RemoteON_read= RemoteOFF_read=HERROR - Failed to get a useful response from the cbusdaemon: State=
printonline
lower
sleeposres	stat5kill -SIGUSR1 `pidof cbusdaemon` >/dev/null 2>&1readprociogotonegetstats µæÌ³¦þæ  C) 4  4   >4  4  >4 7(  >4   T4 >5 5 T5  5 4	 4 >5 4	   >  4	 4 >5 4	  > 4   T4
 % 4 %   $>) 4  T4
 % 4 %  $>)   T'  T' H #ERROR - Remote ON read value: $ does not match written value: $ERROR - Remote OFF read value: 
printtonumberoff_readon_readreadremote_off_onchecknccfeedback
sleeposremonpinremoffpingpio_set_valueàÿ  24   % > 4   % > )  5  %  5  %  5  1  5  1 	 5 
 1  5  4  % > 5  4  4 % >    T 4  % > 4  % > 5  4  4 % >    T 4  % > 4  4 >    T 4  % > 4  7  ' > 4  4 >    T 4  % > 4  7  ' > 4     T4     '   T 4  8    7  >   T 4  % > )  5  T v4   7 ! %" > 4#  >
  T  T4 %$ >4 7' >) 5% ' ' ' I4  7&4 >  T) 5% T4 7'( >Kò4%   T4 %( >4 7' >) 5% * ' ' '	 I4 >       T4 %) >4 7' > 7>* T) 5% T4 7'( >Kã4%   T4 %+ >4 7' >4#  >  T4 %, >4 7' >4#  >  T4 %- >4 7'  >)  5 . 4  7 ' ' > '  ' ' I )4 ' '  >5/ 4/   T) 5. 4 '  '  >5/ 4/   T) 5. 4 '  ' >5/ 4/   T) 5. 4 '  '  >5/ 4/   T) 5. K ×4  4.   T%0 T%1 > 4  7  4.   T'  T' > G  
ERROROKresok©ERROR - Remote ON read is not at its default value of 0.  Either Remote ON is being asserted by a device on the C-Bus network or the Lorax is incorrectly reading it«ERROR - Remote OFF read is not at its default value of 0.  Either Remote OFF is being asserted by a device on the C-Bus network or the Lorax is incorrectly reading itkERROR - Cannot get internal feedback when C-Bus is offline - is the C-Bus power on and NCC programmed?online'ERROR - Could not parse stats fileCERROR - Timed out waiting for cbusdaemon to create stats file.
sleepexistsgotoneIERROR - Cannot get internal feedback when cbusdaemon is not running!tonumberpidof cbusdaemonreadprocio^WARNING - Limited testing only, no internal feedback checked for remote signals asserted.nochecknccfeedback
lowerargpERROR - Remote ON write is not at its default value of 0.  A reboot is required before this test can be run	exitosqERROR - Remote OFF write is not at its default value of 0.  A reboot is required before this test can be rungpio_get_value3WARNING - Could not export GPIO for REMOTE ON.remonpinREMOTE_ON4WARNING - Could not export GPIO for REMOTE OFF.
printlowgpio_exportremoffpinREMOTE_OFFgpio_nrtestmatch readremote_off_on getstats undefinedstatsfile/tmp/cbusstats.txtchecknccfeedback	jsonhelperrequire µæÌ³¦þ 