/**
 * Statistics setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */

var statistics = {

	// Init the Metering page
	initStatistics: function ()
	{
		statistics.populatePane('communications');
		
		statistics.bindAccordionPaneChildren();
		
		// check the availability of comm ports		
		commModuleList.checkCommModuleList();
	},
	
	/**
	 * Dynamically bind event for each Accordion pane
	 * Used to populate Accordion Pane with content on demand.
	 */
	bindAccordionPaneChildren: function () {
		// Bind onClick event for each Accordion header elemenent
		jQuery("div.accordion > h3").each( function()
		{
			var eTarget = jQuery(this).attr('target');
			jQuery(this).bind('click', function()
			{
				statistics.updatePaneContentByTarget(eTarget, jQuery(this).attr("id"));
			});
		});
	},


	/**
	 * Update Appropriate Pane Content
	 */
	updatePaneContentByTarget:function (paneTarget, elementId)
	{
		// Determine if Pane is already selected
		var isSelected = jQuery('#'+ elementId).hasClass('ui-accordion-header-active');
		
		if(!isSelected) {
			switch(paneTarget)
			{
				case 'communications':
				case 'meterbasic':
				case 'meteradvanced':
					statistics.populatePane(paneTarget);
					break;
				case 'ethernet1':
				case 'comm1':
				case 'comm2':
				case 'comm3':
				case 'comm4':
					statistics.requestCommStatistics(paneTarget);
					break;
				case 'serial':
					statistics.requestCommStatistics('comm1');
					statistics.requestCommStatistics('comm2');
					statistics.requestCommStatistics('comm3');
					statistics.requestCommStatistics('comm4');
					break;
				default:
					break;
			}
		}
	},

	populatePane: function (elementId)
	{
		var reqObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			requestArrayName: 'names',
			registerArray: getRegisterArrayFromPage('#' + elementId),
			returnType: 'json',
			successCallback: statistics.successResponse,
			failCallback: statistics.failResponse,
			elementID: elementId,
			updateOnInterval: false
		});
		
		// call getRegisterValues API method
		pmAjax.sendPostWithArray(reqObject);
	},

	successResponse: function (data, reqObj)
	{
		// populate register values and units on page with returned data
		var wrapUnits = true;
		populateRegisterValuesOnPage(data, reqObj.registerArray, reqObj.elementID, wrapUnits);
	},

	failResponse: function (textStatus, errorThrown, reqObj)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#' + reqObj.elementID);
	},

	// Request Ethernet Statistics
	requestCommStatistics: function (id)
	{
		// Compose Request Object for Register values
		var reqRegisterObject = ({
			type: 'GET',
			url: '/api/diagnostics/commStats?port=' + id,
			returnType: 'json',
			successCallback: statistics.getCommStatsSuccess,
			failCallback: statistics.getCommStatsFail,
			elementId: id
		});
		
		// Request values for Registers
		pmAjax.sendGet(reqRegisterObject);
	},
	
	
	// Populate Registers
	getCommStatsSuccess: function (data, reqObj)
	{
		if (data.result != undefined )
		{
			for (var i in data.result)
			{
				for (var key in data.result[i])
				{				
					jQuery('div#' + reqObj.elementId + ' [commStatsReg="' + key + '"]').html(data.result[i][key]);
				}
			}
		}
		completeMeterChangeInProgress();
	},
	
	
	// Handle failed data request
	getCommStatsFail: function (textStatus, errorThrown, reqObj)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#' + reqObj.elementId);
	}
};

