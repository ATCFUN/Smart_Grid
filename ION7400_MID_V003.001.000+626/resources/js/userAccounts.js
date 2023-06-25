/**
 * User Accounts setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */


var userAccounts = {

	initUserAccounts: function ()
	{
		
		// Get register values to pre-populate form
		var strRegisterNames = buildStringGetRegister('#userAccounts');

		// Compose Request Object for Register values
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			serializedData: strRegisterNames,
			returnType: 'json',
			successCallback: userAccounts.getRegisterValsSuccess,
			failCallback: userAccounts.getRegisterValsFail
		});
	
		// Request values for Registers
		pmAjax.sendRequest(reqRegisterObject);

		// init jQuery button
		// attach form handler on Basic and Advanced Settings form (one form covers both accordion sections)
		jQuery('button, input[type="submit"]').click(function ()
		{
			// Display Dialog to confirm changes before applying
			dialog.dialogDisplayMessage('#dialogMessageApply', userAccounts.applyChanges);
	
			return false;
		});
		
	},
	
	// Populate Registers
	getRegisterValsSuccess: function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.serializedData, 'userAccounts');
		
		userAccounts.bindEditUserLinks();
	},
	
	
	// Handle failed data request
	getRegisterValsFail: function ()
	{
		// TODO - error handling
	},
	
	
	// Find and bind Click event for all Edit User Links
	bindEditUserLinks: function ()
	{
		// Catch Anchor Clicks
		jQuery('div#userAccounts table tr > td > a').click( function(e)
		{
			// Prevent default event
			e.preventDefault();
			
			// Display the Edit User Dialog
			dialogEditUser.dialogDisplayEditUserForm(jQuery(this).attr('target'));
			
		});
	}

}
