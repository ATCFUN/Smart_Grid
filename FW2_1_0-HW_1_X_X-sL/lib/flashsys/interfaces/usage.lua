LJ�  
4   % > 5  4  4 >   T �4     	   T �G  4  7  4 > 5  %  4 %	 $  H  �, id = 'interfaces_usage_' + name, win;

  if (!FlashSYS.getCache(id)) {
    win = FlashSYS.newWindow({
      id: id,
      title: $TR('interfaces_usage') + ' ' + name,
      width: 500,
      height: 275,
      padding: 5,
      resizable: false,
      canReload: false
    });

    new Element('object', {
      data: '/flashsys/ifstats.svg' + '?' + name,
      width: 500,
      height: 260,
      type: 'image/svg+xml'
    }).inject(win.contentEl);

    FlashSYS.setCache(id, { window: win });
  }
})();
 (function() {
  var name = 	nameencode	jsonstring	typeifname	datapostvar  