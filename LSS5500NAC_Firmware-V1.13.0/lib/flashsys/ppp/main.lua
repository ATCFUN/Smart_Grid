LJ�   U4   % > 4  > 7  5  4     T�4  7  5  4  7  % > 5  3 	 2  :
 2  : 5  4     T�4  4 > D�4 7:4 :
BN�4  7  % % % > 5  4     T�4    7  % > 5  4     '   T 	�4  7 
 4 7
4 4 >:: %  4 74 >% 4 74   T�4 7>% $  H  �
  win = FlashSYS.newWindow({
    id: 'ppp',
    title: $TR('ppp'),
    width: 400,
    height: 315,
    padding: 0,
    canReload: false,
    padding: 5,
    type: 'modal'
  });

  form = new FlashSYS.Form(win.contentEl, {
    trPrefix: 'ppp_',
    module: 'ppp',
    elements: [
      { type: 'plain', name: 'ip', noTranslate: true, title: $TR('interfaces_currip'), text: ip || $TR('unknown') },
      { type: 'select', name: 'enabled', values: ['0', '1'], translate: true },
      { type: 'text', name: 'apn' },
      { type: 'text', name: 'pincode' },
      { type: 'text', name: 'dialnumber' },
      { type: 'text', name: 'username' },
      { type: 'text', name: 'password' },
      { type: 'text', name: 'dns', noTranslate: true, title: $TR('interfaces_dns'), validate: { required: true, ip: true } },
      { type: 'text', name: 'dns_alt', noTranslate: true, title: $TR('interfaces_dns_alt'), validate: { required: false, ip: true } },
      { type: 'notice', text: 'ppp_hint' }
    ],
    submitEl: win.footerEl,
    reboot: true
  });

  FlashSYS.setCache('ppp', { window: win });
  form.loadValues(data.values, data.params);
})();
	null    , ip = encode	json4(function(){
  var win
    , form
    , data = unpackdns_alt 
splitdnslannetworkgetid
pairs	dataparamsvalues  cfgppp	inituciipinetaddr	ppp0ifinforequire 