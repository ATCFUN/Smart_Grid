/**
 * Preferences setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */
var preferences = {
	
	initPreferences: function ()
	{
		// Get register values to pre-populate form
		var strRegisterNames = buildStringGetRegister('#formPreferences');
		
		// Compose Request Object for Register values
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: preferences.getRegisterValsSuccess,
			failCallback: preferences.getRegisterValsFail
		});
		
		// Request values for Registers
		pmAjax.sendRequest(reqRegisterObject);

		// Unbind any potential existing funtions.
		// This is necessary when re-initializing Register Data
		jQuery('input[type="submit"]').unbind();
		
		// init jQuery button
		// attach form handler on Basic and Advanced Settings form (one form covers both accordion sections)
		jQuery('input.apply').click(function ()
		{
			// Display Dialog to confirm changes before applying
			dialog.dialogDisplayMessage('#dialogMessageApply', preferences.applyChanges);
		
			return false;
		});
		
	},
	
	
	// Populate Registers
	getRegisterValsSuccess: function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.serializedData, 'formPreferences');
	},


	// Handle failed data request
	getRegisterValsFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#formPreferences');
	},
	
	
	/**
	 * Apply Changes to registers
	 *
	 * @param String controlType - the selected control type to be udpated.
	 */
	applyChanges: function (controlType)
	{
		// Get Register values
		var strRegistersToChange = buildStringSetRegister('#formPreferences');
		
		// Compose Request Object
		var reqObject = ({
			type: 'POST',
			url: '/api/registerValues/setRegisterValues',
			serializedData: strRegistersToChange,
			returnType: 'json',
			successCallback: preferences.setApplyChangesSuccess,
			failCallback: preferences.setApplyChangesFail
		});
	
		// send request to set fields
		pmAjax.sendRequest(reqObject);
		
	},
	
	
	// Re-populate page Registers, and reset Form Change Detection
	setApplyChangesSuccess: function (data, reqObj)
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
		
		// Reset form field change detection
		formChangeDetection.resetFormChangeDetection('#formPreferences');
		
		// Re-Populate Registers
		preferences.initPreferences();
		
		// Close the dialog
		dialog.dialogClose('#dialog');
	},
	
	
	// Handle failed data request
	setApplyChangesFail: function ()
	{
		// show error message that meter update failed
		meterUpdateFailed();
	}
	
}
