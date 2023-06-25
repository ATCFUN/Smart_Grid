/**
 * Alarms setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */

// Set Starting points for Alarms
var clearTable = function(selector) {
    $(selector).find("tr:gt(0)").remove();
};



var fillTable = function(selector, data) {
    for(var row=0; row<data.length; row++) {
        var id = data[row].name;
        var txtRow = "<tr id=\"" + id + "\">";

        txtRow += ("<td id=\"" + id + "\">" + data[row].name + "</td>");
        txtRow += ("<td>" + data[row].extremeValue + "</td>");
        txtRow += ("<td>" + data[row].dateTime + "</td>");
        txtRow += ("<td>" + data[row].priority + "</td>");
        txtRow += ("<td>" + data[row].acknowledged + "</td>");

        txtRow += "</tr>";
        $(selector).find("tbody:last").append(txtRow);
    }
};

var alarmsData = {
// INIT Function
    init:function() {

        alarmsData.readActiveAlarms();
        $( '#alarms' ).accordion({ heightStyle: "content"  });
        $( '#alarms' ).accordion({activate: function( event, ui ) {
            var active = $(this).accordion("option", "active");
            if(active==0) 
            {
                alarmsData.readActiveAlarms();
            }
            else
            {
               alarmsData.readHistoricalAlarms();
            }
         } });
        jQuery( "#AckActive" ).button();
        jQuery( "#AckHistorical" ).button();
        jQuery( "#AckActive" ).click( function() {
            // Compose Request Object
            var reqObject = {
                type: 'GET',
                url: '/api/ackActiveAlarms',
                returnType: '',
                successCallback: function(d, reqObj) {
                    if(d != undefined)
                    {
                    }
                },
                failCallback: function(status,error) {
                    // TODO: handle error
                    console.log('Failed fetch');
                }
            };
            // send API request
            pmAjax.sendGet(reqObject);

          });
        jQuery( "#AckHistorical" ).click( function() {
          });
    },

    readActiveAlarms:function() {

        // Compose Request Object
        var reqObject = {
            type: 'GET',
            url: '/api/getActiveAlarms?command=Update',
            returnType: '',
            successCallback: function(d, reqObj) {
                if(d != undefined)
                {
                    clearTable("table#active-alarms");
                    fillTable("table#active-alarms", d.data);
                }
                var isSelected = jQuery('[href="alarms.html"]').parent().hasClass('ui-state-active')
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

    readHistoricalAlarms:function() {

        // Compose Request Object
        var reqObject = {
            type: 'GET',
            url: '/api/getHistoricalAlarms?command=Update',
            returnType: '',
            successCallback: function(d, reqObj) {
                if(d != undefined)
                {
                    clearTable("table#historical-alarms");
                    fillTable("table#historical-alarms", d.data);
                }
                var isSelected = jQuery('[href="alarms.html"]').parent().hasClass('ui-state-active')
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
    }

};
