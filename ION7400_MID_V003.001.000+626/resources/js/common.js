// active vertical tab (LI object index)
var activeTabIndex = -1;

// development environment indicator (string: full|labels|false) - get from cookie, override with parm
var development = getCookie('development');
if (development == null || getUrlParm('development') != undefined) 
{
	development = getUrlParm('development');
}
if (development != "full" && development != "labels") development = "false";
setCookie('development', development);
$.ajaxSetup ({
    // Disable caching of AJAX responses, this also applies to .load()
    cache: false
});
jQuery(document).ready(function()
{
	// Display the Maintenance Tab only if there are Custom Pages
	customUserPages.returnCustomMaintenancePages();
	
	// include the header
	jQuery('#header').load('header.html', function()
	{
		
		// TODO: Get selected language. "en" is default
		selectedLanguage = '';
		
		// Get date and time from API call and populate header area
		clockTime.initDateTimeClock(selectedLanguage);
		
		// Get and display Logged In Username
		userAuthentication.getLoggedInUser();
		
		// Bind Logout link method
		jQuery('#logout').bind('click', function()
		{
			userAuthentication.logUserOut();
		});
		
		// replace translations in dev environment
		devReplaceTranslations('#header');
		
		// initialize the 'update in progress' spinner popup and error popup, which are both included 
		//	in the header HTML
		initMeterChangePopups();
		
	});
	
});


