LJ�   %   H  �(function(){
  if (confirm($TR('reboot_confirm'))) {
    FlashSYS.load({
      module: 'reboot',
      action: 'reboot'
    });
    FlashSYS.endSession();
  }
})();
 