LJ�   4   % ' > 5  %  4 74 >% $  H  �, i, items, id;

  if (!els) {
    win = FlashSYS.newWindow({
      id: 'arp',
      title: $TR('arp'),
      width: 500,
      height: 225,
      padding: 5
    });

    table = new FlashSYS.Table(win.contentEl, {
      trPrefix: 'arp_',
      tableHead: {
        'iface': { width: 25 },
        'ip': { width: 25 },
        'mask': { width: 25 },
        'mac': { width: 25 },
      }
    });

    els = FlashSYS.setCache('arp', {
      window: win,
      table: table
    });
  }

  for (i = 0; i < data.length; i++) {
    items = data[ i ].clean().split(' ');

    if (items.length == 6) {
      id = 'entry' + i.toString();
      values[ id ] = [ items[ 5 ], items[ 0 ], items[ 4 ], items[ 3 ] ];
    }
  }

  els.table.loadValues(values);
})();
encode	jsonX(function(){
  var els = FlashSYS.getCache('arp'), win, table, values = {}, data = 	data/proc/net/arpreadlines 