LJ�   %   H  �(function() {
  var win, form;

  function check(val, hdr) {
    return val.indexOf('BEGIN ' + hdr) > 0 && val.indexOf('END ' + hdr) > 0;
  }

  function checkkey(val) {
    var res = check(val, 'RSA PRIVATE KEY') || check(val, 'PRIVATE KEY');
    return res ? null : $TR('httpd_crt_error');
  }

  function checkcrt(val) {
    return check(val, 'CERTIFICATE') ? null : $TR('httpd_crt_error');
  }

  win = FlashSYS.newWindow({
    id: 'httpd_crt',
    title: $TR('httpd_crt'),
    width: 500,
    height: 410,
    padding: 5,
    canReload: false,
    type: 'modal'
  });

  form = new FlashSYS.Form(win.contentEl, {
    module: 'httpd_crt',
    trPrefix: 'httpd_crt_',
    elements: [
      { type: 'select', name: 'mode', values: [ 'set', 'regen' ], translate: true,
        blocks: {
          def: { crts: true },
          change: { regen: { crts: false } }
        }
      },
      { type: 'blockStart', name: 'crts' },
        { type: 'textarea', name: 'key', rows: 10, validate: { custom: checkkey } },
        { type: 'textarea', name: 'crt', rows: 10, validate: { custom: checkcrt } },
      'blockEnd',
    ],
    submitEl: win.footerEl,
    callback: function(r) {
      r = JSON.decode(r);

      if (r.res) {
        FlashSYS.closeWindow('httpd_crt');
        FlashSYS.addChange({ reboot: true });
      }
      else {
        FlashSYS.stopLoading();

        if (r.err.indexOf('key') >= 0) {
          form.elemWraps.key.addClass('FSFormError');
        }

        if (r.err.indexOf('crt') >= 0) {
          form.elemWraps.crt.addClass('FSFormError');
        }
      }
    }
  });

  FlashSYS.setCache('httpd_crt', { window: win });
})(); 