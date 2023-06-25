LJ�   &4   7  % > 5  4  4 7>    T�'   5  4  '    T �4  '   T �4  ' : 4  7  3 4 :3	 :
> 5  %  4 % $  H  �
;

  win = FlashSYS.newWindow({
    id: 'bacnet',
    title: $TR('bacnet'),
    width: 450,
    height: 350,
    canReload: false,
    padding: 5,
    type: 'modal'
  });

  form = new FlashSYS.Form(win.contentEl, {
    module: 'bacnet',
    elements: [
      { type: 'checkbox', name: 'enabled' },
      { type: 'text', name: 'devid', validate: { 'integer': [ 1, 4194302 ] } },
      { type: 'text', name: 'devname', validate: { 'length': [ 0, 250 ] } },
      { type: 'text', name: 'password', validate: { 'length': [ 5, 16 ] } },
      { type: 'text', name: 'priority', integer: [ 1, 16 ] },
      { type: 'checkbox', name: 'oldname' },
      { type: 'checkbox', name: 'commdescr' },
      { type: 'checkbox', name: 'parseunits' },
      { type: 'text', name: 'port', validate: { 'required': false, 'integer': [ 1024, 65535 ] } },
      { type: 'text', name: 'bbmd_ip', validate: { 'required': false, 'ip': true } },
      { type: 'text', name: 'bbmd_port', validate: { 'required': false, 'integer': [ 1024, 65535 ] } },
      { type: 'text', name: 'bbmd_ttl', validate: { 'required': false, 'integer': [ 1, 60000 ] } }
    ],
    trPrefix: 'bacnet_',
    submitEl: win.footerEl
  });

  form.form.addClass('FSFormL');

  FlashSYS.setCache('bacnet', { window: win });

  form.loadValues(data.values, data.params);
})();
*(function(){
  var win, form, data = 	dataparams idserver  encode	jsonprioritytonumbervaluesbacnet.serverget_alluci 