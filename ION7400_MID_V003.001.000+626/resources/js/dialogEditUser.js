
/**
 * Edit User Dialog
 * Provides the Edit User dialog.
 */
var dialogEditUser = {
	
	
	/**
	 * Display the Edit User Form within a JQuery Dialog
	 * 
	 * @param string editUserID - the selected user being edited.
	 */
	dialogDisplayEditUserForm: function(editUserID)
	{
		
		// Get the Edit User Dialog Title, and Button Titles
		var dialogTitle = jQuery('#dialogEditUser_title').text();
		var buttonConfirm = jQuery('#dialogEditUser_buttonOK').text();
		var buttonCancel = jQuery('#dialogEditUser_buttonCancel').text();
		
		// Set the Edit User Dialog labels
		jQuery('#dialogEdit_name').html(jQuery('#dialogEditUser_name').text() + ' : '+ editUserID);
		jQuery('#dialogEdit_rights').html(jQuery('#dialogEditUser_rights').text() + ':');
		jQuery('#dialogEdit_changePassword').html(jQuery('#dialogEditUser_changePassword').text());
		jQuery('#dialogEdit_newPassword').html(jQuery('#dialogEditUser_newPassword').text());
		jQuery('#dialogEdit_confirmPassword').html(jQuery('#dialogEditUser_confirmPassword').text());
		jQuery('#dialogEdit_buttonCancel').html(jQuery('#dialogEditUser_buttonCancel').text());
		jQuery('#dialogEdit_buttonOK').html(jQuery('#dialogEditUser_buttonOK').text());
		
		// Set Edit User Checkbox labels
		jQuery('#dialogEdit_read').html(jQuery('#dialogEditUser_read').text());
		jQuery('#dialogEdit_fullMeterConfig').html(jQuery('#dialogEditUser_fullMeterConfig').text());
		jQuery('#dialogEdit_peakDemandReset').html(jQuery('#dialogEditUser_peakDemandReset').text());
		jQuery('#dialogEdit_testMode').html(jQuery('#dialogEditUser_testMode').text());
		jQuery('#dialogEdit_timeSync').html(jQuery('#dialogEditUser_timeSync').text());
		jQuery('#dialogEdit_securityConfig').html(jQuery('#dialogEditUser_securityConfig').text());
		
		// Display Message Dialog
		jQuery(function() {
			jQuery("#dialogEditUserAccount").dialog(
			{
				resizable: false,
				height:360,
				width:400,
				modal: true,
				closeOnEscape: false,
				option: 'hide',
				title: dialogTitle,
				buttons: [{
					text: buttonConfirm,
					click: function()
					{
						// Yes, apply changes.
						dialogEditUser.successFunction(editUserID, this);
					}
				},
				{
					text: buttonCancel,
					click: function()
					{
						// No, do not apply changes.
						dialogEditUser.dialogClose(this);
					}
				}]
			});
			
		});
	},
	
	
	// Supply confrimation message
	successFunction: function (editUserID, dialogObj)
	{
		alert(editUserID + ' has been successfully update,\nbut not actually sent to the server.');
		jQuery(dialogObj).dialog("close");
	},
	
	
	// Close the Dialog box for provided Dialog Object
	dialogClose: function (dialogObj)
	{
		jQuery(dialogObj).dialog("close");
	}

}