LJ�   %   H  �(function() {
  var win = FlashSYS.newWindow({
    id: 'packages_form',
    title: $TR('packages_form'),
    width: 280,
    height: 80,
    padding: 5,
    canReload: false,
    type: 'modal'
  });

  new FlashSYS.Form(win.contentEl, {
    module: 'packages_form',
    saveModule: 'packages',
    saveAction: 'save',
    trPrefix: 'packages_',
    elements: [
      { 'type': 'file', 'name': 'uploadfile', 'accept': '.ipk' }
    ],
    upload: true,
    callback: function(r) {
      var d = JSON.decode(r), ok = d.stat === 0;
      d.data.push($TR('done'));
      FlashSYS.closeWindow('packages_form');
      FlashSYS.notifyWindow(d.data, ok ? null : 'error');
      if (ok) {
        FlashSYS.addChange({ reboot: true });
      }
    },
    submitEl: win.footerEl,
    reload: 'packages'
  });

  FlashSYS.setCache('packages_form', { window: win });
})();
 