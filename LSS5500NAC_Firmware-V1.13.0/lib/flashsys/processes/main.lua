LJ�
 	 C2   5   %  5  4  4 74 >  T�2  > T+�4  > T�'  '  T"�4 74  % $>5	 4
 4	 > T�4	  '   T�4	  7% % >5	 4  4    2 ;4	 ;9AN�%  4 74  >% $  H  �    , icon = { cls: 'Icon Delete', title: $TR('title_delete') }
    , els = FlashSYS.getCache('processes'), pid, cmd, i;

  FlashSYS.setReloader('processes');

  if (!els) {
    win = FlashSYS.newWindow({
      id: 'processes',
      title: $TR('processes'),
      width: 640,
      height: 420,
      padding: 5
    });

    table = new FlashSYS.Table(win.contentEl, {
      trPrefix: 'processes_',
      tableHead: {
        'pid': { width: 15 },
        'cmd': { width: 75 },
        'delete': { width: 10, blank: true, confirm: 'processes_confirm', params: { module: 'processes', action: 'delete', reload: 'processes' } }
      }
    });

    els = FlashSYS.setCache('processes', { window: win, table: table });
  }

  for (i = 0; i < data.length; i++) {
    pid = data[ i ][ 0 ], cmd = data[ i ][ 1 ];
    values[ pid ] = [ pid, cmd, icon ];
  }

  els.table.loadValues(values);
})();
encode	json9(function() {
  var win, table, values = {}, data =  %z+	gsubstring	typecmdline/cmdlinereadfiletonumberlsioipairs	base/proc/	data 