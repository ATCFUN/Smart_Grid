LJ�  ! M4   7  % >    T�2   5  3  3 4 7  T�% :4 7  T�% :	4
 4 7>  T�'  :: 3 : 5  4   7  % % % > 5  4  4 >   T �4    7  % > 5  4  4 >   T �4  4 > T�4 7%  $9AN�%  4 74 >%  $  H  �;

  win = FlashSYS.newWindow({
    id: 'httpd',
    title: $TR('httpd'),
    width: 400,
    height: 235,
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
      { type: 'select', name: 'force_https', values: [ '0', '1', '2' ], translate: true },
      { type: 'notice', text: 'httpd_info' },
      { type: 'text', name: 'cors_1' },
      { type: 'text', name: 'cors_2' },
      { type: 'text', name: 'cors_3' },
      { type: 'text', name: 'cors_4' }
    ],
    submitEl: win.footerEl
  });

  FlashSYS.setCache('httpd', { window: win });
  form.loadValues(data.values, data.params);
})();encode	json+(function() {
  var win, form, data = 
cors_ipairs
table 
splitstring	type	corshttp_cors	coregenohm-scadaget	dataparams id
httpdvalues  force_httpstonumber
portslisten_https	port  listen_httpcfghttpd.httpdget_alluci 