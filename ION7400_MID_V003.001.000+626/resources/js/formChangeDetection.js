
/**
 * Form Change Detection
 * If a form field has been changed, the user is notified when they leave the page.
 */
var formChangeDetection = {
	
	// Has the form changed?
	formChanged: false,
	
	// Have the anchors (<a> tags) been bound?
	anchorsBound: false,
	
	/**
	 * Initializes the Form Field Change Detector for the provided selector.
	 * The is prompted if they change any form field data and attempt to leave the page.
	 *
	 * @param string selector - provide the scope for the form fields.
	 */
	initFormChangeDetection: function (selector, messageID)
	{
		// Disable Submit button
		jQuery('#content button, #content input[type="submit"]').button(); // Disabling the button fails without this line.
		jQuery('#content button, #content input[type="submit"]').button("option", "disabled", true); // Disable button.
		
		// Unbind any existing bindings (prevents multiple bindings)
		formChangeDetection.unbindformChangeDetection(selector);
	
		// Unbind the Verttabs click function to prevent default action
		// the Verttabs click event is re-binding after handling click event
		formChangeDetection.unbindVertTabClickEvents();
	
		// Handle KeyUp for Form Input
		jQuery(selector +' input').bind('keyup', function(e)
		{
			// Ignore Tab Key Presses
			if(e.keyCode != '9')
			{
				formChangeDetection.changeDetected(this);
			}
		});
		
		// Handle changes for Form Input
		// This is necessary for the Calendar Date Chooser
		jQuery(selector +' input').change( function(e)
		{
			formChangeDetection.changeDetected(this);
		});
		
		// Handle changes for <select> menus
		jQuery(selector +' select').change( function ()
		{
			formChangeDetection.changeDetected(this);
		});
		
		// Handle changes for Checkboxes
		jQuery(selector +' input:checkbox').change( function ()
		{
			formChangeDetection.changeDetected(this);
		});
	
		// Bind <a> tags if not already bound.
		// This prevents multiple bindings.
		if(!formChangeDetection.anchorsBound)
		{
			// Catch Anchor Clicks
			jQuery('#tabs > ul > li > a').click( function(e)
			{
				if(formChangeDetection.formChanged)
				{
					// If <a> element belongs to the Main Navigation, prevent default action
					e.preventDefault();
				
					// Display Message Dialog
					formChangeDetection.dialogDisplayMessage(jQuery(this), messageID);
				}
			});
		
			// Catch Anchor Clicks
			jQuery('#verttabs > ul > li > a').click( function(e)
			{
				e.preventDefault();
			
				// If the form has been changed
				if(formChangeDetection.formChanged)
				{
					// Display Message Dialog
					formChangeDetection.dialogDisplayMessage(jQuery(this), messageID);
				}
				else
				{
					// There are no changes: click it!
					formChangeDetection.clickVertTabIndex(jQuery(this));
				}
			});
		
		}
	
		// Catch page Unload
		window.onbeforeunload = function (e) {
			if(formChangeDetection.formChanged)
			{
				// Browser Provides it's own Alert Box
				var message = jQuery('#browser_unload_message1').text();
				if(jQuery('#browser_unload_message2').text() != '')
				{
					message += '\n\n' + jQuery('#browser_unload_message2').text();
				}
				
				// Fetch Browser Unload Message
				return message;
			}
		};
	},


	// Reset the Form Change Detector
	resetFormChangeDetection: function (selector)
	{
		formChangeDetection.formChanged = false;
		// Disable Submit button
		jQuery('#content button, #content input[type="submit"]').button(); // Disabling the button fails without this line.
		jQuery('#content button, #content input[type="submit"]').button("option", "disabled", true); // Disable button.

		// clear all "changed" flags on elements
		jQuery(selector).find('[changed]').removeAttr('changed');
	},
	
	
	// Unbind Form Change Detection Events
	unbindformChangeDetection: function (selector)
	{
		// Do not unbind <a> tags. It will break the AJAX.
	
		// Unbind Form Elements
		jQuery(selector +' input').unbind('keyup');
		jQuery(selector +' select').unbind('change');
	
		window.onbeforeunload = null;
	},


	// Unbind VertTab elements
	unbindVertTabClickEvents: function ()
	{
		jQuery('#verttabs > ul > li > a').unbind('click');
	},
	
	
	/* 
	* Enable the submit button when a change has been detected. Mark the changed field as changed 
	*	so that action will be taken on it.
	*
	* @parm element - The DOM element that changed.
	*/
	changeDetected: function (element)
	{
		// If the Submit button has not yet been enabled.
		// This also prevents multiple bindings.
		if(!formChangeDetection.formChanged)
		{
			formChangeDetection.formChanged = true;
			jQuery('#content button, #content input[type="submit"]').button("option", "disabled", false);
		}

		// mark the DOM element as changed
		jQuery(element).attr('changed', 'true');
	},
	
	
	// Display Dialog with Message
	dialogDisplayMessage: function (linkObj, messageID)
	{
		// If there have been any form field changes, notify the user.
		if(formChangeDetection.formChanged)
		{
			// Find Dialog Title
			var dialogTitle = jQuery(messageID +' > label#dialog_title').text();
			
			// Find and compose Dialog Message
			var message = jQuery(messageID +' > label#dialog_message1').text();
			if(jQuery(messageID +' > label#dialog_message2').text() != '')
			{
				message += '<br />' + jQuery(messageID +' > label#dialog_message2').text();
			}
			jQuery('#dialog_message').html(message);
			
			// Find Dialog Button Labels
			var confirm_label = jQuery(messageID +' > label#dialog_confirm').text();
			var cancel_label = jQuery(messageID +' > label#dialog_cancel').text();
			
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
							// Close the dialog
							formChangeDetection.dialogClose(this);
						
							// If <a> element is a Vert Tab, trigger a Click event
							if(linkObj.parent().parent().parent().attr('id') == 'verttabs')
							{
								// Find the Index for the Vertical Tab item that was clicked
								formChangeDetection.clickVertTabIndex(linkObj);
							}
							else
							{
								// Is the Main Navigation
								window.onbeforeunload = null; // for Firefox
								window.location.replace(linkObj.attr('href'));
							}
						
							// Reset form FormChange boolean
							formChangeDetection.formChanged = false;
						
						}
					},
					{
						text: cancel_label,
						click: function()
						{
							formChangeDetection.dialogClose(this);
						}
					}]
				});
				
			});
		}
	},


	/**
	 * Find the Index value of the Vertical tab that was clicked
	 *
	 * @param object linkObj - the HTML element of the object that was clicked.
	 */
	clickVertTabIndex: function (linkObj)
	{
		// Find all Verttabs
		var verttabs = jQuery("#verttabs > ul > li > a");
		var verttabURL = linkObj.attr('href');
	
		// Define vertTabIndex
		var vertTabIndex;
	
		// Find index of item clicked
		for(var i = 0; i < verttabs.length; i++)
		{
			if(verttabs.eq(i).attr('href') == verttabURL)
			{
				vertTabIndex = i;
				break;
			}
		}
	
		// Unbind any existing Click function
		formChangeDetection.unbindVertTabClickEvents();
	
		// Re-Bind Vertical Tabs with their origial function,
		// and provide the index of the item to be automatically clicked.
		verticalTabs(''+ vertTabIndex +'');
	},


	// Close the Dialog box for provided Dialog Object
	dialogClose: function (dialogObj)
	{
		jQuery(dialogObj).dialog("close");
	}

}
