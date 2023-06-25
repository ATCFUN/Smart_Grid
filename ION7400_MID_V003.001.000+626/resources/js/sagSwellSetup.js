/**
 * PQ Setup setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */

var sagSwellSetup = {


	initSagSwellSetup: function ()
	{
	
		// Get possible registers for Select Menus for getEnumerations API method
		var strRegisterNames = buildStringGetRegister('#formSagSwellSetup');

		// Compose Request Object for Select Menus
		var reqObject = ({
			type: 'POST',
			url: '/api/enumerations',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: sagSwellSetup.getSelectMenuValsSuccess,
			failCallback: sagSwellSetup.getSelectMenuValsFail
		});
	
		// Request options for Select Menus
		pmAjax.sendRequest(reqObject);

		// Get register values to pre-populate form
		var strRegisterNames = buildStringGetRegister('#formSagSwellSetup');	

		// Compose Request Object for Register values
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: sagSwellSetup.getRegisterValsSuccess,
			failCallback: sagSwellSetup.getRegisterValsFail
		});
	
		// Request values for Registers
		pmAjax.sendRequest(reqRegisterObject);

		// init jQuery button
		// attach form handler on Basic and Advanced Settings form (one form covers both accordion sections)
		jQuery('button, input[type="submit"]').click(function ()
		{
			// Display Dialog to confirm changes before applying
			dialog.dialogDisplayMessage('#dialogMessageApply', sagSwellSetup.applyChanges);
	
			return false;
		});
		
	},
	
	
	// Populate Registers
	getRegisterValsSuccess: function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.serializedData, 'formSagSwellSetup');
	},
	
	
	// Handle failed data request
	getRegisterValsFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#sagSwellLitmis');
	},
	
	
	// Populate Drop Down Menus
	getSelectMenuValsSuccess: function (data, reqObj)
	{
		// populate dropdown by adding each returned value to DOM
		populateDropdowns(data, reqObj.serializedData);

	},

	
	// Handle failed data request
	getSelectMenuValsFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#sagSwellLitmis');
	},
	
	
	/**
	 * Apply Changes to registers
	 *
	 * @param String controlType - the selected control type to be udpated.
	 */
	applyChanges: function (controlType)
	{
		// TODO: Reset Selected Controller
		
		var strRegistersToChange = buildStringSetRegister('#formSagSwellSetup');
		
		// Compose Request Object
		var reqObject = ({
			type: 'POST',
			url: '/api/registerValues/setRegisterValues',
			serializedData: strRegistersToChange,
			returnType: 'json',
			successCallback: sagSwellSetup.setRegistersSuccess,
			failCallback: sagSwellSetup.setRegistersFail
		});
	
		// send request to set fields
		pmAjax.sendRequest(reqObject);
		
	},
	
	
	// Re-populate page Registers, and reset Form Change Detection
	setRegistersSuccess: function (data, reqObj)
	{
		// display success message?
		alert('Success: but data is not actually sent.');
		
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.serializedData, '#formSagSwellSetup');
		
		// For now: Close the dialog
		dialog.dialogClose('#dialog');
		
		// Reset form field change detection
		formChangeDetection.resetFormChangeDetection('#formSagSwellSetup');
	},
	
	
	// Handle failed data request
	setRegistersFail: function ()
	{
		// TODO - error handling
	}

}
