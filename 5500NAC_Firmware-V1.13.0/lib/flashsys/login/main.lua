LJ�   4   >    T�%  5  %  4   T�% % $  H  �    ],
    trPrefix: 'login_',
    submitEl: win.footerEl,
    callback: function(r) {
      if (JSON.decode(r)) {
        window.location = '/logout';
      }
      else {
        FlashSYS.stopLoading();
        form.elemWraps.set_password.addClass('FSFormError');
      }
    }
  });

  FlashSYS.setCache('login', { window: win });
  form.loadValues({}, { id: 'httpd' });
})();
�(function() {
  var win, form;

  win = FlashSYS.newWindow({
    id: 'login',
    title: $TR('login'),
    width: 400,
    height: 180,
    padding: 5,
    canReload: false,
    type: 'modal'
  });

  form = new FlashSYS.Form(win.contentEl, {
    module: 'login',
    elements: [
      { type: 'plain', name: 'login', text: 'admin' },
      { type: 'password', name: 'set_password', validate: { required: true } },
      { type: 'password', name: 'admin_password', validate: { required: true, password: true, match: ['admin_password_rpt', 'validate_password_match'] } },
      { type: 'password', name: 'admin_password_rpt' }	warn/, { type: 'notice', text: 'login_notice' }isdfltpass 