/**
 * This function escapes all html special characters and must be used whenever
 * any unsafe data is being loaded into any html tag like div, p, b, td, etc.
*/
function escapeHtml(unsafe)
{
 return unsafe
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;")
      .replace(/'/g, "&#039;")
      .replace(/\//g, "&#x2F;");
}


/**
 * Finish off the styling for the VertTabs
 * This function must be called after the Custom User pages has been loaded.
 * This function is called in "customUserPages.populateCustomUserPagesSuccess"
 */
function finishVertTabStyles()
{
	// add jQuery UI tabs classes to horizontal and vertical tabs
	jQuery('#tabs, #verttabs').addClass('ui-tabs ui-widget ui-widget-content ui-corner-all');
	jQuery('#tabs ul, #verttabs > ul').addClass('ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all');
	jQuery('#tabs ul li, #verttabs > ul > li').addClass('ui-state-default ui-corner-top ui-tabs-active');
	jQuery('#tabs ul li a, #verttabs > ul > li > a').addClass('ui-tabs-anchor');
	
	// change classes on vertical tabs for correct layout
	$( "#verttabs").addClass( "ui-tabs-vertical ui-helper-clearfix" );
	$( "#verttabs > li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );

	// set hover styling on tabs
	jQuery('#tabs > ul > li, #verttabs > ul > li').hover(function ()
	{
		jQuery(this).addClass('ui-state-hover');
	}, 
	function ()
	{
		jQuery(this).removeClass('ui-state-hover');
	});
	
	// Only activate the first VertTab if an item exists
	if(jQuery('#verttabs > ul > li').html() !== undefined)
	{
		// handle vertical tab click events and click first tab
		verticalTabs('0');
	}
	
	// any events or changes that may need to be repeated when a portion of the page is changed via ajax
	onloadAjax();
	
}


/**
 * Events and actions to be taken when a portion of the page is changed by ajax.
 * 
 * This function is purely for encapsulation of the kind of code that would normally be
 *	in the document onload function, but may also affect page elements that change via
 *	ajax.
 * 
 * @param number reqStatus - the request status code (is optional)
 */
function onloadAjax(reqStatus)
{
	// If there is an error loading the page (anything but 200)
	if(typeof reqStatus != 'undefined')
	{
		// Catch any Request status that is not 200 (not OK)
		// Bad Meter and Parse Errors are caught before this function.
		if(reqStatus != 200) {
			// Handle 404
			errorMessage.displayHTMLErrorMessage('404', '#content');
		}
	}
	
	// add alternating classnames to data table rows, for zebra striping
	jQuery('.datatable tr:nth-child(even), .formtable tr:nth-child(even)').addClass('altrow');
	
	$('.accordion').accordion({
	    collapsible:true,
		heightStyle: 'content'
		
		/*
		// This hacked code allows Multiple Accordions to be open at once.
	    beforeActivate: function(event, ui) {
	         // The accordion believes a panel is being opened
	        if (ui.newHeader[0]) {
	            var currHeader  = ui.newHeader;
	            var currContent = currHeader.next('.ui-accordion-content');
	         // The accordion believes a panel is being closed
	        } else {
	            var currHeader  = ui.oldHeader;
	            var currContent = currHeader.next('.ui-accordion-content');
	        }
	         // Since we've changed the default behavior, this detects the actual status
	        var isPanelSelected = currHeader.attr('aria-selected') == 'true';

	         // Toggle the panel's header
	        currHeader.toggleClass('ui-corner-all',isPanelSelected).toggleClass('accordion-header-active ui-state-active ui-corner-top',!isPanelSelected).attr('aria-selected',((!isPanelSelected).toString()));

	        // Toggle the panel's icon
	        currHeader.children('.ui-icon').toggleClass('ui-icon-triangle-1-e',isPanelSelected).toggleClass('ui-icon-triangle-1-s',!isPanelSelected);

	         // Toggle the panel's content
	        currContent.toggleClass('accordion-content-active',!isPanelSelected)    
	        if (isPanelSelected) { currContent.slideUp(); }  else { currContent.slideDown(); }

	        return false; // Cancel the default action
	    }
		*/
	});
	
	devReplaceTranslations();

	// set width on submit buttons, so that centering works correctly in IE8
	//	note - this needs to happen after translations are replaced via devReplaceTranslations() so that
	//	we have the correct width for various translations of the word "Apply"
	jQuery(':submit').each(function ()
	{
		jQuery(this).css('width', jQuery(this).outerWidth() + 'px');
	});
}

/**
 * Initialize vertical tabs.
 * 
 * @param string clickTabByIndex - the index of the verticle tab to be auto-clicked.
 */
function verticalTabs(clickTabByIndex)
{
	// hijack click event on links, get URL, and load it in container via ajax instead of redirecting to page.
	jQuery('#verttabs a').click(function ()
	{
		// clear the ajax timer that reloads reports on an interval
		clearTimeout(requestTimer);						

		// load waiting spinner in main content area
		jQuery('#content').html(jQuery('#waiting-master > div').clone());

		// get URL from link
		var url = jQuery(this).attr('href');

		// determine active tab (highest-level tab in vertical tabs); if this is a submenu, set this to parent tab
		var tab = jQuery(this).closest('li', '#verttabs');
		if (jQuery(tab).parent().closest('li', '#verttabs').size())
		{
			tab = jQuery(tab).parent().closest('li', '#verttabs');
		}
		var tabIndex = jQuery(tab).index();


		// if active tab has changed, add/remove class markers and set as active tab
		if (activeTabIndex != tabIndex)
		{
			jQuery('#verttabs li').removeClass('ui-state-active ui-state-hover');
			jQuery(tab).addClass('ui-state-active ui-state-hover');			

			// hide submenu of old active tab if applicable
			jQuery('#verttabs > ul > li > ul').hide();

			activeTabIndex = tabIndex;
		}
		
		/* check if there is a submenu, in which case:
			a) load the first link from that instead
			b) show the submenu
		*/
		if (jQuery(this).closest('li').find('ul').size() > 0)
		{
			// get first submenu's link
			url = jQuery(this).closest('li').find('ul li a').first().attr('href');

			// show the submenu
			jQuery(this).closest('li').find('ul').show();

			// handle active marker on submenu items
			submenus();
		}
		
		// load the main container via ajax

		var splitUrl = url.split(".");
		if( splitUrl.length > 1 && splitUrl[0] != "" ) {
			ext = splitUrl.pop().toLowerCase();
			if (ext === "html") {
				jQuery('#content').load(url, null, function (response, status, reqStatusObj)
				{
					onloadAjax(reqStatusObj.status);
				});
			}
			else if (ext === "jpg" || ext === "jpeg" || ext === "png" || ext === "bmp" || ext === "gif" || ext === "svg" ) {
				// $("html").height() seems better than $("body").outerHeight(true), but IE returns the html height as the window height
				jQuery('#content').html("<img src='"+url+"' style='padding-top:10px' alt='Image format not supported'>");
			}
			else { // including PDF
				// $("html").height() seems better than $("body").outerHeight(true), but IE returns the html height as the window height
				var contentToBodyPadding = $("body").outerHeight(true) - $("#content").height();
				jQuery('#content').html(("<embed src='"+url+"' style='display: block; width: 100%; height: " + ($(window).height() - contentToBodyPadding) +"px' >"));
			}
		}
		// return false to cancel redirect to page (ie: normal anchor functionality)
		return false;
	});
	
	// Invoke the click event for the specified vertical tab index.
	if(clickTabByIndex)
	{
		// click first tab to load data
		jQuery('#verttabs > ul > li > a').eq(clickTabByIndex).click();
	}
}

/**
 * Replace translation markers in development environment.
 *
 * Find and replace all WindMark markers in the following form, with their
 *	untranslated (ie: English) descriptions:
 *
 *	$%localizedString(Temperature Min)#$
 *
 * This would be replaced by "Temperature Min".
 * 
 * @parm selector CSS selector of DOM object to scan and replace
 */
function devReplaceTranslations(selector)
{
	// only continue if we are in the development environment
	if (development == "false")
	{
		return;
	}

	// if no selector is specified, search entire document (ie: body)
	if (selector == null || selector == '')
	{
		selector = 'body';
	}

	// find all DOM elements that have the placeholder text in them (include all submit buttons)
	var arrElements = jQuery(selector).find(':contains("localizedString"), :submit');

	// for each object, remove beginning and end of placeholder, leaving only label text
	jQuery(arrElements).each(function ()
	{

		// for submit buttons, remove placeholder text on "value" element, leaving only English label
		if (jQuery(this).is(':submit'))
		{
			strText = jQuery(this).val();
			strText = strText.replace('$%localizedString(', '');
			strText = strText.replace(')#$', '');
			jQuery(this).val(strText);
		}
		else
		{
			// find text-type content nodes (ie: the actual text) and wrap it in a span
			//	to be able to manipulate it
			var strText = jQuery(this).contents().filter(function() {
			  return this.nodeType == 3;
			}).wrap('<span class="tempDevClass"></span>');
			var objTextWrapper = jQuery(this).find('.tempDevClass');

			// remove placeholder localization text, leaving only the English label
			var strText = jQuery(objTextWrapper).text();
			strText = strText.replace('$%localizedString(', '');
			strText = strText.replace(')#$', '');
			jQuery(objTextWrapper).text(strText);

			// remove temporary wrapper from around text
			jQuery(objTextWrapper).contents().filter(function() {
				return this.nodeType === 3;
			}).unwrap();
		}


		/* Coding Notes:
			- Just using .text() on matching elements replaces too much content when 
				dealing with parent objects, such as the UL element of tabs when what we 
				are actually dealing with is the A element several levels down. That is 
				why we find true text nodes (nodeType = 3).
			- The simple solution of .text() unfortunately replaces sibling elements along
				with text, such as the arrow image on accordions. That is why we wrap 
				the text in tempDevClass.
		*/
	});

}

/**
 * Get parameter from GET parms in URL.
 * 
 * @parm parmName Parameter name in URL.
 * @return Value of the parameter.
 */
function getUrlParm(parmName)
{
	var strParms = window.location.search.substr(1);
	var arrParms = strParms.split ("&");
	var params = {};

	for ( var i = 0; i < arrParms.length; i++) {
		var arrTemp = arrParms[i].split("=");
		params[arrTemp[0]] = arrTemp[1];
	}

	return params[parmName];
}

/**
 * Set a browser cookie.
 * 
 * @parm c_name Cookie name.
 * @parm c_value Cookie value.
 * @parm optional extdays Number of days until expiry.
 */
function setCookie(c_name,value,exdays)
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString()) + ";PATH=/";
	document.cookie=c_name + "=" + c_value;
}

/**
 * Get value of a browser cookie.
 * 
 * @parm c_name Cookie name.
 * @return Value of the cookie, or null if no cookie exists.
 */
function getCookie(c_name)
{
	var c_value = document.cookie;
	var c_start = c_value.indexOf(" " + c_name + "=");
	if (c_start == -1)
	{
		c_start = c_value.indexOf(c_name + "=");
	}
	if (c_start == -1)
	{
		c_value = null;
	}
	else
	{
		c_start = c_value.indexOf("=", c_start) + 1;
		var c_end = c_value.indexOf(";", c_start);
		if (c_end == -1)
		{
			c_end = c_value.length;
		}
		c_value = unescape(c_value.substring(c_start,c_end));
	}
	return c_value;
}

/**
 * Return the value of a data object, from an array of data objects.
 *
 * Helper function to limit code duplication and perform minor validation that data exists. Anticipated
 *	primary use is with the "values" array returned by call to GetRegisterValues API method.
 * 
 * @parm array arrData - the array containing returned data objects, indexed in the order they were requested.
 * @parm String index - the index of the register we want.
 * @parm String regName - Optional, the name of the register to find (used in dev only) 
 * @return Object {value, units} - The contents of the "value" and "units" properties of the register.
 */
function getDataValue(arrData, index, regName)
{	
	var returnObj = {};

	// in full development (ie: dummy data), get the data by name, not index
	if (development == "full" && regName != null)
	{
		var result = [];
		result = jQuery.grep(arrData, function(element, index)
		{ 
			if (element.name == regName) return true;
			if (element.label == regName) return true;
		});
		
		if (result.length > 0)
		{
			returnObj.value = result[0].value;
			
			// set units if they exist (the property may not exist at all)
			if (result[0].units != undefined) returnObj.units = result[0].units;
		}
		else 
		{
			returnObj.value = "-";
			returnObj.units = "";
		}
	}

	// get the data in the requested position in live environment
	else if (development != "full" && arrData && index >= 0 && arrData.length > index)
	{
		returnObj.value = arrData[index].value;

		// set units if they exist (the property may not exist at all)
		if (arrData[index].units != undefined) returnObj.units = arrData[index].units;
	}

	// if all else fails, return blank values
	else
	{
		returnObj.value = "-";
		returnObj.units = "";
	}

	// return the object containing value and units properties
	return returnObj;
}

function getRegisterArrayFromPage(strContainerSelector)
{
	var arrRegNames = [];
	
	// create array of register names from "regname" and "name" attributes on table
	arrRegNames = jQuery(strContainerSelector + ' [regname], ' + strContainerSelector + ' [name]').map(function ()
	{
		if (jQuery(this).attr('regname') != null) return jQuery(this).attr('regname');
		else return jQuery(this).attr('name');
	});
	
	// Convert RegisterNames to an array
	return arrRegNames.toArray();
}

function getTimestampRegisterArrayFromPage(strContainerSelector)
{
	// create array of register names from "regname" and "name" attributes on table
	return jQuery(strContainerSelector + ' [timestamp]').map(function ()
	{
		if (jQuery(this).attr('timestamp') != null) return jQuery(this).attr('timestamp');
	});
}



/**
 * Build a string containing the JSON markup to submit to the setRegisterValues API call. Only send registers
 *	that have been changed by the user.
 *
 * Helper function to form a string containing JSON markup specific to the setRegisterValues API call, in 
 *	this form:
 *		{
 *			"values":
 *				[
 *					{
 *						"name": "registerString1",
 *						"value": "registerValue1",
 *						"units": "registerUnits1"
 *					},
 *					{
 *						"name": "registerString2",
 *						"value": "registerValue2",
 *						"units": "registerUnits2"
 *					},
 *					...
 *				]
 *		}
 *
 * 
 * @parm string strContainerSelector - selector for the form object to convert to JSON string.
 * @return String A string in JSON notation to send to the setRegisterValues API call.
 */
function buildStringSetRegister(strContainerSelector)
{
	if (strContainerSelector)
	{
		return jQuery(strContainerSelector).find('[changed="true"]').serializeArray();
	}
}

function populateRegisterValuesOnPage(data, registerArray, paneID, wrapUnits)
{
	// check that API results are as expected, otherwise leave this function
	if (data.result != undefined) {
		data = data.result;
	}
	else
	{
		errorMessage.displayHTMLErrorMessage('Meter Data Error', '#'+paneID);
		return;
	}
	
	// default wrapUnits flag to false (ie: don't wrap units in parentheses)
	if (wrapUnits == undefined) wrapUnits = false;
	populateRegisterValues(data, registerArray, paneID, wrapUnits);
}


/**
 * Populate Register values: populates Register values on page
 * 
 * @param data array - data provided by the API
 * @parm array strRegisterNames - The list of register names to populate
 * @parm string paneID - ID of the pane being updated.
 */
function populateRegisterValues(data, arrRegNames, paneID, wrapUnits)
{
	jQuery(arrRegNames).each(function (index, regName)
	{
		registerContents = {};
		dataValue = '';
		units = '';

		// get data value from API response
		registerContents = getDataValue(data, index, regName);
		dataValue = registerContents.value;
		if ( registerContents.units != undefined )
		{
			units = registerContents.units;
		}
		if ( dataValue != undefined ) 
		{
         var unitText = '';
         // update the units label (if the data exists and if there is a container for it)
         if (units != '' && units != undefined) 
         {
            unitText = units;
            if (wrapUnits) unitText = "(" + unitText + ")";
            jQuery('[unitsreg="' + regName + '"]').text(unitText);	
         }

         // populate element text (ie: table data)
         jQuery('#' + paneID + ' [regname="' + regName + '"]').text(dataValue+' '+units).attr('readonly',true);	

         // populate form field
         jQuery('#' + paneID + ' [name="' + regName + '"]').val(dataValue);	
		}
		else
		{
			// If the units are undefined, the web page will hide it from view. 
			// This requires the class name to be the same as the regName (ION Label).
			// The regular expression removes the space used in the register name to
			// correspond with the class name because a class name cannot have a space. 
			// Example The register name 'Enable BACnet' 
			// becomes 'EnableBACnet', which is the HTML class name. 
			className = regName.replace(/\s/g, '');
			// Also, "/" needs to be escape for jQuery to work. Example, "ABC/D" needs to be escaped as "ABC\/D"
			className = className.replace('/',"\\/");
			jQuery('#' + paneID).find("tr." + className).hide(); 
		}
	});
}


/**
 * Populate Timestamp values: populates Timestamp values on page
 * 
 * @param data array - data provided by the API
 * @parm array strRegisterNames - The list of register names to populate
 * @parm string paneID - ID of the pane being updated.
 */
function populateTimestampValues(timestampData, timestampRegNames, paneID, registerData, registerNameArray)
{
	if(timestampData.timestamps == undefined)
	{
		errorMessage.displayHTMLErrorMessage('Meter Data Error', '#'+paneID);
		return;
	}

	// init variables to hold API register contents
	var registerContents;
	
	// populate table or form fields with data, by looping through each requested register value 
	//	and finding its corresponding value in the returned data object
	jQuery(timestampRegNames).each(function (index, regName)
	{
		registerContents = timestampData.timestamps[index];

		if(registerContents.seconds != undefined)
		{
			var timeValue = localTimestamp.localizeTimestamp(registerContents.seconds, registerContents.uSeconds, clockTime.regional);

			if ( !RegisterHasValidValueForTimestamp(regName, registerData, registerNameArray) )
				timeValue = '';
			// populate element text (ie: table data)
			jQuery('#' + paneID + ' [timestamp="' + regName + '"]').text(timeValue);
		}
		
	});
}

function RegisterHasValidValueForTimestamp(regName, registerData, registerNameArray)
{
	if (registerData == undefined || registerNameArray == undefined || registerData.result == undefined) {
		return true;
	}
	registerData = registerData.result;
	var dataIndex = jQuery.inArray(regName, registerNameArray);
	return (dataIndex > -1) && (registerData[dataIndex].value != "N/A");
}

/**
 * Populate dropdowns on page with returned values (aka enumerations). This function is for 
 *	encapsulation of common code.
 *
 * @parm array data - The JSON object sent back from device by API call, listing possible values for registers.
 * @parm array strRegisterNames - The list of register names sent to the device via API call (string representation of JSON object).
 */

function populateDropdowns(data, arrRegNames)
{
	/**
		// JSON Structure
		{ 
			“values”:
			[[ 
				{
					“name”:”VoltsMode”, 
					“value”:”4W-WYE”,			// The HTML Option Value.
					“translatedValue”:”....”	// What the user is displayed.
				}
			]] 
		}
	*/
	if (!data.result) return;
	data = data.result;
	for(var i=0;i<arrRegNames.length;i++) {
		
		// Empty the Select Menu
		//   This prevents menus from populating with a second set of
		//   menu items when changes are applied.
		var dropDown = jQuery('[name="' + arrRegNames[i] + '"]');
		dropDown.empty();
		
		jQuery.each(data, function (k,v)
		{
			// Each key/value contains drop down list items
			// [[[name],[value],[translatedValue]], [[name],[value],[translatedValue]]]
			
			// Iterate each drop down item
			jQuery.each(v, function (key, dataValue)
			{
				if(dataValue.name == arrRegNames[i]) {
					
					var displayValue;
					if(typeof dataValue.translatedValue !== 'undefined')
					{
						displayValue = dataValue.translatedValue;
					}
					else
					{
						displayValue = dataValue.value;
					}
					dropDown.append('<option value="' + dataValue.value + '">' + displayValue + '</option>');
				}
			});
		});
		// Make sure nothing is selected by default in case the meter doesn't return a value, e.g.
		// the user doesn't have permissions to see the current value
		dropDown.prop("selectedIndex", -1);
	}
	
}


/**
 * userAuthentication is used to fetch, store, and display the currently logged in user,
 * and log the User out.
 */
var userAuthentication = {
	
	loggedInUser: '',
	
	// Fetch the logged in User's Username
	getLoggedInUser: function()
	{
		// Compose Request Object
		var reqLoggedInUserObject = ({
			type: 'GET',
			url: '/api/getLoggedInUser',
			returnType: 'json',
			successCallback: userAuthentication.getUserSuccess,
			failCallback: userAuthentication.getUserFail
		});

		pmAjax.sendGet(reqLoggedInUserObject);
	},
	
	
	// Display the logged in User's username in the page header
	getUserSuccess: function (data, strRegisterNames)
	{
		// Extract Usrename
		userAuthentication.loggedInUser = data['userName'];
		
		// Update Header with Logged In Username
		jQuery('#loggedInUsername').html(userAuthentication.loggedInUser);
		
	},
	
	
	// Display nothing for a failed GetLoggedInUser request
	getUserFail: function ()
	{
		// TODO: Handle failing getLoggedInUser request
		jQuery('#loggedInUsername').html('');
	},
	
	
	// Call API to Logout the User
	logUserOut: function()
	{
		// Compose Request Object
		var reqLogoutUserObject = ({
			type: 'POST',
			url: '/api/userLogout',
			requestArrayName: 'names',
			registerArray: ["blank"],
			returnType: 'json',
			successCallback: userAuthentication.logUserOutSuccess,
			failCallback: userAuthentication.logUserOutFail
		});
		
		pmAjax.sendPostWithArray(reqLogoutUserObject);
	},
	
	
	// Successfully logged out User is redirected to Logon page
	logUserOutSuccess: function()
	{
		// Forward user out to Login Screen
		window.location.href = '../resources/monitoring.html';
		return false;
	},
	
	
	// Log User Out Fail callback
	logUserOutFail: function ()
	{
		// TODO: Handle failed request
		console.log('Logout Fail');
	}
	
}


/**
 * Updates the ClockTime found in the page Header.
 * Re-Synchronizes the time every minute with the Register Value. 
 */
var clockTime = {
	
	// Set Clock Time Interval Object, Interval Counter, and Inteval Limit
	// Create new Moment.js object
	momentTime: moment(),
	runningClock: '',
	intervalCounter: 0,
	intervalLimit: 59,
	regional: 'en',
	
	// Initialize and run the clock
	initDateTimeClock: function(language) {
		
		// Extract PM Language String cookie value
		language = getCookie('pmLanguageString');
		
		// Set Language if provided
		if(language != '')
		{
			clockTime.regional = language;
		}
		
		// Create new date object
		clockTime.fetchDateRegisterValue();
		
	},
	
	
	// Fetch the Timestamp stored in the Register
	fetchDateRegisterValue: function ()
	{
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			requestArrayName: 'names',
			registerArray: ["Local Time"],
			returnType: 'json',
			successCallback: clockTime.getClockTimeSuccess,
			failCallback: clockTime.getClockTimeFail
		});
	
		pmAjax.sendPostWithArray(reqRegisterObject);
		
	},
	
	
	// Fetch Date Register Value success callback
	getClockTimeSuccess: function (data, reqObj)
	{
		// Extract the 'CL1 UnivTime' value; remove commas and spaces from the string.
      // This assumues the value is ALWAYS an integer, because in digit grouping mode '1 000,0'
      // the 'decimal' would be removed. This should be ok since it should always be the unix time integer seconds.
		var registerDate = data['result'][0]['value'].replace(/([, ])/g, '');
		
		// Clear existing Timeout
		// clockTime.runningClock = clearTimeout(clockTime.runningClock);

		// Verify that the Timestamp is valid
		var unixTimeNow = moment.unix(parseInt(registerDate));
		if(unixTimeNow.isValid() && parseInt(registerDate) > 1)
		{
			// Run the ClockTime clock
			clockTime.runClockTime(registerDate);
		}
		else
		{
			// Failed: retry initDateTimeClock() request in 60 seconds
			clockTime.getClockTimeFail();
		}
	},
	
	
	// Get Clock Time fail handler
	getClockTimeFail: function ()
	{
		// Display empty time
		$('div#datetime').html('-');
		
		// Retry Clock Time request in 60 seconds.
		var retry = setTimeout(function () { clockTime.initDateTimeClock(clockTime.regional) }, 60000);
	},
	
	
	/**
	 * Run the Clock Time starting at provided Timestamp
	 * The clock is re-synchronized with the register value every 60 seconds
	 *
	 * @param string timestamp - the Unix Epoch timestamp fetched from the register.
	 */
	runClockTime: function(timestamp)
	{
		// Clear ClockTime Interval if it exists.
		// clockTime.clearClockTimeInterval();
		
		var unixTimestamp = timestamp;
		
		// Update Clock Time every second
		// Re-Synchronize clock every 60 seconds
		clockTime.runningClock = setTimeout(function() {
			// Display i18n Date and Time
			$('div#datetime').html(localTimestamp.localizeTimestamp(unixTimestamp, '', clockTime.regional));
			
			// Increment Unix Timestamp by 1 second
			unixTimestamp = parseInt(unixTimestamp) + 1;
			
			// Increment Counter
			clockTime.intervalCounter++;
			
			// Fetch current date from Register if necessary (every minute)
			if(clockTime.intervalCounter > clockTime.intervalLimit)
			{
				// Fetch new unixTimestamp from Meter
				unixTimestamp = clockTime.fetchDateRegisterValue();
				
				// Reset ClockTime Counter.
				clockTime.intervalCounter = 0;
				
				return;
			}
			
			clockTime.runClockTime(unixTimestamp);
			
		}, 1000);
	},
	
	
	// Clear the runningClock Interval if necessary
	clearClockTimeTimeout: function(timer)
	{
		// Clear ClockTime Interval if it exists.
		clearTimeout(timer);
	}
}


