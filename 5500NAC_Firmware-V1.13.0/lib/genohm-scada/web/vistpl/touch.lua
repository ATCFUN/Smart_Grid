LJ�M , 2 `4   4 7% >  T�% : )  5  4  % > 5 	 4 
 > 5  4  7  % 4 >% 4 % 4 74  >% 4  7%	 4
 7

4 >
% 4 74 77>% 4 % 4 % 4 % 4 4  >%  4 %! 4 %" 4 %# 4 %$ 4 %% 4  %!& 4" %#' 4$ %%( 4&) )' >&%'* 4(+ 4)  >(%), 4*	 %+- $+> 4  %. > 4  7  %/ 40 >%1 $> G  </script>
</body>
</html>
getjs�;
Scada.baseMode = 'scada-vis';
initPlatform();
setCacheData(data);
cbusLoadTags(data.cbustags);
objectStore.create(objects.data);
getTopLevel(data.levels);
$.each(data.levels, addMenuLevel);
$.each(data.widgets, renderTouchPlan);
$.each(data.plans, renderTouchPlan);
$.each(data.widgets, renderTouchWidgets);
$.each(data.plans, renderTouchWidgets);
renderMenu();
startObjectUpdate();
initTouchControls();
getDefaultLevel();
showPlan(Globals.defaultPlan || planids[ 0 ]);
});
</script>
<script type="text/javascript">+/lib/genohm-scada/web/objects/main.lua, objects = �8">
<div class="ios-title-bar"></div>
<div class="templates hide">
<div class="control-item">
<div class="control-icon"><img src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"></div>
<div class="control-name"></div>
</div>
<div class="control control-spinner input-prepend input-append">
<button class="btn spinner-down icon">-</button>
<input type="number" class="spinner-value" step="any">
<button class="btn spinner-up icon">+</button>
</div>
<div class="control control-cbspinner input-prepend input-append">
<button class="btn spinner-down icon">-</button>
<input type="hidden" class="spinner-value">
<input type="text" class="spinner-display" value="">
<button class="btn spinner-up icon">+</button>
</div>
<div class="control control-dimmer input-prepend input-append">
<button class="btn dimmer-down icon">-</button>
<button class="btn dimmer-up icon">+</button>
</div>
<div class="control control-slider slider-h slider-wrap">
<button class="btn slider-min icon">&larr;</button>
<button class="btn slider-max icon">&rarr;</button>
<div class="slider">
<span class="btn slider-handle"></span>
<div class="progress"></div>
</div>
</div>
<div class="control control-textinput input-append">
<input type="text" maxlength="14">
<button class="btn btn-ok icon">✓</button>
</div>
<div class="control control-toggler toggler">
<span class="btn btn-toggler icon"></span>
<span class="btn active btn-bg">&nbsp;</span>
</div>
<div class="plan-header">
<span class="btn btn-inverse icon">×</span>
<h5 class="plan-title"></h5>
</div>
<div class="control control-empty"></div>
<div class="control control-button"><button class="btn control-value"></button></div>
<div class="control control-button-toggler">
<button class="btn control-value control-value-toggler"></button>
<div class="control toggler">
<span class="btn btn-toggler icon"></span>
<span class="btn active btn-bg">&nbsp;</span>
</div>
</div>
<div class="control control-checkbox icon"><button class="btn icon"></button></div>
</div>
<div class="navbar">
<div class="navbar-inner">
<div class="container">
<button class="btn btn-large pull-left btn-menu icon">=</button>
<button class="btn btn-large pull-left btn-prev icon">&larr;</button>
<a href="/logout" class="btn btn-large pull-right btn-logout icon">&#57345;</a>
<a href="/" class="btn btn-large pull-right btn-home icon">&#57346;</a>
<button class="btn btn-large pull-right btn-next icon">&rarr;</button>
<h4 class="title"></h4>
</div>
</div>
</div>
<div class="sidebar hide">
<ul class="dropdown-menu nav nav-main"></ul>
</div>
<div class="control-wrap"></div>
<div class="modal modal-camera window hide">
<div class="modal-body body"><img src="" alt=""></div>
</div>
<div class="modal modal-iframe window hide">
<div class="modal-body body"></div>
</div>
<div class="well control-modal control-timepicker hide">
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
<div class="well control-modal control-vdatepicker hide">
<div class="inner"></div>
<div class="pull-right">
<button class="btn btn-large btn-info btn-ok icon">✓</button>
<button class="btn btn-large btn-cancel icon">×</button>
</div>
</div>
<div class="well control-modal control-pincode hide">
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
<div class="well control-modal control-colorpicker hide">
<canvas width="280" height="225"></canvas>
<div class="slider-wrap slider-h">
<button class="btn btn-large slider-min icon">&larr;</button>
<div class="slider">
<span class="btn btn-large slider-handle"></span>
<div class="progress"></div>
</div>
<button class="btn btn-large slider-max icon">&rarr;</button>
</div>
<div class="presets hide">
<div class="preset"><div class="preset-sub"></div></div>
<div class="preset"><div class="preset-sub"></div></div>
<div class="preset"><div class="preset-sub"></div></div>
<div class="preset"><div class="preset-sub"></div></div>
<div class="preset"><div class="preset-sub"></div></div>
<div class="preset"><div class="preset-sub"></div></div>
</div>
<div class="pull-left btn btn-color">&nbsp;</div>
<div class="pull-left btn btn-color btn-color-white">&nbsp;</div>
<div class="pull-right">
<button class="btn btn-large btn-info btn-ok icon">✓</button>
<button class="btn btn-large btn-cancel icon">×</button>
</div>
</div>
<div class="well control-modal control-circularslider hide">
<div class="circularslider-wrap">
<canvas></canvas>
<div class="circularslider-value"></div>
<div class="circularslider-title"></div>
<div class="circularslider-min">&darr;</div>
<div class="circularslider-max">&uarr;</div>
</div>
</div>
<div class="well control-modal control-cbcircularslider hide">
<div class="circularslider-wrap">
<canvas></canvas>
<div class="circularslider-toggle"></div>
<div class="circularslider-value circularslider-value-alt"></div>
<div class="circularslider-title"></div>
<div class="circularslider-min">&darr;</div>
<div class="circularslider-max">&uarr;</div>
</div>
</div>
<div class="well control-modal control-vselect hide">
<ul class="nav"></ul>
</div>
<div class="modal-backdrop hide"></div>
<div class="overlay"></div>
<div class="modal-close hide icon">×</div>
<script type="text/javascript">
$(function() {
var data = getcls#</style>
</head>
<body class="getcss">
<style>L">
<link rel="apple-touch-icon" href="/scada/resources/images/touch.png@">
<link rel="icon" href="/scada/resources/images/touch.pngI">
<link rel="stylesheet" type="text/css" href="/scada/vis/brand.cssI">
<link rel="stylesheet" type="text/css" href="/scada/vis/theme.cssS"></script>
<link rel="stylesheet" type="text/css" href="/scada/vis/layout.cssG"></script>
<script type="text/javascript" src="/scada/vis/core.jsL"></script>
<script type="text/javascript" src="/scada/vis/busdecode.js?<script type="text/javascript" src="/scada/vis/controls.jsgetlangtag"></script>
versionS"></script>
<script type="text/javascript" src="/scada/resources/cbuslib.js.gzL"></script>
<script type="text/javascript" src="/scada/resources/lib.jsl,
cbus: true,
touch: true
};
</script>
<script type="text/javascript" src="/scada/resources/language.js	userctx,
user: ',
localrequest: ,
updateTime: 'encode	jsonI"></script>
<script type="text/javascript">
var Globals = {
config: bversion� - Touch</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<script type="text/javascript" src="/scada/vis/jquery.jsgettitle;<!DOCTYPE html>
<html class="touch fh">
<head>
<title>
printngxislocalislocalrequest	data+/lib/genohm-scada/web/vis/usermode.luadofileshortmode0/tmp/gs-groupmonitor.timereadfileioupdatetimeconfig 