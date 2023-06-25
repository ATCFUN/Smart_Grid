LJ�d %  2%   4 >% 4 74 >% 4 % 4	 %
 4	 %
 4 4 >% 4 % 4 % 4 % 4 % 4 % 4 % 4 % 4	 % 4	 % 4 )  >%  4! 4" >!%" 4# >#%$ $ $ H  </script>
</body>
</html>
getjs�V">
	<div class="emergency-wrap">
		<div class="ios-title-bar"></div>
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<!--<button class="btn btn-large pull-left btn-menu icon">=</button>-->
					<!--<button class="btn btn-large pull-left btn-prev icon">&larr;</button>-->
					<a href="/logout" class="btn btn-large pull-right btn-logout icon">&#57345;</a>
					<a href="/" class="btn btn-large pull-right btn-home icon">&#57346;</a>
					<!--<button class="btn btn-large pull-right btn-next icon">&rarr;</button>-->
					<h4 class="title">%emergency_title%</h4>
				</div>
			</div>
		</div>
		<div class="content content-emergency hide">
			<!--<div class="info">
				<span class="inner">
					%schedulers_status%:
					<span class="status-active hide">%dt_1_11_1%</span>
					<span class="status-inactive hide">%dt_1_11_0%</span>
					<br>
					<span class="period"></span>
				</span>
			</div>-->
			<table class="tbl-events responsive">
				<thead>
					<tr>
						<th></th>
						<th>%emergency_name%</th>
						<!--<th>Test Group</th>-->
						<th>Set Mode</th>
						<th>Current Mode</th>
						<th>%emergency_status%</th>
						<td class="actions">
						<!--<span class="btn btn-small btn-success pull-right" id="group-add"><i class="icon">&oplus;</i> %emergency_group_add%</span>-->
						<!--<span class="btn btn-small btn-success pull-right" id="reload">Reload</span>-->
						</td>
					</tr>
				</thead>
				<tbody></tbody>
				<tfoot class="hide">
					<tr class="empty">
						<td colspan="4">%emergency_empty%</td>
					</tr>
					<tr class="tpl">
						<td data-label="" class="index_emer"></td>
						<td data-label="%emergency_name%" class="name_emer"></td>
						<!--<td data-label="Test Group" class="vgroupname_emer"></td>-->
						<td data-label="Set Mode" class="mode_emer">
						<select class="mode-select-box msb-ind hide" name="type">
							<option value="0">%emergency_mode_normal%</option>
							<option value="1">%emergency_mode_function%</option>
							<option value="2">%emergency_mode_duration%</option>
							<!--<option value="3">%emergency_mode_inhibit%</option>-->
							<!--<option value="4">%emergency_mode_rest%</option>-->
							<!--<option value="5">%emergency_mode_emergency%</option>-->
							<!--<option value="6">%emergency_mode_extemergency%</option>-->							
						</select>
						<select class="mode-select-box msb-grp hide" name="type">
							<option value="0">%emergency_mode_normal%</option>
							<option value="1">%emergency_mode_function%</option>
							<option value="2">%emergency_mode_duration%</option>
							<option value="3">%emergency_mode_inhibit%</option>
							<option value="4">%emergency_mode_rest%</option>
							<option value="7">%emergency_mode_relight%</option>
						</select>
						<span class="btn btn-form-set" style="margin-top:-10px;">Set</span>
						</td>
						<td data-label="Current Mode" class="currentmode_emer"></td>
						<td data-label="%emergency_status%" class="status_emer">
							<span class="status_test hide"></span>
							<div id="progressBar" class="test_pb hide"><div class="progressContent"></div></div>
						</td>
						<td class="actions">
							<div class="btn-group pull-right">
								<span class="btn btn-small repo">Report</span>
								<!--<span class="btn btn-small report">Report</span>-->
								<!--<span class="btn btn-small report-h">Historical Report</span>-->
								<!--<span class="btn btn-small email">Email</span>-->
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<!--<div class="sidebar sidebar-menu rightBar" id="vgroup-performtest">
			<div class="sidebar-inner">
				<label for="id-vgrouptp-select">Select Group</label>
				<select name="vgIdTestPerform" id="id-vgrouptp-select">
				</select>

				<label for="id-vgrouptp-mode-select">Select Test</label>
				<select name="vgModeTestPerform" id="id-vgrouptp-mode-select">					
					<option value="1">%emergency_mode_function%</option>
					<option value="2">%emergency_mode_duration%</option>
				</select>
				<div class="actions">
					<span class="btn btn-success" id="vgroup-test-start">Start</span>
				</div>
			</div>
		</div>-->
		<!--<div class="sidebar sidebar-edit sidebar-edit-pri hide" id="email-form">
			<div class="sidebar-inner">
				<h4 class="title-form">%emergency_email%</h4>
				<label for="email-to">%emergency_email_to%</label>
				<input type="text" name="to" id="email-to" class="text">
				<label for="email-cc">%emergency_email_cc%</label>
				<input type="text" name="cc" id="email-cc" class="text">
				<label for="email-filename">%emergency_email_attch%</label>
				<input type="text" name="filename" id="email-filename" class="text" readonly="readonly" style="background-color: #e9e9e9;">
				<label for="email-subject">%emergency_email_sub%</label>
				<input type="text" name="subject" id="email-subject" class="text" maxlength="100">
				<label for="email-message">%emergency_email_msg%</label>
				<textarea form ="email-form" name="message" id="email-message" rows="5" cols="32" wrap="soft" style="color: #555; font-family: Arial, Helvetica, sans-serif;font-size: 14px;font-weight: normal;"></textarea>
				<div class="actions">
					<span class="btn btn-success" id="email-send">%send%</span>
					<span class="btn btn-form-cancel">%cancel%</span>
				</div>
			</div>
		</div>-->
		<div class="sidebar sidebar-edit sidebar-edit-pri hide" id="emailId-form">
			<span class="btn btn-form-cancel btn-back" id="emailId-back">%back%</span>
			<div class="sidebar-inner sidebar-email">
				<h4 class="title-form">%emergency_email%</h4>
				<label for="email-to">%emergency_email_to%</label>
				<input type="text" name="to" id="emailId-to" class="text">
				<label for="email-cc">%emergency_email_cc%</label>
				<input type="text" name="cc" id="emailId-cc" class="text">
				<label for="email-filename">%emergency_email_attch%</label>
				<input type="text" name="filename" id="emailId-filename" class="text" readonly="readonly" style="background-color: #e9e9e9;">
				<label for="email-subject">%emergency_email_sub%</label>
				<input type="text" name="subject" id="emailId-subject" class="text" maxlength="100">
				<label for="email-message">%emergency_email_msg%</label>
				<textarea form ="email-form" name="message" id="emailId-message" rows="5" cols="32" wrap="soft" style="color: #555; font-family: Arial, Helvetica, sans-serif;font-size: 14px;font-weight: normal;-webkit-user-select:text;"></textarea>
				<div class="actions">
					<span class="btn btn-success" id="emailId-send">%send%</span>
					<span class="btn btn-form-cancel">%cancel%</span>
				</div>
				<p style="font-size: 12px;">%send_email_warning_note%</p>
			</div>
		</div>
		<div class="sidebar sidebar-edit sidebar-edit-pri hide" id="report-form">
			<div class="sidebar-inner">
				<div id="filter-widget" class="hide">
					<input type="text" name="daterange" id="date-range" class="text" value="Select a date range" readonly="readonly" style="background-color: #e9e9e9; width:65%;">
					<span class="btn btn-success btn-form-filter" style="top: -6px;position: relative;left: 5px;">Filter</span>
				</div>
				<h5 id="title-report-form"></h5>
				<div id="reports">
					
				</div>
				<div class="actions">
					<!--<span class="btn btn-success" id="report-save">%save%</span>-->
					<span class="btn btn-form-cancel">%cancel%</span>
				</div>					
				<div class="unittpl parent-Unit hide">
				   <div class="cls-toggle"><span class="cls-icon-p">+</span></div>
				   <input type="checkbox" class="cls-checkbox"><label></label>				   				  
				</div>	
				<div class="linetpl child-line hide">
				    <div class="cls-toggle"><span class="cls-icon-p">+</span></div>
				    <input type="checkbox" class="cls-checkbox"><label></label>
				</div>
				<div class="eltpl child-line cls-emer-light hide">
				    <input type="checkbox" class="cls-checkbox"><label></label>
				</div>				
			</div>
		</div>
		<!--<div class="sidebar sidebar-edit sidebar-edit-pri hide" id="vgroup-form">
			<div class="sidebar-inner">
				<label for="id-vgroup-select">Create/Edit Group</label>
				<select name="vgId" id="id-vgroup-select">					
				</select>

				<label for="vgroup-name">%emergency_vgroup_name%</label>
				<input type="text" name="vgName" id="vgroup-name" class="text">

				<label for="">%emergency_lights_objs%</label>
				<fieldset class="eme-objs-cb"> 										
				</fieldset> 

				<label for="vgroup-site">%emergency_vgroup_siteid%</label>
				<input type="text" name="vgSite" id="vgroup-site" class="text">
				<label for="vgroup-performer">%emergency_vgroup_testpername%</label>
				<input type="text" name="vgPerformer" id="vgroup-performer" class="text">
				<label for="vgroup-logo">%emergency_vgroup_logo%</label>
				<input type="file" name="vgLogo" id="vgroup-logo" class="text">
				
				<div class="actions">
					<span class="btn btn-success" id="vgroup-save">%save%</span>
					<span class="btn btn-form-cancel">%cancel%</span>
				</div>					
				<div class="unittpl parent-Unit hide">
				   <div class="cls-toggle"><span class="cls-icon-p">+</span></div>
				   <input type="checkbox" class="cls-checkbox"><label></label>				   				  
				</div>	
				<div class="linetpl child-line hide">
				    <div class="cls-toggle"><span class="cls-icon-p">+</span></div>
				    <input type="checkbox" class="cls-checkbox"><label></label>
				</div>
				<div class="eltpl child-line cls-emer-light hide">
				    <input type="checkbox" class="cls-checkbox"><label></label>
				</div>				
			</div>
		</div>-->
		<div class="modal modal-dialog hide" id="mode-change-modal">
			<div class="modal-header">
				<h4 id="confirm-msg-txt"></h4>
			</div>
			<div class="modal-footer actions">
				<span class="btn btn-danger btn-yes">Yes</span>
				<span class="btn btn-close">%cancel%</span>
			</div>
		</div>
		<!--<div class="modal modal-dialog hide" id="vgmode-change-modal">
			<div class="modal-header">
				<h4 id="vgconfirm-msg-txt"></h4>
			</div>
			<div class="modal-footer actions">
				<span class="btn btn-danger btn-yes">Yes</span>
				<span class="btn btn-close">%cancel%</span>
			</div>
		</div>-->
		<div class="modal modal-dialog hide" id="ui-msg-modal">
			<div class="modal-header">
				<h4 id="ui-msg-txt"></h4>
			</div>
			<div class="modal-footer actions">
				<span class="btn btn-close">OK</span>
			</div>
		</div>		
	</div>
	<div class="modal filter hide">
	<div class="modal-header">
	<h5 class="tr">Filter group reports</h5>
	<button class="close window-close">&times;</button>
	</div>
	<div class="modal-body">
	<div class="split">
	<div class="filter-picker-wrap">
	<label class="tr">From date</label>
	<div class="filter-picker filter-picker-start"></div>
	</div>
	<div class="filter-picker-wrap">
	<label class="tr">To date</label>
	<div class="filter-picker filter-picker-end"></div>
	</div>
	</div>
	</div>
	<div class="modal-footer">
	<span class="btn tr set-filter-value">Ok</span>
	</div>
	</div>
	<div class="modal-backdrop"></div>
	<script type="text/javascript">getcls-</style>
