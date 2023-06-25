LJ�	   4   % ' > 5  %  4 74 >% $  H  �, els = FlashSYS.getCache('routes');

  if (!els) {
    win = FlashSYS.newWindow({
      id: 'routes',
      title: $TR('routes'),
      width: 500,
      height: 225,
      padding: 5
    });

    table = new FlashSYS.Table(win.contentEl, {
      trPrefix: 'routes_',
      tableHead: {
        iface: { width: 25 },
        dest: { width: 25 },
        gateway: { width: 25 },
        mask: { width: 25 }
      }
    });

    els = FlashSYS.setCache('routes', { window: win, table: table });
  }

  function toaddr(val) {
    var res = [], i, tmp;
    for (i = 0; i < 4; i++) {
      tmp = val.substr(i * 2, 2);
      tmp = parseInt(tmp, 16);
      if (!isNaN(tmp)) {
        res.unshift(tmp);
      }
    }

    return res.length == 4 ? res.join('.') : '';
  }

  for (i = 0; i < data.length; i++) {
    items = data[ i ].clean().split(' ');
    if (items.length == 11) {
      id = 'entry' + i.toString();
      values[ id ] = [
        items[ 0 ],
        toaddr(items[ 1 ]),
        toaddr(items[ 2 ]),
        toaddr(items[ 7 ])
      ];
    }
  }

  els.table.loadValues(values);
})();
encode	jsonG(function() {
  var win, table, i, items, id, values = {}, data = 	data/proc/net/routereadlines 