LJ�   $4   4 > % 4 >% 4 % 4 % 4 %	 4
 %	 4 %
 4 ) >% 4 4 >% 4 7 % 4 7  >% $H �) { controlEl.addClass('error'); setval('', true); }
iOSfix();
$('.btn-group .btn').on('vclick', function(e) {
  var num = parseInt($(this).text(), 10), val = inputEl.val(), len = val.length;
  if (isNaN(num)) val = val.substr(0, len - 1);
  else if (len < max) { val = val + num.toString(); len++; }
  setval(val);
  if (len == max) $('form').submit();
  return $.stopEvent(e);
});
});
</script>
</body>
</html>encode	jsonl;
function setval(v, e) { inputEl.val(v); hiddenEl.val(v); controlEl.toggleClass('error', !!e); }
if (!pincode�">
<div class="ios-title-bar"></div>
<div class="well control control-pincode">
<div class="control-group"><input type="password" class="input-large disabled" value="" disabled="disabled" maxlength="8"></div>
<div class="btn-group"><button class="btn btn-large">1</button><button class="btn btn-large">2</button><button class="btn btn-large">3</button></div>
<div class="btn-group"><button class="btn btn-large">4</button><button class="btn btn-large">5</button><button class="btn btn-large">6</button></div>
<div class="btn-group"><button class="btn btn-large">7</button><button class="btn btn-large">8</button><button class="btn btn-large">9</button></div>
<div class="btn-group"><button class="btn btn-large">0</button><button class="btn btn-large btn-backspace btn-backspace-large icon">&lArr;</button></div>
</div>
<form action="" method="post"><input type="hidden" name="pin"></form>
<div class="modal-backdrop"></div>
<script type="text/javascript">
$(function() {
var inputEl = $('input'), hiddenEl = $('form input'), controlEl = $('.control-group'), max = getcls#</style>
</head>
<body class="getcss">
<style>I">
<link rel="stylesheet" type="text/css" href="/scada/vis/brand.cssI">
<link rel="stylesheet" type="text/css" href="/scada/vis/theme.cssS"></script>
<link rel="stylesheet" type="text/css" href="/scada/vis/layout.cssK"></script>
<script type="text/javascript" src="/scada/vis/controls.jsbversion� - Pin Code</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="/scada/vis/jquery.jsgettitle*<!DOCTYPE HTML>
<html>
<head>
<title>configpinauth 