</head>
<body class="emergency getcss">
<style>P">
<link rel="apple-touch-icon" href="/scada/resources/images/emergency.png�">
<!--<link rel="stylesheet" type="text/css" href="/scada/vis/emergency.css">-->
<link rel="icon" href="/scada/resources/images/emergency.pngM">
<link rel="stylesheet" type="text/css" href="/scada/vis/emergency.cssI">
<link rel="stylesheet" type="text/css" href="/scada/vis/brand.cssI">
<link rel="stylesheet" type="text/css" href="/scada/vis/theme.cssS"></script>
<link rel="stylesheet" type="text/css" href="/scada/vis/layout.cssL"></script>
<script type="text/javascript" src="/scada/vis/emergency.jsK"></script>
<script type="text/javascript" src="/scada/vis/controls.js=<script type="text/javascript" src="/scada/vis/jquery.jsgetlangtag"></script>
Q"></script>
<script type="text/javascript" src="/scada/resources/language.jsversionS"></script>
<script type="text/javascript" src="/scada/resources/cbuslib.js.gzbversionK;</script>
<script type="text/javascript" src="/scada/resources/lib.jsconfigencode	json� - Emergency and Exit Lighting</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<script type="text/javascript">Config = gettitle<<html class="fh">
<head>
<meta charset="UTF-8">
<title> 