// Generate a localized timestamp
var localTimestamp = {
	
	// Define Standard and Millisecond data formats
	dateFormatStandard: 'MMMM D YYYY, HH:mm:ss',
	dateFormatMilliseconds: 'MMMM D YYYY, HH:mm:ss.SSS',
	
	/**
	 * Convert a Unix Timestamp (with optional Microseconds) to a readable string
	 *
	 * @param string unixTimestamp - the Unix Timestamp to be converted
	 * @param string uSeconds - (optional) the number of microseconds to be apprended
	 * @param string language - (optional) specify the language code to further refine formatString
	 */
	localizeTimestamp: function (unixTimestamp, uSeconds, language, timeFormat)
	{
		// Set language if not provided
		if(language == '')
		{
			language = 'en';
		}
		
		// Set Localized time format
		if(timeFormat == undefined)
		{
			timeFormat = localTimestamp.dateFormatStandard;
		}
		
		// Construct moment object, set time, and define language
		// var mTime = moment();
		var timestamp = parseInt(unixTimestamp);
		if (timestamp == 0 || isNaN(timestamp))
			return '';
		var mTime = moment.unix(timestamp);
		mTime.zone(0);
		
		// Convert and append Milliseconds if uSeconds is provided
		if( (uSeconds != '') && (parseInt(uSeconds) != 0) )
		{
			mTime.milliseconds(uSeconds/1000);
			timeFormat = localTimestamp.dateFormatMilliseconds;
		}
		
		mTime.lang(language);
		
		// Return i18n Date and Time
		return mTime.format(timeFormat).toString();
	}
	
}


