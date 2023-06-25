/**
 * NPT/SMTP setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */


var smtpConfig = {

	// Initialize NPT/SMPT page
	initNptSmtp: function ()
	{
		// Get register values to pre-populate form
		var strRegisterNames = buildStringGetRegister('#formSMTP');	
		
		// Compose Request Object for Select Menus
		var reqEnumObject = ({
			type: 'POST',
			url: '/api/enumerations',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: smtpConfig.getEnumSuccess,
			failCallback: smtpConfig.getEnumFail
		});
		
		// Request values for Registers
		pmAjax.sendRequest(reqEnumObject);

		// Unbind any potential existing funtions.
		// This is necessary when re-initializing Register Data
		jQuery('input[type="submit"]').unbind();
		
		// init jQuery button
		// attach form handler on Basic and Advanced Settings form (one form covers both accordion sections)
		jQuery('input.apply').click(function ()
		{
			// Display Dialog to confirm changes before applying
			dialog.dialogDisplayMessage('#dialogMessageApply', smtpConfig.applyChanges);
		
			return false;
		});
	},
	
	// Populate Registers
	getNPTSuccess: function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.serializedData, 'formSMTP');
	},
	
	
	// Handle failed data request
	getNPTFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#formSMTP');
	},
	
	
	// Populate Registers
	getEnumSuccess: function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateDropdowns(data, reqObj.serializedData);
		
		// Get register values to pre-populate form
		var strRegisterNames = buildStringGetRegister('#formSMTP');
		
		// Compose Request Object for Register values
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: smtpConfig.getNPTSuccess,
			failCallback: smtpConfig.getNPTFail
		});
		
		// Request values for Registers
		pmAjax.sendRequest(reqRegisterObject);
	},
	
	
	// Handle failed data request
	getEnumFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#formSMTP');
	},
	
	
	/**
	 * Apply Changes to registers
	 *
	 * @param String controlType - the selected control type to be udpated.
	 */
	applyChanges: function (controlType)
	{
		// Get Register values
		var strRegistersToChange = buildStringSetRegister('#formSMTP');
		
		// Compose Request Object
		var reqObject = ({
			type: 'POST',
			url: '/api/registerValues/setRegisterValues',
			serializedData: strRegistersToChange,
			returnType: 'json',
			successCallback: smtpConfig.setSMTPSuccess,
			failCallback: smtpConfig.setSMTPFail
		});
	
		// send request to set fields
		pmAjax.sendRequest(reqObject);
	},
	
	
	// Re-populate page Registers, and reset Form Change Detection
	setSMTPSuccess: function (data, reqObj)
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
		formChangeDetection.resetFormChangeDetection('#formSMTP');
		
		// Re-Populate Registers
		smtpConfig.initNptSmtp();
		
		// Close the dialog
		dialog.dialogClose('#dialog');
	},
	
	
	// Handle failed data request
	setSMTPFail: function (textStatus, errorThrown)
	{
		// show error message that meter update failed
		meterUpdateFailed();
	}

}