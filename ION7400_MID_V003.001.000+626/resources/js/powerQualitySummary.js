var EN50160Evaluation = ({
		Freq1: '<0.5',
		Freq2: '==0',
		VMag1: '<5',
		VMag2: '==0',
		VUnbal: '<5',
		Harm1: '<5',
		Harm2: '==0',
		Flicker: '<5',
		Mains1: '<1'
});

var powerQualitySummary = {

	/**
	 * ITIC-SEMI setup method.
	 *
	 * Call API method(s) and populate page contents with data.
	 * 
	 */
	initIticSemi: function ()
	{
		// find and set nominal frequency and voltage from meter registers

		var reqObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			requestArrayName: 'names',
			registerArray: ["F Nominal", "V Nominal"],
			returnType: 'json',
			failCallback: powerQualitySummary.getRegisterITICSemiFailCallback,
			successCallback: function (data)
			{
				// check that results are returned as expected (do not continue otherwise)
				if (data.result == undefined) return;

				// set Nominal Frequency and Nominal Voltage values from API
				iticSemi.nominalFrequency = getDataValue(data.result, 0, "F Nominal").value;
				iticSemi.nominalVoltage = getDataValue(data.result, 1, "V Nominal").value;
	
				// convert meter data to numeric values, removing any non-numeric content (such as "60Hz")
				if (jQuery.type(iticSemi.nominalFrequency) == "string") iticSemi.nominalFrequency = iticSemi.nominalFrequency.replace(/[a-zA-Z]/g, '') * 1;
				if (jQuery.type(iticSemi.nominalVoltage) == "string") iticSemi.nominalVoltage = iticSemi.nominalVoltage.replace(/[a-zA-Z]/g, '') * 1;
				
				// call API, and present results in graph and tabular forms
				iticSemi.getReadings(jQuery('#standard').val().toUpperCase());
			}
		});
	
		pmAjax.sendPostWithArray(reqObject);

		// bind change event on Standard dropdown (ITIC vs. SEMI)
		jQuery('#standard').change(function ()
		{
			// rewrite graph
			iticSemi.getReadings(jQuery(this).val().toUpperCase());	

			return false;
		});
	
	},
	
	getRegisterITICSemiFailCallback: function(textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#power-logic');
	},

	/**
	 * NEMA Motor Derating Curve setup method.
	 *
	 * Call API method(s) and populate page contents with data.
	 * 
	 */
	initNemaMotorDeratingCurve: function ()
	{
		// call API, and present results...
	},

	/**
	 * EN50160 setup method.
	 *
	 * Call API method(s) and populate page contents with data.
	 * 
	 */
	initEn50160: function ()
	{
		var reqRegisterObject = ({
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			requestArrayName: 'names',
			registerArray: getRegisterArrayFromPage('#en50160'),
			returnType: 'json',
			successCallback: powerQualitySummary.getEn50160RegisterSuccess,
			failCallback: powerQualitySummary.getEn50160RegisterFail
		});
		
		modulesStateCheck.modulesCheck("FLK");
		modulesStateCheck.modulesCheck("INTERHARMONICS");
		modulesStateCheck.modulesCheck("MSE");
		pmAjax.sendPostWithArray(reqRegisterObject);
		
	},
	
	getEn50160RegisterSuccess: function (data, reqObj)
	{
		// populate register data and form fields on page with returned data
		populateRegisterValuesOnPage(data, reqObj.registerArray, 'en50160');
		
		// Determine the Compliance Statuses for each pane
		powerQualitySummary.powerFrequencyComplianceStatus();
		powerQualitySummary.supplyVoltageMagnitudeComplianceStatus();
		powerQualitySummary.supplyVoltageUnbalancedComplianceStatus();
		powerQualitySummary.harmonicVoltageComplianceStatus();
		powerQualitySummary.supplyVoltageFlickerComplianceStatus();
		powerQualitySummary.mainsSignalingVoltagesComplianceStatus();
		
		// Determine the compliance summary.  The summary compliance depends on compliance of each pane above.
		powerQualitySummary.summaryComplianceStatus();
      pmAjax.schedulePostRequest(reqObj);
	},
	
	
	getEn50160RegisterFail: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#en50160');
	},
	
	
	// Determine and display the EN50160 Compliance Status summary report.
	summaryComplianceStatus: function()
	{
		var complianceArray = new Array();
	
		// Compliance Summary - Frequency
		complianceArray = ['#freqN1OverN', '#freqN2OverN'];
		powerQualitySummary.determineSummaryComplianceStatus('#summary_powerFreq_thisYear', complianceArray);		
		complianceArray = ['#poFreqN1OverN', '#poFreqN2OverN'];
		powerQualitySummary.determineSummaryComplianceStatus('#summary_powerFreq_lastYear', complianceArray);		
			
		// Compliance Summary - Supply Voltage Magnitude
		complianceArray = ['#V1MagN1OverN', '#V1MagN2OverN', '#V2MagN1OverN', '#V2MagN2OverN', '#V3MagN1OverN', '#V3MagN2OverN'];
		powerQualitySummary.determineSummaryComplianceStatus('#summary_supplyVoltageMagnitude_thisWeek', complianceArray);
		complianceArray = ['#poV1MagN1OverN', '#poV1MagN2OverN', '#poV2MagN1OverN', '#poV2MagN2OverN', '#poV3MagN1OverN', '#poV3MagN2OverN'];
		powerQualitySummary.determineSummaryComplianceStatus('#summary_supplyVoltageMagnitude_lastWeek', complianceArray);
				
		// Compliance Summary - Supply Voltage Unbalanced
		complianceArray = ['#VUnbalN1OverN'];
		powerQualitySummary.determineSummaryComplianceStatus('#summary_supplyVoltageUnbalanced_thisWeek', complianceArray);
		complianceArray = ['#poVUnbalN1OverN'];
		powerQualitySummary.determineSummaryComplianceStatus('#summary_supplyVoltageUnbalanced_lastWeek', complianceArray);
			
		// Compliance Summary - Harmonic Voltage
		complianceArray = ['#V1HarmN1OverN', '#V1HarmN2OverN', '#V2HarmN1OverN', '#V2HarmN2OverN', '#V3HarmN1OverN', '#V3HarmN2OverN'];
		powerQualitySummary.determineSummaryComplianceStatus('#summary_harmonicVoltage_thisWeek', complianceArray);
		complianceArray = ['#poV1HarmN1OverN', '#poV1HarmN2OverN', '#poV2HarmN1OverN', '#poV2HarmN2OverN', '#poV3HarmN1OverN', '#poV3HarmN2OverN'];
		powerQualitySummary.determineSummaryComplianceStatus('#summary_harmonicVoltage_lastWeek', complianceArray);
			
		// Compliance Summary - Supply Voltage Flicker
		complianceArray = ['#V1FlickerN1OverN', '#V2FlickerN1OverN', '#V3FlickerN1OverN'];
		powerQualitySummary.determineSummaryComplianceStatus('#summary_supplyVoltageFlicker_thisWeek', complianceArray);
		complianceArray = ['#poV1FlickerN1OverN', '#poV2FlickerN1OverN', '#poV3FlickerN1OverN'];
		powerQualitySummary.determineSummaryComplianceStatus('#summary_supplyVoltageFlicker_lastWeek', complianceArray);
						
		// Compliance Summary - Mains Signaling Voltages
		complianceArray = ['#V1MainsN1OverN', '#V2MainsN1OverN', '#V3MainsN1OverN'];
		powerQualitySummary.determineSummaryComplianceStatus('#summary_mainsSignalingVoltages_today', complianceArray);
		complianceArray = ['#poV1MainsN1OverN', '#poV2MainsN1OverN', '#poV3MainsN1OverN'];
		powerQualitySummary.determineSummaryComplianceStatus('#summary_mainsSignalingVoltages_yesterday', complianceArray);
		
	},
	
	
	// Determine and display the Power Frequency compliance indicators
	powerFrequencyComplianceStatus: function()
	{
		// Determine Compliance
		powerQualitySummary.determineComplianceStatus(['#freqN1OverN', '#poFreqN1OverN'], EN50160Evaluation.Freq1);
		powerQualitySummary.determineComplianceStatus(['#freqN2OverN', '#poFreqN2OverN'], EN50160Evaluation.Freq2);
	},
	
	
	// Determine and display the Supply Voltage Magnitude compliance indicators
	supplyVoltageMagnitudeComplianceStatus: function()
	{		
		// Determine Compliance
		powerQualitySummary.determineComplianceStatus(['#V1MagN1OverN', '#V2MagN1OverN', '#V3MagN1OverN', 
																									'#poV1MagN1OverN', '#poV2MagN1OverN', '#poV3MagN1OverN'],
																									EN50160Evaluation.VMag1);
		powerQualitySummary.determineComplianceStatus(['#V1MagN2OverN', '#V2MagN2OverN', '#V3MagN2OverN', 
																									'#poV1MagN2OverN', '#poV2MagN2OverN', '#poV3MagN2OverN'],
																									EN50160Evaluation.VMag2);
	},
	
	// Determine and display the Supply Voltage Unbalanced compliance indicators
	supplyVoltageUnbalancedComplianceStatus: function()
	{		
		// Determine Compliance
		powerQualitySummary.determineComplianceStatus(['#VUnbalN1OverN', '#poVUnbalN1OverN'], EN50160Evaluation.VUnbal);
	},
	
	// Determine and display the Harmonic Voltage compliance indicators
	harmonicVoltageComplianceStatus: function()
	{
		// Determine Compliance
		powerQualitySummary.determineComplianceStatus(['#V1HarmN1OverN', '#V2HarmN1OverN', '#V3HarmN1OverN', 
																									'#poV1HarmN1OverN', '#poV2HarmN1OverN', '#poV3HarmN1OverN'],
																									EN50160Evaluation.Harm1);
		powerQualitySummary.determineComplianceStatus(['#V1HarmN2OverN', '#V2HarmN2OverN', '#V3HarmN2OverN', 
																									'#poV1HarmN2OverN', '#poV2HarmN2OverN', '#poV3HarmN2OverN'],
																									EN50160Evaluation.Harm2);
	},

	// Determine and display the Supply Voltage Flicker compliance indicators
	supplyVoltageFlickerComplianceStatus: function()
	{
		// Determine Compliance
		powerQualitySummary.determineComplianceStatus(['#V1FlickerN1OverN', '#V2FlickerN1OverN', '#V3FlickerN1OverN', 
																									'#poV1FlickerN1OverN', '#poV2FlickerN1OverN', '#poV3FlickerN1OverN'],
																									EN50160Evaluation.Flicker);
	},	
	
	// Determine and display the Mains Signaling Voltages compliance indicators
	mainsSignalingVoltagesComplianceStatus : function()
	{
		// Determine Compliance
		powerQualitySummary.determineComplianceStatus(['#V1MainsN1OverN', '#V2MainsN1OverN', '#V3MainsN1OverN', 
																									'#poV1MainsN1OverN', '#poV2MainsN1OverN', '#poV3MainsN1OverN'],
																									EN50160Evaluation.Mains1);
	},

	/**
	 * Determine the Status of the Compliance Standard using provided parameters
	 *  and display appropriate status for the specified item and threshold
	 *
	 * @param cellID String - the ID of the register to update the status of.
	 * @param thresholdEval String - string to indicate how threshold is evaludated against the value
	 */
	determineComplianceStatus: function(cellIdArray, thresholdEval)
	{
		if (cellIdArray == undefined) return;
		
		for(var i=0; i<cellIdArray.length; i++)
		{		
			var cellElement = jQuery(cellIdArray[i]);
			var cellValue = cellElement.text().replace('%','');
			
			// assume compliance fails and set pass otherwise
			cellElement.addClass('failText');						
			var evaluation = parseFloat(cellValue) + thresholdEval; 
			var passed = eval(evaluation);
			
			if(passed)
			{
				// Pass: add appropriate Pass style
				cellElement.removeClass('failText');
				cellElement.addClass('pass');						
			}
		}
	},
	
	
	/**
	 * Determine the Status of the Compliance Standard for the Summary Report
	 *  and display appropriate status for the specified item and threshold
	 *
	 * @param summaryComplianceArray Array - an array of values to determine compliance
	 *   The summaryComplianceArray array contains:
	 * 		@param ['summeryComplianceCellId'] String - the ID of the summary compliance element
	 * 		@param ['complianceCellIdArray'] Array[strings] - the ID of compliance elements that make up the summary compliance
	 */
	determineSummaryComplianceStatus: function(summeryComplianceCellId, complianceCellIdArray)
	{
		if (complianceCellIdArray == undefined) return;
		
		var passed = true;
		jQuery(summeryComplianceCellId).removeClass('pass');
		jQuery(summeryComplianceCellId).removeClass('fail');

		for(var i=0; i<complianceCellIdArray.length; i++)
		{
			passed = passed && jQuery(complianceCellIdArray[i]).hasClass('pass');
		}
		if (passed)
		{
			jQuery(summeryComplianceCellId).addClass('pass');
			jQuery(summeryComplianceCellId).html("&#x2713;");			
		}
		else
		{
			jQuery(summeryComplianceCellId).addClass('fail');
			jQuery(summeryComplianceCellId).html("");			
		}
	},
	
   initHstc: function ()
   {
      var reqRegisterObject = ({
         type: 'POST',
         url: '/api/registerValues/getRegisterValues',
         requestArrayName: 'names',
         registerArray: getRegisterArrayFromPage('#hstc'),
         returnType: 'json',
         successCallback: powerQualitySummary.getHstcRegisterSuccess,
         failCallback: powerQualitySummary.getHstcRegisterFail
      });

      
      modulesStateCheck.modulesCheck("HSTC");
      pmAjax.sendPostWithArray(reqRegisterObject);
      
   },
   
   getHstcRegisterSuccess: function (data, reqObj)
   {
      // populate register data and form fields on page with returned data
      populateRegisterValuesOnPage(data, reqObj.registerArray, 'hstc');
      pmAjax.schedulePostRequest(reqObj);
   },
   
   
   getHstcRegisterFail: function (textStatus, errorThrown)
   {
      // Handle Error
      errorMessage.displayHTMLErrorMessage(errorThrown, '#hstc');
   }, 
}

