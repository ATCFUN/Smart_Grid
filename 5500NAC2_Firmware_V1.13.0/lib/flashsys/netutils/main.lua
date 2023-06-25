LJ�   %   H  �(function(){
  var win, tabs, elem, i, action;

  if (!FlashSYS.getCache('netutils')) {
    win = FlashSYS.newWindow({
      id: 'netutils',
      title: $TR('netutils'),
      padding: 0,
      width: 600,
      height: 350
    });

    function endcb(result, params) {
      if (params.elem) {
        params.elem
          .removeClass('NetUtilsLoading')
          .store('lock', false)
          .set('html', result.replace(/\n/g, '<br>'));
      }
    };

    function startcb(values, params) {
      var elem = params.elem;
      if (!elem || elem.retrieve('lock')) {
        return;
      }

      elem.empty()
        .addClass('NetUtilsLoading')
        .store('lock', true);

      values.action = params.action;

      FlashSYS.load({
        module: 'netutils',
        action: 'run',
        data: values,
        exec: false,
        elem: elem,
        success: endcb
      });
    };

    tabs = new FlashSYS.Tabs(win.contentEl, {
      tabs: ['ping', 'traceroute'],
      trPrefix: 'netutils_',
      footerEl: win.footerEl
    });

    for (i = 0; i < 2; i++) {
      action = i ? 'trace' : 'ping';

      elem = new Element('div', {
        'class': 'NetUtilsResult'
      }).inject(tabs.getPanel(i));

      new FlashSYS.Form(tabs.getPanel(i), {
        module: 'netutils',
        elements: [
          { type: 'text', name: 'ip', validate: { required: true, regexp: /^[-0-9a-zA-Z\.]+$/ } }
        ],
        trPrefix: 'netutils_',
        skipAutoSize: true,
        submit: startcb,
        submitParam: {
          elem: elem,
          action: action
        },
        submitEl: tabs.getFooter(i)
      });
    }

    FlashSYS.setCache('netutils', { window: win });
  }
})();
 