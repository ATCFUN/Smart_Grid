LJ~    4   7  % >    T%  4  7% >  T% F  /tmp/eibd-stats/totals/tmp/eibd-stats/hourlyreadfileioβ .* +  6   T+  3  9  7% >  	  T' T 	 T'  TG  ' ' ' I4	 
6

>		 T
'  +	  6	 	+
  6
 
6



9
	Kρ)  F tonumber 
split       
?  
4  7  >  4  7'd   @ min	ceil	mathΘ° 	* 4    > T+  6 T  88 4 7'<  >!4  > 4 7  >H insert
table
roundmax	mathstring	typeΘί  )€*  4  % >7% ' 1 >   4 7% > 7%	 >84
 74  >  T' > 2  1 5 1 5 1 5 4 %  >2  :  7 % >  '  5 4   >TA4
 % 	 >
5 5
 4
  
 T84
 
 
5
 4
 7

4 ' >
5
 4
 4 '< >
5
 4
 8

4 8

5
 4
 '  
 T
4
 4 84 !>
5
 4
 7
 
7' 2 4 ;4 ;4
 7!'d 4 > < >
7
! 
 T
4
 %! 	 >
AN½4 7!  T4 %! %" >4 %! '< >4 %  >4 % ' T T >:#4$ 7% > 4&   T0  H %'  %( $0  H ν;

  FlashSYS.setReloader('knx_stats');

  function getRow(type) {
    var row, stats = data[ type ];

    return [
      $TR('knx_stats_' + type),
      stats[ 5 ] + '%',
      stats[ 4 ],
      stats[ 0 ] + ' / ' + stats[ 1 ],
      stats[ 2 ] + ' / ' + stats[ 3 ]
    ];
  }

  if (!els) {
    win = FlashSYS.newWindow({
      id: 'knx_stats',
      title: $TR('knx_stats'),
      resizable: false,
      width: 500,
      height: 390,
      padding: 5
    });

    table = new FlashSYS.Table(win.contentEl, {
      trPrefix: 'knx_stats_',
      tableHead: {
        period: { width: 20 },
        tp_load: { width: 20 },
        tp_rp: { width: 20 },
        tp_rx_tx: { width: 20 },
        ip_rx_tx: { width: 20 }
      }
    });

    el = new Element('div').setStyles({
      'width': 504,
      'height': 260,
      'margin-top': 5
    }).inject(win.contentEl);

    xfmt = function(time) {
      var zpad = Dygraph.zeropad, date = new Date(time);
      return zpad(date.getHours()) + ':' + zpad(date.getMinutes());
    };

    yfmt = function(value) {
      return value + '%';
    }

    graph = new Dygraph(el, data.hourly, {
      labels: [ '', $TR('knx_stats_tp_load'), $TR('knx_stats_tp_rp') ],
      legend: 'always',
      labelsDivWidth: 443,
      labelsDivStyles: {
        'height': '39px'
      },
      axes: {
        x: { valueFormatter: xfmt, axisLabelFormatter: xfmt },
        y: { valueFormatter: yfmt, axisLabelFormatter: yfmt, valueRange: [ 0, 120 ] }
      }
    });

    els = FlashSYS.setCache('knx_stats', { window: win, table: table, graph: graph });
  }

  vals.min = getRow('min');
  vals.hour = getRow('hour');
  vals.total = getRow('total');

  els.graph.updateOptions({ file: data.hourly });
  els.table.loadValues(vals);
})();
s(function(){
  var els = FlashSYS.getCache('knx_stats'), win, table, el, graph, xfmt, yfmt, vals = {}, data = statsdataencode	jsonuptimemininsertrpt	load	timeremove
tablereschunks	houripairs
count
hourly
totalcalcload 
round pushdata tonumber
floor	math 
split/proc/uptimereadfileio eibd-statsrunlockedsemrequireΘΠΐx 