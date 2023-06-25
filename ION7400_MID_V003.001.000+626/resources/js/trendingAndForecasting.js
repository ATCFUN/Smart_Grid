/**
 * Trending and Forecasting setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */
function initTrendingAndForecasting()
{
	controlsTrending.init();
}
var controlsTrending = {
	init:function() {
		var reqObject = {
			type: 'GET',
			url: '/api/trendTopics',
			returnType: '',
			failCallback: function(textStatus, errorThrown)
			{
				// Handle Error
				errorMessage.displayHTMLErrorMessage(errorThrown, '#monTrendingForecasting');
			},
			successCallback: function(d,reqObj) {
				
				if(d.topics.length > 0)
				{
					var syncCall = controlsTrending.setControlData("monTrendingTarget",d.topics,d.translatedTopics);
					$('#monTrendingTarget :nth-child(1)').prop('selected', true);
					$('#monTrendingInterval :nth-child(1)').prop('selected', true);
				
					$("#monTrendingInterval").change(function() {
						controlsTrending.controlChange();
					});
					$("#monTrendingTarget").change(function() {
						controlsTrending.controlChange();
					});
					monTrendingChart.init();
				}
			}
		};
		pmAjax.sendGet(reqObject);
		
	},
	setControlData:function(controlID, data, labels) {
		// Empty Target Selector
		$("#"+controlID).empty();
		if ( data.length != labels.length)
		{
		    return true;
		}
		
		// Iterate and populate Target Dropdown
		for(var i=0;i<data.length;i++) {
			$("#"+controlID).append($("<option></option>")
					.text(labels[i])
					.attr("value",data[i])
				);
		}
		return true;
	},
	controlChange:function() {
		monTrendingChart.updateChart($("#monTrendingTarget").val(),$("#monTrendingInterval").val());
	},
	getValue:function(type) {
		if(type=="target") {
			return $("#monTrendingTarget").val();
		} else {
			return $("#monTrendingInterval").val();
		}
	}
}

