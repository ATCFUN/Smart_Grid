LJ:   4    >T T) H ANúG  ipairs=     7  > 7 >  T) T) H 
lower  7  7 )  4  > T4  > T	'   T4 7! > H 
floor	mathnumber	typequality_maxqualityÈ   `* 2  2  4	   	 T	H 4	  7		7		
  >		   T	H 4	 
 >	T%7 T"4 7>% 4 7	>$4
   >  T4 7  >4  >   T	4 7 6  T'  >9ANÙ4	 7		
 4 >	'  4	 
 >	T 7' 'íÿ> 6  T	 %  % $ T  2 ;;9ANè	 
 F	 %) (signal: subsortssid	sortmax	mathgetqualityinsert
tabledupessid
bssid 	ssidtostringMaster	modeipairsscanlistnl80211iwinfo  A* 2  4    TH 4  77  >   TH 4  >T	7
7
  T  T7
  T4 7 2 7
;4	 7
%   > < >A	N	ç '   T4 74 7> = 4 7'  > 68  F random	timeosrandomseed	math%d (%.3f GHz)formatstringinsert
tablerestrictedmhzchannelipairsfreqlistnl80211iwinfoÐÀd   4  7% >4  >D7  TH BNúG  ifname
pairsnetworkget_alluci¼  L û4   % > 4  4  % > 1  5  1  5  1  5 	 1 
 5  1  5  4  7  >    T2   5  3  3 : 2  : 5  1  5  4  7  % >   7  % ' ) > 5  4  7     T4  7  5  4  4 > 5  4     T4   7 ! %" 4 > 5  4  7  4 : T 2   5  4  7 #    T4  7 #   7 $ %% > 5 # 4 #    '   T 4  4 4' 4# >:&:# 4  7  4 : 4  %( > 5 ) 4 ) 4 6     T4 ) 4 6  7 * 5 + 4 ) 7 , 5 - 4   . T 4     T% / 5 0 T K4   1 T H4     T4   7 2 %" %. %3 > 5 3 4 4 43 > 5 3 4 3    T4  4 4 >56 :5 4  7 7    T 4  46 :7 % 8 5 0 T '4  7 9    T 4  7 9  : T 4  %; :9 4  4 4 >5= :< 4  7 >    T4  7 ?    T	4  4 7>%% 4 7?$:> T 4  4= :> % @ 5 0 4  4 : 4  7 A 4+   T4 7B> 5 + 4  7 A 4   T%C > 5 D 4  7 A 4 > 5  % E 4+ %F 4 %G 4D %H 4-   T' T'  %I 4	0  	 T
%	C 4
3  
 T%
C T%
J %K $  0  H  ¬    ],
    submitEl: win.footerEl,
    reboot: true
  });

  FlashSYS.setCache('interfaces_form', { window: win });
  form.loadValues(data.values, data.params);
})();
Ü      { type: 'select', name: 'proto', values: ['static', 'dhcp'], translate: true,
        blocks: {
          def: { 'static': 1, 'dchp': 0 },
          change: {
            'dhcp': { 'static': 0, 'dchp': 1 }
          }
        }
      },
      { type: 'blockStart', name: 'static' },
        { type: 'text', name: 'ipaddr', validate: { ip: true, custom: checkip } },
        { type: 'text', name: 'netmask', def: '255.255.255.0', validate: 'ip' },
        { type: 'text', name: 'gateway' },
      'blockEnd',
      { type: 'blockStart', name: 'dchp' },
        { type: 'plain', name: 'currip', text: ip || $TR('unknown') },
      'blockEnd',
      { type: 'text', name: 'dns', validate: { required: false, ip: true } },
      { type: 'text', name: 'dns_alt', validate: { required: false, ip: true } },
      { type: 'text', name: 'mtu', cls: 'w20p' }Û && ip.match(/^192\.168\.254/)) {
      res = false;
    }
    else {
      res = 0 < c && c < 224 && c != 127;
    }

    return res ? '' : $TR('validate_ip');
  }

  form = new FlashSYS.Form(win.contentEl, {
    module: 'interfaces_form',
    saveModule: 'interfaces',
    reload: 'interfaces',
    trPrefix: 'interfaces_',
    elements: [ µ;

  win = FlashSYS.newWindow({
    id: 'interfaces_form',
    title: $TR('interfaces_form') + (name ? ' ' + name : ''),
    width: 400,
    height: 275,
    padding: 5,
    canReload: false,
    type: 'modal'
  });

  function checkip(ip) {
    var c = parseInt(ip.split('.')[0], 10) || 0, res;
    if (    , name =     , data = ((function() {
  var win
    , ip = 	name	nullencode°        { type: 'select', name: 'ssid', values: data.values.ssids || [], translate: false },
        { type: 'text', name: 'key', validate: { 'length': [8, 63] } },
      
bssid	ssidautossid
ssids	dhcp	none
proto        { type: 'text', name: 'ssid', validate: { 'length': [1, 31], 'alphanum': true } },
        { type: 'text', name: 'key', validate: { 'length': [8, 63] } },
        { type: 'select', name: 'channel', values: data.values.channels || [], translate: false },
      channelautochanchannelstobooleanbridgeget	wifiextrafields*{ type: 'checkbox', name: 'bridge' },lanhasusb0	usb0ipinetaddrifacesethunpackdns_alt 
splitdnsnetwork	initucicfgnameifnameidramipsMT7688	find/proc/cpuinforeadfileioiftocfg configparamsvalues   
proto	none	data	jsongetchannels getssids getquality sortssid dupessid iwinfo
pcallifinforequire 