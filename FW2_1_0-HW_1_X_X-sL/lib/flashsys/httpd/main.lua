LJ�   "4   7  % >    T�2   5  3 
 3 4 7  T�% :4 7  T�% :	: 3 : 5  %  4 74 >% $  H  �;

  win = FlashSYS.newWindow({
    id: 'httpd',
    title: $TR('httpd'),
    width: 400,
    height: 100,
    padding: 5,
    canReload: false,
    type: 'modal'
  });

  form = new FlashSYS.Form(win.contentEl, {
    module: 'httpd',
    trPrefix: 'httpd_',
    elements: [
      { type: 'text', name: 'port', validate: { required: false, integer: [ 1024, 65535 ] } },
      { type: 'text', name: 'ports', validate: { required: false, integer: [ 1024, 65535 ] } },
      { type: 'notice', text: 'httpd_info' }
    ],
    submitEl: win.footerEl
  });

  FlashSYS.setCache('httpd', { window: win });
  form.loadValues(data.values, data.params);
})();encode	json+(function() {
  var win, form, data = 	dataparams id
httpdvalues  
portslisten_https	port  listen_httpcfghttpd.httpdget_alluci 