LJD+  +    4  7  C =9G   �formatstring�   .7  4 % 7   T�% >7   T�4 % 7 >7   T�4 % 7 >4 %	 7
   T�% >4  > T�4 % 4 7 % > =4 % >G  ; concatIP: %s
tablestatusStatus: %sType: %s	typeName: %s	name?	nwidNetwork: %s	pushassignedAddresses� 
  )2   4  7% >4 7 > 4  > T�% 0 �1 5	 1
 5 4  >T�4 4 	 >AN�  )  9 4 7  % 0  �@ H 
concat
pcallipairsparsenet 	push 
table	typepdecode	jsonBzerotier-cli -D/var/lib/zerotier-one_default/ -j listnetworksreadprocio�   O4   7  % % % > 5  4   7  % % % > 5  4   7  % % % > 5  3 	 4  T�'  T�' : 4
 4 >  T�'	': 5  4  4 >   T �4    7  % > 5  4  4 >   T �4  4 > T�4 %  $9AN�1  5  4  4 >: %  4 74 >% $  0  �H  �, stat;

  win = FlashSYS.newWindow({
    id: 'zerotier',
    title: $TR('zerotier'),
    width: 340,
    height: 285,
    padding: 5,
    canReload: false,
    type: 'modal'
  });

  form = new FlashSYS.Form(win.contentEl, {
    trPrefix: 'zerotier_',
    module: 'zerotier',
    saveModule: 'zerotier',
    submitEl: win.footerEl,
    elements: [
      { type: 'select', name: 'enabled', values: ['0', '1'], translate: true },
      { type: 'text', name: 'join_1' },
      { type: 'text', name: 'join_2' },
      { type: 'text', name: 'join_3' },
      { type: 'text', name: 'join_4' },
      { type: 'text', name: 'port', validate: { required: true, integer: [ 1024, 65535 ] } },
      { type: 'textarea', name: 'status' }
    ]
  });

  FlashSYS.setCache('zerotier', { window: win });
  form.loadValues(data, {});

  form.elemWraps.status.addClass('FullRow');
  stat = form.elements.status;
  stat.readOnly = true;
  stat.setStyles({
    height: 70,
    background: 'transparent',
    border: 'none',
    padding: 0
  });
})();
encode	json*(function(){
  var win, form, data = statusgetstatus 
join_ipairs
table 
splitstring	typevaluestonumber  0
joins	join	portenableddefaultzerotiergetuci 