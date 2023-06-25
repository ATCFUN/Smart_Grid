/**
 * Date & Time setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */

var dateAndTime = {

	initDateAndTime: function ()
	{
		// get possible values for Frame Format dropdown with call to getEnumerations API method
		var strRegisterNames = buildStringGetRegister('#dateAndTime');
		
		// Compose Request Object
		var reqObject = ({
			type: 'POST',
			url: '/api/enumerations',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: dateAndTime.getDateAndTimeSelectSuccess,
			failCallback: dateAndTime.getDateAndTimeSelectFail
		});
		
		// Request values for Select menus
		pmAjax.sendRequest(reqObject);
		
		// Initialize Date Picker
		$("#datechooser").datepicker({
			showOn: "button",
			buttonImage: "images/icon-date-picker.gif",
			buttonImageOnly: true,
			changeMonth: true,
			changeYear: true
		});
		
		// Unbind any potential existing funtions.
		// This is necessary when re-initializing Register Data
		jQuery('input[type="submit"]').unbind();
		
		// init jQuery button
		// attach form handler on Basic and Advanced Settings form (one form covers both accordion sections)
		jQuery('input.apply').click(function ()
		{
			// Display Dialog to confirm changes before applying
			dialog.dialogDisplayMessage('#dialogMessageApply', dateAndTime.applyChanges);
		
			return false;
		});
	},

	// Populate Registers
	getDateAndTimeSuccess: function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.serializedData, 'dateAndTime');
	},


	// Handle failed data request
	getDateAndTimeFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#dateAndTime');
	},
	
	
	// Populate Select Menus
	getDateAndTimeSelectSuccess: function (data, reqObj)
	{
		populateDropdowns(data, reqObj.serializedData);
		
		// get possible values for Frame Format dropdown with call to getEnumerations API method
		var strRegisterNames = buildStringGetRegister('#dateAndTime');
		
		// Compose Request Object for Register values
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: dateAndTime.getDateAndTimeSuccess,
			failCallback: dateAndTime.getDateAndTimeFail
		});
		
		// Request values for Registers
		pmAjax.sendRequest(reqRegisterObject);
	},


	// Handle failed Select Menu data request
	getDateAndTimeSelectFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#dateAndTime');
	},
	


	/**
	 * Apply Changes to registers
	 *
	 * @param String controlType - the selected control type to be udpated.
	 */
	applyChanges: function (controlType)
	{
		// Get Register values
		var strRegistersToChange = buildStringSetRegister('#dateAndTime');

		// Compose Request Object
		var reqObject = ({
			type: 'POST',
			url: '/api/registerValues/setRegisterValues',
			serializedData: strRegistersToChange,
			returnType: 'json',
			successCallback: dateAndTime.setDateAndTimeSuccess,
			failCallback: dateAndTime.setDateAndTimeFail
		});

		// send request to set fields
		pmAjax.sendRequest(reqObject);
	},


	// Re-populate page Registers, and reset Form Change Detection
	setDateAndTimeSuccess: function (data, reqObj)
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
		formChangeDetection.resetFormChangeDetection('#dateAndTime');
		
		// Re-Populate Registers
		dateAndTime.initDateAndTime();
		
		// Close the dialog
		dialog.dialogClose('#dialog');
	},


	// Handle failed data request
	setDateAndTimeFail: function (textStatus, errorThrown)
	{
		// show error message that meter update failed
		meterUpdateFailed();
	}
	
}
