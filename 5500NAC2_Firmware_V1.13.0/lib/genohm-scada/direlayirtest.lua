LJ\   4  4   >4  4  >4  4  >G  
relay
ircar
irmodgpio_set_value7    4   ' ' '  > G  setup_irmod_ircar_relayõ   $4  4 >5 4  4 >5 4   T4  T4 % 4 % 4	 %
   %	 4
 %  % 4 $>4 >4 74	 >G  	exitosset_defaults, distatlowres_read=, distatlowres_expect=, dirngok_read= failed. dirngok_expect=subcase, subcase 	caseERROR - Test case 
printdistatlowres_readdistatlowresdirngok_readdirngokgpio_get_value  ,í4   % > '   5  ' ÿ 5  4  % > 5  4  4 % >    T 4 	 %
 > 4  % > 5  4  4 % >    T 4 	 % > 4  % > 5  4  4 % >    T 4 	 % > 4  % > 5  4  4 % >    T 4 	 % > 4  % > 5  4  4 % >    T 4 	 % > 1  5  1  5  1  5  )  5  4      T54      '   T 04   8    7 ! >   T )4 	 %" > )  5  4 # 4 >    T 4 	 %$ > 4 % 7 & ' > 4 # 4 >    T 4 	 %' > 4 % 7 & ' > 4 # 4 >   T 4 	 %( > 4 % 7 & ' > 4     T(  T'  5 ) '  ' ' I P5 ' 5 4 ' ' '  >4% 7*4) >4 ' ' >' 5 4 ' '  '  >4% 7*( >4 '  '  >' 5 4 '  ' '  >4% 7*( >4 '  '  >' 5 4 '  '  '  >4% 7*4) >4 '  '  >4   T' 5 4 ' ' ' >4% 7*' >4 '  ' >K °4  > 4 	 %+ > 4 % 7 & '  > G  OK
sleep
delayfERROR - RELAY is not at its default value of 0.  A reboot is required before this test can be rungERROR - IR_CAR is not at its default value of 1.  A reboot is required before this test can be run	exitosgERROR - IR_MOD is not at its default value of 1.  A reboot is required before this test can be rungpio_get_value1WARNING - Limited testing in safe mode only.
lowerarg	safe#checkread_dirngok_distatlowres set_defaults setup_irmod_ircar_relay :WARNING - Could not export GPIO for DI_STATE_LOW_RES.distatlowresDIG_IN_LOW3WARNING - Could not export GPIO for DI_RNG_OK.indirngokDIG_IN_RNG/WARNING - Could not export GPIO for RELAY.low
relayRELAY_CTL0WARNING - Could not export GPIO for IR_CAR.
ircarIR_CARRIER0WARNING - Could not export GPIO for IR_MOD.
print	highgpio_export
irmodIR_MODgpio_nrsubcase	casehelperrequire µæÌ³¦þ 