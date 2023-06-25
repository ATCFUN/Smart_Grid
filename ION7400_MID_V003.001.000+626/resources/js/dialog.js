
/**
 * Form Change Detection
 * If a form field has been changed, the user is notified when they leave the page.
 */
var dialog = {
	
	/**
	 * Display Dialog with Message
	 *
	 * @param string messageID - the ID specifying which object contains content for the Dialog...
	 *		... this allows multiple types of dialogs on one page.
	 * @param function successFunction - the function used when the user clicks the confirm option.
	 */
	dialogDisplayMessage: function (messageID, successFunction, successParam)
	{
		// If a messageID is provided
		if(messageID.length > 0)
		{
			messageID = messageID + ' > ';
		}
		
		// Find Dialog Title
		var dialogTitle = jQuery(messageID + 'label#dialog_title').text();
		
		// Find and compose Dialog Message
		var message = jQuery(messageID + 'label#dialog_message1').text();
		
		// Accomodate a potential second message line
		if(jQuery(messageID + 'label#dialog_message2').text() != '')
		{
			message += '<br />' + jQuery(messageID + 'label#dialog_message2').text();
		}
		jQuery('#dialog_message').html(message);
		
		// Find Dialog Button Labels
		var confirm_label = jQuery(messageID + 'label#dialog_confirm').text();
		var cancel_label = jQuery(messageID + 'label#dialog_cancel').text();
		
		// Display Message Dialog
		jQuery(function() {
			jQuery("#dialog").dialog(
			{
				resizable: false,
				width:300,
				height:175,
				modal: true,
				closeOnEscape: false,
				option: 'hide',
				title: dialogTitle,
				buttons: [{
					text: confirm_label,
					click: function()
					{
						// Yes, apply changes.
						successFunction(successParam);
					}
				},
				{
					text: cancel_label,
					click: function()
					{
						// No, do not apply changes.
						dialog.dialogClose(this);
					}
				}]
			});
			
		});
			
	},
	
	// Close the Dialog box for provided Dialog Object
	dialogClose: function (dialogObj)
	{
		jQuery(dialogObj).dialog("close");
	}

}
