/**
 * SNMP Parameters setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */

var SetupPane =  {
	init : function(formId, valuesUrl)
	{
		//IE doesn't support function parameter with default value.  Assign default value to parameter if parameter is undefined.
		if (valuesUrl === undefined)
		{
			valuesUrl = '/api/registerValues/getRegisterValues';
		}
		
		var reqEnumObject = ({
			type: 'POST',
			url: '/api/enumerations',
			requestArrayName: 'names',
			registerArray: getRegisterArrayFromPage('#'+formId),
			returnType: 'json',
			successCallback: SetupPane.getEnumSuccess,
			failCallback: SetupPane.getFail,
			formId: formId,
			valuesUrl: valuesUrl
		});
		
		// Request values for Enumerations
		pmAjax.sendPostWithArray(reqEnumObject);
		
		// check the availability of comm ports		
		commModuleList.checkCommModuleList();
		
		// Unbind any potential existing funtions.
		// This is necessary when re-initializing Register Data
		jQuery('input[type="submit"]').unbind();
		
		// init jQuery button
		// attach form handler on Basic and Advanced Settings form (one form covers both accordion sections)
		jQuery('input.apply').click(function ()
		{
			// Display Dialog to confirm changes before applying
			dialog.dialogDisplayMessage('#dialogMessageApply', SetupPane.applyChanges, formId);
		
			return false;
		});
	},
	
	
	// Handle failed data request
	getFail : function (textStatus, errorThrown, reqObj)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#'+reqObj.formId);
	},
	
	
	// Populate Enumerations
	getEnumSuccess : function (data, reqObj)
	{
		// populate dropdown by adding each returned value to DOM
		populateDropdowns(data, reqObj.registerArray);
		
		var reqRegisterObject = ({
			type: 'POST',
			url: reqObj.valuesUrl,
			requestArrayName: 'names',
			registerArray: getRegisterArrayFromPage('#'+reqObj.formId),
			returnType: 'json',
			successCallback: SetupPane.getDataSuccess,
			failCallback: SetupPane.getFail,
			formId: reqObj.formId
		});

		// Request values for Registers
		pmAjax.sendPostWithArray(reqRegisterObject);
	},
	
	// Populate Registers
	getDataSuccess : function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.registerArray, reqObj.formId);
	},
	
	
	
	/**
	 * Apply Changes to registers
	 *
	 */
	 
	applyChanges : function (formId)
	{
		var reqObject = ({
			type: 'POST',
			url: '/api/registerValues/setRegisterValues',
			requestArrayName: 'values',
			registerArray: buildStringSetRegister('#'+formId),
			returnType: 'json',
			successCallback: SetupPane.setDataSuccess,
			failCallback: SetupPane.setDataFail,
			formId: formId
		});
	
		// send request to set fields
		pmAjax.sendPostWithArray(reqObject);
	},
	
	
	// Re-populate page Registers, and reset Form Change Detection
	setDataSuccess : function (data, reqObj)
	{
		// check success/fail message (check whether results were sent back)
		if (!data.result || data.result[0].value != "true")
		{
			// show error message that meter update failed
			var message;
			if(data.result && data.result.length > 0 && data.result[0].errorMessage)
				message = data.result[0].errorMessage;
			meterUpdateFailed(message);
			dialog.dialogClose('#dialog'); // Close confirmation dialog

			// leave this function without resetting the form with correct data, or resetting
			//	the change flag (formChangeDetection object) so that user can try to 
			//	resubmit their changes again.
			return;
		}
		
		// Reset form field change detection
		formChangeDetection.resetFormChangeDetection('#'+reqObj.formId);
		
		// Re-Populate Registers
		SetupPane.init(reqObj.formId);
		
		// Close the dialog
		dialog.dialogClose('#dialog');
	},
	
	
	// Handle failed data request
	setDataFail : function (textStatus, errorThrown, reqObj)
	{
		meterUpdateFailed(textStatus);
	}
};
