LJ�  Q4   7  % > 5  3  2  : 2  : 5  4     T�4  4 > D�4 7:	4 :BN�4 
 4 77> 5  4  4 >   T �4  	   T �4  7  '  : T �4  7  ' : 4  7  % > 5 5 5  4  '    T �4  7  4 4 4 >: T �4  7  % : 4  7  4 > 5  %  4 % $  H  �;

  win = FlashSYS.newWindow({
    id: 'vsftpd',
    title: $TR('vsftpd'),
    width: 400,
    height: 400,
    padding: 0,
    canReload: false,
    padding: 5,
    type: 'modal'
  });

  form = new FlashSYS.Form(win.contentEl, {
    trPrefix: 'vsftpd_',
    module: 'vsftpd',
    elements: [
      { type: 'plain', name: 'free' },
      { type: 'select', name: 'enabled', values: ['0', '1'], translate: true },
      { type: 'checkbox', name: 'force_ssl' },
      { type: 'text', name: 'port', validate: 'integer' },
      { type: 'plain', name: 'username', text: 'ftp' },
      { type: 'password', name: 'password_ftp', validate: { required: false, password: true }, title: $TR('vsftpd_password'), noTranslate: true },
      { type: 'plain', name: 'username', text: 'apps' },
      { type: 'password', name: 'password_apps', validate: { required: false, password: true }, title: $TR('vsftpd_password'), noTranslate: true },
      { type: 'text', name: 'pasv_address', validate: { required: false, ip: true } },
      { type: 'text', name: 'pasv_min_port', validate: { required: false, integer: [ 1024, 65535 ] } },
      { type: 'text', name: 'pasv_max_port', validate: { required: false, integer: [ 1024, 65535 ] } },
      { type: 'notice', text: 'vsftpd_hint' }
    ],
    submitEl: win.footerEl
  });

  form.form.addClass('FSFormL');

  FlashSYS.setCache('vsftpd', { window: win });
  form.loadValues(data.values, data.params);
})();
*(function(){
  var win, form, data = 	dataencode	json?fmtfssize
total	free
bsize
/datastatfsionumber	typeforce_ssltonumberid
pairsconfigparamsvalues  cfgvsftpd	inituci  