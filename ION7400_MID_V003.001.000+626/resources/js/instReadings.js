var instantaneousReadings = {
	initInstantaneousReadings: function (initPane)
	{
		// init first table in accordion - Basic Readings
		instantaneousReadings.getRegisterData(initPane);

		// Bind event to populate Accordion Children when they are Clicked
		instantaneousReadings.bindAccordionPaneChildren();
		
		modulesStateCheck.modulesCheck("MEASURED_I5");
		modulesStateCheck.modulesCheck("V4");
		modulesStateCheck.modulesCheck("VGROUND");

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
				instantaneousReadings.updatePaneContentByTarget(eTarget, jQuery(this).attr("id"));
			});
		});
	},

	updatePaneContentByTarget: function (paneTarget, eID)
	{
		// Determine if Pane is already selected
		var isSelected = jQuery('#'+ eID).hasClass('ui-accordion-header-active');
		// If the Pane is not selected, populate it.
		if(!isSelected) {
			
			// Populate appropriate pane.
			switch(paneTarget)
			{
				case 'demand-readings':
					instantaneousReadings.getDemandReadings();
					break;
				default:
					instantaneousReadings.getRegisterData(paneTarget);
					break;
			}
		}
	},

	getRegisterData: function (paneId)
	{
		var registerArray = getRegisterArrayFromPage('#' + paneId);
		if(registerArray.length == 0) return;
		
		var reqObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			requestArrayName: 'names',
			registerArray: registerArray,
			returnType: 'json',
			successCallback: instantaneousReadings.successResponse,
			failCallback: instantaneousReadings.failResponse,
			elementId: paneId
		});
		
		pmAjax.sendPostWithArray(reqObject);
	},

	successResponse: function(data, reqObj)
	{
		var wrapUnits = true;
		populateRegisterValuesOnPage(data, reqObj.registerArray, reqObj.elementId, wrapUnits);
		instantaneousReadings.repeatRequestIfSelected(reqObj);
	},

	repeatRequestIfSelected: function(reqObj)
	{
		var isSelected = jQuery('[target="' + reqObj.elementId + '"]').hasClass('ui-accordion-header-active')
		if (isSelected) {
			pmAjax.schedulePostRequest(reqObj);
		}
	},

	failResponse: function(textStatus, errorThrown, reqObj)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#' + reqObj.elementId);
	},

	getDemandReadings:function ()
	{
		var reqObj = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			requestArrayName: 'names',
			registerArray: getRegisterArrayFromPage('#demand-readings'),
			returnType: 'json',
			successCallback: instantaneousReadings.demandRegisterSuccess,
			failCallback: instantaneousReadings.failResponse,
			elementId: 'demand-readings'
		});
		
		pmAjax.sendPostWithArray(reqObj);
	},

	demandRegisterSuccess:function (data, reqObj)
	{
		// populate register values and units on page with returned data
		var wrapUnits = true;
		populateRegisterValuesOnPage(data, reqObj.registerArray, reqObj.elementId, wrapUnits);
		
		var reqTimestampObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterTimestamps',
			requestArrayName: 'names',
			registerArray: getTimestampRegisterArrayFromPage('#demand-readings'),
			returnType: 'json',
			successCallback: instantaneousReadings.demandTimestampSuccess,
			failCallback: instantaneousReadings.failResponse,
			elementId: 'demand-readings',
			repeatRequest: reqObj,
			registerData: data,
			registerNameArray: reqObj.registerArray
		});

		pmAjax.sendPostWithArray(reqTimestampObject);
	},

	demandTimestampSuccess:function (data, reqObj)
	{
		// populate register values and units on page with returned data
		populateTimestampValues(data, reqObj.registerArray, reqObj.elementId, reqObj.registerData, reqObj.registerNameArray);
		instantaneousReadings.repeatRequestIfSelected(reqObj.repeatRequest);
	},
};