var iticSemi = {

	// object-level global for ITIC vs SEMI standard (default SEMI)
	graphStandard: "ITIC",

	// object-level global for Nominal Voltage value (default 230 volts)
	nominalVoltage: 230,

	// object-level global for Nominal Frequency value (default 50 Hz)
	// - currently not used but may in future
	nominalFrequency: 50,
	
	// ITIC curve values by milliseconds
	iticGuideline1: [
			{"voltage": 500, "duration": .1666}, // .1666... ms (aka .01 cycles) @ 500%
			{"voltage": 200, "duration": 1}, // 1ms @ 200%
			{"voltage": 140, "duration": 3},
			{"voltage": 120, "duration": 3},
			{"voltage": 120, "duration": 20},
			{"voltage": 120, "duration": 500},
			{"voltage": 110, "duration": 500}, // 0.5s @ 110%
			{"voltage": 110, "duration": 10000}, // 10s @ 110%
			{"voltage": 110, "duration": 11000} 
		],
	iticGuideline2: [
			{"voltage": 0, "duration": 20}, // 20ms @ 0%
			{"voltage": 40, "duration": 20}, 
			{"voltage": 70, "duration": 20}, 
			{"voltage": 70, "duration": 500}, // 0.5s @ 70%
			{"voltage": 80, "duration": 500},
			{"voltage": 80, "duration": 10000}, // 10s @ 80%
			{"voltage": 90, "duration": 10000},
			{"voltage": 90, "duration": 11000}
		],

	// SEMI curve values by milliseconds
	semiGuideline: [
			//{"voltage": 50, "duration": 0}, 
			{"voltage": 50, "duration": 50}, //0.05 s (ie: 50 ms) @ 50%
			{"voltage": 50, "duration": 200}, 
			{"voltage": 70, "duration": 200}, 
			{"voltage": 70, "duration": 500}, 
			{"voltage": 80, "duration": 500},
			{"voltage": 80, "duration": 1000},
			{"voltage": 80, "duration": 11000}
		],


	// x-axis tick points (ms)
	durationTicks: [0.001, 1, 3, 20, 500, 10000],


	/**
	 * ITIC/SEMI report data retrieval.
	 *
	 * Call API method voltageDisturbances/summary and populate graph.
	 *
	 * @parm [optional] standard - ITIC vs SEMI standard for graph guidelines. Defaults to ITIC.
	 * 
	 */
	getReadings: function (standard)
	{

		// set object values for re-use later in code (if set)
		if (standard != undefined) iticSemi.graphStandard = standard;

		// Compose Request Object
		var reqObject = ({
			type: 'GET',
			url: '/api/pq/voltageDisturbances/summary',
			returnType: 'json',
			successCallback: iticSemi.successResponse,
			failCallback: iticSemi.failResponse,
			elementID: 'iticSemiTableResults'
		});
	
		// call getRegisterValues API method
		pmAjax.sendGet(reqObject);
	},


	/**
	 * Successful ITIC-SEMI response populates the ITIC-SEMI data table and builds the graph.
	 *
	 * @parm array data - The JSON object sent back from device by API call, listing voltage disturbance metrics.
	 * @parm array strRegisterNames - empty and not needed, but is passed anyway by pmAjax.
	 * @parm string objID - defines ID for the selected Object's ID to be populated.
	 */
	successResponse: function (data, strRegisterNames)
	{
		// set Nominal Voltage display value
		jQuery('.voltage').val(iticSemi.nominalVoltage);
		jQuery('.dispVoltage').text("(" + iticSemi.nominalVoltage + ")");
		
		// check for error message
		if (data.errorCode)
		{
			// print error message on page instead of graph
			jQuery('#chart-itic-semi-errmsg').html("<br />" + data.errorMessage);

			// leave, do not continue processing data
			return;
		}
		else
		{
			// if no error found, clear the error message in case it was populated previously
			jQuery('#chart-itic-semi-errmsg').text('');
		}

		// simplify subsequent code
		data = data.voltageDisturbances;
	
		// Clear any existing Table Rows
		jQuery('#'+strRegisterNames.elementID).empty();
	
		// Set empty tableData variable to concatenate Table Data
		var tableData = '';
		
		// Iterate each item to compose each Table Row
		jQuery(data).each(function (i, item)
		{
			tableData += '<tr class="minor">';
		
			// timestamp
			tableData += '<td>' + localTimestamp.localizeTimestamp(item.timestamp.seconds, item.timestamp.uSeconds, clockTime.regional) + '</td>';

			// duration
			tableData += '<td>' + item.duration.toFixed(3) + ' ' + tranSeconds + '</td>';

			// percentage of nominal
			tableData += '<td>' + (item.worstValue / iticSemi.nominalVoltage * 100).toFixed(0) + '%</td>';
		
			tableData += '</tr>';	
		});
	
		// Populate Table with Table Data
		jQuery('#'+strRegisterNames.elementID).html(tableData);
		var maxXValue = 11000; //milliseconds
		// parse data into graph-friendly array, then build graph
		var graphData = iticSemi.parseData(data, iticSemi.nominalVoltage, maxXValue);

		// set maximum value for Y axis - 500% for ITIC graph, 100% for SEMI graph
		var maxYValue = 500;
		if (iticSemi.graphStandard == "SEMI") maxYValue = 100;

		iticSemi.buildGraph("#chart-itic-semi", graphData, maxYValue, maxXValue);
	},

	failResponse: function (textStatus, errorThrown)
	{
		// Handle Error
		errorMessage.displayHTMLErrorMessage(errorThrown, '#iticSemiTableResults');
	},

	parseData:function(d,nominalVoltage,maximumDuration) {
	
		var voltages = [];
		var duration = [];
		var timestamps = [];

		for(var i=0;i<d.length;i++) {
			var durationMs = d[i].duration * 1000;
			
			if (durationMs <= maximumDuration)
			{
				// push voltage onto "voltage" array - this is as percentage of nominal voltage
				voltages.push((d[i].worstValue / nominalVoltage * 100).toFixed(0));

				// push duration values onto "duration" array, converted from seconds to milliseconds
				duration.push(durationMs);

				// push timestamp values onto "timestamps" array
				timestamps.push(localTimestamp.localizeTimestamp(d[i].timestamp.seconds, d[i].timestamp.uSeconds, clockTime.regional));
			}
		}

		return {"voltages":voltages,"duration":duration, "timestamps": timestamps};
	},

	/**
	 * Build ITIC/SEMI graph.
	 *
	 * @parm array graphData - The JSON object sent back from device by API call, listing voltage disturbance metrics.
	 */
	buildGraph: function(chartID,cdata,yScale,xScale) 
	{
		// clear existing graph
		jQuery(chartID).html('');

		var height=400,
			width=708, // width=790,
			xmargin=80,
			ymargin=80;
		
		// create tooltip container 
		$(chartID).append($("<div id='tooltip'></div")
			.attr("class","tooltip")
			.css("opacity",0)
			.css("background-color","white")
			.css("border","solid 1px black")
			.css("z-index","99")
			.css("position","absolute")
			.css("padding","10px")
		);
		
		// create y function, used to plot points on y axis
		var y=d3.scale.linear().domain([0,yScale]).range([height - ymargin,0 + ymargin]);

		// create x function, used to plot points on x axis - log scale for ITIC graph,
		//	linear scale for SEMI graph
		if (iticSemi.graphStandard == "SEMI")
		{
			var x=d3.scale.linear().domain([0, xScale]).range([0 + xmargin, width-xmargin]);
		}
		else
		{
			var x=d3.scale.log().domain([.001, xScale]).range([0 + xmargin, width-xmargin]);
		}
		
		// create chart object 
		var chartObj = d3.select(chartID)
			.append("svg:svg")
			.attr("class","linearline")
			.attr("width", width)
			.attr("height", height)
		;
		var g = chartObj.append("svg:g")
		
		
	// Tooltip
		var tooltip = d3.select(".tooltip");
	
	// Draw Function
		var line = d3.svg.line()
			.x(function(d,i) { return x(d.duration); })
			.y(function(d) { return y(d.voltage); })
		;
	// Data Lines
	
		// draw guidelines for ITIC standard
		if (iticSemi.graphStandard == "ITIC")
		{
			g.append("svg:path")
				.attr("d", line(iticSemi.iticGuideline1))
				.attr("class","dataLine")
				.attr("fill","none")
				.attr("stroke-width",2)
				.attr("stroke","red")
			;
			g.append("svg:path")
				.attr("d", line(iticSemi.iticGuideline2))
				.attr("class","dataLine")
				.attr("fill","none")
				.attr("stroke-width",2)
				.attr("stroke","green")
			;
		}
		// draw guidelines for SEMI standard
		else
		{
			g.append("svg:path")
				.attr("d", line(iticSemi.semiGuideline))
				.attr("class","dataLine")
				.attr("fill","none")
				.attr("stroke-width",2)
				.attr("stroke","green")
			;
		}

	// Data Points
		g.selectAll("dataPoint")
			.data(cdata["voltages"])
			.enter().append("svg:circle")
				.attr("class","dataPoint")
				.attr("r", 4)
				.attr("cx", function(d,i) { return x(cdata["duration"][i]); })
				.attr("cy", function(d,i) 
				{
					// cap the Y value at the highest value for the graph
					return y(Math.min(d, yScale)); 
				})
				.attr("stroke-width",1)
				.attr("stroke", "red")
				.attr("fill-opacity","0.1")
				.on("mouseover", function(d, i) {
					tooltip.transition()
						.duration(200)
						.style("opacity", 1)
						.style("border","1px solid green")
						.transition()
						.style("display", "block")
					;
					tooltip.html(function(data) 
						{ 
							tooltipText = "<div class='tooltiptitle'>" + cdata["timestamps"][i] + "</div>" + tranVoltage + ": " + d + "%<br />" + tranDuration + ": ";
							
							// if duration value is below 1 ms, show as microseconds
							if (cdata["duration"][i] < 1)
							{
								duration = cdata["duration"][i]*1000;
								tooltipText += duration.toFixed(3) + ' ' + tranMicroseconds;
							}
							// if duration value is above 99, show as seconds
							else if (cdata["duration"][i] > 99)
							{	
								duration = cdata["duration"][i]/1000;
								tooltipText += duration.toFixed(3) + ' ' + tranSeconds;
							}
							// otherwise, show as milliseconds
							else
							{
								duration = cdata["duration"][i];
								tooltipText += duration.toFixed(3) + ' ' + tranMilliseconds;
							}

							return tooltipText;
						})
						.style("left",(d3.event.pageX + 10) + "px")
						.style("top", (d3.event.pageY - 28) + "px")
					;
					})                  
				.on("mouseout", function(d) {
					tooltip.transition()
						.duration(500)
						.style("opacity", 0)
						.transition()
						.style("display", "none")
					;
				})
		;
	// yAxis
		var yAxis = d3.svg.axis()
			.scale(y)
			.orient("left")
			.ticks(5);
		g.append("g")
			.attr("class", "axis")
			.attr("transform", "translate("+ymargin+",0)")
			.call(yAxis);
		
		// y axis label
		g.append("text")
			.attr("class", "y label")
			.attr("text-anchor", "end")
			.attr("y", 20)
			.attr("x", -140)
			.attr("transform", "rotate(-90)")
			.text(jQuery('#yAxisLabel').text());	
	
	
	// xAxis
		var xAxis = d3.svg.axis()
			.scale(x)
			.orient("bottom");

		// set ticks for SEMI graph as simple ticks
		if (iticSemi.graphStandard == "SEMI")
		{
			xAxis
				.ticks(5)
				.tickFormat(function (d)
				{
					// show ticks as seconds
					return d/1000 + ' ' + tranSeconds;
				});
			;
		}
		// set ticks for ITIC graph from microseconds to seconds, adjusting units
		else
		{
			
			xAxis
				.tickValues(iticSemi.durationTicks)
				.tickFormat(function (d)
				{
					// if value is below 1 ms, show as microseconds
					if (d < 1)
					{
						return d*1000 + ' ' + tranMicroseconds;
					}
					// if value is above 99, show as seconds
					else if (d > 99)
					{
						return d/1000 + ' ' + tranSeconds;
					}
					// otherwise, show as milliseconds
					else
					{
						return d + ' ' + tranMilliseconds;
					}
				})
			;

		}

		g.append("g")
			.attr("class", "axis")
			.attr("transform", "translate(0,"+(height-xmargin)+")")
			.call(xAxis)
			.selectAll("text")  
				.style("text-anchor", "end")
				.attr("transform", function(d,i) {
					return "rotate(-65 -4,12)" 
				})
		;

		// x axis label
		g.append("text")
			.attr("class", "x label")
			.attr("text-anchor", "end")
			.attr("y", height - 30)
			.attr("x", width/2)
			.text(jQuery('#xAxisLabel').text());	
	}
}

