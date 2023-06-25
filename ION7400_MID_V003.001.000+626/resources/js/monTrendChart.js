var monTrendingChart = {
	colorList:["#2fb4e9","#f4a100","#c4014b"], // colorList:["blue","red","green"],
	hasForecastValues:false,
	init:function() {
		monTrendingChart.updateChart(controlsTrending.getValue("target"),controlsTrending.getValue("interval"));
	},
	updateChart:function(target,interval) {
		var reqObject = {
			type: 'GET',
			url: '/api/trendValues/'+target+"?timeScale="+interval,
			returnType: '',
			failCallback: function(status,error) {
				// Display error message
				errorMessage.displayHTMLErrorMessage('Meter Data Error', '#monTrendChart');
			},
			successCallback: function(d,reqObj) {
				$("#monTrendChart").empty();
				var data = monTrendingChart.parseData(d,reqObj["interval"]);
				monTrendingChart.createChart("#monTrendChart",data,1,data["labels"].length-1,10,data["labels"].length-1,interval,target);
			},
			"interval":interval
		};
		pmAjax.sendGet(reqObject);
	},
	parseData:function(d,interval) {
		d=d['result'];
		var avg = [];
		var mn = [];
		var mx = [];
		var merged = [];
		var labels = [];
		var avgTicker = 0;
		var minTicker = 0;
		var maxTicker = 0;
		var avgStop=false;
		var minStop=false;
		var maxStop=false;
		var avgCanIncrement=false;
		var minCanIncrement=false;
		var maxCanIncrement=false;
		monTrendingChart.hasForecastValues=false;

		var labelFormat = '';
		switch(interval) {
			case "hour":
				labelFormat = 'MMM D, HH:MM:SS';
				break;
			case "day":
				labelFormat = 'MMM D';
				break;
			case "week":
				labelFormat = 'MMM D';
				break;
			case "month":
				labelFormat = 'MMM D YYYY';
				break;
		} 

		for(var i=0;i<d["values"].length;i++) {
			var currDate = new Date();
			var originalDt = new Date(currDate);
			if(!(isNaN(d.values[i]["avg"]))) {
				avgStop=false;
				if(avg.length<=avgTicker) {
					avg[avgTicker] = {};
					avg[avgTicker]["data"] = [];
				}
				var dataObj = {"tick":i,"value":d["values"][i]["avg"],type:"normal"};
				avg[avgTicker]["data"].push(dataObj);
				merged.push(d["values"][i]["avg"]);
				avgCanIncrement=true;
			} else {
				if(avgStop==false&&avgCanIncrement==true) {
					avgStop=true;
					avgCanIncrement=false;
					avgTicker++;
				}
			}
			if(!(isNaN(d["values"][i]["min"]))) {
				minStop=false;
				if(mn.length<=minTicker) {
					mn[minTicker] = {};	
					mn[minTicker]["data"] = [];
				}
				var dataObj = {"tick":i,"value":d["values"][i]["min"],type:"normal"};
				mn[minTicker]["data"].push(dataObj);
				merged.push(d["values"][i]["min"]);
				minCanIncrement=true;
			} else {
				if(minStop==false&&minCanIncrement==true) {
					minCanIncrement=false;
					minStop=true;
					minTicker++;
				}
			}
			if(!(isNaN(d.values[i]["max"]))) {
				maxStop=false;
				if(mx.length<=maxTicker) {
					mx[maxTicker] = {};
					mx[maxTicker]["data"] = [];
				}
				var dataObj = {"tick":i,"value":d["values"][i]["max"],type:"normal"};
				mx[maxTicker]["data"].push(dataObj);
				merged.push(d["values"][i]["max"]);
				maxCanIncrement=true;
			} else {
				if(maxStop==false&&maxCanIncrement==true) {
					maxCanIncrement=false;
					maxStop=true;
					maxTicker++;
				}
			}
			var timestamp = d.values[i]["tsSeconds"];
			if(!(isNaN(timestamp))) {
				labels.push(localTimestamp.localizeTimestamp(timestamp, '', clockTime.regional, labelFormat));
			} else {
				labels.push('-');
			}
		}
		
		if(d.forecastedValues&&d.forecastedValues.length>0) {
			monTrendingChart.hasForecastValues=true;
			if(avgCanIncrement==true) {
				avgStop=true;
				avgCanIncrement=false;
				avgTicker++;
			}
			if(minCanIncrement==true) {
				minCanIncrement=false;
				minStop=true;
				minTicker++;
			}
			if(maxCanIncrement==true) {
				maxCanIncrement=false;
				maxStop=true;
				maxTicker++;
			}
			for(var i=0;i<d.forecastedValues.length;i++) {
				var currDate = new Date();
				var originalDt = new Date(currDate);
				
				if(avg.length<=avgTicker) {
					avg[avgTicker] = {};
					avg[avgTicker]["data"] = [];
				}
				var dataObj = {"tick":d.values.length+i,"value":d.forecastedValues[i]["avg"],type:"forecast"};
				avg[avgTicker]["data"].push(dataObj);
				if(!(isNaN(d.forecastedValues[i]["avg"]))) {
					merged.push(d.forecastedValues[i]["avg"]);
				}
				if(mn.length<=minTicker) {
					mn[minTicker] = {};	
					mn[minTicker]["data"] = [];
				}
				var dataObj = {"tick":d.values.length+i,"value":d.forecastedValues[i]["min"],type:"forecast"};
				mn[minTicker]["data"].push(dataObj);
				if(!(isNaN(d.forecastedValues[i]["min"]))) {
					merged.push(d.forecastedValues[i]["min"]);
				}
					
				if(mx.length<=maxTicker) {
					mx[maxTicker] = {};
					mx[maxTicker]["data"] = [];
				}
				var dataObj = {"tick":d.values.length+i,"value":d.forecastedValues[i]["max"],type:"forecast"};
				mx[maxTicker]["data"].push(dataObj);
				if(!(isNaN(d.forecastedValues[i]["max"]))) {
					merged.push(d.forecastedValues[i]["max"]);
				}

				var timestamp = d.forecastedValues[i]["tsSeconds"];
				if(!(isNaN(timestamp))) {
					labels.push(localTimestamp.localizeTimestamp(timestamp, '', clockTime.regional, labelFormat));
				} else {
					labels.push('-');
				}
			}
		}
		
		return {"minValues":mn,"maxValues":mx,"avgValues":avg,"merged":merged,"labels":labels};
	},
	createChart:function(chartID,cdata,yScale,xScale,yTickCnt,xTickCnt,interval,target) {
		$("#monTrendChart").empty();
		var height=450,
			width=748,
			xmargin=80,
			topymargin=80,
			bottomymargin=100;
		var mergedArrays = cdata["merged"];
		var maxValue = Math.max.apply(null, mergedArrays);
		var minValue = Math.min.apply(null, mergedArrays);
		var yScaleVal;
		var hasNegNum=false;
		if(minValue<0) {
			hasNegNum=true;
		}
		if(maxValue<10&&minValue<10) {
			maxValue=Math.ceil(maxValue);
			minValue=Math.ceil(Math.abs(minValue));
			if(minValue>maxValue) {
				yScaleVal = minValue;
			} else {
				yScaleVal = maxValue;
			}
		} else {
			maxValue=Math.ceil((maxValue/100))*100;
			minValue=Math.ceil((Math.abs(minValue)/100))*100;
			if(minValue>maxValue) {
				yScaleVal = minValue;
			} else {
				yScaleVal = maxValue;
			}
		}
		var yScaleDomain = [0,yScaleVal];
		if(hasNegNum) {
			yScaleDomain = [0-yScaleVal,yScaleVal];
		}
		$("#monTrendChart").append($("<div id='tooltip'></div")
			.attr("class","tooltip")
			.css("opacity",0)
			.css("background-color","white")
			.css("border","solid 1px black")
			.css("z-index","99")
			.css("position","absolute")
			.css("padding","10px")
		);
		var y=d3.scale.linear().domain(yScaleDomain).range([height - bottomymargin,0 + topymargin]);
		var x=d3.scale.linear().domain([0, xScale]).range([0 + xmargin, width-xmargin]);
		var xAxis=d3.scale.linear().domain([0, xTickCnt]).range([0 + xmargin, width-xmargin]);
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
			.attr("y1", topymargin)
			.attr("x2", xmargin)
			.attr("y2", height-bottomymargin)
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
			.attr("height", height-(bottomymargin+topymargin))
			.attr("x",xmargin)
			.attr("y",topymargin)
			.style("fill", "url(#gradient)");
		
	// Tooltip
		var tooltip = d3.select(".tooltip");
	// Draw Function
		var line = d3.svg.line()
			.x(function(d) { return x(d["tick"]); })
			.y(function(d) { return y(d["value"]); })
		;
	// Data Lines
		for(var j=0;j<cdata["minValues"].length;j++) {
			g.append("svg:path")
				.attr("d", line(cdata["minValues"][j]["data"]))
				.attr("class",function() { 
					var classList = "dataLine";
					if(cdata["minValues"][j]["data"][0]["type"]=="forecast") {
						classList = classList + " dashedStroke";	
					}
					return classList;
				})
				.attr("fill","none")
				.attr("stroke-width",2)
				.attr("stroke",monTrendingChart.colorList[0])
			;
		}
		for(var j=0;j<cdata["maxValues"].length;j++) {
			g.append("svg:path")
				.attr("d", line(cdata["maxValues"][j]["data"]))
				.attr("class",function() { 
					var classList = "dataLine";
					if(cdata["maxValues"][j]["data"][0]["type"]=="forecast") {
						classList = classList + " dashedStroke";	
					}
					return classList;
				})
				.attr("fill","none")
				.attr("stroke-width",2)
				.attr("stroke",monTrendingChart.colorList[1])
			;
		}
		for(var j=0;j<cdata["avgValues"].length;j++) {
			g.append("svg:path")
				.attr("d", line(cdata["avgValues"][j]["data"]))
				.attr("class",function() { 
					var classList = "dataLine";
					if(cdata["avgValues"][j]["data"][0]["type"]=="forecast") {
						classList = classList + " dashedStroke";	
					}
					return classList;
				})
				.attr("fill","none")
				.attr("stroke-width",2)
				.attr("stroke",monTrendingChart.colorList[2])
			;
		}
	// Data Points
		for(var j=0;j<cdata["minValues"].length;j++) {
			g.selectAll("dataPoint")
				.data(cdata["minValues"][j]["data"])
				.enter().append("svg:circle")
					.attr("class","dataPoint")
					.attr("r", 4)
					.attr("cx", function(d) { return x(d["tick"]); })
					.attr("cy", function(d) { return y(d["value"]);})
					.attr("stroke-width",1)
					.attr("stroke", monTrendingChart.colorList[0])
					.attr("fill-opacity","0.1")
					.on("mouseover", function(d) {
						tooltip.transition()
							.duration(200)
							.style("opacity", 1)
							.style("border","1px solid "+monTrendingChart.colorList[0])
							.transition()
							.style("display", "block")
						;						var label = jQuery('#monitoringLabels > label#label_minimum').text()
						tooltip.html(function(data) { return "<div class='tooltiptitle'>"+label+":</div><br />"+cdata["labels"][d["tick"]]+"<br />"+d["value"]; })
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
		}
		for(var j=0;j<cdata["maxValues"].length;j++) {
			g.selectAll("dataPoint")
				.data(cdata["maxValues"][j]["data"])
				.enter().append("svg:circle")
					.attr("class","dataPoint")
					.attr("r", 4)
					.attr("cx", function(d) { return x(d["tick"]); })
					.attr("cy", function(d) { return y(d["value"]);})
					.attr("stroke-width",1)
					.attr("stroke", monTrendingChart.colorList[1])
					.attr("fill-opacity","0.1")
					.on("mouseover", function(d) {
						tooltip.transition()
							.duration(200)
							.style("opacity", 1)
							.style("border","1px solid "+monTrendingChart.colorList[1])
							.transition()
							.style("display", "block")
						;
						var label = jQuery('#monitoringLabels > label#label_maximum').text()						tooltip.html(function(data) { return "<div class='tooltiptitle'>"+label+":</div><br />"+cdata["labels"][d["tick"]]+"<br />"+d["value"]; })
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
		}
		for(var j=0;j<cdata["avgValues"].length;j++) {
			g.selectAll("dataPoint")
				.data(cdata["avgValues"][j]["data"])
				.enter().append("svg:circle")
					.attr("class","dataPoint")
					.attr("r", 4)
					.attr("cx", function(d) { return x(d["tick"]); })
					.attr("cy", function(d) { return y(d["value"]);})
					.attr("stroke-width",1)
					.attr("stroke", monTrendingChart.colorList[2])
					.attr("fill-opacity","0.1")
					.on("mouseover", function(d) {
						tooltip.transition()
							.duration(200)
							.style("opacity", 1)
							.style("border","1px solid "+monTrendingChart.colorList[2])
							.transition()
							.style("display", "block")
						;
						var label = jQuery('#monitoringLabels > label#label_average').text()						tooltip.html(function(data) { return "<div class='tooltiptitle'>"+label+":</div><br />"+cdata["labels"][d["tick"]]+"<br />"+d["value"]; })
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
		}
	// yAxis
		var yAxis = d3.svg.axis()
			.scale(y)
			.orient("left")
			.ticks(5);
		g.append("g")
			.attr("class", "axis")
			.attr("transform", "translate("+xmargin+",0)")
			.call(yAxis);
	// xAxis
		var xAxis = d3.svg.axis()
			.scale(x)
			.orient("bottom")
			.ticks(xTickCnt)
			.tickFormat(function(d,i) { return cdata["labels"][i]})
		;
		g.append("g")
			.attr("class", "axis")
			.attr("transform", "translate(0,"+(height-bottomymargin)+")")
			.call(xAxis)
			.selectAll("text")  
				.style("text-anchor", "end")
				.attr("transform", function(d,i) {
					return "rotate(-65 -4,12)" 
					})
		;
	// Legend
		var legend = chartObj.append("svg:g");
		if(monTrendingChart.hasForecastValues==true) {
			legend.append("svg:rect")
				.attr("width", 420)
				.attr("height", 60)
				.attr("x",300)
				.attr("y",10)
				.style("stroke-width", 0.5)
				.style("stroke", "#000000")
				.attr("fill","#4FA600")
				.attr("fill-opacity","0.2")
			;
			// Normal Lines
			legend.append("svg:path")
				.attr("d","M310 20 L360 20")
				.attr("class","legendLine")
				.attr("stroke-width",2)
				.attr("stroke", monTrendingChart.colorList[1])
			;
			legend.append("svg:path")
				.attr("d","M310 40 L360 40")
				.attr("class","legendLine")
				.attr("stroke-width",2)
				.attr("stroke", monTrendingChart.colorList[2])
			;
			legend.append("svg:path")
				.attr("d","M310 60 L360 60")
				.attr("class","legendLine")
				.attr("stroke-width",2)
				.attr("stroke", monTrendingChart.colorList[0])
			;
			
			legend.append("svg:circle")
				.attr("class","dataPoint")
				.attr("r", 4)
				.attr("cx", 335)
				.attr("cy", 20)
				.attr("stroke-width",1)
				.attr("stroke", monTrendingChart.colorList[1])
				.attr("fill-opacity","0.1")
			;
			legend.append("svg:circle")
				.attr("class","dataPoint")
				.attr("r", 4)
				.attr("cx", 335)
				.attr("cy", 40)
				.attr("stroke-width",1)
				.attr("stroke", monTrendingChart.colorList[2])
				.attr("fill-opacity","0.1")
			;
			legend.append("svg:circle")
				.attr("class","dataPoint")
				.attr("r", 4)
				.attr("cx", 335)
				.attr("cy", 60)
				.attr("stroke-width",1)
				.attr("stroke", monTrendingChart.colorList[0])
				.attr("fill-opacity","0.1")
			;
			
			legend.append("svg:text")
				.attr("x",370)
				.attr("y",25)
				.text(jQuery('#monitoringLabels > label#label_maximum').text())
			;
			legend.append("svg:text")
				.attr("x",370)
				.attr("y",45)
				.text(jQuery('#monitoringLabels > label#label_average').text())
			;
			legend.append("svg:text")
				.attr("x",370)
				.attr("y",65)
				.text(jQuery('#monitoringLabels > label#label_minimum').text())
			;
			// Forecast Legend
			
			legend.append("svg:path")
				.attr("d","M470 20 L520 20")
				.attr("class","legendLine dashedStroke")
				.attr("stroke-width",2)
				.attr("stroke", monTrendingChart.colorList[1])
			;
			legend.append("svg:path")
				.attr("d","M470 40 L520 40")
				.attr("class","legendLine dashedStroke")
				.attr("stroke-width",2)
				.attr("stroke", monTrendingChart.colorList[2])
			;
			legend.append("svg:path")
				.attr("d","M470 60 L520 60")
				.attr("class","legendLine dashedStroke")
				.attr("stroke-width",2)
				.attr("stroke", monTrendingChart.colorList[0])
			;
			
			legend.append("svg:circle")
				.attr("class","dataPoint")
				.attr("r", 4)
				.attr("cx", 495)
				.attr("cy", 20)
				.attr("stroke-width",1)
				.attr("stroke", monTrendingChart.colorList[1])
				.attr("fill-opacity","0.1")
			;
			legend.append("svg:circle")
				.attr("class","dataPoint")
				.attr("r", 4)
				.attr("cx", 495)
				.attr("cy", 40)
				.attr("stroke-width",1)
				.attr("stroke", monTrendingChart.colorList[2])
				.attr("fill-opacity","0.1")
			;
			legend.append("svg:circle")
				.attr("class","dataPoint")
				.attr("r", 4)
				.attr("cx", 495)
				.attr("cy", 60)
				.attr("stroke-width",1)
				.attr("stroke", monTrendingChart.colorList[0])
				.attr("fill-opacity","0.1")
			;
			
			legend.append("svg:text")
				.attr("x",530)
				.attr("y",25)
				.text(jQuery('#monitoringLabels > label#label_forecast_maximum').text())
			;
			legend.append("svg:text")
				.attr("x",530)
				.attr("y",45)
				.text(jQuery('#monitoringLabels > label#label_forecast_average').text())
			;
			legend.append("svg:text")
				.attr("x",530)
				.attr("y",65)
				.text(jQuery('#monitoringLabels > label#label_forecast_minimum').text())
			;
		} else {
			legend.append("svg:rect")
				.attr("width", 180)
				.attr("height", 60)
				.attr("x",540)
				.attr("y",10)
				.style("stroke-width", 0.5)
				.style("stroke", "#000000")
				.attr("fill","#4FA600")
				.attr("fill-opacity","0.2")
			;
			legend.append("svg:path")
				.attr("d","M550 20 L600 20")
				.attr("class","legendLine")
				.attr("stroke-width",2)
				.attr("stroke", monTrendingChart.colorList[1])
			;
			legend.append("svg:path")
				.attr("d","M550 40 L600 40")
				.attr("class","legendLine")
				.attr("stroke-width",2)
				.attr("stroke", monTrendingChart.colorList[2])
			;
			legend.append("svg:path")
				.attr("d","M550 60 L600 60")
				.attr("class","legendLine")
				.attr("stroke-width",2)
				.attr("stroke", monTrendingChart.colorList[0])
			;
			
			legend.append("svg:circle")
				.attr("class","dataPoint")
				.attr("r", 4)
				.attr("cx", 575)
				.attr("cy", 20)
				.attr("stroke-width",1)
				.attr("stroke", monTrendingChart.colorList[1])
				.attr("fill-opacity","0.1")
			;
			legend.append("svg:circle")
				.attr("class","dataPoint")
				.attr("r", 4)
				.attr("cx", 575)
				.attr("cy", 40)
				.attr("stroke-width",1)
				.attr("stroke", monTrendingChart.colorList[2])
				.attr("fill-opacity","0.1")
			;
			legend.append("svg:circle")
				.attr("class","dataPoint")
				.attr("r", 4)
				.attr("cx", 575)
				.attr("cy", 60)
				.attr("stroke-width",1)
				.attr("stroke", monTrendingChart.colorList[0])
				.attr("fill-opacity","0.1")
			;
			
			legend.append("svg:text")
				.attr("x",610)
				.attr("y",25)
				.text(jQuery('#monitoringLabels > label#label_maximum').text())
			;
			legend.append("svg:text")
				.attr("x",610)
				.attr("y",45)
				.text(jQuery('#monitoringLabels > label#label_average').text())
			;
			legend.append("svg:text")
				.attr("x",610)
				.attr("y",65)
				.text(jQuery('#monitoringLabels > label#label_minimum').text())
			;
		}
	}
};