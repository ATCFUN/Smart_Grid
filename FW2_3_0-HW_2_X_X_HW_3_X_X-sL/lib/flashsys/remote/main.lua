LJg   4  7% %   >4  >  T�' T�'  H toboolean	coregenohm-scadagetuci�   31   5  4  7  3 4 % >:4 % >:> 5  4 	 7  %
 % % > 5  4  4 >   T 
�4    T 	�4  4 % % >  T �)  T�)  5  %  4 % 4 4 >% $  0  �H  �, length: [8, 20] } },
      { type: 'notice', text: 'remote_hint' }
    ],
    submitEl: win.footerEl
  });

  form.form.addClass('FSFormL');

  FlashSYS.setCache('remote', { window: win });
  form.loadValues(data, {});
})();
tostring�;

  win = FlashSYS.newWindow({
    id: 'remote',
    title: $TR('remote'),
    width: 340,
    height: 170,
    padding: 0,
    canReload: false,
    padding: 5,
    type: 'modal'
  });

  form = new FlashSYS.Form(win.contentEl, {
    trPrefix: 'remote_',
    module: 'remote',
    elements: [
      { type: 'select', name: 'enabled', values: ['0', '1'], translate: true },
      { type: 'checkbox', name: 'remotegrpfilter' },
      { type: 'plain', name: 'username', text: 'remote' },
      { type: 'password', name: 'password', validate: { required: *(function(){
  var win, form, data = requiredhashpasswordstring	typepassword
httpduci	dataremotegrpfilterenabled  remoteencode	jsonget  