LJ�	 	  /4   % > 2   5  2   5  4  7  > 5  4  4 > T�% 7	$5
 4 4
 794 74 2 4
 ;7;>AN�%  4 74 >% 4 74 >% $  H  , []);
})();
�, i, j, elements = [];

  win = FlashSYS.newWindow({
    id: 'bacnet_cov',
    title: $TR('bacnet_cov'),
    width: 480,
    height: 480,
    canReload: false,
    padding: 5,
    type: 'modal'
  });

  elements.push({ type: 'notice', text: 'bacnet_cov_notice' });

  for (i = 0, j = items.length; i < j; i++) {
    item = items[ i ];
    elements.push({
      type: 'text',
      name: item[ 0 ],
      title: item[ 1 ],
      noTranslate: true,
      validate: {
        'required': true,
        'float': [ 0.1, 1000 ]
      }
    });
  }

  form = new FlashSYS.Form(win.contentEl, {
    module: 'bacnet_cov',
    elements: elements,
    trPrefix: 'bacnet_',
    submitEl: win.footerEl
  });

  form.form.style.width = 'auto';
  form.form.style.height = 'auto';

  FlashSYS.setCache('bacnet_cov', { window: win });

  form.loadValues(encode	json1(function(){
  var win, form, item, items = 	nameinsert
tablecovincrkeyid	obj_ipairsavgetobjectsbcvalues
items/lib/bacnet/common.luadofile 