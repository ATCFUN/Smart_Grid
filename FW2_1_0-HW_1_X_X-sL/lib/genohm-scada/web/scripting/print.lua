LJ�  * s4   > 5  4    7  > 5  4    7  % > 5  4  7 	 %
 > 5  4  7  4 > 4  4 > T � 7% ' )	 >  T� 7% % >5 4 74 3 4 7%	 4
 % $		>  T	�% :4 :>AN�4  7  4 3 4 7% >  T�% :> 4  7  4 3 4 7% >  T�% :> %  4 7$  5  %  4 $  5  %   4! 4 7">%# 4 %$ 4% 4 >%& 4' 7(4 >%) $  H  �, i, j, item, category;

function w(t) { document.write(t); }
function t(k) { return (Translations[ k ] || k); }

function e(s) {
var map = { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': '&quot;', "'": '&#39;', "/": '&#x2F;' };
return String(s).replace(/[&<>"'\/]/g, function(s) { return map[ s ]; });
}

for (i = 0, j = scripts.length; i < j; i++) {
item = scripts[ i ];

if (category !== item.category) {
w('<div class="hr"></div>');
w('<h1>' + t('scripting_category') + ': ' + (item.category || t('unknown')) + '</h1>');
category = item.category;
}

w('<div class="hr"></div>');

w('<div class="script">');
if (item.type == 'userlib') w('<h2>' + t('scripting_tools_userlib') + '</h2>');
else if (item.type == 'initscript') w('<h2>' + t('scripting_tools_initscript') + '</h2>');
else if (item.type == 'user') w('<h2>user.' + e(item.name) + '</h2>');
else {
w('<h2>' + e(item.name) + '</h2>');
w('<h3>' + t('scripting_type') + ': ' + t('scripting_' + item.type) + '</h3>');
w('<h3>' + t('scripting_active') + ': ' + (item.active == '1' ? t('yes') : t('no')) + '</h3>');
}

switch (item.type) {
case 'event':
w('<h3>' + t('scripting_address') + ': ' + e(item.params) + '</h3>');
break;
case 'resident':
w('<h3>' + t('scripting_sleep') + ': ' + e(item.params) + '</h3>');
break;
case 'scheduled':
w('<h3>' + t('scripting_datetime') + ': ' + e(item.params) + '</h3>');
break;
}

if (item.description) w('<p>' + e(item.description) + '</p>');
w('<code>' + e(item.script) + '</code>');
w('</div>');
}
</script>
</body>
</html>encode	jsonB</head>
<body>
<script type="text/javascript">
var scripts = getlangtag"></script>
�</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<style>
body, html { margin: 0; padding: 0; font-family: Tahoma, Helvetica, Arial, sans-serif; font-size: 11pt; }
body { margin: 10px; }
h1, h2, h3, p { margin: 0; font-weight: normal; }
h1 { padding: 10px; background-color: #eee; font-size: 20pt; }
h2 { padding-bottom: 10px; font-size: 16pt; }
h3 { font-size: 13pt; padding-bottom: 1px; }
p { padding-top: 10px; }
code { font-family: "Consolas", monospace; padding-top: 14px; white-space: pre-wrap; display: block; }
.script { margin: 15px 0; }
.hr { margin: 0; height: 1px; font-size: 0; line-height: 1px; overflow: hidden; background-color: #999; }
</style>
<script type="text/javascript" src="/scada/resources/language.js
brandescape*<!DOCTYPE html>
<html>
<head>
<title>.gzversion?version= 	nameinitscriptcategorySystem	typeinitscript//usr/share/lua/genohm-scada/initscript.lua 	nameuserlibcategorySystem	typeuserlib-/usr/share/lua/genohm-scada/userlib.luasscript categoryUser library	type	user/usr/share/lua/user/readfileinsert	name	gsub
.luas	findipairs	sort
table
files/usr/share/lua/userlsioscriptsjSELECT id, type, name, active, params, category, description, script FROM scripting ORDER BY categorygetalldbnew
dbenvconfiggetconfig 