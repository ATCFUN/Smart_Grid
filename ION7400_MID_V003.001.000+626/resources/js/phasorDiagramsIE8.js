/**
 * Phasor Diagrams setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */

// Set Starting points for Phasor Chart
var initData = [
	{label:"V1",angle:0,amplitude:0,lineColor:"#00CC00"},
	{label:"V2",angle:0,amplitude:0,lineColor:"#0000FF"},
	{label:"V3",angle:0,amplitude:0,lineColor:"#FF0000"},
	{label:"I1",angle:0,amplitude:0,lineColor:"#009900"},
	{label:"I2",angle:0,amplitude:0,lineColor:"#0000CC"},
	{label:"I3",angle:0,amplitude:0,lineColor:"#CC0000"}
];

var phasorChart = {
	height:500,
	width:620,
	gaugeRadius:420,
	offsetX:0,
	offsetY:0,
	chartScale: d3.scale.linear().domain([0,360]).range([0,2*Math.PI]),
// INIT Function
	init:function() {
		phasorChart.offsetX=(phasorChart.width/2);
		phasorChart.offsetY=(phasorChart.height/2);
		
		var newChart = phasorChart.createChart();
		phasorChart.redraw(newChart,initData);
		
		// Setup call for data
		var reqFail = function(status,error) {
			// TODO: handle errors....
		}
		var reqSuccess = function(d, reqObject) {
			data = 	phasorChart.parseData(d.result);
			phasorChart.redraw(newChart);

			// update table data
			phasorChart.updateTable(d.result, reqObject);
		}
	
		// Compose Request Object
		var reqObject = ({
			type: 'GET',
			url: '/apis/getPhaserGaugeData',
			serializedData: '',
			returnType: '',
			successCallback: reqSuccess,
			failCallback: reqFail,
			updateOnInterval: true
		});
		
		// send API request
			pmAjax.sendRequest(reqObject);
	},
	parseData:function(d) {
		var typeList = ["v1","v2","v3","i1","i2","i3"];
		var data = [];
		for(var i=0;i<typeList.length;i++) {
			var obj = {};
			obj.label = typeList[i].toUpperCase();
			obj.angle = d[typeList[i]+"Angle"];
			obj.amplitude = d[typeList[i]+"Amplitude"];
			switch(typeList[i]) {
				case "v1":
					obj.lineColor = "#00CC00";
					break;
				case "v2":
					obj.lineColor = "#0000FF";
					break;
				case "v3":
					obj.lineColor = "#FF0000";
					break;
				case "i1":
					obj.lineColor = "#009900";
					break;
				case "i2":
					obj.lineColor = "#0000CC";
					break;
				case "i3":
					obj.lineColor = "#CC0000";
					break;
			}
			data.push(obj);
		}
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
			.attr("transform","translate("+phasorChart.offsetX+","+phasorChart.offsetY+")");
		// Draw chart
		chartGroup.append("svg:circle")
			.attr("r",(phasorChart.gaugeRadius/2)-5)
			.attr("fill","#EFEFEF")
			.attr("class","phasor outercirlce")
			.attr("stroke","#666666")
			.attr("stroke-width",1)
		;
		chartGroup.append("svg:circle")
			.attr("r",2)
			.attr("fill","black")
			.attr("class","phasor innercircle")
		;
		// Grid Lines
		chartGroup.append("svg:path")
			.attr("d","M "+(0-phasorChart.gaugeRadius/2)+" 0 L "+(phasorChart.gaugeRadius/2)+" 0")
			.attr("class","gridline")
			.attr("stroke","#666666")
			.attr("stroke-width",1)
		;
		chartGroup.append("svg:path")
			.attr("transform", "rotate(90)")
			.attr("d","M "+(0-phasorChart.gaugeRadius/2)+" 0 L "+(phasorChart.gaugeRadius/2)+" 0")
			.attr("class","gridline")
			.attr("stroke","#666666")
			.attr("stroke-width",1)
		;
		// Grid Arrows
		chartGroup.append("svg:g")
			.attr("transform", "translate(3,"+(0-(phasorChart.gaugeRadius/2)+5)+") rotate(270)")
			.attr("class","gridArrowGroup")
			.append("svg:path")
				.attr("d","M -8 -4 L0 0 L-8 4 Z")
				.attr("class","gridArrow")
				.attr("stroke","black")
				.attr("stroke-width","2")
				.attr("fill","black")
		;
		chartGroup.append("svg:g")
			.attr("transform", "translate("+((phasorChart.gaugeRadius/2)-5)+",0) rotate(0)")
			.attr("class","gridArrowGroup")
			.append("svg:path")
				.attr("d","M -8 -4 L0 0 L-8 4 Z")
				.attr("class","gridArrow")
				.attr("stroke","black")
				.attr("stroke-width","2")
				.attr("fill","black")
		;
		
		// Chart Labels
		chartGroup.append("svg:text")
			.attr("x",((phasorChart.gaugeRadius/2)+5))
			.attr("y",5)
			.text("0")
		;
		chartGroup.append("svg:text")
			.attr("x",(0-((phasorChart.gaugeRadius/2)+29)))
			.attr("y",5)
			.text("180")
		;
		return chartObj;
	},
// REDRAW Function
	redraw:function(chartObj,data) {
		var r=d3.scale.linear().domain([0, 100]).range([0, (phasorChart.gaugeRadius/2)-5]);
		var handArc = d3.svg.arc()
			.innerRadius(1)
			.outerRadius(function(d) {
				return r(d.amplitude)-5;
			})
			.startAngle(function(d) {
				return phasorChart.chartScale(d.angle);
			})
			.endAngle(function(d) {
				return phasorChart.chartScale(d.angle);
			})
		;
		var arrowArc = d3.svg.arc()
			.innerRadius(function(d) {
				return r(d.amplitude)-5;
			})
			.outerRadius(function(d) {
				return r(d.amplitude);
			})
			.startAngle(function(d) {
				return phasorChart.chartScale(d.angle);
			})
			.endAngle(function(d) {
				return phasorChart.chartScale(d.angle);
			})
		;
		
		chartObj.selectAll(".segmentGroup")
			.data(data)
			.enter().append("svg:g")
					.attr("class","segmentGroup")
		;
		var segGroup = chartObj.selectAll(".segmentGroup");
		
	// If group exists, modify objects, else create new objects
	
		if(segGroup.select(".segment").node()) {
			segGroup.select(".segment")
					.attr("d", function(d) { return "M 2 0 L"+(r(d.amplitude)-4)+" 0"; })
					.attr("stroke",function(d) { return d.lineColor; })
					.attr("stroke-width",2)
					.attr("transform",function(d) {
						return "translate("+(phasorChart.offsetX-3)+","+(phasorChart.offsetY-6)+") rotate("+d.angle+")";
					})
			;
			segGroup.select(".segmentArrow")
					.attr("transform", function(d) {
						return "translate("+(phasorChart.offsetX)+","+phasorChart.offsetY+") rotate("+(d.angle)+")";
					})
					.select(".arrowPath")
						.attr("d",function(d) { return "M "+(r(d.amplitude)-8)+" -4 L"+(r(d.amplitude))+" 0 L"+(r(d.amplitude)-8)+" 4 Z";})
						.attr("stroke",function(d) { return d.lineColor; })
						.attr("stroke-width","2")
						.attr("fill",function(d) { return d.lineColor; })
			;
			segGroup.select(".segmentLabelContainer")
					.attr("transform", function(d) {
						return "translate("+(phasorChart.offsetX)+","+(phasorChart.offsetY)+") rotate("+(d.angle)+")"; 
					})
					.select(".segmentLabelGroup")
						.attr("transform", function(d) {
							return "translate("+(r(d.amplitude))+",0)";
						})
						.select(".segmentLabelRotater")
							.select(".segmentLabel")
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
										return ".4em";
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
										return "1em";
									} else if(d.angle<=270) {
										return "-.15em";
									} else {
										return ".3em";
									}
								})
								.attr("transform", function(d) { return "rotate("+(0-d.angle)+")"; })
								.attr("fill",function(d) { return d.lineColor; })
								.text(function(d) { return d.label; })
			;
		} else {
	// Creates SVG objects if they dont already exist
			segGroup.append("svg:path")
					.attr("d", function(d) {
						return handArc(d);
					})
					.attr("transform",function(d) {
						return "translate("+phasorChart.offsetX+","+(phasorChart.offsetY)+") rotate("+d.angle+")";
					})
					.attr("d", function(d) { return "M 2 0 L"+(r(d.amplitude)-4)+" 0"; })
					.attr("class","segment")
					.attr("fill","none")
			;
			segGroup.append("svg:g")
					.attr("transform", function(d) {
						return "translate("+(phasorChart.offsetX)+","+phasorChart.offsetY+") rotate("+(d.angle)+")";
					})
					.attr("class","segmentArrow")
					.append("svg:path")
						.attr("d",function(d) { return "M "+(r(d.amplitude)-8)+" -4 L"+(r(d.amplitude))+" 0 L"+(r(d.amplitude)-8)+" 4 Z";})
						.attr("class","arrowPath")
						.attr("stroke","none")
						.attr("stroke-width","0")
						.attr("fill","none")
			;
			segGroup.append("svg:g")
					.attr("transform", function(d) {
						return "translate("+(phasorChart.offsetX)+","+phasorChart.offsetY+") rotate("+(d.angle)+")";
					})
					.attr("class","segmentLabelContainer")
					.append("svg:g")
						.attr("transform", function(d) {
							return "rotate("+(0-d.angle)+")";
						})
						.attr("class","segmentLabelGroup")
						.append("svg:g")
							.attr("transform", function(d) {
								return "rotate("+(0-d.angle)+")";
							})
							.attr("class","segmentLabelRotater")
							.append("svg:text")
								.attr("class","segmentLabel")
			;
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
			if (dataElement != null)
			{
				jQuery(this).text(dataElement);	
			}


		});
	}

};