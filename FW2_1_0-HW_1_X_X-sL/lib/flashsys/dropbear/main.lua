LJ�   04   7  % >    T�2   5  3  2  : 2  : 5  4  4 > D	�4 7:	4  T�2  :T �BN�4  7  7 
    T �4  7  '  :
 4  7  4 > 5  %  4 % $  H  �;

  win = FlashSYS.newWindow({
    id: 'dropbear',
    title: $TR('dropbear'),
    width: 280,
    height: 80,
    padding: 5,
    canReload: false,
    type: 'modal'
  });

  form = new FlashSYS.Form(win.contentEl, {
    module: 'dropbear',
    elements: [
      { type: 'select', name: 'enable', translate: true, values: [ ['0', 'disabled'], ['1', 'enabled'] ] },
      { type: 'notice', text: 'dropbear_notice' }
    ],
    trPrefix: 'dropbear_',
    submitEl: win.footerEl
  });

  FlashSYS.setCache('dropbear', { window: win });
  form.loadValues(data.values, data.params);
})();
*(function(){
  var win, form, data = 	dataencode	jsonenableid
pairsconfigparamsvalues  cfgdropbearget_alluci 