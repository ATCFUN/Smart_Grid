LJ�L / * O*  4  4 7% >  T�% :) 5 4 % >  4 %	 > %
 4 >% 4 % 4 74  >% 4	  7		%
 4 % 4 % 4 4  >% 4 % 4 % 4 % 4 % 4 % 4 % 4 % 4 %  4! %"  4# %$! 4%" )& >%%&# 4'$ 4(  >'%(% )  %*& + %,' 4-( >-%.) $.H </script>
</body>
</html>
getjs�, cfg = Globals.config;
if (cfg.visbgcolor && cfg.visbgcolor != '#FFFFFF') $('body, .popover, .well').css('background-color', cfg.visbgcolor);
if (cfg.visbgimg) $('body').css('background-image', 'url("/scada/resources/img/' + cfg.visbgimg + '")');
Scada.baseMode = 'scada-vis';
initPlatform();
setCacheData(data);
objectStore.create(objects.data);
visCentered = toBoolean(cfg.viscenter);
visAutoWidth = toNumber(cfg.viscenter) == 3;
visAutoGrow = toBoolean(cfg.visautogrow);
getTopLevel(data.levels);
$.each(data.levels, addMenuLevel);
$.each(data.layouts, renderPlan);
$.each(data.widgets, renderPlan);
$.each(data.plans, renderPlan);
$.each(data.plans, renderWidgets);
$.each(data.layouts, renderWidgets);
$.each(data.widgets, renderWidgets);
renderMenu();
startObjectUpdate();
initControls();
getDefaultLevel();
showPlan(Globals.defaultPlan || planids[ 0 ]);
});
</script>
<script type="text/javascript">, objects = �5">
<div class="ios-title-bar"></div>
<div class="templates">
<div class="control control-toggler toggler">
<span class="btn btn-toggler icon"></span>
<span class="btn active btn-bg">&nbsp;</span>
</div>
<div class="control control-checkbox">
<button class="btn btn-large icon"></button>
</div>
</div>
<div class="popover control control-spinner hide">
<div class="popover-content input-prepend input-append">
<button class="btn btn-large spinner-down icon">-</button>
<input type="number" class="spinner-value input-large" step="any">
<button class="btn btn-large spinner-up icon">+</button>
</div>
</div>
<div class="popover control control-cbspinner hide">
<div class="popover-content input-prepend input-append">
<button class="btn btn-large spinner-down icon">-</button>
<input type="hidden" class="spinner-value">
<input type="text" class="spinner-display input-large" value="">
<button class="btn btn-large spinner-up icon">+</button>
</div>
</div>
<div class="popover control control-dimmer hide">
<div class="popover-content input-prepend input-append">
<button class="btn btn-large dimmer-down icon">-</button>
<button class="btn btn-large dimmer-up icon">+</button>
</div>
</div>
<div class="popover control control-slider control-slider-h slider-h hide">
<div class="popover-content slider-wrap">
<button class="btn btn-large slider-min icon">&larr;</button>
<div class="slider">
<span class="btn btn-large slider-handle"></span>
<div class="progress"></div>
</div>
<button class="btn btn-large slider-max icon">&rarr;</button>
</div>
</div>
<div class="popover control control-slider control-slider-v slider-v hide">
<div class="popover-content slider-wrap">
<button class="btn btn-large slider-max icon">&uarr;</button>
<div class="slider">
<span class="btn btn-large slider-handle"></span>
<div class="progress"></div>
</div>
<button class="btn btn-large slider-min icon">&darr;</button>
</div>
</div>
<div class="popover control control-textinput hide">
<div class="popover-content input-append">
<input type="text" class="input-large" maxlength="14">
<button class="btn btn-large btn-ok icon">✓</button>
</div>
</div>
<div class="well control control-timepicker hide">
<select class="timepicker-day">
<option value="0" class="tr">dt_noday</option>
<option value="1" class="tr">dt_monday</option>
<option value="2" class="tr">dt_tuesday</option>
<option value="3" class="tr">dt_wednesday</option>
<option value="4" class="tr">dt_thursday</option>
<option value="5" class="tr">dt_friday</option>
<option value="6" class="tr">dt_saturday</option>
<option value="7" class="tr">dt_sunday</option>
</select>
<div class="timepicker">
<div class="spinner-vertical timepicker-hour">
<button class="btn btn-large spinner-up icon">&uarr;</button>
<input type="text" class="input-large spinner-value">
<button class="btn btn-large spinner-down icon">&darr;</button>
</div>
<div class="spinner-vertical timepicker-minute">
<button class="btn btn-large spinner-up icon">&uarr;</button>
<input type="text" class="input-large spinner-value">
<button class="btn btn-large spinner-down icon">&darr;</button>
</div>
<div class="spinner-vertical timepicker-second">
<button class="btn btn-large spinner-up icon">&uarr;</button>
<input type="text" class="input-large spinner-value">
<button class="btn btn-large spinner-down icon">&darr;</button>
</div>
</div>
<div class="pull-right">
<button class="btn btn-large btn-info btn-ok icon">✓</button>
<button class="btn btn-large btn-cancel icon">×</button>
</div>
</div>
<div class="well control control-vdatepicker hide">
<div class="inner"></div>
<div class="pull-right">
<button class="btn btn-large btn-info btn-ok icon">✓</button>
<button class="btn btn-large btn-cancel icon">×</button>
</div>
</div>
<div class="well control control-pincode hide">
<div class="control-group">
<input type="password" class="input-large disabled" value="" disabled="disabled">
</div>
<div class="btn-group">
<button class="btn btn-large">1</button>
<button class="btn btn-large">2</button>
<button class="btn btn-large">3</button>
</div>
<div class="btn-group">
<button class="btn btn-large">4</button>
<button class="btn btn-large">5</button>
<button class="btn btn-large">6</button>
</div>
<div class="btn-group">
<button class="btn btn-large">7</button>
<button class="btn btn-large">8</button>
<button class="btn btn-large">9</button>
</div>
<div class="btn-group">
<button class="btn btn-large">0</button>
<button class="btn btn-large btn-backspace icon">&lArr;</button>
<button class="btn btn-large btn-cancel icon">×</button>
</div>
</div>
<div class="popover control control-vselect hide">
<div class="popover-content">
<ul class="nav"></ul>
</div>
</div>
<div class="well control control-colorpicker hide">
<canvas width="280" height="225"></canvas>
<div class="presets hide">
<div class="preset"></div>
<div class="preset"></div>
<div class="preset"></div>
<div class="preset"></div>
<div class="preset"></div>
<div class="preset"></div>
</div>
<div class="pull-left btn btn-color">&nbsp;</div>
<div class="pull-right">
<button class="btn btn-large btn-info btn-ok icon">✓</button>
<button class="btn btn-large btn-cancel icon">×</button>
</div>
</div>
<div class="popover control control-circularslider hide">
<div class="popover-content">
<div class="circularslider-wrap">
<canvas></canvas>
<div class="circularslider-value"></div>
<div class="circularslider-title"></div>
<div class="circularslider-min">&darr;</div>
<div class="circularslider-max">&uarr;</div>
</div>
</div>
</div>
<div class="popover control control-cbcircularslider hide">
<div class="popover-content">
<div class="circularslider-wrap">
<canvas></canvas>
<div class="circularslider-toggle"></div>
<div class="circularslider-value circularslider-value-alt"></div>
<div class="circularslider-title"></div>
<div class="circularslider-min">&darr;</div>
<div class="circularslider-max">&uarr;</div>
</div>
</div>
</div>
<div class="popover control control-mracircularslider hide">
<div class="popover-content">
<div class="circularslider-wrap">
<canvas></canvas>
<div class="circularslider-toggle"></div>
<div class="circularslider-value circularslider-value-alt"></div>
<div class="circularslider-title"></div>
<div class="circularslider-min">&darr;</div>
<div class="circularslider-max">&uarr;</div>
</div>
</div>
</div>
<div class="modal-backdrop hide"></div>
<div class="menu"><button class="btn btn-show-hide hide icon">&rarr;</button><div class="inner"><ul class="nav nav-main"></ul></div></div>
<div class="layers">
<div class="layer widgets"></div>
<div class="layer layout-background"></div>
<div class="layer layout-background-add"></div>
<div class="layer plan-background"></div>
<div class="layer plan-background-add"></div>
</div>
<script type="text/javascript">
$(function() {
var data = getcls,</style>
</head>
<body class="usermode getcss">
<style>T">
<link rel="apple-touch-icon" href="/scada/resources/images/visualization.pngversionH">
<link rel="icon" href="/scada/resources/images/visualization.pngI">
<link rel="stylesheet" type="text/css" href="/scada/vis/brand.cssI">
<link rel="stylesheet" type="text/css" href="/scada/vis/theme.cssS"></script>
<link rel="stylesheet" type="text/css" href="/scada/vis/layout.cssJ"></script>
<script type="text/javascript" src="/scada/vis/dygraph.jsH"></script>
<script type="text/javascript" src="/scada/vis/gauge.jsG"></script>
<script type="text/javascript" src="/scada/vis/core.jsL"></script>
<script type="text/javascript" src="/scada/vis/busdecode.js?<script type="text/javascript" src="/scada/vis/controls.jsgetlangtag"></script>
Q"></script>
<script type="text/javascript" src="/scada/resources/language.jsP',
};
</script>
<script type="text/javascript" src="/scada/resources/lib.js,
updateTime: 'encode	jsonI"></script>
<script type="text/javascript">
var Globals = {
config: bversion�  - Visualization</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<script type="text/javascript" src="/scada/vis/jquery.jsgettitle*<!DOCTYPE HTML>
<html>
<head>
<title>+/lib/genohm-scada/web/objects/main.lua+/lib/genohm-scada/web/vis/usermode.luadofileshortmode0/tmp/gs-groupmonitor.timereadfileioupdatetimeconfig 