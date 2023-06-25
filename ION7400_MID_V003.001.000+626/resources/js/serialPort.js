/**
 * Serial Port setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */

var serialPort = {
	
	// Init the Serial Port page
	initSerialPort : function ()
	{
		// Get possible registers for Select Menus for getEnumerations API method
		var strRegisterNames = buildStringGetRegister('#formSerialPortSettings');
	
		// Compose Request Object for Select Menus
		var reqObject = ({
			type: 'POST',
			url: '/api/enumerations',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: serialPort.getSelectMenuValsSuccess,
			failCallback: serialPort.getSelectMenuValsFail
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
			dialog.dialogDisplayMessage('#dialogMessageApply', serialPort.applyChanges);
		
			return false;
		});
	
	},
	
	
	// Populate Registers
	getSerialPortSuccess: function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.serializedData, 'formSerialPortSettings');
	},
	
	
	// Handle failed data request
	getSerialPortFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#formSerialPortSettings');
	},
	
	
	// Populate Drop Down Menus
	getSelectMenuValsSuccess: function (data, reqObj)
	{
		// populate dropdown by adding each returned value to DOM
		populateDropdowns(data, reqObj.serializedData);
		
		// Get possible registers for Select Menus for getEnumerations API method
		var strRegisterNames = buildStringGetRegister('#formSerialPortSettings');
		
		// Compose Request Object for Register values
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: serialPort.getSerialPortSuccess,
			failCallback: serialPort.getSerialPortFail
		});
		
		// Request values for Registers
		pmAjax.sendRequest(reqRegisterObject);

	},

	
	// Handle failed data request
	getSelectMenuValsFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#formSerialPortSettings');
	},
	
	
	/**
	 * Apply Changes to registers
	 *
	 * @param String controlType - the selected control type to be udpated.
	 */
	applyChanges: function (controlType)
	{
		// get Register values
		var strRegistersToChange = buildStringSetRegister('#formSerialPortSettings');
		
		// Compose Request Object
		var reqObject = ({
			type: 'POST',
			url: '/api/registerValues/setRegisterValues',
			serializedData: strRegistersToChange,
			returnType: 'json',
			successCallback: serialPort.setSerialPortsSuccess,
			failCallback: serialPort.setSerialPortsFail
		});
	
		// send request to set fields
		pmAjax.sendRequest(reqObject);
		
	},
	
	
	// Re-populate page Registers, and reset Form Change Detection
	setSerialPortsSuccess: function (data, reqObj)
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
		formChangeDetection.resetFormChangeDetection('#formSerialPortSettings');
		
		// Re-Populate Registers
		serialPort.initSerialPort();
		
		// Close the dialog
		dialog.dialogClose('#dialog');
	},
	
	
	// Handle failed data request
	setSerialPortsFail: function ()
	{
		// show error message that meter update failed
		meterUpdateFailed();
	}
}