/* HARMONICS CHART */
var pqHarmonicsChart = {
	colorList:["#2fb4e9","#f4a100","#1a79a9"],
	height:400,
	width:748,
	xmargin:60,
	ymargin:60,
	barPadding:1,
	
	currentMaxYRange:0,
	init:function() {
		pqHarmonicsChart.createChart("#harmonicsChart");
		pqHarmonicsChart.getData($("#harmonicsTarget").val());
		$("#harmonicsTarget").change(function() {
			$("#harmonicsChart").empty();
			pqHarmonicsChart.createChart("#harmonicsChart");
			pqHarmonicsChart.getData($("#harmonicsTarget").val());
		});
	},
	getData:function(target) {
		var reqObject = {
			type: 'GET',
			url: '/api/pq/harmonics/summary/'+target,
			returnType: '',
			successCallback: function(d, reqObj) {
				var data = pqHarmonicsChart.parseData(d);
				if(typeof data === 'undefined')
				{
					// console.log('No data:' + data);
				}
				else
				{
					pqHarmonicsChart.redrawChart("#harmonicsChart",data,0,data["currentValues"].length-1,target);
					
				}
				var isSelected = jQuery('[href="harmonicsChart.html"]').parent().hasClass('active')
				if (isSelected) {
					pmAjax.scheduleGetRequest(reqObj);
				};
			},
			failCallback: function(status,error) {
				// Display error message
				errorMessage.displayHTMLErrorMessage('Meter Data Error', '#harmonicsControls');
			}
		};
		pmAjax.sendGet(reqObject);
	},
	parseData:function(d) {
		var newJSON = d; 
		return newJSON["result"];
	},
		createChart:function(chartID) {
		$(chartID).empty();

		$(chartID).append($("<div id='tooltip'></div>")
			.attr("class","tooltip")
			.css("opacity",0)
			.css("background-color", "#ececec")
			.css("border", function (d,i)
			{
				
				if(i%2==0)
				{
					return "solid 1px "+pqHarmonicsChart.colorList[0];
				} else {
					return "solid 1px "+pqHarmonicsChart.colorList[1];
				}
			})
			.css("z-index","99")
			.css("position","absolute")
			.css("padding","10px")
		);
		var chartObj = d3.select(chartID)
			.append("svg:svg")
			.attr("class","linearBar")
			.attr("width", pqHarmonicsChart.width)
			.attr("height", pqHarmonicsChart.height)
		;
		chartObj.append("svg:g")
			.attr("class", "yAxis axis")
		;
		chartObj.append("svg:g")
			.attr("class", "xAxis axis")
		;
	},

	log10:function (val) {return Math.log(val) / Math.LN10;},
	redrawChart:function(chartID,cdata,yScale,xScale,target) {

		var maxYValue = Math.max.apply(null, cdata["currentValues"]);
		
		var currentMaxYRange = pqHarmonicsChart.currentMaxYRange;
		if (maxYValue == 0)
		{
			if (currentMaxYRange == 0)	currentMaxYRange = 1;
		}
		else
		{
			if ( (currentMaxYRange == 0) || (maxYValue > currentMaxYRange) || (maxYValue / currentMaxYRange < 0.5) )
			{ // calc new maximum range because new max is bigger than current or less than 50% of current
				// scale current max up by 5% so that next call does not trigger recalc of range (assumes
				// maximum variation is less than 5%)
				var scaledMaxYValue = maxYValue * 1.05;
				var smallestPowerOfTen = Math.pow(10, Math.floor(pqHarmonicsChart.log10(scaledMaxYValue)));
				currentMaxYRange = Math.ceil(scaledMaxYValue / smallestPowerOfTen) * smallestPowerOfTen;
			}
		}
		pqHarmonicsChart.currentMaxYRange = currentMaxYRange;

		var yScaleDomain = [0,currentMaxYRange];
	// Tooltip
		var tooltip = d3.select(".tooltip");
		var y=d3.scale.linear().domain(yScaleDomain).range([pqHarmonicsChart.height - pqHarmonicsChart.ymargin,0 + pqHarmonicsChart.ymargin]);
		var x=d3.scale.linear().domain([0, xScale]).range([0 + pqHarmonicsChart.xmargin, pqHarmonicsChart.width-pqHarmonicsChart.xmargin]);

	// THD Data 
		$("#harmonicsLabels").empty();
		$("#harmonicsLabels").append($("<label for='"+ cdata["totalLabel"] +"'>"+ cdata["totalLabel"] +"</label><input type='text' id='"+ cdata["totalLabel"] +"' readonly='readonly' value='"+ cdata["total"] +"' class='harmonic' />"));
		$("#harmonicsLabels").append($("<label for='"+ cdata["totalEvenLabel"] +"'>"+ cdata["totalEvenLabel"] +"</label><input type='text' id='"+ cdata["totalEvenLabel"] +"' readonly='readonly' value='"+ cdata["totalEven"] +"' class='harmonic' />"));
		$("#harmonicsLabels").append($("<label for='"+ cdata["totalOddLabel"] +"'>"+ cdata["totalOddLabel"] +"</label><input type='text' id='"+ cdata["totalOddLabel"] +"' readonly='readonly' value='"+ cdata["totalOdd"] +"' class='harmonic' />"));
		var chartObj = d3.select(".linearBar");

		// Data bars
		if($(".dataBar").length<=0) {
			chartObj.selectAll(".dataBar")
				.data(cdata["currentValues"])
				.enter()
				.append("svg:rect")
					.attr("class","dataBar")
		}
		chartObj.selectAll(".dataBar")
			.data(cdata["currentValues"])
				.attr("class","dataBar")
				.attr("fill",function (d,i) {  
					if(i%2==0) {
						return pqHarmonicsChart.colorList[0];
					} else {
						return pqHarmonicsChart.colorList[1];
					}
				})
				.attr("x", function(d,i) { return x(i) } )
				.attr("y", function (d) { return y(d); })
				.attr("rx","2")
				.attr("ry","2")
				.attr("width", ((pqHarmonicsChart.width-(pqHarmonicsChart.xmargin*2))/cdata["currentValues"].length-pqHarmonicsChart.barPadding))
				.attr("height", function(d) { return y(0)-y(d); })
				.on("mouseover", function(d,i) {
					var c = parseInt(i) + 1;
					tooltip.transition()
						.duration(200)
						.style("opacity", 1)
						.style("border", function(d,i) {
							if(c%2==0) {
								return "1px solid "+pqHarmonicsChart.colorList[1];
							} else {
								return "1px solid "+pqHarmonicsChart.colorList[0];
							}
						})
						.transition()
						.style("display", "block")
					;
					tooltip.html(function() {
						var label = jQuery('#monitoringLabels > label#label_value').text();
						return "<div class='tooltiptitle'>"+label+":"+(i+1)+"</div><br />"+d; 
					})
						.style("top", (d3.event.pageY - 68) + "px")
						.style("left", (d3.event.pageX + 10) + "px")
						.style("border", function(d,i)
						{
							if(c%2==0) {
								return "1px solid "+ pqHarmonicsChart.colorList[1];
							} else {
								return "1px solid "+ pqHarmonicsChart.colorList[0];
							}
						})
					;
					
					})                  
				.on("mouseout", function(d) {
					tooltip.transition()
						.duration(500)
						.style("opacity", 0)
						.transition()
						.style("display", "none")
					;
				})
		;
		
	// yAxis
		var yAxis = d3.svg.axis()
			.scale(y)
			.orient("left")
			.ticks(5);
		chartObj.select(".yAxis")
			.attr("transform", "translate("+pqHarmonicsChart.xmargin+",0)")
			.call(yAxis);
			
	// xAxis
		var xAxis = d3.svg.axis()
			.scale(x)
			.orient("bottom")
			.ticks((cdata["currentValues"].length/2))
			.tickFormat(function(d,i) { return (i*2)+1; })
		;
		chartObj.select(".xAxis")
			.attr("transform", "translate(0,"+(pqHarmonicsChart.height-pqHarmonicsChart.ymargin)+")")
			.call(xAxis)
		;
		var barCenter = ((pqHarmonicsChart.width-(pqHarmonicsChart.xmargin*2))/cdata["currentValues"].length)/2;
		chartObj.selectAll(".xAxis .major line")
			.attr("x2",barCenter)
			.attr("x1",barCenter)
		;
		chartObj.selectAll(".xAxis .major text")
			.attr("x",barCenter)
		;
	}	
}
var deratingChart = {
	colorList:["#2fb4e9","#f4a100","#1a79a9"],
	init:function() {
		deratingChart.updateChart();
	},
	updateChart:function() {
		var reqObject = {
			type: 'POST',
			url: '/api/registerValues/getRegisterValues',
			requestArrayName: 'names',
			registerArray: ["V unbal"],
			returnType: '',
			failCallback: function(status,error) {
				// Display error message
				errorMessage.displayHTMLErrorMessage('Meter Data Error', '#deratingChart');
			},
			successCallback: function(d,reqObj) {
				var data = deratingChart.parseData(d);
				deratingChart.createChart("#deratingChart",data);
			}
		};
		pmAjax.sendPostWithArray(reqObject);
	},
	parseData:function(d) {
		var arr = [];
		arr.push(d["result"][0]["value"]);
		return arr;
	},
	createChart:function(chartID,cdata) {
		var height=400,
			width=748,
			xmargin=80,
			ymargin=80;
		var deratingCurve = [1,1,1,.97,.95,.93,.89,.85,.82,.78,.76];
		var xTickCnt = deratingCurve.length-1;
		var yTickCnt = 5;
				
		$("#deratingChart").append($("<div id='tooltip'></div>")
			.attr("class","tooltip")
			.css("opacity",0)
			.css("background-color","white")
			.css("border","solid 1px #f4a100")
			.css("z-index","99")
			.css("position","absolute")
			.css("padding","10px")
		);
		var y=d3.scale.linear().domain([0.7,1.0]).range([height - ymargin,0 + ymargin]);
		var x=d3.scale.linear().domain([0, xTickCnt]).range([0 + xmargin, width-xmargin]);
		var xaxis=d3.scale.linear().domain([0, xTickCnt/2]).range([0 + xmargin, width-xmargin]);
		var chartObj = d3.select(chartID)
			.append("svg:svg")
			.attr("class","linearline")
			.attr("width", width)
			.attr("height", height)
		;
			
		var g = chartObj.append("svg:g")
		
	// Gradient Background
		var gradient = chartObj.append("svg:defs")
		  .append("svg:linearGradient")
			.attr("id", "gradient")
			.attr("x1", xmargin)
			.attr("y1", ymargin)
			.attr("x2", xmargin)
			.attr("y2", height-ymargin)
			.attr("spreadMethod", "pad");
		
		gradient.append("svg:stop")
			.attr("offset", "0%")
			.attr("stop-color", "#ececec")
			.attr("stop-opacity", 1);
		
		gradient.append("svg:stop")
			.attr("offset", "100%")
			.attr("stop-color", "#ececec")
			.attr("stop-opacity", 1);
		
		g.append("svg:rect")
			.attr("width", width-(xmargin*2))
			.attr("height", height-(ymargin*2))
			.attr("x",xmargin)
			.attr("y",ymargin)
			.style("fill", "#ececec");
		
	// Tooltip
		var tooltip = d3.select(".tooltip");
		
	// Draw Function
		var line = d3.svg.line()
			.x(function(d,i) { return x(i); })
			.y(function(d) { return y(d); })
		;
	// Data Lines
		g.append("svg:path")
			.attr("d", line(deratingCurve))
			.attr("class","dataLine")
			.attr("fill","none")
			.attr("stroke-width",2)
			.attr("stroke",deratingChart.colorList[0])
		;
		function getY(d) {
			d=parseFloat(d);
			if(d<1) { return deratingCurve[1] }
			if(d>5) { return deratingCurve[deratingCurve.length-1]; }
			var leftYValue = 0;
			var rightYValue = 0;
			var leftXValue = 0;
			var rightXValue = 0;
			var xval=0;
			var i=0;
			while(xval+.5<=d) {
				var xval = i/2;
				var x2val = (i+1)/2;
				leftYValue = deratingCurve[i];
				if(deratingCurve.length>i+1) {
					rightYValue = deratingCurve[i+1];
				} else {
					rightYValue = deratingCurve[i];	
				}
				leftXValue = xval;
				rightXValue =x2val;
				i++;
			}
			var yVal = Math.round((leftYValue-((((leftYValue*1000)-(rightYValue*1000))/1000))*((d-leftXValue)/(rightXValue-leftXValue)))*1000)/1000;
			return yVal;
		}
	// Data Points
		g.selectAll("dataPoint")
			.data(cdata)
			.enter().append("svg:circle")
				.attr("class","dataPoint")
				.attr("r", 8)
				.attr("cx", function(d) { return x((d*2)); })
				.attr("cy", function(d) { return y(getY(d)); })
				.attr("stroke-width",1)
				.attr("stroke",deratingChart.colorList[1])
				.attr("fill-opacity","0.1")
				.attr("fill",deratingChart.colorList[1])
				.on("mouseover", function(d) {
					tooltip.transition()
						.duration(200)
						.style("opacity", 1)
						.style("border","1px solid "+deratingChart.colorList[1])
						.transition()
						.style("display", "block")
					;
				var unbalanceLabel = jQuery('#monitoringLabels > label#label_unbalance').text();
				var deratingLabel = jQuery('#monitoringLabels > label#label_derating').text();
				tooltip.html(function() { return "<div class='tooltiptitle'>"+unbalanceLabel+": "+d+"%"+"<br />"+deratingLabel+": "+getY(d)+"</div>"; })
						.style("top", (d3.event.pageY - 28) + "px")
						.style("left", (d3.event.pageX + 10) + "px")
					;
					
					})                  
				.on("mouseout", function(d) {
					tooltip.transition()
						.duration(500)
						.style("opacity", 0)
						.transition()
						.style("display", "none")
					;
				})
		;
	// axis Labels
		g.append("svg:text")
			.attr("class","axisLabel axisYLabel")
			.text(jQuery('#monitoringLabels > label#label_derating_factor').text())
			.attr("text-anchor","middle")
			.attr("transform","translate(40,"+(height/2)+") rotate(-90)")
		;
		g.append("svg:text")
			.attr("class","axisLabel axisXLabel")
			.attr("text-anchor","middle")
			.attr("x",(width/2))
			.attr("y",(height-xmargin)+40)
			.text(jQuery('#monitoringLabels > label#label_voltage_unbalance').text())
		;
		
	// legend
		var label = jQuery('#monitoringLabels > label#label_value').text();
		g.append("svg:text")
			.attr("class","legendLabel")
			.attr("x",(width/2))
			.attr("y",50)
			.text(jQuery('#monitoringLabels > label#label_unbalance').text()+": "+cdata[0]+"%")
		;
		g.append("svg:text")
			.attr("class","legendLabel")
			.attr("x",(width/2))
			.attr("y",70)
			.text(jQuery('#monitoringLabels > label#label_derating').text()+": "+getY(cdata[0]))
		;
	// yAxis
		var yAxis = d3.svg.axis()
			.scale(y)
			.orient("left")
			.ticks(yTickCnt)
		;
			
		g.append("g")
			.attr("class", "axis")
			.attr("transform", "translate("+ymargin+",0)")
			.call(yAxis);
	// xAxis
		var xAxis = d3.svg.axis()
			.scale(xaxis)
			.orient("bottom")
			.ticks(xTickCnt)
			.tickFormat(function(d,i) { return i/2; })
		;
		g.append("g")
			.attr("class", "axis")
			.attr("transform", "translate(0,"+(height-xmargin)+")")
			.call(xAxis)
			.selectAll("text")  
				.style("text-anchor", "middle")
		;
	}
};
