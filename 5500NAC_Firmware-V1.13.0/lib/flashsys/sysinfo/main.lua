LJ'    8 8  T�) T�) H �+  ?�2   5   4  4 7% >  T�2  > T� 7% >  T
�4  4    3 % 	 $	;9AN�% 	 5 
 4  4 74
 >  T�2  > T:� 7% >  T� 7% >  T.�4
  % $5 4 74 % $>  T�% 5 4 74 % $>  T�% 5 4  4    2 % 	 $	;4 	 7>%	 4
 
 7

>
$
;9AN�4  7  4  1 > 2   5  4  7  % > T@�4  7% > = 5  5! 4    T5�4 7"4  >5# 5$ 5% 4% '   T*�4% 4$ 5& 4' 7(4& 4% !>5) 4 4   2 4! ;4* 4% 4	# >;4* 4& 4	# >%+ 4	) %
, $
;4* 4$ 4	# >;4  ;9AN�4 - 7 . 31 4/ %0 >:24/ %3 >:44 :4 7%5 >:64 7%7 >:84 7%9 >::4  :;> 5 < % = 4< %> $  0  �H  �;
  FlashSYS.setReloader('sysinfo');

  if (!els) {
    win = FlashSYS.newWindow({
      id: 'sysinfo',
      title: $TR('sysinfo'),
      width: 450,
      height: 280
    });

    tabs = new FlashSYS.Tabs(win.contentEl, {
      tabs: ['general', 'memory', 'partitions', 'serial'],
      trPrefix: 'sysinfo_'
    });

    tables.gen = new FlashSYS.Table(tabs.getPanel(0), {
      tableHead: {
        param: { width: 40 },
        value: { width: 60 }
      }
    });

    tables.gen.tableHead.addClass('Hidden');

    tables.mem = new FlashSYS.Table(tabs.getPanel(1), {
      tableHead: {
        param: { width: 40 },
        value: { width: 60 }
      }
    });

    tables.mem.tableHead.addClass('Hidden');

    tables.part = new FlashSYS.Table(tabs.getPanel(2), {
      trPrefix: 'sysinfo_',
      tableHead: {
        fs: { width: 20 },
        size: { width: 20 },
        used: { width: 20 },
        free: { width: 20 },
        mount: { width: 20 }
      }
    });

    tables.serial = new FlashSYS.Table(tabs.getPanel(3), {
      trPrefix: 'sysinfo_',
      tableHead: {
        name: { width: 25 },
        description: { width: 75 }
      }
    });

    els = FlashSYS.setCache('sysinfo', { window: win, tables: tables });
  }

  values = {};
  info = {};

  for (i = 0; i < data.cpuinfo.length; i++) {
    items = data.cpuinfo[ i ].clean().split(' : ');
    values[ items[ 0 ].replace(/\W/, '').toLowerCase() ] = items[ 1 ];
  }

  if (values.system_type) {
    info.system = [ $TR('sysinfo_system'), values.system_type ];
  }
  else if (values.machine) {
    info.system = [ $TR('sysinfo_system'), values.machine ];
  }

  if (values.vendorid) {
    info.vendorid = [ $TR('sysinfo_vendor'), values.vendorid ];
  }

  if (values.modelname) {
    info.model = [ $TR('sysinfo_model'), values.modelname ];
  }
  else if (values.cpu) {
    info.model = [ $TR('sysinfo_model'), values.cpu ];
  }
  else if (values.cpumodel) {
    info.model = [ $TR('sysinfo_model'), values.cpumodel ];
  }

  if (values.cpumhz) {
    info.cpumhz = [ $TR('sysinfo_cpumhz'), values.cpumhz ];
  }

  if (values.clock) {
    info.clock = [ $TR('sysinfo_clock'), values.clock ];
  }

  info.kernel = [ $TR('sysinfo_kernel'), data.kernel ];

  if (data.uptime) {
    i = data.uptime.split(' ').shift();
    items = [
      Math.floor(i / 86400).toString(),
      Math.floor((i % 86400) / 3600).toString(),
      Math.floor((i % 3600) / 60).toString()
    ];

    info.uptime = [ $TR('sysinfo_uptime'), items[ 0 ] + $TR('dt_day') + ' ' + items[ 1 ]  + $TR('dt_hour') + ' ' + items[ 2 ]  + $TR('dt_min') ];
  }

  info.loadavg = [ $TR('sysinfo_loadavg'), data.loadavg ? data.loadavg.split(' ').slice(0, 3).join(' ') : '' ];
  els.tables.gen.loadValues(info);

  values = {};

  for (i = 0; i < data.meminfo.length; i++) {
    items = data.meminfo[ i ].clean().split(' ');
    values[ items[ 0 ].replace(/\W/, '').toLowerCase() ] = parseInt(items[ 1 ], 10);
  }

  if (!isNaN(values.memtotal) && !isNaN(values.memfree) && !isNaN(values.buffers) && !isNaN(values.cached) && !isNaN(values.shmem)) {
    used = values.memtotal - values.memfree - values.buffers - values.cached + values.shmem;
    free = values.memtotal - used;

    usedp = Math.round(used / values.memtotal * 100);
    freep = 100 - usedp;

    function tomeg(v) {
      return (v / 1024).toFixed(1) + 'M';
    }

    els.tables.mem.loadValues({
      total: [ $TR('sysinfo_memtotal'), tomeg(values.memtotal) ],
      used: [ $TR('sysinfo_memused'), tomeg(used) + ' (' + usedp + '%)' ],
      free: [ $TR('sysinfo_memfree'), tomeg(free) + ' (' + freep + '%)' ],
      buffers: [ $TR('sysinfo_membuffers'), tomeg(values.buffers) ],
      cached: [ $TR('sysinfo_memcached'), tomeg(values.cached) ]
    });
  }

  values = {};

  for (i = 0; i < data.partitions.length;  i++) {
    items = data.partitions[ i ];
    if (items.length == 5) {
      id = 'entry' + i.toString();
      values[ id ] = items;
    }
  }

  els.tables.part.loadValues(values);
  els.tables.serial.loadValues(data.serial);
})();
�(function() {
  var win, tabs, tables = {}, values, info, i, items, used, free, usedp, freep, els = FlashSYS.getCache('sysinfo'), data = 	dataserialloadavg/proc/loadavgkernel/proc/sys/kernel/osreleaseuptime/proc/uptimememinfo/proc/meminfocpuinfo  /proc/cpuinforeadlinesencode	json%) (fmtfssizeusedpc
floor	math	used
total	free
bsizestatfs
ftypefmount 
splitunpack/proc/mounts
linespartitions 	sort
table - 	trimprproductmnUnknownmanufacturerreadfile	path/../../ttyACMttyUSB	base!/sys/bus/usb-serial/devices/   
/dev/RS	find	/devlsioipairs
ports����� 