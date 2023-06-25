LJ  4    > T�4   >  T�'   4 7  >  4   @ tostring
floor	mathtonumberboolean	type�w  4  74 2 ;7 ;7 ;4 7 > <  >G  
valueconvert	name
extidobjectsinsert
table	�����  F4   % > 4  7  % > 5  4  4 7%	 > 7
>% 4 7  T�(  $: 2   5  4  7  > 5 5  1  5  1  5  4  4 > T�4  % >AN�4  4 > T�4  % >AN�4  7  3 4 :4 :> 5  %  4 % $  0  �H  �;

  if (!elems) {
    win = FlashSYS.newWindow({
      id: 'bacnet_objects',
      title: $TR('bacnet_objects'),
      width: 600,
      height: 400,
      padding: 5
    });

    table = new FlashSYS.Table(win.contentEl, {
      trPrefix: 'bacnet_',
      sortable: true,
      sortBy: 'instance',
      tableHead: {
        type: { width: 15 },
        instance: { width: 20 },
        name: { width: 30 },
        value: { width: 35 }
      }
    });

    info = new Element('p').inject(win.contentEl, 'top');

    a = document.createElement('a');
    if (typeof a.download !== 'undefined') {
      btn = new Element('button.FSInlineButton').set('text', $TR('bacnet_csv')).inject(win.contentEl, 'top');
    }

    elems = FlashSYS.setCache('bacnet_objects', { window: win, table: table, info: info, btn: btn });
  }

  elems.table.loadValues(data.objects);
  csvEscape = function(v) {
    v = v.toString();
    return '"' + v.replace(/\"/g, '\\"') + '"';
  }

  $each([ 'name', 'devid', 'priority', 'port' ], function(prop) {
    var value = data.config[ prop ], title;
    if (value) {
      title = $TR('bacnet_' + prop);
      html.push('<b>' + title + ':</b> ' + value.toString());
      csv.push(csvEscape(title) + ',' + csvEscape(value));
    }
  });

  elems.info.set('html', html.join('<br>'));

  csv.push('');

  line = [];
  $each([ 'type', 'instance', 'name', 'value' ], function(prop) {
    line.push(csvEscape($TR('bacnet_' + prop)));
  });
  csv.push(line.join(','));

  $each(data.objects, function(objects) {
    var line = [];

    $each(objects, function(prop) {
      line.push(csvEscape(prop));
    });

    csv.push(line.join(','));
  });

  if (elems.btn) {
    elems.btn.onclick = function() {
      link = document.createElement('a');
      blob = new Blob([ csv.join('\r\n') ], { type: 'text/csv' });
      link.href = URL.createObjectURL(blob);
      link.download = 'bacnet.csv';

      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }
  }
})();
�(function(){
  var elems = FlashSYS.getCache('bacnet_objects'), csv = [], line, info, win, csvEscape, btn, a,
      html = [], table, data = 	data  encode	json2 (AV)5 (BV)ipairs	push convert avbvgetobjectsbcobjects
devid_	trim/proc/sys/kernel/hostnamereadfileio	nameconfigbacnet.serverget_alluci/lib/bacnet/common.luadofile�� 