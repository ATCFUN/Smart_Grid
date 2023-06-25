/**
 * Metering setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */

var metering = {
	
	// Init the Metering page
	initMetering: function ()
	{
		// Get possible registers for Select Menus for getEnumerations API method
		var strRegisterNames = buildStringGetRegister('#formMetering');
	
		// Compose Request Object for Select Menus
		var reqObject = ({
			type: 'POST',
			url: '/api/enumerations',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: metering.getSelectMenuValsSuccess,
			failCallback: metering.getSelectMenuValsFail
		});
		
		// Request options for Select Menus
		pmAjax.sendRequest(reqObject);
		
		// Unbind any potential existing funtions.
		// This is necessary when re-initializing Register Data
		jQuery('input[type="submit"]').unbind();
		
		// init jQuery button
		// attach form handler on Basic and Advanced Settings form (one form covers both accordion sections)
		jQuery('input.apply').click(function ()
		{
			// Display Dialog to confirm changes before applying
			dialog.dialogDisplayMessage('#dialogMessageApply', metering.applyChanges);
		
			return false;
		});

		
	},
	
	// Populate Registers
	getSuccess: function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.serializedData, 'formMetering');

		// hide the "in progress" spinner/UI if it was being shown (after a form update)
		completeMeterChangeInProgress();

	},
	
	
	// Handle failed data request
	getFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#basic');
	},
	
	
	// Populate Drop Down Menus
	getSelectMenuValsSuccess: function (data, reqObj)
	{
		// populate dropdown by adding each returned value to DOM
		populateDropdowns(data, reqObj.serializedData);

		// Get register values to pre-populate form (this needs to go in the dropdown success function
		//	since the dropdowns need to be populated first)
		var strRegisterNames = buildStringGetRegister('#formMetering');	

		// Compose Request Object for Register values
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: metering.getSuccess,
			failCallback: metering.getFail
		});
		
		// Request values for Registers
		pmAjax.sendRequest(reqRegisterObject);
	},

	
	// Handle failed data request
	getSelectMenuValsFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#basic');
	},
	
	
	/**
	 * Apply Changes to registers
	 *
	 * @param String controlType - the selected control type to be udpated.
	 */
	applyChanges: function (controlType)
	{
		
		// Close the dialog
		dialog.dialogClose('#dialog');

		// disable page and show in-progress spinner
		displayMeterChangeInProgress();
		
		// Build register values for Set Request
		var strRegistersToChange = buildStringSetRegister('#formMetering');
		
		// Compose Request Object
		var reqObject = ({
			type: 'POST',
			url: '/api/registerValues/setRegisterValues',
			serializedData: strRegistersToChange,
			returnType: 'json',
			successCallback: metering.setSuccess,
			failCallback: metering.setFail
		});
	
		// send request to set fields
		pmAjax.sendRequest(reqObject);
		
	},
	
	
	// Re-populate page Registers, and reset Form Change Detection
	setSuccess: function (data, reqObj)
	{
		// check success/fail message (check whether results were sent back)
		if (!data.result || data.result[0].value != "true")
		{
			// show error message that meter update failed
			meterUpdateFailed();
			dialog.dialogClose('#dialog'); // Close confirmation dialog

			// leave this function without resetting the form with correct data, or resetting
			//	the change flag (formChangeDetection object) so that user can try to 
			//	resubmit their changes again.
			return;

		}
		// Get register values and re-populate the form
		var strRegisterNames = buildStringGetRegister('#formMetering');	

		// Compose Request Object for Register values
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: metering.getSuccess,
			failCallback: metering.getFail
		});
		
		// Request values for Registers
		pmAjax.sendRequest(reqRegisterObject);
		
		// Reset form field change detection
		formChangeDetection.resetFormChangeDetection('#formMetering');
	},
	
	
	// Handle failed data request
	setFail: function ()
	{
		// show error message that meter update failed
		meterUpdateFailed();
	}

}
