LJ�� #  0%   4 >% 4 74 >% 4 % 4 %	 4	
 %
 4 4 >% 4 % 4 % 4 % 4 % 4 % 4 % 4
 % 4
 % 4 ) >% 4 4  >%  4! >!%" $ " H  </script>
</body>
</html>
getjs��">
<div class="schedulers-wrap">
<div class="ios-title-bar"></div>
<div class="navbar navbar-fixed-top">
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
<div class="content content-scheduler hide">
<div class="info">
<span class="btn btn-small scheduler-edit pull-right"><i class="icon">&#8857;</i> %edit%</span>
<span class="inner">
%schedulers_status%:
<span class="status-active hide">%dt_1_11_1%</span>
<span class="status-inactive hide">%dt_1_11_0%</span>
<br>
<span class="period"></span>
</span>
</div>
<table class="tbl-events responsive">
<thead>
<tr>
<th>%schedulers_name%</th>
<th>%schedulers_run_at%</th>
<th>%schedulers_value%</th>
<td class="actions">
<span class="btn btn-small btn-success pull-right" id="event-add"><i class="icon">&oplus;</i> %schedulers_events_add%</span>
</td>
</tr>
</thead>
<tbody></tbody>
<tfoot class="hide">
<tr class="empty">
<td colspan="4">%schedulers_events_empty%</td>
</tr>
<tr class="tpl">
<td data-label="%schedulers_name%" class="name"></td>
<td data-label="%schedulers_run_at%" class="run-at"></td>
<td data-label="%schedulers_value%" class="value"></td>
<td class="actions">
<div class="btn-group pull-right">
<span class="btn btn-small edit"><i class="icon">&#8857;</i> %edit%</span>
<span class="btn btn-small delete"><i class="icon">×</i> %delete%</span>
</div>
</td>
</tr>
</tfoot>
</table>
</div>
<div class="content content-holidays hide">
<table class="tbl-holidays responsive">
<thead>
<tr>
<th>%schedulers_name%</th>
<th>%schedulers_period_alt%</th>
<td class="actions"><span class="btn btn-success pull-right" id="holiday-add"><i class="icon">&oplus;</i> %schedulers_holidays_add%</span></td>
</tr>
</thead>
<tbody></tbody>
<tfoot class="hide">
<tr class="empty">
<td colspan="3">%schedulers_holidays_empty%</td>
</tr>
<tr class="tpl">
<td data-label="%schedulers_name%" class="name"></td>
<td data-label="%schedulers_period_alt%" class="period"></td>
<td class="actions">
<div class="btn-group pull-right">
<span class="btn edit"><i class="icon">&#8857;</i> %edit%</span>
<span class="btn delete"><i class="icon">×</i> %delete%</span>
</div>
</td>
</tr>
</tfoot>
</table>
</div>
<div class="sidebar sidebar-menu">
<ul class="nav nav-pills nav-stacked"></ul>
</div>
<div class="sidebar sidebar-edit sidebar-edit-pri hide" id="event-form">
<div class="sidebar-inner">
<h4 class="title-add hide">%schedulers_events_add%</h4>
<h4 class="title-edit hide">%schedulers_events_edit%</h4>
<label class="checkbox"><input type="checkbox" name="active" id="event-active"> %schedulers_events_active%</label>
<label for="event-name">%schedulers_name%</label>
<input type="text" name="name" id="event-name" placeholder="%schedulers_events_new%" class="text" maxlength="100">
<label>%schedulers_events_disable_level%</label>
<select id="eventdisablelevel" name="eventdisablelevel">
<option value="">%schedulers_unused_txt%</option>
</select>
<label>%schedulers_run_at%</label>
<select id="event-type" name="type">
<option value="">%schedulers_events_time%</option>
<option value="sunrise">%schedulers_events_sunrise%</option>
<option value="sunset">%schedulers_events_sunset%</option>
</select>
<div id="event-type-time">
<label>%schedulers_time%</label>
<div class="spinners">
<div class="spinner timepicker-hour input-prepend input-append" id="spinner-start-hour">
<button class="btn spinner-down icon">-</button>
<input type="text" class="spinner-value" value="" name="start_hour">
<button class="btn spinner-up icon">+</button>
</div>
<div class="spinner timepicker-min input-prepend input-append" id="spinner-start-min">
<button class="btn spinner-down icon">-</button>
<input type="text" class="spinner-value" value="" name="start_min">
<button class="btn spinner-up icon">+</button>
</div>
</div>
</div>
<div id="event-type-sunrise-sunset">
<label>%schedulers_events_offset%</label>
<div class="spinners">
<div class="spinner timepicker-offset-hour input-prepend input-append" id="spinner-offset-hour">
<button class="btn spinner-down icon">-</button>
<input type="text" class="spinner-value" value="" name="offset_hour">
<button class="btn spinner-up icon">+</button>
</div>
<div class="spinner timepicker-min input-prepend input-append" id="spinner-offset-min">
<button class="btn spinner-down icon">-</button>
<input type="text" class="spinner-value" value="" name="offset_min">
<button class="btn spinner-up icon">+</button>
</div>
</div>
</div>
<div class="selector" id="event-daysofweek">
<label>%schedulers_events_dow%</label>
<button class="btn btn-success">&nbsp;</button>
<div class="popover control-vselect hide">
<div class="popover-content">
<ul class="nav">
<li class="group group-2">
<span class="a" data-select="all">%schedulers_all%</span>
<span class="a" data-select="-">%schedulers_none%</span>
</li>
<li class="group group-2">
<span class="a" data-select="1,2,3,4,5">%schedulers_events_weekdays%</span>
<span class="a" data-select="6,7">%schedulers_events_weekend%</span>
</li>
<li class="group group-5">
<span class="a">%scripting_dt_weekday_1%</span>
<span class="a">%scripting_dt_weekday_2%</span>
<span class="a">%scripting_dt_weekday_3%</span>
<span class="a">%scripting_dt_weekday_4%</span>
<span class="a">%scripting_dt_weekday_5%</span>
</li>
<li class="group group-5">
<span class="a">%scripting_dt_weekday_6%</span>
<span class="a">%scripting_dt_weekday_7%</span>
</li>
</ul>
</div>
</div>
</div>
<div class="selector" id="event-dayweeknrs">
<label>%schedulers_events_month_dow%</label>
<button class="btn btn-success">&nbsp;</button>
<div class="popover control-vselect hide">
<div class="popover-content">
<ul class="nav">
<li class="group group-2">
<span class="a" data-select="all">%schedulers_all%</span>
<span class="a" data-select="-">%schedulers_none%</span>
</li>
<li class="group group-3">
<span class="a">%schedulers_events_month_dow_1%</span>
<span class="a">%schedulers_events_month_dow_2%</span>
<span class="a">%schedulers_events_month_dow_3%</span>
</li>
<li class="group group-3">
<span class="a">%schedulers_events_month_dow_4%</span>
<span class="a">%schedulers_events_month_dow_5%</span>
<span class="a">%schedulers_events_month_dow_6%</span>
</li>
</ul>
</div>
</div>
</div>
<div class="selector" id="event-daysofmonth">
<label>%schedulers_events_month_days%</label>
<button class="btn btn-success">&nbsp;</button>
<div class="popover control-vselect hide">
<div class="popover-content">
<ul class="nav">
<li class="group group-2">
<span class="a" data-select="all">%schedulers_all%</span>
<span class="a" data-select="-">%schedulers_none%</span>
</li>
<li class="group group-7">
<span class="a">1</span>
<span class="a">2</span>
<span class="a">3</span>
<span class="a">4</span>
<span class="a">5</span>
<span class="a">6</span>
<span class="a">7</span>
</li>
<li class="group group-7">
<span class="a">8</span>
<span class="a">9</span>
<span class="a">10</span>
<span class="a">11</span>
<span class="a">12</span>
<span class="a">13</span>
<span class="a">14</span>
</li>
<li class="group group-7">
<span class="a">15</span>
<span class="a">16</span>
<span class="a">17</span>
<span class="a">18</span>
<span class="a">19</span>
<span class="a">20</span>
<span class="a">21</span>
</li>
<li class="group group-7">
<span class="a">22</span>
<span class="a">23</span>
<span class="a">24</span>
<span class="a">25</span>
<span class="a">26</span>
<span class="a">27</span>
<span class="a">28</span>
</li>
<li class="group group-7">
<span class="a">29</span>
<span class="a">30</span>
<span class="a">31</span>
</li>
</ul>
</div>
</div>
</div>
<div class="selector" id="event-months">
<label>%schedulers_events_months%</label>
<button class="btn btn-success">&nbsp;</button>
<div class="popover control-vselect hide">
<div class="popover-content">
<ul class="nav">
<li class="group group-2">
<span class="a" data-select="all">%schedulers_all%</span>
<span class="a" data-select="-">%schedulers_none%</span>
</li>
<li class="group group-3">
<span class="a">%scripting_dt_month_1%</span>
<span class="a">%scripting_dt_month_2%</span>
<span class="a">%scripting_dt_month_3%</span>
</li>
<li class="group group-3">
<span class="a">%scripting_dt_month_4%</span>
<span class="a">%scripting_dt_month_5%</span>
<span class="a">%scripting_dt_month_6%</span>
</li>
<li class="group group-3">
<span class="a">%scripting_dt_month_7%</span>
<span class="a">%scripting_dt_month_8%</span>
<span class="a">%scripting_dt_month_9%</span>
</li>
<li class="group group-3">
<span class="a">%scripting_dt_month_10%</span>
<span class="a">%scripting_dt_month_11%</span>
<span class="a">%scripting_dt_month_12%</span>
</li>
</ul>
</div>
</div>
</div>
<label class="checkbox"><input type="checkbox" name="year" id="event-year"> %schedulers_events_year%</label>
<div class="spinners">
<div class="spinner input-prepend input-append" id="spinner-start-year">
<button class="btn spinner-down icon">-</button>
<input type="text" class="spinner-value spinner-full" value="" name="start_year">
<button class="btn spinner-up icon">+</button>
</div>
</div>
<label>%schedulers_holidays%</label>
<select id="event-holidays" name="holidays">
<option value="">%schedulers_holidays_none%</option>
<option value="n">%schedulers_holidays_no%</option>
<option value="y">%schedulers_holidays_yes%</option>
</select>
<label>%schedulers_value% <span id="control-value" class="hide label label-info"></span></label>
<select class="event-value" id="event-value-enums"></select>
<select class="event-value" id="event-value-bool">
<option value="0">%dt_1_1_0%</option>
<option value="1">%dt_1_1_1%</option>
</select>
<input type="text" class="event-value event-value-text" id="event-value-text">
<div class="event-value color" id="event-value-color">
<div class="btn btn-color event-value-color">&nbsp;</div>
<div class="btn btn-color btn-color-white event-value-color-white">&nbsp;</div>
<span class="muted">%schedulers_color_select%</span>
</div>
<div class="spinner input-prepend input-append event-value" id="event-value-spinner">
<button class="btn spinner-down icon">-</button>
<input type="number" class="spinner-value spinner-full" step="any">
<button class="btn spinner-up icon">+</button>
</div>
<div id="event-value-emergency" class="event-value emergency hide">
<select id="em-value" name="em-value">
<option value=""></option>
<option value="1">%emergency_mode_function%</option>
<option value="2">%emergency_mode_duration%</option>
</select>
</div>
<div class="slider-wrap slider-h event-value" id="event-value-slider">
<button class="btn slider-min icon">&larr;</button>
<button class="btn slider-max icon">&rarr;</button>
<div class="slider"><span class="btn slider-handle"></span><div class="progress"></div></div>
</div>
<div id="event-value-lighting" class="event-value lighting event-value-multiple">
<div class="slider-wrap slider-h" id="event-value-lighting-slider">
<button class="btn slider-min icon">&larr;</button>
<button class="btn slider-max icon">&rarr;</button>
<div class="slider"><span class="btn slider-handle"></span><div class="progress"></div></div>
</div>
<div class="spinner input-prepend input-append" id="event-value-lighting-spinner">
<button class="btn spinner-down icon">-</button>
<input type="number" class="spinner-value spinner-full" step="any">
<button class="btn spinner-up icon">+</button>
</div>
<label for="event-value-lighting-ramprate">Ramp rate</label>
<select id="event-value-lighting-ramprate">
<option value="0">0s (instantaneous)</option>
<option value="4">4s</option>
<option value="8">8s</option>
<option value="12">12s</option>
<option value="20">20s</option>
<option value="30">30s</option>
<option value="40">40s</option>
<option value="60">1m</option>
<option value="90">1m 30s</option>
<option value="120">2m</option>
<option value="180">3m</option>
<option value="300">5m</option>
<option value="420">7m</option>
<option value="600">10m</option>
<option value="900">15m</option>
<option value="1020">17m</option>
</select>
</div>
<div id="event-value-measurement" class="event-value measurement event-value-multiple">
<div class="spinner input-prepend input-append" id="event-value-measurement-spinner">
<button class="btn spinner-down icon">-</button>
<input type="number" class="spinner-value spinner-full" step="any">
<button class="btn spinner-up icon">+</button>
</div>
<label for="event-value-measurement-units">Units</label>
<select id="event-value-measurement-units">
<option value="254">- None -</option>
</select>
</div>
<input type="hidden" name="scheduler" id="event-scheduler">
<input type="hidden" name="id" id="event-id">
<div class="actions">
<span class="btn btn-success" id="event-save">%save%</span>
<span class="btn btn-form-cancel">%cancel%</span>
</div>
</div>
</div>
<div class="sidebar sidebar-edit sidebar-edit-pri hide" id="scheduler-form">
<div class="sidebar-inner">
<h4>%schedulers_edit%</h4>
<label class="checkbox"><input type="checkbox" name="active" id="scheduler-active"> %schedulers_status_active%</label>
<label style="padding-top: 11px;">%schedulers_scheduler_enable_group%</label>
<select id="controlobjectgrp" name="type" disabled>
<option value="">%schedulers_unused_txt%</option>
<option value="0">%schedulers_unused_txt%</option>
</select>
<label class="checkbox" style="padding: 11px 20px;"><input type="checkbox" name="ignore_enable_group" id="scheduler-ignore-enable-group"> %schedulers_ignore_enable_group%</label>
<div class="timepickers">
<div class="timepicker timepicker-start">
<label>%schedulers_start%</label>
<div class="spinner-vertical timepicker-day" id="spinner-start-day">
<button class="btn btn-large spinner-up icon">&uarr;</button>
<input type="number" class="spinner-value" value="" name="start_day">
<button class="btn btn-large spinner-down icon">&darr;</button>
</div>
<div class="spinner-vertical spinner timepicker-month" id="spinner-start-month">
<button class="btn btn-large spinner-up icon">&uarr;</button>
<input type="hidden" class="spinner-value" value="" name="start_month">
<input type="text" class="spinner-display" value="">
<button class="btn btn-large spinner-down icon">&darr;</button>
</div>
</div>
<div class="timepicker timepicker-end">
<label>%schedulers_end%</label>
<div class="spinner-vertical spinner timepicker-day" id="spinner-end-day">
<button class="btn btn-large spinner-up icon">&uarr;</button>
<input type="text" class="spinner-value" value="" name="end_day">
<button class="btn btn-large spinner-down icon">&darr;</button>
</div>
<div class="spinner-vertical spinner timepicker-month" id="spinner-end-month">
<button class="btn btn-large spinner-up icon">&uarr;</button>
<input type="hidden" class="spinner-value" value="" name="end_month">
<input type="text" class="spinner-display" value="">
<button class="btn btn-large spinner-down icon">&darr;</button>
</div>
</div>
</div>
<input type="hidden" name="id" id="scheduler-id">
<div class="actions">
<span class="btn btn-success" id="scheduler-save">%save%</span>
<span class="btn btn-form-cancel">%cancel%</span>
</div>
</div>
</div>
<div class="sidebar sidebar-edit sidebar-edit-sec hide" id="holiday-form">
<div class="sidebar-inner">
<h4 class="title-add hide">%schedulers_holidays_add%</h4>
<h4 class="title-edit hide">%schedulers_holidays_edit%</h4>
<label for="holiday-name">%schedulers_name%</label>
<input type="text" name="name" id="holiday-name" placeholder="%schedulers_holidays_new%" class="text" maxlength="100">
<label for="holiday-type">%schedulers_holidays_type%</label>
<select id="holiday-type" name="type">
<option value="">%schedulers_holidays_date%</option>
<option value="dayweeknr">%schedulers_events_dow%</option>
</select>
<div id="holiday-type-dayweeknr">
<label for="holiday-dayofweek">%schedulers_events_dow%</label>
<div class="select-double">
<select id="holiday-dayweeknr" name="dayweeknr">
<option value="1">%schedulers_events_month_dow_1%</option>
<option value="2">%schedulers_events_month_dow_2%</option>
<option value="3">%schedulers_events_month_dow_3%</option>
<option value="4">%schedulers_events_month_dow_4%</option>
<option value="5">%schedulers_events_month_dow_5%</option>
<option value="6">%schedulers_events_month_dow_6%</option>
</select>
<select id="holiday-dayofweek" name="dayofweek">
<option value="1">%scripting_dt_weekday_mon%</option>
<option value="2">%scripting_dt_weekday_tue%</option>
<option value="3">%scripting_dt_weekday_wed%</option>
<option value="4">%scripting_dt_weekday_thu%</option>
<option value="5">%scripting_dt_weekday_fri%</option>
<option value="6">%scripting_dt_weekday_sat%</option>
<option value="7">%scripting_dt_weekday_sun%</option>
</select>
</div>
<label for="holiday-month">%schedulers_month%</label>
<select id="holiday-month" name="month">
<option value="1">%scripting_dt_month_jan%</option>
<option value="2">%scripting_dt_month_feb%</option>
<option value="3">%scripting_dt_month_mar%</option>
<option value="4">%scripting_dt_month_apr%</option>
<option value="5">%scripting_dt_month_may%</option>
<option value="6">%scripting_dt_month_jun%</option>
<option value="7">%scripting_dt_month_jul%</option>
<option value="8">%scripting_dt_month_aug%</option>
<option value="9">%scripting_dt_month_sep%</option>
<option value="10">%scripting_dt_month_oct%</option>
<option value="11">%scripting_dt_month_nov%</option>
<option value="12">%scripting_dt_month_dec%</option>
</select>
<label for="holiday-duration">%schedulers_duration%</label>
<div class="spinners">
<div class="spinner input-prepend input-append" id="spinner-holiday-duration">
<button class="btn spinner-down icon">-</button>
<input type="text" class="spinner-value spinner-full" value="">
<button class="btn spinner-up icon">+</button>
</div>
</div>
</div>
<div id="holiday-type-date">
<label>%schedulers_date_from%</label>
<div class="picker-from"></div>
<label>%schedulers_date_to%</label>
<div class="picker-to"></div>
</div>
<label class="checkbox"><input type="checkbox" name="recurring" id="holiday-recurring"> %schedulers_holidays_recur%</label>
<div class="spinners">
<div class="spinner input-prepend input-append" id="spinner-holiday-year">
<button class="btn spinner-down icon">-</button>
<input type="text" class="spinner-value spinner-full" value="">
<button class="btn spinner-up icon">+</button>
</div>
</div>
<input type="hidden" name="duration" id="holiday-duration-value">
<input type="hidden" name="day" id="holiday-day-value">
<input type="hidden" name="month" id="holiday-month-value">
<input type="hidden" name="year" id="holiday-year-value">
<input type="hidden" name="id" id="holiday-id">
<div class="actions">
<span class="btn btn-success" id="holiday-save">%save%</span>
<span class="btn btn-form-cancel">%cancel%</span>
</div>
</div>
</div>
<div class="modal modal-dialog hide" id="holiday-delete-modal">
<div class="modal-header">
<h4>%schedulers_holidays_delete_confirm%</h4>
</div>
<div class="modal-footer actions">
<span class="btn btn-danger btn-delete">%delete%</span>
<span class="btn btn-close">%cancel%</span>
</div>
</div>
<div class="modal modal-dialog hide" id="event-delete-modal">
<div class="modal-header">
<h4>%schedulers_events_delete_confirm%</h4>
</div>
<div class="modal-footer actions">
<span class="btn btn-danger btn-delete">%delete%</span>
<span class="btn btn-close">%cancel%</span>
</div>
</div>
</div>
<div class="well modal control-colorpicker hide">
<canvas width="280" height="225"></canvas>
<div class="slider-wrap slider-h">
<button class="btn btn-large slider-min icon">&larr;</button>
<div class="slider">
<span class="btn btn-large slider-handle"></span>
<div class="progress"></div>
</div>
<button class="btn btn-large slider-max icon">&rarr;</button>
</div>
<div class="pull-left btn btn-color">&nbsp;</div>
<div class="pull-left btn btn-color btn-color-white">&nbsp;</div>
<div class="pull-right">
<button class="btn btn-large btn-info btn-ok icon">✓</button>
<button class="btn btn-large btn-cancel icon">×</button>
</div>
</div>
<div class="modal-backdrop">
<div class="loader"><div></div><div></div><div></div><div></div></div>
</div>
<script type="text/javascript">getcls.</style>
</head>
<body class="schedulers getcss">
<style>Q">
<link rel="apple-touch-icon" href="/scada/resources/images/schedulers.pngE">
<link rel="icon" href="/scada/resources/images/schedulers.pngI">
<link rel="stylesheet" type="text/css" href="/scada/vis/brand.cssI">
<link rel="stylesheet" type="text/css" href="/scada/vis/theme.cssS"></script>
<link rel="stylesheet" type="text/css" href="/scada/vis/layout.cssM"></script>
<script type="text/javascript" src="/scada/vis/schedulers.jsK"></script>
<script type="text/javascript" src="/scada/vis/controls.js=<script type="text/javascript" src="/scada/vis/jquery.jsgetlangtag"></script>
versionS"></script>
<script type="text/javascript" src="/scada/resources/cbuslib.js.gzL"></script>
<script type="text/javascript" src="/scada/resources/lib.jsbversionP;</script>
<script type="text/javascript" src="/scada/resources/language.jsconfigencode	json� - Schedulers</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<script type="text/javascript">Config = gettitleL<!DOCTYPE html>
<html class="fh">
<head>
<meta charset="UTF-8">
<title> 