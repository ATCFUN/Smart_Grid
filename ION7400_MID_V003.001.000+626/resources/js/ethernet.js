/**
 * Ethernet & TCP/IP setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */

var ethernet = {

	initEthernet: function ()
	{
		// get possible values for Frame Format dropdown with call to getEnumerations API method
		var strRegisterNames = buildStringGetRegister('#frameFormatDropdownContainer');
		
		// Compose Request Object
		var reqObject = ({
			type: 'POST',
			url: '/api/enumerations',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: ethernet.getFrameFormatValsSuccess,
			failCallback: ethernet.getFrameFormatValsFail
		});
	
		pmAjax.sendRequest(reqObject);
	
		// Unbind any potential existing funtions.
		// This is necessary when re-initializing Register Data
		jQuery('input[type="submit"]').unbind();
		
		// init jQuery button
		// attach form handler on Basic and Advanced Settings form (one form covers both accordion sections)
		jQuery('input.apply').click(function ()
		{
			// Display Dialog to confirm changes before applying
			dialog.dialogDisplayMessage('#dialogMessageApply', ethernet.applyChanges);
			
			return false;
		});
	},
	
	
	getEthernetSuccess: function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.serializedData, 'formEthernetSettings');
	},
	
	
	getEthernetFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#basic-settings');
	},
	
	
	setEthernetSuccess: function (data, reqObj)
	{
		// check success/fail message (check whether results were sent back)
		if(!data.result || data.result[0].value != "true")
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
		formChangeDetection.resetFormChangeDetection('#formEthernetSettings');
		
		// Re-Populate Registers
		ethernet.initEthernet();
		
		// For now: Close the dialog
		dialog.dialogClose('#dialog');
	},
	
	
	setEthernetFail: function ()
	{
		// show error message that meter update failed
		meterUpdateFailed();
	},


	getFrameFormatValsSuccess: function (data, reqObj)
	{
		// populate dropdown by adding each returned value to DOM
		populateDropdowns(data, reqObj.serializedData);
		
		// get register values to pre-populate form
		var strRegisterNames = buildStringGetRegister('#formEthernetSettings');	
	
		// Compose Request Object
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: ethernet.getEthernetSuccess,
			failCallback: ethernet.getEthernetFail
		});
		
		pmAjax.sendRequest(reqRegisterObject);
	},


	getFrameFormatValsFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#advanced-settings');
	},
	
	
	/**
	 * Apply Changes to registers
	 *
	 * @param String controlType - the selected control type to be updated.
	 */
	applyChanges: function (controlType)
	{
		// get Register values
		var strRegistersToChange = buildStringSetRegister('#formEthernetSettings');
		
		// Compose Request Object
		var reqObject = ({
			type: 'POST',
			url: '/api/registerValues/setRegisterValues',
			serializedData: strRegistersToChange,
			returnType: 'json',
			successCallback: ethernet.setEthernetSuccess,
			failCallback: ethernet.setEthernetFail
		});
	
		// send request to set fields
		pmAjax.sendRequest(reqObject);
		
	}

}