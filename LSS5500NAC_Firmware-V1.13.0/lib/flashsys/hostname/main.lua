LJ�   )4   7  % >    T�2   5  3  2  : 2  : 5  4  4 > D�4 7:	7
  T�4 77
:
T �BN�4  7  4 > 5  %  4 % $  H  �;

  win = FlashSYS.newWindow({
    id: 'hostname',
    title: $TR('hostname'),
    width: 280,
    height: 80,
    padding: 5,
    canReload: false,
    type: 'modal'
  });

  form = new FlashSYS.Form(win.contentEl, {
    module: 'hostname',
    elements: [
      {
        type: 'text',
        name: 'hostname',
        validate: { regexp: /^[a-z0-9][-_a-z0-9]{0,50}[a-z0-9]$/i }
      }
    ],
    submitEl: win.footerEl,
    reboot: true
  });

  FlashSYS.setCache('hostname', { window: win });
  form.loadValues(data.values, data.params);
})();
*(function(){
  var win, form, data = 	dataencode	jsonhostnameid
pairsconfigparamsvalues  cfgsystem	inituci 