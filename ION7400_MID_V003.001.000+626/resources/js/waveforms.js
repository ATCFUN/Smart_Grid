/**
 * Trending and Forecasting setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */
function initWaveforms()
{
    controlsWaveforms.init();
}

var controlsWaveforms = {
    waveforms:'',
    records:'',
    module:'',
    init:function( ) {
        controlsWaveforms.requestComtradeData('comtrade1');
        controlsWaveforms.bindAccordionPaneChildren();
    },

    requestComtradeData: function(paneId) {
        var reqUrl;
        controlsWaveforms.module = null;
        if (paneId == 'comtrade1') {
            controlsWaveforms.module = 'comtrade1';
        } else if (paneId == 'comtrade2') {
            controlsWaveforms.module = 'comtrade2';
        } else if (paneId == 'comtrade3') {
            controlsWaveforms.module = 'comtrade3';
        }

        if ( controlsWaveforms.module != null ) {
            reqUrl = '/api/waveforms/'+controlsWaveforms.module;
            var reqObject = {
                type: 'GET',
                url: reqUrl,
                returnType: '',
                failCallback: function(textStatus, errorThrown)
                {
                    // Handle Error
                    errorMessage.displayHTMLErrorMessage(jQuery('#waveformErrorLabel').text(), '#'+controlsWaveforms.module+'Waveform');
                },
                successCallback: function(d,reqObj) {
                    var records = d.result.records;
                    if( records && (records.length > 0) ) {
                            var syncCall = controlsWaveforms.setControlData(controlsWaveforms.module+'Records',records);
                            $('#'+controlsWaveforms.module+'Records :nth-child(1)').prop('selected', true);

                            $('#'+controlsWaveforms.module+'Records').change(function(){
                                controlsWaveforms.controlChange();
                            });
                            $('#'+controlsWaveforms.module+'Controls').show();
                            waveformViewer.init();
                    }
                    else {
                        $('#'+controlsWaveforms.module+'Controls').hide();
                        errorMessage.displayHTMLErrorMessage(jQuery('#noRecordsLabel').text(), '#'+controlsWaveforms.module+'Waveform');
                    }
                }
            };
            pmAjax.sendGet(reqObject);
        }
    },

    setControlData:function(controlID, data) {
        // Empty Target Selector
        $("#"+controlID).empty();
        if( data ){
            data.sort();
            // Iterate and populate Target Dropdown
            for (var i=0;i<data.length;i++) {
                $("#"+controlID).append($("<option></option>")
                                .text(data[i])
                                .attr("value",data[i])
                                );
            }
        }
        return true;
    },
    controlChange:function() {
        waveformViewer.getConfigFile( controlsWaveforms.module, $('#'+controlsWaveforms.module+'Records').val());
    },
    getValue:function(type) {
        if (type=="record") {
            return $('#'+controlsWaveforms.module+'Records').val();
        } else if (type=="module") {
            return controlsWaveforms.module;
        }
    },
    bindAccordionPaneChildren: function () {
        // Bind onClick event for each Accordion header elemenent
        jQuery("div.accordion > h3").each( function(){
            var eTarget = jQuery(this).attr('target');
            jQuery(this).bind('click', function(){
                controlsWaveforms.updatePaneContentByTarget(eTarget, jQuery(this).attr("id"));
            });
        });
    },
    updatePaneContentByTarget: function (paneTarget, eID)
    {
        // Determine if Pane is already selected
        var isSelected = jQuery('#'+ eID).hasClass('ui-accordion-header-active');
        // If the Pane is not selected, populate it.
        if (!isSelected) {
            controlsWaveforms.requestComtradeData(paneTarget);
        }
    }
}

