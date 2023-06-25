LJ�   %   H  �(function(){
  var mod = 'restore', els = FlashSYS.getCache(mod), win, form;

  if (!els) {
    win = FlashSYS.newWindow({
      id: mod,
      title: $TR(mod),
      width: 280,
      height: 90,
      padding: 5,
      canReload: false,
      type: 'modal'
    });

    form = new FlashSYS.Form(win.contentEl, {
      module: mod,
      saveModule: mod,
      saveAction: 'save',
      trPrefix: 'restore_',
      upload: true,
      callback: function(r) {
        FlashSYS.closeWindow('restore');

        if (r.toInt() == 1) {
          FlashSYS.endSession();
        }
        else {
          FlashSYS.notifyWindow($TR('restore_invalid'), 'error');
        }
      },
      elements: [
        { type: 'file', name: 'file', accept: '.gz,.tar' },
        { type: 'notice', text: 'restore_hint' }
      ],
      submitEl: win.footerEl
    });

    FlashSYS.setCache(mod, {
      window: win,
      form: form
    });
  }
})(); 