/**
 * SNMP Parameters setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */

var snmpParameters = {
	
	// Initialize SNMP Parameters page
	initSnmpParameters: function ()
	{
		// Get register values to pre-populate form
		var strRegisterNames = buildStringGetRegister('#formSNMPParameter');	
		
		// Compose Request Object for Select Menus
		var reqEnumObject = ({
			type: 'POST',
			url: '/api/enumerations',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: snmpParameters.getSNMPEnumSuccess,
			failCallback: snmpParameters.getSNMPFail
		});
		
		// Request values for Enumerations
		pmAjax.sendRequest(reqEnumObject);
		
		// Unbind any potential existing funtions.
		// This is necessary when re-initializing Register Data
		jQuery('input[type="submit"]').unbind();
		
		// init jQuery button
		// attach form handler on Basic and Advanced Settings form (one form covers both accordion sections)
		jQuery('input.apply').click(function ()
		{
			// Display Dialog to confirm changes before applying
			dialog.dialogDisplayMessage('#dialogMessageApply', snmpParameters.applyChanges);
		
			return false;
		});
	},
	
	
	// Populate Registers
	getSNMPSuccess: function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.serializedData, 'formSNMPParameter');
	},
	
	
	// Handle failed data request
	getSNMPFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#formSNMPParameter');
	},
	
	
	// Populate Enumerations
	getSNMPEnumSuccess: function (data, reqObj)
	{
		// populate dropdown by adding each returned value to DOM
		populateDropdowns(data, reqObj.serializedData);
		
		// Get register values to pre-populate form
		var strRegisterNames = buildStringGetRegister('#formSNMPParameter');
		
		// Compose Request Object for Register values
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: snmpParameters.getSNMPSuccess,
			failCallback: snmpParameters.getSNMPFail
		});
		
		// Request values for Registers
		pmAjax.sendRequest(reqRegisterObject);
	},
	
	
	/**
	 * Apply Changes to registers
	 *
	 * @param String controlType - the selected control type to be udpated.
	 */
	applyChanges: function (controlType)
	{
		// get Register values
		var strRegistersToChange = buildStringSetRegister('#formSNMPParameter');
		
		// Compose Request Object
		var reqObject = ({
			type: 'POST',
			url: '/api/registerValues/setRegisterValues',
			serializedData: strRegistersToChange,
			returnType: 'json',
			successCallback: snmpParameters.setSNMPParameterSuccess,
			failCallback: snmpParameters.setSNMPParameterFail
		});
	
		// send request to set fields
		pmAjax.sendRequest(reqObject);
	},
	
	
	// Re-populate page Registers, and reset Form Change Detection
	setSNMPParameterSuccess: function (data, reqObj)
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
		formChangeDetection.resetFormChangeDetection('#formSNMPParameter');
		
		// Re-Populate Registers
		snmpParameters.initSnmpParameters();
		
		// Close the dialog
		dialog.dialogClose('#dialog');
	},
	
	
	// Handle failed data request
	setSNMPParameterFail: function ()
	{
		// show error message that meter update failed
		meterUpdateFailed();
	}

}