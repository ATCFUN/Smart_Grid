LJ�   %   H  �(function(){
  var win = FlashSYS.newWindow({
    id: 'about',
    title: $TR('about'),
    width: 300,
    height: 75,
    padding: 5,
    canReload: false,
    type: 'modal'
  });

  $('Copyright').clone().inject(win.contentEl).removeClass('Hidden');
})();
 