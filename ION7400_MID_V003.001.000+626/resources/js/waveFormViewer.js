/**
 * Wave Form Viewer setup method.
 *
 * Call API method(s) and populate page contents with data.
 * 
 */
var waveformViewer = {
    colors:{ "DARK_RED":"#A8002D",  "DARK_GREEN":"#2EC94B", "DARK_BLUE":"#005479",       "ORANGE":"#E37B00", "BLACK":"#1D1E22", 
               "VOILET":"#FF2075", "LIGHT_GREEN":"#82DF93",      "CYAN":"#3BB1E5", "LIGHT_ORANGE":"#FFAE48",  "GRAY":"#96979B",
               "YELLOW":"FFFF00" },
    waveforms:[],
    active:[false,false,false,false,false,false],
    configFile:{
        stationName:"",
        devId:"",
        rev_year:"",
        numChannels:0,
        numAnalogChannels:0,
        numDigitalChannels:0,
        analogChannelList:[],
        digitalChannelsList:[],
        nominalFrequency:0,
        numSampleRates:0,
		samplingRate:0,	 
        samplesList:[],
        firstValueTimestamp:{month:0,day:0,year:0,hours:0,minutes:0,seconds:0,usecs:0},
        triggerValueTimestamp:{month:0,day:0,year:0,hours:0,minutes:0,seconds:0,usecs:0},
        isBinary:0,
        MultiplicationFactor:0,
    },
    MICROSECONDS_PER_DAY:86400000000,
    MICROSECONDS_PER_HOUR:3600000000,
    MICROSECONDS_PER_MINUTE:60000000,
    MICROSECONDS_PER_SECOND:1000000,
    timeStampMaxValue:4294967295,
    analogChannelIndex:0,
    digitalChannelIndex:0,
    numberOfSamples:0,
    init:function( ) {
        waveformViewer.getConfigFile( controlsWaveforms.getValue("module"), controlsWaveforms.getValue("record"));
    },
    analogChannel:function( ) {
        this.channelIndex = 0;
        this.channelId = 0;
        this.phaseId = 0;
        this.circuitComponent = 0;
        this.units = 0;
        this.multiplier = 0;
        this.offset = 0;
        this.skewMs = 0;
        this.minimum = 0;
        this.maximum = 0;
        this.primary = 0;
        this.secondary = 0;
        this.isPrimary = 0;
    },
    digitalChannel:function( ) {
        this.channelIndex = 0;
        this.channelId = 0;
        this.phaseId = 0;
        this.circuitComponent = 0;
        this.state = 0;
    },
    plotDataByIndex:function( ) {
        this.index = 0;
        this.time = 0;
        this.data = [];
    },
    plotData:{
        index:[],
        time:[],
        data:[]
    },
    stats:{
        minValue:255,
        maxValue:0
    },
    coordinates:{
        path:{ x1:0, x2:0, y:0 },
        circle:{ x:0, y:0 },
        text:{ x:0, y:0 },
    },
    sample:function( ) {
        this.sampleRateHz = 0;
        this.lastSampleNumber = 0;
    },
    getConfigFile:function(module, record) {
        $('#'+module+'Waveform').empty();
        $('#'+module+'StartTime').empty();
        $('#'+module+'Throbber').show();

        var reqObject = {
            type: 'GET',
            url: '/api/waveforms/'+module+'/'+record+'.cfg',
            returnType: 'text',
            failCallback: function(status,error) {
                // Display error message
                $('#'+module+'Throbber').hide();
                errorMessage.displayHTMLErrorMessage(jQuery('#noConfigFileLabel').text(), '#'+controlsWaveforms.module+'Waveform');
            },
            successCallback: function(d,reqObj) {
                waveformViewer.parseConfigFile(d);
                waveformViewer.getDataFile(module,record);
            },
        };
        pmAjax.sendGet(reqObject);
    },

    getDataFile:function(module,record) {

        var xhr = new XMLHttpRequest();
        // The following url with "?" followed by the date is needed because 
        // IE caches the data if each XMLHttpRequest call is NOT unique
        var url = "?" + new Date().getTime();
        xhr.open('GET', '/api/waveforms/'+module+'/'+record+'.dat'+url, true);
        xhr.responseType = 'arraybuffer';

        xhr.onload = function(e) {
            waveformViewer.parseDataFile(module, this.response);
        };

        xhr.onerror = function(){
            // Handle Error
            errorMessage.displayHTMLErrorMessage(jQuery('#noDataFileLabel').text(), '#'+controlsWaveforms.module+'Waveform');
        }

        xhr.send();
    },
    parseGeneralInformation:function(row) {
        var fields = row.split(',');
        waveformViewer.configFile.stationName = fields[0];
        waveformViewer.configFile.devId = fields[1];
        waveformViewer.configFile.rev_year = fields[2];
    },
    parseChannelInformation:function(row) {
        var fields = row.split(',');
        waveformViewer.configFile.numChannels = Number(fields[0]);
        waveformViewer.configFile.numAnalogChannels = Number(fields[1].slice(0, -1));
        waveformViewer.configFile.numDigitalChannels = Number(fields[2].slice(0, -1));
    },
    parseAnalogChannelInformation:function(row) {
        var fields = row.split(',');
        var aChannel = new waveformViewer.analogChannel();
        aChannel.channelIndex = Number(fields[0]);
        aChannel.channelId = fields[1];
        aChannel.phaseId = Number(fields[2]);
        aChannel.circuitComponent = fields[3];
        aChannel.units = fields[4];
        aChannel.multiplier = parseFloat(fields[5]);
        aChannel.offset = parseFloat(fields[6]);
        aChannel.skewMs = parseInt(fields[7]);
        aChannel.minimum = parseInt(fields[8]);
        aChannel.maximum = parseInt(fields[9]);
        aChannel.primary = parseFloat(fields[10]);
        aChannel.secondary = parseFloat(fields[11]);
        aChannel.isPrimary = fields[12];

        waveformViewer.configFile.analogChannelList.splice( waveformViewer.analogChannelIndex,0,aChannel);
        waveformViewer.analogChannelIndex++;
    },
    parseDigitalChannelInformation:function(row) {
        var fields = row.split(',');
        var dChannel = new waveformViewer.digitalChannel();
        aChannel.channelIndex = fields[0];
        aChannel.channelId = fields[1];
        aChannel.phaseId = fields[2];
        aChannel.circuitComponent = fields[3];
        dChannel.state = fields[4];

        waveformViewer.configFile.digitalChannelList.splice( waveformViewer.digitalChannelIndex,0,dChannel);
        waveformViewer.digitalChannelIndex++;
    },
    parseNominalFrequency:function(row) {
        waveformViewer.configFile.nominalFrequency = row;
    },
    parseNumSamples:function(row) {
        waveformViewer.configFile.numSampleRates = row;
    },
	parseSamplingRate:function(row) {
		var fields = row.split(',');
        waveformViewer.configFile.samplingRate = parseFloat(fields[0]);
    },							  	
    parseSampleRatesInformation:function(row) {
        var fields = row.split(',');
        var tempSample = new waveformViewer.sample();
        tempSample.sampleRateHz = parseFloat(fields[0]);
        tempSample.lastSampleNumber = Number(fields[1]);
        waveformViewer.configFile.samplesList.splice( waveformViewer.sampleIndex,0,tempSample);
        waveformViewer.sampleIndex++;
    },
    parseFirstValueTimestamp:function(row) {
        var fields = row.split(',');
        // Date format is MM/DD/YYYY
        var date = fields[0].split('/');
        // Time format is HH:MM:SS.USEC
        var time = fields[1].split(':');
        var secs = time[2].split('.');

        waveformViewer.configFile.firstValueTimestamp.day = waveformViewer.padWithZero(date[0],2);
        waveformViewer.configFile.firstValueTimestamp.month = waveformViewer.padWithZero(date[1],2);
        waveformViewer.configFile.firstValueTimestamp.year = date[2];
        waveformViewer.configFile.firstValueTimestamp.hours = waveformViewer.padWithZero(time[0],2);
        waveformViewer.configFile.firstValueTimestamp.minutes = waveformViewer.padWithZero(time[1],2);
        waveformViewer.configFile.firstValueTimestamp.seconds = waveformViewer.padWithZero(secs[0],2);
        waveformViewer.configFile.firstValueTimestamp.usecs = waveformViewer.padWithZero(secs[1],6);
    },
    parseTriggerValueTimestamp:function(row) {
        var fields = row.split(',');
        // Date format is MM/DD/YYYY
        var date = fields[0].split('/');
        // Time format is HH:MM:SS.USEC
        var time = fields[1].split(':');
        var secs = time[2].split('.');

        waveformViewer.configFile.triggerValueTimestamp.day = waveformViewer.padWithZero(date[0],2);
        waveformViewer.configFile.triggerValueTimestamp.month = waveformViewer.padWithZero(date[1],2);
        waveformViewer.configFile.triggerValueTimestamp.year = date[2];
        waveformViewer.configFile.triggerValueTimestamp.hours = waveformViewer.padWithZero(time[0],2);
        waveformViewer.configFile.triggerValueTimestamp.minutes = waveformViewer.padWithZero(time[1],2);
        waveformViewer.configFile.triggerValueTimestamp.seconds = waveformViewer.padWithZero(secs[0],2);
        waveformViewer.configFile.triggerValueTimestamp.usecs = waveformViewer.padWithZero(secs[1],6);

    },
    parseDataType:function(row) {
        if (row.toUpperCase() == 'BINARY') {
            waveformViewer.configFile.isBinary = "true";
        } 
        else {
            waveformViewer.configFile.isBinary = "false";
        }
    },
    parseMultiplicationFactor:function(row) {
        waveformViewer.configFile.MultiplicationFactor = row;
    },
    padWithZero:function(number, length) {
        var my_string = '' + number;
        while (my_string.length < length) {
            my_string = '0' + my_string;
        }

        return my_string;
    },
    parseConfigFile:function(d) {
        var rows = d.split('\r\n');
        var rowIndex = 0;

        // Reset variables
        waveformViewer.analogChannelIndex = 0;
        waveformViewer.digitalChannelIndex = 0;
        waveformViewer.sampleIndex = 0;

        // Remove old parameters as needed

        // Parse the general information
        waveformViewer.parseGeneralInformation(rows[rowIndex]);
        rowIndex++;

        // Parse the channel information
        waveformViewer.parseChannelInformation(rows[rowIndex]);
        rowIndex++;

        // Parse analog channel information
        var index = 0;
        for ( index = 0; index < waveformViewer.configFile.numAnalogChannels; index++) {
            waveformViewer.parseAnalogChannelInformation(rows[rowIndex]);
            rowIndex++;
        }

        // Parse digital channel information
        for ( index = 0; index < waveformViewer.configFile.numDigitalChannels; index++) {
            waveformViewer.parseDigitalChannelInformation(rows[rowIndex]);
            rowIndex++;
        }

        // Parse nominal frequency
        waveformViewer.parseNominalFrequency(rows[rowIndex]);
        rowIndex++;

        // Parse Number of Samples
        waveformViewer.parseNumSamples(rows[rowIndex]);
        rowIndex++;

		// Parse sampling rate
		waveformViewer.parseSamplingRate(rows[rowIndex]);
		rowIndex++;				
																					   
        // Parse digital channel information
        waveformViewer.parseFirstValueTimestamp(rows[rowIndex]);
        rowIndex++;

        // Parse digital channel information
        waveformViewer.parseTriggerValueTimestamp(rows[rowIndex]);
        rowIndex++;

        // Parse digital channel information
        waveformViewer.parseDataType(rows[rowIndex]);
        rowIndex++;

        // Parse digital channel information
        waveformViewer.parseMultiplicationFactor(rows[rowIndex]);
        rowIndex++;
    },
    convertTimestampToString:function(timestamp) {
        // Take the date time parts from config file and create one date/time string
        var timeString = timestamp.year + "/" + timestamp.month + "/" + timestamp.day + ", " +
                         timestamp.hours + ":" + timestamp.minutes + ":" + timestamp.seconds  + "." + timestamp.usecs.substring(0,3);
        return timeString;
    },
    updateDisplayTimestamps:function(module) {
        // Update timestamps on the display
        var firstValueTimeString = waveformViewer.convertTimestampToString(waveformViewer.configFile.firstValueTimestamp);
        $('#'+module+'StartTime').text(jQuery('#startTimeLabel').text() + ' : ' + firstValueTimeString);
    },
    parseDataFile:function(module, d) {
        var dv = new DataView(d);
        var dataSize = d.byteLength;
        var sampleSize = 4 + 4 + (waveformViewer.configFile.numAnalogChannels * 2);
        var sampleIndex = 0;
        var tempOffset = 0;
        var tempSize = 0;
        var tempData = 0;
        var numSamples = dataSize / sampleSize;
        var numChannels = waveformViewer.configFile.numAnalogChannels;
        var index = 0;
        var i = 0;
        var currentChannel = 0;

        waveformViewer.numberOfSamples = numSamples;

        waveformViewer.stats.minValue = 255;
        waveformViewer.stats.maxValue = 0;

        waveformViewer.plotData.data = []
        
        var dataBuffer;
        for (i=0; i<numChannels; i++) {
            dataBuffer = new ArrayBuffer( numSamples );
            waveformViewer.plotData.data.splice(i,0,dataBuffer);
        }

        // Javscript does not support microSeconds natively in its timestamps. So, we have to use each component of time
        // and convert to microseconds for calculations below.
        // THIS CALCULATION ASSUMES THAT THE DURATION IS SHORTER THAN 24 HOURS.
        var FirstValueHours = parseFloat(waveformViewer.configFile.firstValueTimestamp.hours);
        var FirstValueMinutes = parseFloat(waveformViewer.configFile.firstValueTimestamp.minutes);
        var FirstValueSeconds = parseFloat(waveformViewer.configFile.firstValueTimestamp.seconds);
        var FirstValueMicroseconds = parseFloat(waveformViewer.configFile.firstValueTimestamp.usecs);
        var TriggerValueHours = parseFloat(waveformViewer.configFile.triggerValueTimestamp.hours);
        var TriggerValueMinutes = parseFloat(waveformViewer.configFile.triggerValueTimestamp.minutes);
        var TriggerValueSeconds = parseFloat(waveformViewer.configFile.triggerValueTimestamp.seconds);
        var TriggerValueMicroseconds = parseFloat(waveformViewer.configFile.triggerValueTimestamp.usecs);

        var FirstValueInMicroseconds = (FirstValueHours * waveformViewer.MICROSECONDS_PER_HOUR) +
                                         (FirstValueMinutes * waveformViewer.MICROSECONDS_PER_MINUTE) +
                                         (FirstValueSeconds * waveformViewer.MICROSECONDS_PER_SECOND) +
                                         (FirstValueMicroseconds);
        var TriggerValueInMicroseconds = (TriggerValueHours * waveformViewer.MICROSECONDS_PER_HOUR) +
                                           (TriggerValueMinutes * waveformViewer.MICROSECONDS_PER_MINUTE) +
                                           (TriggerValueSeconds * waveformViewer.MICROSECONDS_PER_SECOND) +
                                           (TriggerValueMicroseconds);

        var timeIncrementMicroseconds = waveformViewer.MICROSECONDS_PER_SECOND / waveformViewer.configFile.samplingRate;

        var Seconds = FirstValueSeconds;
        var Microseconds = FirstValueMicroseconds;

        var timestamp = 0;
        // Create data buffer for each channel
        for (index=0; index<numSamples; index++) {
            sampleIndex = index * sampleSize;
            tempOffset = 0;

            // Get sample data by parts
            tempSize = 4;
            waveformViewer.plotData.index[index] = dv.getUint32(sampleIndex, true);
            sampleIndex += tempSize;

            // Get timestamp 
            waveformViewer.plotData.time[index] = dv.getUint32(sampleIndex, true);
            sampleIndex += tempSize;

            // Check to see if max value(0xFFFFFFFF)
            if (waveformViewer.plotData.time[index] == waveformViewer.timeStampMaxValue)
            {
                if( index != 0 )
                {
                    Microseconds += timeIncrementMicroseconds;
                }
                if ( Microseconds >= waveformViewer.MICROSECONDS_PER_SECOND )
                {
                    Microseconds -= waveformViewer.MICROSECONDS_PER_SECOND;
                    Seconds += 1;
                }
                // Format should be "SS.uuuuu"
                timestamp = Seconds + (Microseconds/waveformViewer.MICROSECONDS_PER_SECOND);
                waveformViewer.plotData.time[index] = timestamp;
            }
            else
            {
                waveformViewer.plotData.time[index] = waveformViewer.plotData.time[index] * waveformViewer.configFile.MultiplicationFactor;
            }

            // Get data  
            tempSize = 2;
            for ( i=0;i<numChannels;i++) {
                currentChannel = waveformViewer.configFile.analogChannelList[i];
                tempData = (dv.getInt16(sampleIndex, true) * currentChannel.multiplier) + currentChannel.offset;
                sampleIndex += tempSize;
                
                waveformViewer.plotData.data[i][index] = tempData;

                if ( waveformViewer.plotData.data[i][index] < waveformViewer.stats.minValue) {
                    waveformViewer.stats.minValue = waveformViewer.plotData.data[i][index];
                }
                if ( waveformViewer.plotData.data[i][index] > waveformViewer.stats.maxValue) {
                    waveformViewer.stats.maxValue = waveformViewer.plotData.data[i][index];
                }
            }
        }
        waveformViewer.updateDisplayTimestamps(module);
        waveformViewer.createWaveform( module );
    },
    seData:function() {
        var waveform1 = [],waveform2 = [],
            waveform3 = [],waveform4 = [],
            waveform5 = [],waveform6 = [];

        var numChannels = waveformViewer.configFile.numAnalogChannels;
        var sample = 0;
        var time = 0;
            for (var sample=0;sample<waveformViewer.numberOfSamples;sample++) {
                time = waveformViewer.plotData.time[sample];
                switch(numChannels) {
                    case 6: // INTENTIONAL FALLTHROUGH
                        waveform6.push({x: time, y: waveformViewer.plotData.data[5][sample]});
                    case 5: // INTENTIONAL FALLTHROUGH
                        waveform5.push({x: time, y: waveformViewer.plotData.data[4][sample]});
                    case 4: // INTENTIONAL FALLTHROUGH
                        waveform4.push({x: time, y: waveformViewer.plotData.data[3][sample]});
                    case 3: // INTENTIONAL FALLTHROUGH
                        waveform3.push({x: time, y: waveformViewer.plotData.data[2][sample]});
                    case 2: // INTENTIONAL FALLTHROUGH
                        waveform2.push({x: time, y: waveformViewer.plotData.data[1][sample]});
                    case 1: // INTENTIONAL FALLTHROUGH
                        waveform1.push({x: time, y: waveformViewer.plotData.data[0][sample]});
                        break;
                    default:
                        break;
                }
            }

        var waveforms = [];
        var wv_data = [];
        var wv_key = '';
        var wv_color = '';

        for ( var channel=0;channel<numChannels;channel++) {
            waveformViewer.active[channel] = true;

            label = waveformViewer.configFile.analogChannelList[channel].channelId;
            wv_color = waveformViewer.getColorFromLabel(label);
            wv_key = label + " (" + waveformViewer.configFile.analogChannelList[channel].units + ")"

            wv_data = [];
            switch ( channel ) {
                case 0:
                    wv_data = waveform1;
                    break;
                case 1:
                    wv_data = waveform2;
                    break;
                case 2:
                    wv_data = waveform3;
                    break;
                case 3:
                    wv_data = waveform4;
                    break;
                case 4:
                    wv_data = waveform5;
                    break;
                case 5:
                    wv_data = waveform6;
                    break;
                default:
                    break;
            }
            waveforms.push({values: wv_data,key: wv_key, color: wv_color});
        }

        return waveforms
    },
    getColorFromLabel:function(label) {
        var color = "";
        switch( label ) {
            case "V1":
            case "V12":
            case "V13":
                color = waveformViewer.colors["DARK_RED"];
                break;
            case "V2":
            case "V23":
            case "V32":
                color = waveformViewer.colors["DARK_GREEN"];
                break;
            case "V3":
            case "V31":
            case "V21":
                color = waveformViewer.colors["DARK_BLUE"];
                break;
            case "V4":
                color = waveformViewer.colors["ORANGE"];
                break;
            case "V5":
                color = waveformViewer.colors["BLACK"];
                break;
            case "I1":
                color = waveformViewer.colors["VOILET"];
                break;
            case "I2":
                color = waveformViewer.colors["LIGHT_GREEN"];
                break;
            case "I3":
                color = waveformViewer.colors["CYAN"];
                break;
            case "I4":
                color = waveformViewer.colors["LIGHT_ORANGE"];
                break;
            case "I5":
                color = waveformViewer.colors["GRAY"];
                break;
            default:
                color = waveformViewer.colors["YELLOW"];
                break;
        }
        return color;
    },
    createWaveform:function( module ) {
        var chartID = '#'+module+'Waveform';
        var height=450,
        width=748,
        xmargin=80,
        topymargin=80,
        bottomymargin=100;
        $('#'+module+'Waveform').empty();

        height = window.innerHeight - $('#header').height() - $('#tabs').height() - 200;

        var xAxisLabel = jQuery('#xAxisLabel').text();

        var chart = nv.models.lineWithFocusChart()
                             .useInteractiveGuideline(true)
                             .height(height);

        chart.tooltip.enabled();
        chart.interactiveLayer.tooltip.headerFormatter(function(d){return xAxisLabel + " : " + d });

        chart.margin({"bottom":50});

        chart.xAxis
            .axisLabel(xAxisLabel)
            .tickFormat(d3.format(',.5f'));
            
        chart.x2Axis
            .tickFormat(d3.format(',.5f'));
                    
        chart.yAxis
            .axisLabel(jQuery('#yAxisLabel').text())
            .tickFormat(d3.format(',f'));

        chart.y2Axis
            .tickFormat(d3.format(',f'));

        d3.select(chartID)
            .append("svg:svg")
            .attr("height", height)
            .datum(waveformViewer.seData())
            .transition().duration(250)
            .call(chart)
            .each("end", function() { $('#'+module+'Throbber').hide()});

          nv.utils.windowResize(chart.update);
          
          return chart;
    },
};

