LJ�   %   H  �(function(){
  if (confirm($TR('shutdown_confirm'))) {
    FlashSYS.load({
      module: 'shutdown',
      action: 'shutdown'
    });
    FlashSYS.endSession();
  }
})();
 