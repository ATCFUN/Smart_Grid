LJ:   4    >T T) H ANúG  ipairs=     7  > 7 >  T) T) H 
lower  7  7 )  4  > T4  > T	'   T4 7! > H 
floor	mathnumber	typequality_maxqualityÈ  ^* 2  2  4	   	 T	H 4	  7		7		
  >		   T	H 4	 
 >	T#7 T 4 7>% 4 7	>$4
   >  T  94  >   T	4 7 6  T'  >9ANÛ4	 7		
 4 >	'  4	 
 >	T 7' 'íÿ> 6  T	 %  % $ T  2 ;;9ANè	 
 F	 %) (signal: subsortssid	sort
tablemax	mathgetqualitydupessid
bssid 	ssidtostringMaster	modeipairsscanlistnl80211iwinfod   4  7% >4  >D7  TH BNúG  ifname
pairsnetworkget_alluci   : ¾4   % > 4  4  % > 1  5  1  5  1  5 	 1 
 5  4  7  >    T2   5  3  3 : 2  : 5  1  5  4  7     Tp4  7  5  4  4 > 5  4     T4  7  % 4 > 5  4  7  4 : T 2   5  4  7     T4  7    7  % > 5  4     '   T 4  4 4 4 >:: 4  7  4 : 4  %  > 5 ! 4 ! 4 6     T4 ! 4 6  7 " 5 # 4 ! 7 $ 5 % 4   & T '4  7 '    T 4  7 '  ( T 4  %) :' 4  4 4 >5+ :* 4  7 ,    T4  7 -    T	4  4 7,% 4 7-$:, T 4  4+ :, % . 5 / 4  4 : 4  7 0 4#   T4 71> 5 # 4  7 0 4   T%2 > 5 3 4  7 0 4 > 5  % 4 4# %5 4 %6 43 %7 4%   T' T'  %8 4	/  	 T
%	2 %
9 $ 
 0  H        { type: 'select', name: 'proto', values: ['static', 'dhcp'], translate: true,
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
      { type: 'text', name: 'mtu', cls: 'w20p' }
    ],
    submitEl: win.footerEl,
    reboot: true
  });

  FlashSYS.setCache('interfaces_form', { window: win });
  form.loadValues(data.values, data.params);
})();
Û && ip.match(/^192\.168\.254/)) {
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
    , ip = 	name	nullencodeextrafieldsª      { type: 'select', name: 'ssid', values: data.values.ssids || [], translate: false },
      { type: 'text', name: 'key', validate: { 'length': [8, 63] } },
    
bssid	ssidautossid
ssids	dhcp	none
proto	wifihasusb0	usb0ipinetaddrifacesethunpackdns_alt 
splitdnsnetwork	initucicfgnameifnameidiftocfg configparamsvalues   
proto	none	data	jsongetssids getquality sortssid dupessid iwinfo
pcallifinforequire 