// Populate the Vertical Tab Menu with Custom User Pages
var customUserPages = {
	
	/**
	 * Get Custom User pages for provided Section
	 *
	 * @param string sectionTitle - the Title of the section (Monitoring, Control, Diagnostics, or Setup)
	 */
	populateCustomUserPagesForSection: function (sectionTitle)
	{
		// Compose Request Object for Register values
		var reqCustomUserPagesObject = ({
			type: 'GET',
			url: '/api/customPages/'+ sectionTitle,
			returnType: 'json',
			successCallback: customUserPages.populateCustomUserPagesSuccess,
			failCallback: customUserPages.populateCustomUserPagesFail
		});
		
		// Request values for Registers
		pmAjax.sendGet(reqCustomUserPagesObject);
	},
	
	
	// Populate Custom User Pages Success callback
	populateCustomUserPagesSuccess: function (data, reqObj)
	{
		// If there are any Custom Pages
		if(data.result.length > 0)
		{
			// Append each Custom Page to the Verttab Menu
			jQuery.each(data.result, function(item,value) {
				jQuery('#verttabs > ul').append('<li><a href="'+ value.linkUrl +'">'+ value.displayName +'</a></li>');
			});
		}
		finishVertTabStyles();
	},
	
	
	// Populate Custom User Pages Fail callback
	populateCustomUserPagesFail: function ()
	{
		// TODO - error handling
	},
	
	
	returnCustomMaintenancePages: function ()
	{
		// Compose Request Object for Register values
		var reqCustomUserPagesObject = ({
			type: 'GET',
			url: '/api/customPages/Maintenance',
			returnType: 'json',
			xhrFields: { withCredentials: true },
			beforeSend: function(xhr)
			{
				// Renew existing Cookies
				xhr.setRequestHeader('Set-Cookie', document.cookie);
			},
			successCallback: customUserPages.returnCustomMaintenancePagesSuccess,
			failCallback: customUserPages.returnCustomMaintenancePagesFail
		});
		
		// Request values for Registers
		pmAjax.sendGet(reqCustomUserPagesObject);
	},
	
	
	// Populate Custom User Pages Success callback
	returnCustomMaintenancePagesSuccess: function (data, reqObj)
	{
		// If there are any Custom Pages
		if(data.result.length == 0)
		{
			// Disable Maintenance URL
			jQuery('div#tabs > ul > li > a[href="maintenance.html"]').remove();
		}
	},
	
	
	// Populate Custom User Pages Fail callback
	returnCustomMaintenancePagesFail: function ()
	{
		// TODO - error handling
	}
	
}


