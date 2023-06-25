// max characters (bytes) allowed in post data to the API
var maxPostDataLength = 500;

// global timer object to manage requests
var requestTimer = null;

// set the reload interval in milliseconds
var reloadReportInterval = 1000;

// Global Request Timeout Limit
var reqTimeoutLimit = 60000; // 60 Seconds

var pmAjax = {

	sendPostEmpty:function(reqObj) {
				
		reqObj.currentRegisterIndex = 0;
		var responseObject = {};
		responseObject.result = null;
		
		var request = $.ajax({
			type: reqObj.type,
			url: reqObj.url,
			dataType: 'text', //needs to be reqObj.returnType which is generally going to be "json", however unwrapped FAIL values break this right now.
			cache:false,
			timeout: reqTimeoutLimit
		});
		
		request.done(function(data) {
			try {			
				data = jQuery.parseJSON(data);
			} catch(e) {
				data = {result:[{errorCode:-1,errorMessage:"$%localizedString(Invalid response from device)#$"}]};
			}
			
			reqObj.successCallback(data, reqObj);
			
		});
		request.fail(function(jqXHR, textStatus, errorThrown) {
			if(reqObj.failCallback) {
				reqObj.failCallback(textStatus, errorThrown, reqObj);
			}
		});
	},	
		
	sendPostWithArray:function(reqObj) {		
	// reqObj:
	//    requestArrayName: 'values', 'names', etc
	//    registerArray: array of register names
		reqObj.currentRegisterIndex = 0;
		var responseObject = {};
		responseObject.result = null;
		pmAjax.sendRegisterBlock(reqObj, responseObject);
	},
	
	sendRegisterBlock:function(reqObj, responseObject) {
		var registerRequest = pmAjax.createRegisterString(reqObj, maxPostDataLength);
		reqObj.registerRequestCount = registerRequest.registerRequestCount;
		reqObj.currentRegisterIndex += registerRequest.registerRequestCount;
		var request = $.ajax({
				type: reqObj.type,
				url: reqObj.url,
				data: registerRequest.requestString,
				dataType: 'text', //needs to be reqObj.returnType which is generally going to be "json", however unwrapped FAIL values break this right now.
				cache:false,
				timeout: reqTimeoutLimit
			});		
		request.done(function(data) {pmAjax.blockDone(data, reqObj, responseObject);});
		request.fail(function(jqXHR, textStatus, errorThrown) {
			if(reqObj.failCallback) {
				reqObj.failCallback(textStatus, errorThrown, reqObj);
			}
		});
	},
	
	createRegisterString:function(reqObj, maxCharacters)
	{
		var maxArrayStringLength = maxCharacters - reqObj.requestArrayName.length - 5;
		var requestArray = [];
		var requestStringLength = 0;
		var currentRegisterIndex = reqObj.currentRegisterIndex;
		while(currentRegisterIndex < reqObj.registerArray.length) {
			var elementToAdd = reqObj.registerArray[currentRegisterIndex];
			var stringLengthToAdd;
			if (typeof elementToAdd == 'string' || elementToAdd instanceof String) {
				stringLengthToAdd = elementToAdd.length;
			}
			else {
				stringLengthToAdd = JSON.stringify(elementToAdd).length;
			}
			stringLengthToAdd += 5; // some extra characters are added during final stringify
			
			if ( requestStringLength + stringLengthToAdd >= maxArrayStringLength) {
				break;
			}
			
			requestArray.push(elementToAdd);
			currentRegisterIndex += 1;
			requestStringLength += stringLengthToAdd;
		}
		
		return {
			registerRequestCount: currentRegisterIndex - reqObj.currentRegisterIndex,
			requestString: '{"' + reqObj.requestArrayName + '":' + JSON.stringify(requestArray) + '}'
		};
	},
	
	blockDone:function(data, reqObj, responseObject) {
		try {			
			data = jQuery.parseJSON(data);
		} catch(e) {
			data = {result:[{errorCode:-1,errorMessage:"$%localizedString(Invalid response from device)#$"}]};
		}
		
		if ( data.result ) {
			data.result = data.result.slice(0, reqObj.registerRequestCount);
			if (responseObject.result == null) {
				responseObject.result = data.result; 
			} else {
				responseObject.result = responseObject.result.concat(data.result);
			}
		} else if ( data.timestamps ) {
			data.timestamps = data.timestamps.slice(0, reqObj.registerRequestCount);
			if (responseObject.timestamps == null) {
				responseObject.timestamps = data.timestamps; 
			} else {
				responseObject.timestamps = responseObject.timestamps.concat(data.timestamps);
			}
		}
		
		if (reqObj.currentRegisterIndex >= reqObj.registerArray.length)
		{
			if(reqObj.successCallback) {
				reqObj.successCallback(responseObject, reqObj);
			}
		}
		else
		{
			pmAjax.sendRegisterBlock(reqObj, responseObject);
		}
	},
	
	schedulePostRequest:function(reqObj) {
		clearTimeout(requestTimer);				
		requestTimer = setTimeout(function () {pmAjax.sendPostWithArray(reqObj); }, reloadReportInterval);
	},
	
	schedulePostEmptyRequest:function(reqObj) {
		clearTimeout(requestTimer);				
		requestTimer = setTimeout(function () {pmAjax.sendPostEmpty(reqObj); }, reloadReportInterval);
	},
	
	scheduleGetRequest:function(reqObj) {
		clearTimeout(requestTimer);				
		requestTimer = setTimeout(function () {pmAjax.sendGet(reqObj); }, reloadReportInterval);
	},
	
	sendGet:function(reqObj) {
		if(development == "full") {
			pmAjax.getDummyData(reqObj);
			return;
		}
		
		var request = $.ajax({
			type: reqObj.type,
			url: reqObj.url,
			dataType: 'text', //needs to be reqObj.returnType which is generally going to be "json", however unwrapped FAIL values break this right now.
			cache:false,
			timeout: reqTimeoutLimit
		});

		request.done(function(data) {
			// wrap FAIL values in double quotes
			data = data.replace(/:FAIL/g,":\"FAIL\"");

			// JSON-ify the response
			try {
				data = jQuery.parseJSON(data);
			} catch(e) {
				// Handle Error
				// errorMessage.displayHTMLErrorMessage('Meter Data Error', '#content');
				// requestFailed = true;
				console.log('GET response error = ' + e);
			}

			if(reqObj.successCallback) {
				reqObj.successCallback(data, reqObj);
			}
		});

		request.fail(function(jqXHR, textStatus, errorThrown) {
			
			if(reqObj.failCallback) {
				reqObj.failCallback(textStatus, errorThrown, reqObj);
			}
		});
	},
		
  binaryGet:function(reqObj) {
          if(development == "full") {
                  pmAjax.getDummyData(reqObj);
                  return;
          }

          var request = $.ajax({
                  type: reqObj.type,
                  url: reqObj.url,
                  dataType: reqObj.dataType,
                  contentType: reqObj.contentType,
                  returnType: reqObj.returnType,
                  processData: reqObj.processData,
                  responseType: reqObj.responseType,
                  cache:false,
                  timeout: reqTimeoutLimit
          });

          request.done(function(data) {
                  // wrap FAIL values in double quotes
                  data = data.replace(/:FAIL/g,":\"FAIL\"");

                  if(reqObj.successCallback) {
                          reqObj.successCallback(data, reqObj);
                  }
          });

          request.fail(function(jqXHR, textStatus, errorThrown) {

                  if(reqObj.failCallback) {
                          reqObj.failCallback(textStatus, errorThrown, reqObj);
                  }
          });
  },

  getDummyData:function(reqObj) {
		var data = dummyData(reqObj);
		if(data!=null) {
			reqObj.successCallback(data, reqObj);
		} else {
			reqObj.failCallback("textStatus", "errorThrown");
		}
	}
};