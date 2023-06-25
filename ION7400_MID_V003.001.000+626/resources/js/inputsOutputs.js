var inputsOutputs = {


   // Init with the Inputs pane.
   initInputsOutputs: function ()
   {
	  inputsOutputs.requestInputData('digInputs');
	  inputsOutputs.bindAccordionPaneChildren();
   },
		
   requestInputData: function(paneId)
   {
	    var reqUrl;
	    
	    if(paneId == 'digInputs')
	    {
		    var reqUrl = '/api/registerValues/getDigitalInputValues';
	    }
	    else if (paneId == 'digOutputs')
	    {
		    var reqUrl = '/api/registerValues/getDigitalOutputValues';
	    }
	    else if (paneId == 'anlgInputs')
	    {
		    var reqUrl = '/api/registerValues/getAnalogInputValues';
	    }
	    else // assume 'anlgOutputs'
	    {
		    var reqUrl = '/api/registerValues/getAnalogOutputValues';
	    }
	   
		// Compose Request Object
		var reqObj = ({
			type: 'POST',
			url: reqUrl,
			requestArrayName: 'names',
			registerArray: ["blank"],
			returnType: 'json',
			successCallback: inputsOutputs.reqInputOutputDataSuccess,
			failCallback: inputsOutputs.reqInputOutputDataFail,
			elementId: paneId
		});
		
		pmAjax.sendPostEmpty(reqObj);
		
   },

    reqInputOutputDataSuccess: function (data, reqObj)
	{    	
    	var digIoTable =  document.getElementById(reqObj.elementId).getElementsByTagName("table")[0];
    	
    	// First, remove the table rows.
    	var oRows = digIoTable.getElementsByTagName("tr");
    	var iRowCount = oRows.length;
    	for(var i = iRowCount - 1; i > 0; i--)
    	{
    		digIoTable.deleteRow(i);
    	}
    	
    	var oRows = digIoTable.getElementsByTagName('tr');
    	var iRowCount = oRows.length;    	    
    	var baseRow = document.createElement('tr');
    	var baseCell = document.createElement('td');
    	    	
        for(var i = 0; i < data.result.length; i++)
        {        
        	// Create a new row.
        	var newRow = baseRow.cloneNode(false);
        	if((i % 2) != 0)
        	{
        	   newRow.className = "altrow";
        	}
        	
        	// Create the new cells.
        	var myCell = baseCell.cloneNode(false);
        	myCell.innerHTML = data.result[i].label;
        	newRow.appendChild(myCell);
        	
        	myCell = baseCell.cloneNode(false);
        	myCell.innerHTML = data.result[i].value;
        	newRow.appendChild(myCell);
        	
        	if(reqObj.elementId == 'digInputs')
        	{
        	   myCell = baseCell.cloneNode(false);
        	   myCell.innerHTML = data.result[i].count;
        	   newRow.appendChild(myCell);
        	}

        	//Append new row
        	digIoTable.appendChild(newRow);        	
        }
        
        inputsOutputs.repeatRequestIfSelected(reqObj);
	},
	
	reqInputOutputDataFail: function (textStatus, errorThrown, reqObj)
	{
		errorMessage.displayHTMLErrorMessage(errorThrown, '#' + reqObj.elementId);
	},			
	
	bindAccordionPaneChildren: function () {
		// Bind onClick event for each Accordion header elemenent
		jQuery("div.accordion > h3").each( function()
		{
			var eTarget = jQuery(this).attr('target');
			jQuery(this).bind('click', function()
			{
				inputsOutputs.updatePaneContentByTarget(eTarget, jQuery(this).attr("id"));
			});
		});
	},
		
	updatePaneContentByTarget: function (paneTarget, eID)
	{
		// Determine if Pane is already selected
		var isSelected = jQuery('#'+ eID).hasClass('ui-accordion-header-active');
		// If the Pane is not selected, populate it.
		if(!isSelected) {
			inputsOutputs.requestInputData(paneTarget);
		}
	},
   
	repeatRequestIfSelected: function (reqObj)
	{
		var isSelected = jQuery('[target="' + reqObj.elementId + '"]').hasClass('ui-accordion-header-active');
		if (isSelected) {
			pmAjax.schedulePostEmptyRequest(reqObj);
		}		
	}
};