LJ� 7* 4  7  >T.� 7%	 '
 ) >	  T	� 7'		 > 7> T� 7%	 '
 ) >	  T� 7'		 > 7>   T�  T	�+  +    2	 ;	;	9	T�AN�G   �Version: 	trimsubPackage: 	find
linesio�
   %2   %  1 4 4 7 >  T�2  >T�	 7%
 ' ) >  T	� 	 
 $	
	>AN�% 4 7	  >%
 $0  �H �, els = FlashSYS.getCache('packages')
    , icon = { cls: 'Icon Delete', title: $TR('title_delete') };

  if (!els) {
    win = FlashSYS.newWindow({
      id: 'packages',
      title: $TR('packages'),
      width: 640,
      height: 420,
      padding: 5
    });

    FlashSYS.Control.addButton(win.footerEl, {
      params: { module: 'packages', action: 'form' },
      cls: 'Add',
      title: $TR('packages_form')
    });

    table = new FlashSYS.Table(win.contentEl, {
      trPrefix: 'packages_',
      sortable: true,
      sortBy: 'package',
      tableHead: {
        'package': { width: 50 },
        'version': { width: 40 },
        'delete':  { width: 10, blank: true, confirm: 'del_confirm', params: { module: 'packages', action: 'delete', reload: 'packages' } }
      }
    });

    els = FlashSYS.setCache('packages', { window: win, table: table });
  }

  for (i = 0; i < data.length; i++) {
    items = data[ i ];
    items.push(icon);
    values[ items[ 0 ] ] = items;
  }

  els.table.loadValues(values);
})();
encode	jsonB(function(){
  var win, table, i, items, values = {}, data = .control	findlsioipairs /usr/lib/opkg/info/ 