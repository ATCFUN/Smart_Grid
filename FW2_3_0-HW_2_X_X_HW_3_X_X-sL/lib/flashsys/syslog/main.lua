LJ�   4   % > 5  4  7  % >    T�%  T�%  5  % 	 4
 74 >% 4 % $  H  �'),
      width: 600,
      height: 400,
      padding: 5
    });

    table = new FlashSYS.Table(win.contentEl, {
      tableHead: { entry: { width: 100 } }
    });

    table.tableHead.addClass('Hidden');

    els = FlashSYS.setCache('syslog', { window: win, table: table });
  }

  for (i = data.length - 1; i >= 0; i--) {
    var log = data[ i ];
    if (log) {
      values[ 'entry' + i ] = [ log ];
    }
  }

  els.table.loadValues(values);
})();
�, els = FlashSYS.getCache('syslog');

  FlashSYS.setReloader('syslog');

  if (!els) {
    win = FlashSYS.newWindow({
      id: 'syslog',
      title: $TR('encode	json<(function() {
  var i, win, table, values = {}, data = 
titlesyslogsyslog_full/lib/cbusexistsio	datalogread | tail -n 50readproclines 