LJ   W4   % > 4  4  % > 4  % > 5  4  7     T4  7     T4  7  4 77: 4  7  4 77	:	 4  )  : 4  7 
    T)4     T&4  7  7  %
 > 5  4    T 4  7  7  %
 > 5  4  4 > 5  4  7 
 4 7
7  T4 4 >: T 4    T 4  7 
 % : %  4 74 >% $  H  , function(stat, name) {
    if (name.match(/^(eth|wlan)/)) {
      vals[ name ] = {
        cls: (stat.up ? '' : 'Inactive'),
        cells: [
          name,
          stat.hw,
          stat.inetaddr,
          stat.mtu,
          stat.txbytes,
          stat.rxbytes,
          (stat.txerr + ' / ' + stat.rxerr),
          icon
        ]
      }
    }
  });

  els.table.loadValues(vals);
})();
encode	json(function(){
  var els = FlashSYS.getCache('interfaces'), vals = {}, win, table
    , icon = { cls: 'Icon Usage', title: $TR('title_usage') };

  FlashSYS.setReloader('interfaces');

  if (!els) {
    win = FlashSYS.newWindow({
      id: 'interfaces',
      title: $TR('interfaces'),
      width: 700,
      height: 250,
      padding: 5
    });

    table = new FlashSYS.Table(win.contentEl, {
      trPrefix: 'interfaces_',
      setLoading: true,
      params: { module: 'interfaces', action: 'form' },
      tableHead: {
        name: { width: 15 },
        mac: { width: 15 },
        ipaddr: { width: 15 },
        mtu: { width: 10 },
        txbytes: { width: 15, axis: 'number', callback: formatSize },
        rxbytes: { width: 15, axis: 'number', callback: formatSize },
        errors: { width: 10 },
        usage: { width: 5, blank: true, params: { module: 'interfaces', action: 'usage', noEncode: true } }
      }
    });

    els = FlashSYS.setCache('interfaces', { window: win, table: table });
  }

  $each(-Mastertobooleanupmac	nextresassoclistClient	modenl80211
wlan0mtuinetaddrbr0	eth0	dataethiwinfo
pcallifinforequire 