/**
 * Handle submenu highlighting.
 */
function submenus()
{
	// set initial active menu to first one (and clear others)
	jQuery('.submenu').each(function ()
	{
		jQuery(this).find('li').removeClass('active');
		jQuery(this).find('li:first').addClass('active');
	});

	// set active flag (class="active") on clicked submenu event
	jQuery('.submenu a').click(function ()
	{
		// remove active marker on any previously-clicked item in this menu
		jQuery(this).closest('.submenu').find('li').removeClass('active');

		// add active marker to this item
		jQuery(this).closest('li').addClass('active');
	});
}


/**
 * Initialize the popup for UI feedback that data on the meter is being updated.
 *
 */
function initMeterChangePopups()
{
	// init a modal popup with no controls, only a spinner (HTML found in header.html)
	jQuery('#updateInProgress').dialog({
		modal: true,
		draggable: false,
		dialogClass: 'noHeader',
		autoOpen: false
	});

	// init a modal popup that displays the error message and an OK button (HTML found in header.html)
	jQuery('#updateError').dialog({
		modal: true,
		draggable: false,
		autoOpen: false,
		buttons:[
		{
			text: jQuery('#errorLabels > label#label_ok').text(),
			click: function()
			{
				jQuery('#updateError').dialog('close'); // Close Error dialog
			}
		}]
	});

}

