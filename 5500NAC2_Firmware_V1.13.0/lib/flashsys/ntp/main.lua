LJ�   J4   7  % % % > 5  4   7  % % % > 5  4   7  % % % > 5  3 	 4  T�'  T�' : 4
 4 >  T�' T�'  : 5  4  4 >   T �4    7  % > 5  4  4 >   T �4  4 > T�4 %  $9AN�%  4 74 >% $  H  �;

  win = FlashSYS.newWindow({
    id: 'ntp',
    title: $TR('ntp_form'),
    width: 340,
    height: 185,
    padding: 5,
    canReload: false,
    type: 'modal'
  });

  form = new FlashSYS.Form(win.contentEl, {
    trPrefix: 'ntp_',
    module: 'ntp',
    saveModule: 'ntp',
    submitEl: win.footerEl,
    elements: [
      { type: 'select', name: 'enable_client', values: ['0', '1'], translate: true,
        blocks: {
          def: { servers: 0 },
          change: { '1': { servers: 1 } }
        }
      },
      { type: 'blockStart', name: 'servers' },
        { type: 'text', name: 'server_1', validate: 'required' },
        { type: 'text', name: 'server_2' },
        { type: 'text', name: 'server_3' },
        { type: 'text', name: 'server_4' },
      'blockEnd',
      { type: 'select', name: 'enable_server', values: ['0', '1'], translate: true },
    ]
  });

  FlashSYS.setCache('ntp', { window: win });
  form.loadValues(data, {});
})();
encode	json*(function(){
  var win, form, data = server_ipairs
table 
splitstring	typevaluestoboolean  0serversserverenable_serverenable_clientntpsystemgetuci 