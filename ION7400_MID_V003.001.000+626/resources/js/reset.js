/**
 * Reset setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */
function initReset()
{
	// Initialize Reset buttons
	$("input[type=submit].reset").button();
	$("input[type=submit].reset").css('margin','0');
	
	// Hook Reset button Click Event
	jQuery("input[type=submit].reset").each( function ()
	{
		jQuery(this).click( function()
		{
			// Capture Control Type. The "Target" defines the "Regname"
			var controlType = jQuery(this).parent().parent().attr('target');
			
			// Find parent Pane ID
			var paneID = jQuery(this).parent().parent().attr('id');
			
			// Find Dialog Title
			var dialogTitle = jQuery('tr[target="' + controlType + '"] > td.titleLabel').text();
		
			// Find and compose Dialog Message
			var message = jQuery('label#dialog_message1').text();
			if(jQuery('label#dialog_message2').text().length > 0)
			{
			 	message += '<br />' + jQuery('label#dialog_message2').text();
			}
		
			// Add message to Dialog
			jQuery('#dialog_message').html(message);
		
			// Find Dialog Button Labels
			var confirm_label = jQuery('label#dialog_confirm').text();
			var cancel_label = jQuery('label#dialog_cancel').text();
			
			// Display Message Dialog
			jQuery(function() {
				jQuery("#dialog").dialog(
				{
					resizable: false,
					height:175,
					modal: true,
					option: 'hide',
					title: dialogTitle,
					buttons: [{
						text: confirm_label,
						click: function()
						{
							// Close the confirmation dialog
							jQuery(this).dialog("close");
							
							// Display loading icon
							displayMeterChangeInProgress()
							
							// Reset the specified Control Type
							resetControlAction(controlType);
						}
					},
					{
						text: cancel_label,
						click: function()
						{
							// Close the dialog
							jQuery(this).dialog("close");
						}
					}]
				});
			
			});
		
		});
		
	});
	
	var reqTimestampObject = ({
		type: 'POST',
		url: '/api/registerValues/getRegisterValues',
		requestArrayName: 'names',
		registerArray: getTimestampRegisterArrayFromPage('#controlReset'),
		returnType: 'json',
		successCallback: getTimestampValuesSuccess,
		failCallback: getRegisterValuesFailure
	});

	pmAjax.sendPostWithArray(reqTimestampObject);
}

function getTimestampValuesSuccess(data, reqObj)
{
	var reqTimestampObject = ({
		type: 'POST',
		url: '/api/registerValues/getRegisterTimestamps',
		requestArrayName: 'names',
		registerArray: reqObj.registerArray,
		returnType: 'json',
		successCallback: getRegisterTimestampsSuccessful,
		failCallback: getRegisterValuesFailure,
		repeatRequest: reqObj,
		registerData: data
	});

	pmAjax.sendPostWithArray(reqTimestampObject);
}

function getRegisterTimestampsSuccessful(data, reqObj)
{
	populateTimestampValues(data, reqObj.registerArray, 'controlReset', reqObj.registerData, reqObj.registerArray);
	pmAjax.schedulePostRequest(reqObj.repeatRequest);
}


function getRegisterValuesFailure(textStatus, errorThrown)
{
	// Handle Error
	errorMessage.displayHTMLErrorMessage(errorThrown, '#controlReset');
}


/**
 * Reset the selected controller
 *
 * @param String controlType - the selected control type to be reset.
 */
function resetControlAction(controlType) {
	
	// Set specified register value
	//var resetRegisterName = '{"values":[{"name":"'+ controlType +'", "value":"1"}]}';
	
	// Compose Request Object
	var reqObject = ({
		type: 'POST',
		url: '/api/registerValues/setRegisterValues',
		requestArrayName: 'values',
		registerArray: [{"name" : controlType, "value" : "1"}],
		returnType: 'json',
		successCallback: resetControlActionSuccess,
		failCallback: resetControlActionFail
	});

	// send request to set fields
	pmAjax.sendPostWithArray(reqObject);

}


// Request to Reset Control success callback
function resetControlActionSuccess(data, reqObj)
{
	// Determine if request succeeded
	if(!data.result || data.result[0].value != "true")
	{
		// Show error message that meter update failed
		var message;
		if(data.result && data.result.length > 0 && data.result[0].errorMessage)
			message = data.result[0].errorMessage;
		meterUpdateFailed(message);
		
		return;
	}
	
	completeMeterChangeInProgress();
	
	// Get Register values
	initReset();
}


// Request to Reset control fail callback
function resetControlActionFail(textStatus, errorThrown, reqObj)
{
	// show error message that meter update failed
	meterUpdateFailed(textStatus);
}
