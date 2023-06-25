var weekly95thPercentileThreshold = '95';
var weekly99thPercentileThreshold = '99';
var daily99thPercentileThreshold = '99';

var ieee519Summary = {
	
	/**
	 * IEEE 519 setup method.
	 *
	 * Call API method(s) and populate page contents with data.
	 * 
	 */	
	initIeee519: function()
	{
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			requestArrayName: 'names',
			registerArray: getRegisterArrayFromPage('#ieee519'),
			returnType: 'json',
			successCallback: ieee519Summary.getIeee519RegisterSuccess,
			failCallback: ieee519Summary.getIeee519RegisterFail
		});
		
		pmAjax.sendPostWithArray(reqRegisterObject);
		
	},
	
	getIeee519RegisterSuccess: function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.registerArray, 'ieee519');
		ieee519Summary.updateHarmonicsComplianceStatus();
      pmAjax.schedulePostRequest(reqObj);
	},
	
	
	getIeee519RegisterFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#ieee519');
	},
	
	// Update IEEE 519 Compliance Status summary
	updateHarmonicsComplianceStatus: function()
	{
		// Weekly compliance - 95th percentile
		ieee519Summary.checkHarmonicCompliance('#lastWeekVoltageHarmonic95thPercentile', weekly95thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#thisWeekVoltageHarmonic95thPercentile', weekly95thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#lastWeekVoltageTHD95thPercentile', weekly95thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#thisWeekVoltageTHD95thPercentile', weekly95thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#lastWeekCurrentHarmonic95thPercentile', weekly95thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#thisWeekCurrentHarmonic95thPercentile', weekly95thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#lastWeekCurrentTDD95thPercentile', weekly95thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#thisWeekCurrentTDD95thPercentile', weekly95thPercentileThreshold);
		
		// Weekly compliance - 99th percentile
		ieee519Summary.checkHarmonicCompliance('#lastWeekCurrentHarmonic99thPercentile', weekly99thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#thisWeekCurrentHarmonic99thPercentile', weekly99thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#lastWeekCurrentTDD99thPercentile', weekly99thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#thisWeekCurrentTDD99thPercentile', weekly99thPercentileThreshold);
		
		//Daily compliance - 99th percentile
		ieee519Summary.checkHarmonicCompliance('#yesterdayVoltageHarmonic99thPercentile', daily99thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#todayVoltageHarmonic99thPercentile', daily99thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#yesterdayVoltageTHD99thPercentile', daily99thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#todayVoltageTHD99thPercentile', daily99thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#yesterdayCurrentHarmonic99thPercentile', daily99thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#todayCurrentHarmonic99thPercentile', daily99thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#yesterdayCurrentTDD99thPercentile', daily99thPercentileThreshold);
		ieee519Summary.checkHarmonicCompliance('#todayCurrentTDD99thPercentile', daily99thPercentileThreshold);
	},

	// Check if values in IEEE 519 compliance
	checkHarmonicCompliance: function(cellID, thresholdValue)
	{
		var passed = false;
		var cellValue = jQuery(cellID).text();
		// If value is blank or non-numeric, it automatically fails
		if( (!isNaN(parseFloat(cellValue))) && (cellValue != '') )
		{
			passed = parseFloat(cellValue) > parseFloat(thresholdValue);
		}
		jQuery(cellID).removeClass('pass');
      jQuery(cellID).removeClass('failText');
		
		if(passed)
		{
			// Pass: add appropriate Pass style
			jQuery(cellID).addClass('pass');
		}
		else
		{
			// Fail: add appropriate Fail style
			jQuery(cellID).addClass('failText');
		}
	},
};