/**
 * Display UI feedback that data on the meter is being updated.
 *
 */
function displayMeterChangeInProgress()
{
	// show a modal popup with no controls, only a spinner
	jQuery('#updateInProgress').dialog('open');

}

/**
 * Complete/hide the UI feedback that data on the meter is being updated.
 *
 */
function completeMeterChangeInProgress()
{
	// hide the modal popup that was showing a spinner
	jQuery('#updateInProgress').dialog('close');

}

/**
 * UI feedback when meter update fails
 *
 */
function meterUpdateFailed(message)
{
	// hide the modal popup that was showing a spinner
	jQuery('#updateInProgress').dialog('close');

	// show the popup that says there was an error

	jQuery('#updateError').html('<div>'+jQuery('#errorLabels > label#label_update_error').text()+'"' + message + '"</div');
	jQuery('#updateError').dialog('open');
}


/**
 * Error Message
 * Handles Errors based on the Error being thrown: Timeouts and Response Errors (poorly formatted request)
 * Displays an appropriate Error message for the associate pane.
 */
var errorMessage = {
	
	/**
	 * displayHTMLErrorMessage - Displays an Error Message based on the Error Thrown 
	 * 
	 * @param string errorThrown - the textStatus of the AJAX Request (ie. timeout).
	 * @param string paneID - the ID of the pane to populate with an Error Message.
	 */
	displayHTMLErrorMessage: function (errorThrown, paneID)
	{
		// clear the ajax timer that reloads reports on an interval
		clearTimeout(requestTimer);
		
		jQuery(paneID).html(jQuery('#errorMessage').html());
		var message = '';
		switch(errorThrown)
		{
			case 'timeout':
				message = jQuery('#errorLabels > label#label_timeout').text();
			break;
			case '404':
				message = jQuery('#errorLabels > label#label_notfound').text();
			break;
			default:
				message = jQuery('#errorLabels > label#label_cantload').text();
			break;
		}
		jQuery(paneID+'>*>p#errorText').html(message);
		jQuery(paneID+'>*>p#errorCode').html(errorThrown);
	}
	
};
