/**
 * Phasor Diagrams setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */

// Set Starting points for Phasor Chart

var phasorChart = {
	height:500,
	width:620,
	gaugeRadius:420,
	offsetX:0,
	offsetY:0,
	chartThreshold:{},
	chartScale: d3.scale.linear().domain([0,360]).range([0,2*Math.PI]),
// INIT Function
	init:function() {
		phasorChart.offsetX=(phasorChart.width/2);
		phasorChart.offsetY=(phasorChart.height/2);
		
		var newChart = phasorChart.createChart();
		
		// Compose Request Object
		var reqObject = {
			type: 'GET',
			url: '/api/diagnostics/phasorData',
			returnType: '',
			successCallback: function(d, reqObj) {
			    if(d.result != undefined)
				{
					var data = phasorChart.parseData(d.result);
					if(data) {
						phasorChart.redraw(newChart,data);

						// update tabular data
						phasorChart.updateTable(d.result);
					}
				}
				var isSelected = jQuery('[href="phasorDiagrams.html"]').parent().hasClass('ui-state-active')
				if (isSelected) {
					pmAjax.scheduleGetRequest(reqObj);
				};
			},
			failCallback: function(status,error) {
				// TODO: handle error
				console.log('Failed fetch');
			}
		};

		// send API request
		pmAjax.sendGet(reqObject);
	},
	parseData:function(d) {
		var typeList = ["v1","v2","v3","i1","i2","i3"];
		var data = [];
		for(var i=0;i<typeList.length;i++) {			var type = typeList[i];			var amplitudeKey = type + "Amplitude";			var obj = {label: "", angle:0, amplitude:0, lineColor:0, current:false};			if ( amplitudeKey in d )			{				obj.label = d[type + "Label"];;
				obj.angle = 360 - d[type + "Angle"];
				obj.amplitude = d[amplitudeKey];								obj.current = type.substring(0,1) == "i";//				if ( obj.amplitude == 0 ) continue;
				switch(type.substring(1,2)) {
					case "1":
						obj.lineColor = "#2fb4e9";
						break;
					case "2":
						obj.lineColor = "#f4a100";
						break;
					case "3":
						obj.lineColor = "#c4014b";
						break;
				}
			}			data.push(obj);		}
		return data;
	},
// CREATE CHART Function
	createChart:function() {
		var chartObj = d3.selectAll(".phasorChart")
			.append("svg:svg")
			.attr("width",phasorChart.width)
			.attr("height",phasorChart.height)
		;
		// Set SVG group and offset to center
		var chartGroup = chartObj.append("svg:g")
			.attr("class","gaugeChart")
			.attr("transform","translate("+phasorChart.offsetX+","+phasorChart.offsetY+")");
		// Draw chart
		chartGroup.append("svg:circle")
			.attr("r",(phasorChart.gaugeRadius/2)-5)
			.attr("class","phasor outercircle")
		;
		chartGroup.append("svg:circle")
			.attr("r",2)
			.attr("class","phasor innercircle")
		;
		// Grid Lines
		chartGroup.append("svg:path")
			.attr("d","M "+(0-phasorChart.gaugeRadius/2)+" 0 L "+(phasorChart.gaugeRadius/2)+" 0")
			.attr("class","gridline")
		;
		chartGroup.append("svg:path")
			.attr("transform", "rotate(90)")
			.attr("d","M "+(0-phasorChart.gaugeRadius/2)+" 0 L "+(phasorChart.gaugeRadius/2)+" 0")
			.attr("class","gridline")
		;
		// Grid Arrows
		chartGroup.append("svg:g")
			.attr("transform", "translate(0,"+(0-(phasorChart.gaugeRadius/2)+5)+") rotate(270)")
			.attr("class","gridArrowGroup")
			.append("svg:path")
				.attr("d","M -8 -4 L0 0 L-8 4 Z")
				.attr("class","gridArrow")
		;
		chartGroup.append("svg:g")
			.attr("transform", "translate("+((phasorChart.gaugeRadius/2)-5)+",0) rotate(0)")
			.attr("class","gridArrowGroup")
			.append("svg:path")
				.attr("d","M -8 -4 L0 0 L-8 4 Z")
				.attr("class","gridArrow")
		;
		
		// Chart Labels
		chartGroup.append("svg:text")
			.attr("x",((phasorChart.gaugeRadius/2)+15))
			.attr("y",5)
			.text("0")
		;
		chartGroup.append("svg:text")
			.attr("x",-7)
			.attr("y",-((phasorChart.gaugeRadius/2)+15))
			.text("90")
		;
		return chartObj;
	},
// REDRAW Function
	redraw:function(chartObj,data) {
		var maxV = 0;		var maxI = 0;		for(var i=0;i<data.length;i++) {			var sample = data[i]["amplitude"];
			if(data[i].current) {				if ( sample > maxI ) maxI = sample;
			} else {				if ( sample > maxV ) maxV = sample;			}		}		maxV = Math.ceil(maxV);		maxI = Math.ceil(maxI);		var rV=d3.scale.linear().domain([0, maxV]).range([0, (phasorChart.gaugeRadius/2)-5]);		var rI=d3.scale.linear().domain([0, maxI]).range([0, (phasorChart.gaugeRadius/2)-5]);		var segGroup = chartObj.selectAll(".segmentGroup");		segGroup.data(data)			.enter().append("svg:g")					.attr("class","segmentGroup");
	// If group exists, modify objects, else create new objects
		if(segGroup.select(".segment").node()) {
			segGroup.select(".segment")
					.transition()
					.attr("transform",function(d) {
						return "translate("+(phasorChart.offsetX)+","+(phasorChart.offsetY)+") rotate("+d.angle+")";
					})
					.attr("d", function(d) { if(d.current) {
												return "M 2 0 L"+(rI(d.amplitude)-4)+" 0";
											} else {
												return "M 2 0 L"+(rV(d.amplitude)-4)+" 0";
											}
					})
					.attr("class", function(d) {
						var addDashedStroke="";
						if(d.current) { addDashedStroke = " dashedStroke"; }
						return "segment"+addDashedStroke;
					})
					.attr("stroke",function(d) { return d.lineColor; })
			;
			segGroup.select(".segmentArrow")
					.transition()
					.attr("transform", function(d) {
						return "translate("+(phasorChart.offsetX)+","+phasorChart.offsetY+") rotate("+(d.angle)+")";
					})
					.select(".arrowPath")
						.attr("d",function(d) { 
										   if(d.current) { 
												return "M "+(rI(d.amplitude)-8)+" -4 L"+rI(d.amplitude)+" 0 L"+(rI(d.amplitude)-8)+" 4 Z";
											} else {
												return "M "+(rV(d.amplitude)-8)+" -4 L"+rV(d.amplitude)+" 0 L"+(rV(d.amplitude)-8)+" 4 Z";
											}
					})
						.attr("stroke",function(d) { return d.lineColor; })
						.attr("fill",function(d) { return d.lineColor; })
			;
			segGroup.select(".segmentLabelContainer")
					.transition()
					.attr("transform", function(d) {
						return "translate("+(phasorChart.offsetX)+","+(phasorChart.offsetY)+") rotate("+(d.angle)+")"; 
					})
					.select(".segmentLabelGroup")
						.attr("transform", function(d) { 
											if(d.current) { 
												return "translate("+rI(d.amplitude)+",0)";
											} else {
												return "translate("+rV(d.amplitude)+",0)";
											}
							
						})
						.select(".segmentLabelRotater")
							.attr("transform", function(d) {								return "rotate("+(0-d.angle)+")";							})							.select(".segmentLabel")
								.style("text-anchor", function(d) {
									if (d.angle<=90) {
										return "start";
									} else if(d.angle<=180) {
										return "end";
									} else if(d.angle<=270) {
										return "end";
									} else {
										return "start";
									}
								})
								.attr("x", function(d) {
									if (d.angle<=90) {
										return ".2em";
									} else if(d.angle<=180) {
										return "-.25em";
									} else if(d.angle<=270) {
										return "-.25em";
									} else {
										return ".4em";
									}
								})
								.attr("y",function(d) {
									if (d.angle<=90) {
										return ".3em";
									} else if(d.angle<=180) {
										return "1.1em";
									} else if(d.angle<=270) {
										return "-.15em";
									} else {
										return ".3em";
									}
								})
								.attr("fill",function(d) { return d.lineColor; })
								.text(function(d) { return d.label; })
			;
		} else {
			// Creates SVG objects if they dont already exist			segGroup.append("svg:path")					.attr("transform",function(d) {						return "translate("+phasorChart.offsetX+","+(phasorChart.offsetY)+") rotate("+d.angle+")";					})					.attr("d", function(d) { return "M 2 0 L0 0"; })					.attr("class","segment")					.attr("fill","none")			;			segGroup.append("svg:g")					.attr("transform", function(d) {						return "translate("+(phasorChart.offsetX)+","+phasorChart.offsetY+") rotate("+(d.angle)+")";					})					.attr("class","segmentArrow")					.append("svg:path")						.attr("d",function(d) { return "M 0 -4 L0 0 L0 4 Z";})						.attr("class","arrowPath")						.attr("stroke","none")						.attr("stroke-width","0")						.attr("fill","none")			;			segGroup.append("svg:g")					.attr("transform", function(d) {						return "translate("+(phasorChart.offsetX)+","+phasorChart.offsetY+") rotate("+(d.angle)+")";					})					.attr("class","segmentLabelContainer")					.append("svg:g")						.attr("transform", function(d) {							return "rotate("+(0-d.angle)+")";						})						.attr("class","segmentLabelGroup")						.append("svg:g")							.attr("transform", function(d) {								return "rotate("+(0-d.angle)+")";							})							.attr("class","segmentLabelRotater")							.append("svg:text")								.attr("class","segmentLabel")			;
		}
		
	},
// UPDATE TABLE Function
	updateTable: function (data, reqObj)
	{
		// populate table or form fields with data, by looping through each requested data value 
		//	and finding its corresponding value in the returned data object
		jQuery('#phasor-data [id]').each(function ()
		{
			// get data value name
			dataName = this.id;

			// get the data associated with this element in the API return object (use eval because
			//	dataName contains the name of the property we are looking for)
			dataElement = eval("data." + dataName);

			// populate table data - angle and magnitude (aka amplitude)
			if (dataElement != null)			{				jQuery(this).text(dataElement);				}			else			{				jQuery(this).text("");				}			

		});
	}

};
