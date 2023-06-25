function dummyData (reqObject)
{
	
	// TODO Setup Fake Data
	switch(reqObject.url) {
		case "/api/getLanguageList":
			var data = ["English US","English UK","French","Spanish","German","Italian","Polish","Portuguese","Turkish","Chinese","Russian","Arabic","Dutch"];
			
			return data;
		break;
		case "/api/getLoggedInUser":
			var data = {"userName":"UserOne"};
			return data;
		break;
		case "/api/userLogout":
			var data = "";
			return data;
		break;
		case "/api/diagnostics/phasorData":
			var data = {
				"result":
					{						"v1Label": "Va",
						"v2Label": "Vb",						"v3Label": "Vc",						"i1Label": "Ia",						"i2Label": "Ib",						"i3Label": "Ic",						"i4Label": "I4",						"v1Amplitude": (Math.random() * 60 + 20).toFixed(3),
						"v1Angle": (0 + Math.random() * 10 - 5).toFixed(3),
						"v2Amplitude": (Math.random() * 60 + 20).toFixed(3),
						"v2Angle": (240.1 + Math.random() * 10 - 5).toFixed(3),
						"v3Amplitude": (Math.random() * 60 + 20).toFixed(3),
						"v3Angle": (120.1 + Math.random() * 10 - 5).toFixed(3),
						"v4Amplitude": (Math.random() * 60 + 20).toFixed(3),
						"v4Angle": (30.1 + Math.random() * 10 - 5).toFixed(3),
						"i1Amplitude":  (Math.random() * 60 + 20).toFixed(3),
						"i1Angle": (217 + Math.random() * 10 - 5).toFixed(3),
						"i2Amplitude":  (Math.random() * 60 + 20).toFixed(3),
						"i2Angle": (95.6 + Math.random() * 10 - 5).toFixed(3),
						"i3Amplitude":  (Math.random() * 60 + 20).toFixed(3),
						"i3Angle": (150 + Math.random() * 10 - 5).toFixed(3),
						"i4Amplitude": (Math.random() * 3 + 2).toFixed(3)
						// not implemented by API: "i4Angle": (150 + Math.random() * 10 - 5).toFixed(3)
					}
			}
			return data;
		break;
		case "/api/trendTopics":
			
			var data = {
				topics:[
					"kW sd del-rec",
					"Vll ab",
					"Vll bc",
					"Vll ca",
					"Vll avg",
					"Freq",
					"I a mean",
					"I b mean",
					"I c mean",
					"I avg mean"
				],
				translatedTopics:[
					"kW sd del-rec",
					"Vll ab",
					"Vll bc",
					"Vll ca",
					"Vll avg",
					"Freq",
					"I a mean",
					"I b mean",
					"I c mean",
					"I avg mean"
				]
			}

			return data;
		break;
		case "/api/trendValues/kW sd del-rec?timeScale=hour":
		case "/api/trendValues/kW sd del-rec?timeScale=day":
		case "/api/trendValues/kW sd del-rec?timeScale=week":
		case "/api/trendValues/kW sd del-rec?timeScale=month":
		case "/api/trendValues/Vll abtimeScale=hour":
		case "/api/trendValues/Vll abtimeScale=day":
		case "/api/trendValues/Vll abtimeScale=week":
		case "/api/trendValues/Vll abtimeScale=month":
		case "/api/trendValues/Vll bc?timeScale=hour":
		case "/api/trendValues/Vll bc?timeScale=day":
		case "/api/trendValues/Vll bc?timeScale=week":
		case "/api/trendValues/Vll bc?timeScale=month":
		case "/api/trendValues/Vll ca?timeScale=hour":
		case "/api/trendValues/Vll ca?timeScale=day":
		case "/api/trendValues/Vll ca?timeScale=week":
		case "/api/trendValues/Vll ca?timeScale=month":
		case "/api/trendValues/Vll avg?timeScale=hour":
		case "/api/trendValues/Vll avg?timeScale=day":
		case "/api/trendValues/Vll avg?timeScale=week":
		case "/api/trendValues/Vll avg?timeScale=month":
		case "/api/trendValues/Freq?timeScale=hour":
		case "/api/trendValues/Freq?timeScale=day":
		case "/api/trendValues/Freq?timeScale=week":
		case "/api/trendValues/Freq?timeScale=month":     
		case "/api/trendValues/I a mean?timeScale=hour":
		case "/api/trendValues/I a mean?timeScale=day":
		case "/api/trendValues/I a mean?timeScale=week":
		case "/api/trendValues/I a mean?timeScale=month":
		case "/api/trendValues/I b mean?timeScale=hour":
		case "/api/trendValues/I b mean?timeScale=day":
		case "/api/trendValues/I b mean?timeScale=week":
		case "/api/trendValues/I b mean?timeScale=month":
		case "/api/trendValues/I c mean?timeScale=hour":
		case "/api/trendValues/I c mean?timeScale=day":
		case "/api/trendValues/I c mean?timeScale=week":
		case "/api/trendValues/I c mean?timeScale=month":
		case "/api/trendValues/I avg mean?timeScale=hour":
		case "/api/trendValues/I avg mean?timeScale=day":
		case "/api/trendValues/I avg mean?timeScale=week":
		case "/api/trendValues/I avg mean?timeScale=month":
		
			var numRecords = 0;
			var increment = 0;
			switch(reqObject["url"].split("?timeScale=")[1]) {
				case "hour":
					numRecords=24;
					increment = 1;
					break;
				case "day":
					numRecords=28;
					increment = 24;
					break;
				case "week":
					numRecords=8;
					increment = 24 * 7;
					break;
				case "month":
					numRecords=12;
					increment = 24 * 30;
					break;
			}
			var data = {
				"result":
				{
					"dateTimeInfo":
					{
						"hour": "1",
						"dayOfMonth":"10",
						"month":"July",
						"year": "2013",
						"weekday":"Wednesday",
						"weekMonth": "2",
						"weekYear": "28",
						"daysInMonth": "31"
					},
					"values":[{}],
					"forecastedValues":[{}]
				}
				
			};
			
			var maxVal = 1*2;
			var negVal = (maxVal/2);
			var naValues=0;
			//if(Math.random()*4>4) { naValues=Math.floor(Math.random() * numRecords-1) };
			
			switch(reqObject.url.split(/[\/\?]/)[3]) {
				case "kW sd del-rec":
					maxVal = 200;
					minVal = 0;
					break;
				case "Vll ab":
					maxVal = 20000;
					minVal = 0;
					break;
				case "Vll bc":
					maxVal = 10000;
					minVal = 0;
					break;
				case "Vll ca":
					maxVal = 10000;
					minVal = 0;
					break;
				case "Vll avg":
					maxVal = 10000;
					minVal = 0;
					break;
				case "Freq":
					maxVal = 1;
					minVal = -1;
					break;
				case "I a mean":
					maxVal = 65;
					minVal = 55;
					break;
				case "I b mean":
					maxVal = 1;
					minVal = 0;
					break;
				case "I c mean":
					maxVal = 1;
					minVal = 0;
					break;
				case "I avg mean":
					maxVal = 1;
					minVal = 0;
					break;
			}
			
			var currentAvg = (Math.random() * (maxVal+(0-minVal))) - (0-minVal);
			for(var i=0;i<numRecords;i++) {
				if(naValues>i) {
					data['result']['values'].push({
						"tsSeconds":1379462400 + i * increment * 60 * 60,
						"min":"n/a",
						"max":"n/a",
						"avg":"n/a"
					});
				} else {
					var mn= currentAvg * (1 - (Math.random() / 10));
					if (mn < minVal) mn = minVal;
					var mx= currentAvg * (1 + (Math.random() / 10));
					if (mx > maxVal) mx = maxVal;
					var av=currentAvg;
					if((Math.random() * 10)>9) {
						mn="-";
					}
					if((Math.random() * 10)>9) {
						mx="-";
					}
					if((Math.random() * 10)>9) {
						av="-";
					}
					data['result']["values"].push({
						"tsSeconds":1379462400 + i * increment * 60 * 60,
						"min":mn,
						"max":mx,
						"avg":av
					});
					currentAvg *= 1 + (0.05 - (Math.random() / 10));
					if (currentAvg > maxVal) currentAvg = maxVal;
					if (currentAvg < minVal) currentAvg = minVal;
				}
			}
			if(Math.random() * 3 > 1) {
				for(var i=0;i<6;i++) {
					var mn= currentAvg * (1 - (Math.random() / 10));
					if (mn < minVal) mn = minVal;
					var mx= currentAvg * (1 + (Math.random() / 10));
					if (mx > maxVal) mx = maxVal;
					var av=currentAvg;
					data['result']["forecastedValues"].push({
						"tsSeconds":1379462400 + i * increment * 60 * 60,
						"min":mn,
						"max":mx,
						"avg":av
					});
					currentAvg *= 1 + (0.05 - (Math.random() / 10));
					if (currentAvg > maxVal) currentAvg = maxVal;
					if (currentAvg < minVal) currentAvg = minVal;
				}
			}
			
			return data;
		break;
		
		case "/api/getVoltWaveData":
			var data = [
				[ 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40],
				[-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60],
				[-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40, 40, 60, 40,-40,-60,-40]
			];
			
			for(var i = 0;i<data.length;i++) {
				for(var j=0;j<data[i].length;j++) {
					data[i][j] = data[i][j] + Math.random() * 10 - 5
				}
			}
			return data;
		break;
		case "/api/getAmpWaveData":
			var data = [
				[ .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40],
				[-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60],
				[-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40, .40, .60, .40,-.40,-.60,-.40]
			];
			for(var i = 0;i<data.length;i++) {
				for(var j=0;j<data[i].length;j++) {
					data[i][j] = data[i][j] + Math.random() * 2 - 1
				}
			}
			return data;
		break;

		case "/api/registerValues/getRegisterValues":
			
			// Return only one object for Timestamp
			if(jQuery.parseJSON(reqObject["serializedData"])["names"] == "LocalTime")
			{
				// Get current time
				// var utc = new Date().getTime() / 1000;
				
				// Clock Time (displayed in header)
				var data = {
					"result":[
					{	
						"name": "CL1 UnivTime",
						"value": "946665475",
						"units": ""
					}
				]};
				
				return data;
			}
			
			var data = {
				"result":[
					{	
						"name": "I a mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I a",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I a mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I b mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I b",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I b mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I b mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I b",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I b mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I4 mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I 4",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I4 mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I5 mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I 5",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I5 mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I avg low",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I avg",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I avg mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "currentUnbalanceMin",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I unbal",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "currentUnbalanceMax",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "kW tot mn",
						"value": Math.floor(Math.random()*1000),
						"units": ""
					},
					{	
						"name": "kW tot",
						"value": Math.floor(Math.random()*1000),
						"units": ""
					},
					{	
						"name": "kW tot max",
						"value": Math.floor(Math.random()*1000),
						"units": ""
					},
					{	
						"name": "kW tot mn",
						"value": Math.floor(Math.random()*100),
						"units": ""
					},
					{	
						"name": "kW tot",
						"value": Math.floor(Math.random()*100),
						"units": ""
					},
					{	
						"name": "kW tot max",
						"value": Math.floor(Math.random()*100),
						"units": ""
					},
					{	
						"name": "kVA tot mn",
						"value": Math.floor(Math.random()*1000),
						"units": ""
					},
					{	
						"name": "kVA tot",
						"value": Math.floor(Math.random()*1000),
						"units": ""
					},
					{	
						"name": "kVA tot max",
						"value": Math.floor(Math.random()*1000),
						"units": ""
					},
					{	
						"name": "powerFactorTotalMin",
						"value": Math.round(Math.random()*1000)/1000,
						"units": ""
					},
					{	
						"name": "PF sign tot",
						"value": Math.round(Math.random()*1000)/1000,
						"units": ""
					},
					{	
						"name": "powerFactorTotalMax",
						"value": Math.round(Math.random()*1000)/1000,
						"units": ""
					},
					{	
						"name": "Vll avg mn",
						"value": Math.floor(Math.random()*1000),
						"units": ""
					},
					{	
						"name": "Vll avg",
						"value": Math.floor(Math.random()*1000),
						"units": ""
					},
					{	
						"name": "Vll avg mx",
						"value": Math.floor(Math.random()*1000),
						"units": ""
					},
					{	
						"name": "Vln avg mn",
						"value": Math.floor(Math.random()*1000),
						"units": ""
					},
					{	
						"name": "Vln avg",
						"value": Math.floor(Math.random()*1000),
						"units": ""
					},
					{	
						"name": "Vln avg mx",
						"value": Math.floor(Math.random()*1000),
						"units": ""
					},
					{	
						"name": "Freq min",
						"value": Math.round(Math.random()*10000)/100,
						"units": ""
					},
					{	
						"name": "Freq",
						"value": Math.round(Math.random()*10000)/100,
						"units": ""
					},
					{	
						"name": "Freq max",
						"value": Math.round(Math.random()*10000)/100,
						"units": ""
					},
					{	
						"name": "loadTimerMin",
						"value": Math.round(Math.random()*100),
						"units": ""
					},
					{	
						"name": "loadTimerPresent",
						"value": Math.round(Math.random()*100),
						"units": ""
					},
					{	
						"name": "loadTimerMax",
						"value": Math.round(Math.random()*100),
						"units": ""
					},
					
					
					// Setup > Ethernet & TCP/IP
					{	
						"name": "macAddress",
						"value": "00:80:67:81:65:21",
						"units": ""
					},
					{	
						"name": "IP1",
						"value": "192",
						"units": ""
					},
					{	
						"name": "IP2",
						"value": "168",
						"units": ""
					},
					{	
						"name": "IP3",
						"value": "2",
						"units": ""
					},
					{	
						"name": "IP4",
						"value": "212",
						"units": ""
					},
					{	
						"name": "subnetMask1",
						"value": "192",
						"units": ""
					},
					{	
						"name": "subnetMask2",
						"value": "168",
						"units": ""
					},
					{	
						"name": "subnetMask3",
						"value": "10",
						"units": ""
					},
					{	
						"name": "subnetMask4",
						"value": "119",
						"units": ""
					},
					{	
						"name": "defaultGateway1",
						"value": "192",
						"units": ""
					},
					{	
						"name": "defaultGateway2",
						"value": "168",
						"units": ""
					},
					{	
						"name": "defaultGateway3",
						"value": "10",
						"units": ""
					},
					{	
						"name": "defaultGateway4",
						"value": "10",
						"units": ""
					},
					{	
						"name": "dns1",
						"value": "192",
						"units": ""
					},
					{	
						"name": "dns2",
						"value": "168",
						"units": ""
					},
					{	
						"name": "dns3",
						"value": "100",
						"units": ""
					},
					{	
						"name": "dns4",
						"value": "3",
						"units": ""
					},
					{	
						"name": "secondaryDns1",
						"value": "192",
						"units": ""
					},
					{	
						"name": "secondaryDns2",
						"value": "168",
						"units": ""
					},
					{	
						"name": "secondaryDns3",
						"value": "100",
						"units": ""
					},
					{	
						"name": "secondaryDns4",
						"value": "6",
						"units": ""
					},
					{	
						"name": "tcpTimeToLive",
						"value": "60",
						"units": ""
					},
					{	
						"name": "udpTimeToLive",
						"value": "30",
						"units": ""
					},
					{	
						"name": "tcpKeepAlive",
						"value": "30",
						"units": ""
					},
					{	
						"name": "httpConnectionIdleTime",
						"value": "4",
						"units": ""
					},
					{	
						"name": "httpPortNumber",
						"value": "80",
						"units": ""
					},
					{	
						"name": "arpCacheTimeout",
						"value": "15",
						"units": ""
					},
					{	
						"name": "ftpServerRegister",
						"value": "Disabled",
						"units": ""
					},
					{	
						"name": "ipv6LinkLocalAddress",
						"value": "Disabled",
						"units": ""
					},
					{	
						"name": "dpwsRegister",
						"value": "Disabled",
						"units": ""
					},
					{	
						"name": "modbusTCIPRegister",
						"value": "Disabled",
						"units": ""
					},
					{	
						"name": "modbusBroadcastRegister",
						"value": "Disabled",
						"units": ""
					},
					{	
						"name": "ftpConnectionIdleTime",
						"value": "30",
						"units": ""
					},
					{	
						"name": "modbusTCPIPServerConnectionIdleTime",
						"value": "0",
						"units": ""
					},
					{	
						"name": "snmpDataCacheTimeout",
						"value": "5",
						"units": ""
					},
					
					// Setup > Serial Port
					{
						"name": "protocol",
						"value": "RS232",
						"units": ""
					},
					{
						"name": "baudRate",
						"value": "19200",
						"units": ""
					},
					{
						"name": "unitID",
						"value": "65",
						"units": ""
					},
					{	
						"name": "responseTimeout",
						"value": "4000",
						"units": ""
					},
					{	
						"name": "transmissionDelay",
						"value": "2000",
						"units": ""
					},
					{	
						"name": "paritySerialPortValues",
						"value": "8N1",
						"units": ""
					},
					{	
						"name": "rtsLevel",
						"value": "42",
						"units": ""
					},
					{	
						"name": "ctsLevel",
						"value": "43",
						"units": ""
					},
					{	
						"name": "rtsDelay",
						"value": "44",
						"units": ""
					},
					{	
						"name": "delayBetweenFrames",
						"value": "45",
						"units": ""
					},
					{	
						"name": "silentIntercolExtension",
						"value": "46",
						"units": ""
					},
					{	
						"name": "modbusTimeoutExceptionCode",
						"value": "47",
						"units": ""
					},
					
					// Setup > SNMP Parameters
					{	
						"name": "systemContact",
						"value": "John Doe",
						"units": ""
					},
					{	
						"name": "systemName",
						"value": "Doe Industries",
						"units": ""
					},
					{	
						"name": "systemLocation",
						"value": "New York City",
						"units": ""
					},
					{	
						"name": "readOnlyCommunityName",
						"value": "Community Name",
						"units": ""
					},
					{	
						"name": "readWriteCommunityName",
						"value": "47",
						"units": "Community Name"
					},
					{	
						"name": "trapReceiver1IPAddress",
						"value": "111.111.111.111",
						"units": ""
					},
					{	
						"name": "trapReceiver2IPAddress",
						"value": "222.222.222.222",
						"units": ""
					},
					{	
						"name": "trapReceiver3IPAddress",
						"value": "333.333.333.333",
						"units": ""
					},
					{	
						"name": "trapReceiver4IPAddress",
						"value": "444.444.444.444",
						"units": ""
					},
					
					// Setup > NPT/SMTP
					{	
						"name": "serverAddress1",
						"value": "123",
						"units": ""
					},
					{	
						"name": "serverAddress2",
						"value": "456",
						"units": ""
					},
					{	
						"name": "serverAddress3",
						"value": "789",
						"units": ""
					},
					{	
						"name": "serverAddress4",
						"value": "123",
						"units": ""
					},
					{	
						"name": "port",
						"value": "80",
						"units": ""
					},
					{	
						"name": "connectionTimeout",
						"value": "20000",
						"units": ""
					},
					
					// Setup > Date And Time
					{	
						"name": "serverAddress1",
						"value": "111",
						"units": ""
					},
					{	
						"name": "serverAddress2",
						"value": "222",
						"units": ""
					},
					{	
						"name": "serverAddress3",
						"value": "333",
						"units": ""
					},
					{	
						"name": "serverAddress4",
						"value": "444",
						"units": ""
					},
					{	
						"name": "portNumber",
						"value": "88",
						"units": ""
					},
					{	
						"name": "syncMode",
						"value": "Combo Box",
						"units": ""
					},
					{	
						"name": "syncInterval",
						"value": "2000",
						"units": ""
					},
					
					
					{	
						"name": "localTimezoneOffset",
						"value": "UTC -8:00",
						"units": ""
					},
					{	
						"name": "dstOffset",
						"value": "-1",
						"units": ""
					},
					{	
						"name": "clockSource",
						"value": "Clock Source",
						"units": ""
					},
					{	
						"name": "syncStatus",
						"value": "Clock Source",
						"units": ""
					},
					{	
						"name": "syncStatus",
						"value": "OK",
						"units": ""
					},
					{	
						"name": "networkTimeServerAddress1_1",
						"value": "123",
						"units": ""
					},
					{	
						"name": "networkTimeServerAddress1_2",
						"value": "456",
						"units": ""
					},
					{	
						"name": "networkTimeServerAddress1_3",
						"value": "789",
						"units": ""
					},
					{	
						"name": "networkTimeServerAddress1_4",
						"value": "001",
						"units": ""
					},
					{	
						"name": "networkTimeServerAddress1_2",
						"value": "456",
						"units": ""
					},
					{	
						"name": "currentDate",
						"value": "07/22/2013",
						"units": ""
					},
					{	
						"name": "currentTimeHours",
						"value": "18",
						"units": ""
					},
					{	
						"name": "currentTimeMinutes",
						"value": "30",
						"units": ""
					},
					{	
						"name": "currentTimeSeconds",
						"value": "59",
						"units": ""
					},
					
					// Setup > FTP Settings
					{	
						"name": "ftpPort",
						"value": "21",
						"units": ""
					},
					{	
						"name": "enableFTP",
						"value": "Enabled",
						"units": ""
					},
					
					// Setup > Preferences
					{	
						"name": "equipmentName",
						"value": "PowerLogic PM8000",
						"units": ""
					},
					{	
						"name": "owner",
						"value": "Vandelay Industries",
						"units": ""
					},
					{	
						"name": "tag1",
						"value": "Tag A",
						"units": ""
					},
					{	
						"name": "tag2",
						"value": "Tag B",
						"units": ""
					},
					
					// Setup > Metering
					{	
						"name": "Volts Mode",
						"value": "DEMO",
						"units": ""
					},
					{	
						"name": "PM1 PT Prim",
						"value": "120.00",
						"units": ""
					},
					{	
						"name": "PM1 PT Sec",
						"value": "120.00",
						"units": ""
					},
					{	
						"name": "PM1 CT Prim",
						"value": "5000.00",
						"units": ""
					},
					{	
						"name": "PM1 CT Sec",
						"value": "5.00",
						"units": ""
					},
					{	
						"name": "I4 CT Prim",
						"value": "5.00",
						"units": ""
					},
					{	
						"name": "PM1 I4 CT Sec",
						"value": "5.00",
						"units": ""
					},
					{	
						"name": "v1Polarity",
						"value": "Normal",
						"units": ""
					},
					{	
						"name": "v2Polarity",
						"value": "Normal",
						"units": ""
					},
					{	
						"name": "v3Polarity",
						"value": "Normal",
						"units": ""
					},
					{	
						"name": "i1Polarity",
						"value": "Normal",
						"units": ""
					},
					{	
						"name": "i2Polarity",
						"value": "Normal",
						"units": ""
					},
					{	
						"name": "i3Polarity",
						"value": "Normal",
						"units": ""
					},
					{	
						"name": "I4 Polarity",
						"value": "Normal",
						"units": ""
					},
					{	
						"name": "rotationSelection",
						"value": "A B C",
						"units": ""
					},
					{	
						"name": "FAC1 Inominal",
						"value": "20.00",
						"units": ""
					},
					{	
						"name": "F Nominal",
						"value": "60.00",
						"units": "Hz"
					},
					{	
						"name": "powerSubInterval",
						"value": "900.00",
						"units": ""
					},
					{	
						"name": "powerNumSubIntervals",
						"value": "1.00",
						"units": ""
					},
					{	
						"name": "powerPredictedResponse",
						"value": "1.00",
						"units": ""
					},
					{	
						"name": "currentSubInterval",
						"value": "900.00",
						"units": ""
					},
					{	
						"name": "currentNumSubIntervals",
						"value": "1.00",
						"units": ""
					},
					{	
						"name": "currentPredictedResponse",
						"value": "1.00",
						"units": ""
					},
					{	
						"name": "incrementalEnergyInterval",
						"value": "900.00",
						"units": ""
					},
					{	
						"name": "distortionType",
						"value": "THD",
						"units": ""
					},
					{	
						"name": "IEC / NEMA",
						"value": "900.00",
						"units": ""
					},
					{	
						"name": "ctCompresssionPerPhase",
						"value": "42.00",
						"units": ""
					},
					{	
						"name": "vtCompresssionPerPhase",
						"value": "42.00",
						"units": ""
					},
					
					// Setup > Sag/Swell Setup
					{	
						"name": "voltageSwellLimit",
						"value": "256.00",
						"units": ""
					},
					{	
						"name": "voltageSagLimit",
						"value": "230.00",
						"units": ""
					},
					{	
						"name": "currentSwellLimit",
						"value": "23.00",
						"units": ""
					},
					{	
						"name": "currentSagLimit",
						"value": "18.00",
						"units": ""
					},
					{	
						"name": "changeCriteria",
						"value": "42",
						"units": ""
					},
					{	
						"name": "learnedSwellLimit",
						"value": "250.42",
						"units": ""
					},
					{	
						"name": "learnedSagLimit",
						"value": "232.42",
						"units": ""
					},
					{	
						"name": "learnedDuration",
						"value": "60.00",
						"units": ""
					},
					{	
						"name": "learnMode",
						"value": "learn mode",
						"units": ""
					},
					
					// Setup > User Accounts
					{	
						"name": "userRights1",
						"value": "Basic, Admin",
						"units": ""
					},
					{	
						"name": "userRights2",
						"value": "Basic",
						"units": ""
					},
					{	
						"name": "userRights3",
						"value": "Read",
						"units": ""
					},
					{	
						"name": "userRights4",
						"value": "Test Mode",
						"units": ""
					},
					{	
						"name": "userRights5",
						"value": "Security Config",
						"units": ""
					},
					{	
						"name": "userRights6",
						"value": "Time Sync",
						"units": ""
					},
					{	
						"name": "userRights7",
						"value": "Full Meter Config",
						"units": ""
					},
					{	
						"name": "userRights8",
						"value": "Basic",
						"units": ""
					},
					{	
						"name": "userRights9",
						"value": "Basic",
						"units": ""
					},
					{	
						"name": "userRights10",
						"value": "Basic",
						"units": ""
					},
					{	
						"name": "userRights11",
						"value": "Basic",
						"units": ""
					},
					{	
						"name": "userRights12",
						"value": "Basic",
						"units": ""
					},
					{	
						"name": "userRights13",
						"value": "Basic",
						"units": ""
					},
					{	
						"name": "userRights14",
						"value": "Basic",
						"units": ""
					},
					{	
						"name": "userRights15",
						"value": "Basic",
						"units": ""
					},
					{	
						"name": "userRights16",
						"value": "Basic",
						"units": ""
					},
					// Clock Time (displayed in header)
					{	
						"name": "CL1 UnivTime",
						"value": "946836971",
						"units": ""
					},
					// nominal frequency and voltage (used by ITIC/SEMI graph and Setup > Metering form)
					{	
						"name": "F Nominal",
						"value": "60.00",
						"units": "Hz"
					},
					{	
						"name": "V Nominal",
						"value": "120",
						"units": "V"
					},
					
					// Monitoring > Inputs / Outputs
					{	
						"name": "DI1 State",
						"value": "N/A",
						"units": ""
					},
					{	
						"name": "DI1 Count",
						"value": "0",
						"units": ""
					},
					{	
						"name": "DI2 State",
						"value": "N/A",
						"units": ""
					},
					{	
						"name": "DI2 Count",
						"value": "0",
						"units": ""
					},
					{	
						"name": "DI3 State",
						"value": "N/A",
						"units": ""
					},
					{	
						"name": "DI3 Count",
						"value": "0",
						"units": ""
					},
					{	
						"name": "_HMI_PortDO1_data",
						"value": "Unused",
						"units": ""
					},
					
					// Monitoring > Power Quality Summary > EN50160
					{	
						"name": "Freq N",
						"value": "608",
						"units": ""
					},
					{	
						"name": "Freq N invld",
						"value": "40",
						"units": ""
					},
					{	
						"name": "Freq N1",
						"value": "3",
						"units": ""
					},
					{	
						"name": "Freq N2",
						"value": "0",
						"units": ""
					},
					{	
						"name": "Freq N1/N",
						"value": "0.5%",
						"units": ""
					},
					{	
						"name": "Freq N2/N",
						"value": "0.0%",
						"units": ""
					},
					{	
						"name": "PO Freq N",
						"value": "1000",
						"units": ""
					},
					{	
						"name": "Not Available",
						"value": "-",
						"units": ""
					},
					{	
						"name": "PO Freq N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO Freq N2",
						"value": "0",
						"units": ""
					},
					{	
						"name": "PO Freq N1/N",
						"value": "0.1%",
						"units": ""
					},
					{	
						"name": "PO Freq N2/N",
						"value": "0.0",
						"units": ""
					},
					
					{	
						"name": "V1-Mag N",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Mag N invld",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Mag N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Mag N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Mag N1/N",
						"value": "2.2%",
						"units": ""
					},
					{	
						"name": "V1-Mag N2/N",
						"value": "0.0%",
						"units": ""
					},
					{	
						"name": "V2-Mag N",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Mag N invld",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Mag N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Mag N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Mag N1/N",
						"value": "4.9%",
						"units": ""
					},
					{	
						"name": "V2-Mag N2/N",
						"value": "0.2%",
						"units": ""
					},
					{	
						"name": "V3-Mag N",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Mag N invld",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Mag N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Mag N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Mag N1/N",
						"value": "3.2%",
						"units": ""
					},
					{	
						"name": "V3-Mag N2/N",
						"value": "0.0%",
						"units": ""
					},
					
					{	
						"name": "PO V1-Mag N",
						"value": "1",
						"units": ""
					},
					{	
						"name": "Not Available",
						"value": "-",
						"units": ""
					},
					{	
						"name": "PO V1-Mag N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Mag N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Mag N1/N",
						"value": "4.9%",
						"units": ""
					},
					{	
						"name": "PO V1-Mag N2/N",
						"value": "0.0%",
						"units": ""
					},
					{	
						"name": "PO V2-Mag N",
						"value": "1",
						"units": ""
					},
					{	
						"name": "Not Available",
						"value": "-",
						"units": ""
					},
					{	
						"name": "PO V2-Mag N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Mag N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Mag N1/N",
						"value": "5.0%",
						"units": ""
					},
					{	
						"name": "PO V2-Mag N2/N",
						"value": "0.0%",
						"units": ""
					},
					{	
						"name": "PO V3-Mag N",
						"value": "1",
						"units": ""
					},
					{	
						"name": "Not Available",
						"value": "-",
						"units": ""
					},
					{	
						"name": "PO V3-Mag N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Mag N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Mag N1/N",
						"value": "5.1%",
						"units": ""
					},
					{	
						"name": "PO V3-Mag N2/N",
						"value": "0.1%",
						"units": ""
					},
					
					{	
						"name": "Vunbal N",
						"value": "608",
						"units": ""
					},
					{	
						"name": "Vunbal N invld",
						"value": "40",
						"units": ""
					},
					{	
						"name": "Vunbal N1",
						"value": "35",
						"units": ""
					},
					{	
						"name": "Vunbal N1/N",
						"value": "5.8%",
						"units": ""
					},
					{	
						"name": "PO Vunbal N",
						"value": "1000",
						"units": ""
					},
					{	
						"name": "Not Available",
						"value": "-",
						"units": ""
					},
					{	
						"name": "PO Vunbal N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO Vunbal N1/N",
						"value": "0.1%",
						"units": ""
					},
					
					{	
						"name": "V1-Hrm N",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Hrm N invld",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Hrm N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Hrm N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Hrm N1/N",
						"value": "2.5%",
						"units": ""
					},
					{	
						"name": "V1-Hrm N2/N",
						"value": "0.0%",
						"units": ""
					},
					{	
						"name": "V2-Hrm N",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Hrm N invld",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Hrm N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Hrm N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Hrm N1/N",
						"value": "3.1%",
						"units": ""
					},
					{	
						"name": "V2-Hrm N2/N",
						"value": "0.0",
						"units": ""
					},
					{	
						"name": "V3-Hrm N",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Hrm N invld",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Hrm N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Hrm N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Hrm N1/N",
						"value": "2.8%",
						"units": ""
					},
					{	
						"name": "V3-Hrm N2/N",
						"value": "5.1%",
						"units": ""
					},
					
					{	
						"name": "PO V1-Hrm N",
						"value": "1",
						"units": ""
					},
					{	
						"name": "Not Available",
						"value": "-",
						"units": ""
					},
					{	
						"name": "PO V1-Hrm N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Hrm N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Hrm N1/N",
						"value": "1.2%",
						"units": ""
					},
					{	
						"name": "PO V1-Hrm N2/N",
						"value": "0.0%",
						"units": ""
					},
					{	
						"name": "PO V2-Hrm N",
						"value": "1",
						"units": ""
					},
					{	
						"name": "Not Available",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Hrm N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Hrm N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Hrm N1/N",
						"value": "0.8%",
						"units": ""
					},
					{	
						"name": "PO V2-Hrm N2/N",
						"value": "0.0%",
						"units": ""
					},
					{	
						"name": "PO V3-Hrm N",
						"value": "1",
						"units": ""
					},
					{	
						"name": "Not Available",
						"value": "-",
						"units": ""
					},
					{	
						"name": "PO V3-Hrm N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Hrm N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Hrm N1/N",
						"value": "2.2%",
						"units": ""
					},
					{	
						"name": "PO V3-Hrm N2/N",
						"value": "0.0%",
						"units": ""
					},
					
					{	
						"name": "V1-Ovrvlt T1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Ovrvlt T2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Ovrvlt T3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Ovrvlt T4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Ovrvlt T1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Ovrvlt T2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Ovrvlt T3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Ovrvlt T4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Ovrvlt T1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Ovrvlt T2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Ovrvlt T3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Ovrvlt T4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Ovrvlt S1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Ovrvlt S2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Ovrvlt S3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Ovrvlt S4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Ovrvlt S1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Ovrvlt S2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Ovrvlt S3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Ovrvlt S4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Ovrvlt S1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Ovrvlt S2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Ovrvlt S3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Ovrvlt S4",
						"value": "1",
						"units": ""
					},
					
					{	
						"name": "PO V1-Ovlt T1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Ovlt T2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Ovlt T3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Ovlt T4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Ovlt T1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Ovlt T2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Ovlt T3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Ovlt T4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Ovlt T1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Ovlt T2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Ovlt T3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Ovlt T4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Ovlt S1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Ovlt S2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Ovlt S3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Ovlt S4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Ovlt S1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Ovlt S2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Ovlt S3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Ovlt S4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Ovlt S1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Ovlt S2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Ovlt S3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Ovlt S4",
						"value": "1",
						"units": ""
					},
					
					{	
						"name": "V1-Dip A1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip A2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip A3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip A4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip A5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip A1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip A2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip A3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip A4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip A5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip A1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip A2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip A3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip A4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip A5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip B1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip B2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip B3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip B4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip B5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip B1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip B2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip B3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip B4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip B5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip B1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip B2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip B3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip B4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip B5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip C1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip C2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip C3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip C4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip C5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip C1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip C2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip C3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip C4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip C5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip C1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip C2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip C3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip C4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip C5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip D1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip D2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip D3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip D4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip D5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip D1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip D2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip D3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip D4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip D5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip D1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip D2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip D3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip D4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip D5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip X1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip X2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip X3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip X4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Dip X5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip X1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip X2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip X3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip X4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Dip X5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip X1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip X2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip X3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip X4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Dip X5",
						"value": "1",
						"units": ""
					},
					
					{	
						"name": "PO V1-Dip A1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip A2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip A3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip A4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip A5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip A1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip A2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip A3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip A4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip A5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip A1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip A2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip A3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip A4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip A5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip B1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip B2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip B3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip B4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip B5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip B1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip B2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip B3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip B4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip B5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip B1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip B2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip B3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip B4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip B5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip C1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip C2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip C3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip C4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip C5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip C1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip C2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip C3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip C4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip C5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip C1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip C2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip C3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip C4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip C5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip D1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip D2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip D3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip D4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip D5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip D1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip D2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip D3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip D4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip D5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip D1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip D2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip D3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip D4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip D5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip X1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip X2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip X3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip X4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Dip X5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip X1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip X2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip X3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip X4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Dip X5",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip X1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip X2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip X3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip X4",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Dip X5",
						"value": "1",
						"units": ""
					},
					
					{	
						"name": "V1-Intrpt N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Intrpt N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V1-Intrpt N3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Intrpt N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Intrpt N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V2-Intrpt N3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Intrpt N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Intrpt N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "V3-Intrpt N3",
						"value": "1",
						"units": ""
					},
					
					{	
						"name": "PO V1-Intrpt N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Intrpt N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V1-Intrpt N3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Intrpt N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Intrpt N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V2-Intrpt N3",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Intrpt N1",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Intrpt N2",
						"value": "1",
						"units": ""
					},
					{	
						"name": "PO V3-Intrpt N3",
						"value": "1",
						"units": ""
					},
					
					
				]};
			return data;
		break;

		case "/api/enumerations":
			var data = {
				"result":[
					
					// Languages for Logon
					[
						{	
							"name": "Language",
							"value": "English US",
							"translatedValue": "TV - English US"
						},
						{
							"name": "Language",
							"value": "English UK",
							"translatedValue": "TV - English UK"
						},
						{
							"name": "Language",
							"value": "French",
							"translatedValue": "TV - French"
						},
						{
							"name": "Language",
							"value": "Spanish",
							"translatedValue": "TV - Spanish"
						},
						{
							"name": "Language",
							"value": "German",
							"translatedValue": "TV - German"
						},
						{	
							"name": "Language",
							"value": "Itialian",
							"translatedValue": "TV - Itialian"
						},
						{	
							"name": "Language",
							"value": "Polish",
							"translatedValue": "TV - Polish"
						},
						{	
							"name": "Language",
							"value": "Portuguese",
							"translatedValue": "TV - Portuguese"
						},
						{	
							"name": "Language",
							"value": "Turkish",
							"translatedValue": "TV - Turkish"
						},
						{	
							"name": "Language",
							"value": "Chinese",
							"translatedValue": "TV - Chinese"
						},
						{	
							"name": "Language",
							"value": "Russian",
							"translatedValue": "TV - Russian"
						},
						{	
							"name": "Language",
							"value": "Arabic",
							"translatedValue": "TV - Arabic"
						},
						{	
							"name": "Language",
							"value": "Dutch",
							"translatedValue": "TV - Dutch"
						}
					
					],
					
					// Some dummy dropdown values
					[
						{	
							"name": "registerName1",
							"value": "TV - Value 1",
							"translatedValue": "TV - Value 1"
						},
						{	
							"name": "registerName2",
							"value": "TV - Value 2",
							"translatedValue": "TV - Value 2"
						},
						{	
							"name": "registerName3",
							"value": "TV - Value 3",
							"translatedValue": "TV - Value 3"
						}
					],
					[
						{	
							"name": "registerName2",
							"value": "TV - Sample Value 1",
							"translatedValue": "TV - Sample Value 1"
						},
						{	
							"name": "registerName2",
							"value": "TV - Sample Value 2",
							"translatedValue": "TV - Sample Value 2"
						},
						{	
							"name": "registerName2",
							"value": "TV - Sample Value 3",
							"translatedValue": "TV - Sample Value 3"
						}
					],
					
					// Setup > Ethernet & TCP/IP
					[
						{	
							"name": "Enable Web Server",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Enable Web Server",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Enable FTP",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Enable FTP",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Enable DNP Over TCP",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Enable DNP Over TCP",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Enable ION Over TCP",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Enable ION Over TCP",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Enable Modbus RTU Over TCP",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Enable Modbus RTU Over TCP",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Enable Modbus TCP",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Enable Modbus TCP",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Enable IPv6",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Enable IPv6",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Enable DPWS",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Enable DPWS",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Enable Telnet",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Enable Telnet",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Protocol",
							"value": "ION",
							"translatedValue": "TV - ION"
						},
						{	
							"name": "Protocol",
							"value": "Modbus RTU",
							"translatedValue": "TV - Modbus RTU"
						},
						{	
							"name": "Protocol",
							"value": "Modbus Master",
							"translatedValue": "TV - Modbus Master"
						},
						{	
							"name": "Protocol",
							"value": "DNP V3.00",
							"translatedValue": "TV - DNP V3.00"
						},
						{	
							"name": "Protocol",
							"value": "Modbus Master",
							"translatedValue": "TV - Modbus Master"
						},
						{	
							"name": "Protocol",
							"value": "DNP V3.00",
							"translatedValue": "TV - DNP V3.00"
						},
						{	
							"name": "Protocol",
							"value": "EtherGate",
							"translatedValue": "TV - EtherGate"
						},
						{	
							"name": "Protocol",
							"value": "GPS:Truetime/Datum",
							"translatedValue": "TV - GPS:Truetime/Datum"
						},
						{	
							"name": "Protocol",
							"value": "GPS:Arbiter",
							"translatedValue": "TV - GPS:Arbiter"
						},
						{	
							"name": "Protocol",
							"value": "GPS:Arbiter-Vorne",
							"translatedValue": "TV - GPS:Arbiter-Vorne"
						},
						{	
							"name": "Protocol",
							"value": "Factory",
							"translatedValue": "TV - Factory"
						}
					],
					[
						{	
							"name": "Baud Rate",
							"value": "2400",
							"translatedValue": "TV - 2400"
						},
						{	
							"name": "Baud Rate",
							"value": "4800",
							"translatedValue": "TV - 4800"
						},
						{	
							"name": "Baud Rate",
							"value": "9600",
							"translatedValue": "TV - 9600"
						},
						{	
							"name": "Baud Rate",
							"value": "9600",
							"translatedValue": "TV - 19200"
						},
						{	
							"name": "Baud Rate",
							"value": "38400",
							"translatedValue": "TV - 38400"
						},
						{	
							"name": "Baud Rate",
							"value": "57600",
							"translatedValue": "TV - 57600"
						},
						{	
							"name": "Baud Rate",
							"value": "115200",
							"translatedValue": "TV - 115200"
						}
					],
					
					[
						{	
							"name": "Serial Port",
							"value": "8N1",
							"translatedValue": "TV - 8N1"
						},
						{	
							"name": "Serial Port",
							"value": "8N2",
							"translatedValue": "TV - 8N2"
						},
						{	
							"name": "Serial Port",
							"value": "8E1",
							"translatedValue": "TV - 8E1"
						},
						{	
							"name": "Serial Port",
							"value": "8E2",
							"translatedValue": "TV - 8E2"
						},
						{	
							"name": "Serial Port",
							"value": "8O1",
							"translatedValue": "TV - 8O1"
						},
						{	
							"name": "Serial Port",
							"value": "8O2",
							"translatedValue": "TV - 8O2"
						}
					],
					[
						{	
							"name": "RS485 Bias",
							"value": "On",
							"translatedValue": "TV - On"
						},
						{	
							"name": "RS485 Bias",
							"value": "8O2",
							"translatedValue": "TV - Off"
						}
					],
					
					
					[
						{	
							"name": "Enable SNMP",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Enable SNMP",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Enable SNMP Traps",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Enable SNMP Traps",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "High Priority Alarms Enable",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "High Priority Alarms Enable",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Med Priority Alarms Enable",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Med Priority Alarms Enable",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Low Priority Alarms Enable",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Low Priority Alarms Enable",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Enable NTP Time Sync",
							"value": "Yes",
							"translatedValue": "TV - Yes"
						},
						{	
							"name": "Enable NTP Time Sync",
							"value": "No",
							"translatedValue": "TV - No"
						}
					],
					[
						{	
							"name": "Time Sync Source",
							"value": "COM1",
							"translatedValue": "TV - COM1"
						},
						{	
							"name": "Time Sync Source",
							"value": "ETHERNET",
							"translatedValue": "TV - ETHERNET"
						},
						{	
							"name": "Time Sync Source",
							"value": "ETHERNET - ION",
							"translatedValue": "TV - ETHERNET - ION"
						},
						{	
							"name": "Time Sync Source",
							"value": "ETHERNET - DNP",
							"translatedValue": "TV - ETHERNET - DNP"
						},
						{	
							"name": "Time Sync Source",
							"value": "IRIG-B",
							"translatedValue": "TV - IRIG-B"
						}
					],
					[
						{	
							"name": "Time Sync Type",
							"value": "UTC",
							"translatedValue": "TV - UTC"
						},
						{	
							"name": "Time Sync Type",
							"value": "LOCAL",
							"translatedValue": "TV - LOCAL"
						}
					],
					[
						{	
							"name": "Clock Source",
							"value": "Internal",
							"translatedValue": "TV - Internal"
						},
						{	
							"name": "Clock Source",
							"value": "Line Freq",
							"translatedValue": "TV - Line Freq"
						},
						{	
							"name": "Clock Source",
							"value": "COMM",
							"translatedValue": "TV - COMM"
						}
					],
					[
						{	
							"name": "Volts Mode",
							"value": "4W-WYE",
							"translatedValue": "TV - 4W-WYE"
						},
						{	
							"name": "Volts Mode",
							"value": "DELTA",
							"translatedValue": "TV - DELTA"
						},
						{	
							"name": "Volts Mode",
							"value": "3W-WYE",
							"translatedValue": "TV - 3W-WYE"
						},
						{	
							"name": "Volts Mode",
							"value": "SINGLE",
							"translatedValue": "TV - SINGLE"
						},
						{	
							"name": "Volts Mode",
							"value": "DEMO",
							"translatedValue": "TV - DEMO"
						}
					],
					[
						{	
							"name": "Va Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "Va Polarity",
							"value": "Inverted",
							"translatedValue": "TV - Inverted"
						}
					],
					[
						{	
							"name": "Vb Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "Vb Polarity",
							"value": "Inverted",
							"translatedValue": "TV - Inverted"
						}
					],
					[
						{	
							"name": "Vc Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "Vc Polarity",
							"value": "Inverted",
							"translatedValue": "TV - Inverted"
						}
					],
					
					
					
					
					[
						{	
							"name": "Ia Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "Ia Polarity",
							"value": "Inverted",
							"translatedValue": "TV - Inverted"
						}
					],
					[
						{	
							"name": "Ib Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "Ib Polarity",
							"value": "Inverted",
							"translatedValue": "TV - Inverted"
						}
					],
					[
						{	
							"name": "Ic Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "Ic Polarity",
							"value": "Inverted",
							"translatedValue": "TV - Inverted"
						}
					],
					[
						{	
							"name": "I4 Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "I4 Polarity",
							"value": "Inverted",
							"translatedValue": "TV - Inverted"
						}
					],
					[
						{	
							"name": "PhaseOrder",
							"value": "ABC",
							"translatedValue": "TV - ABC"
						},
						{	
							"name": "PhaseOrder",
							"value": "ACB",
							"translatedValue": "TV - ACB"
						}
					],
					[
						{	
							"name": "Phase Lbls",
							"value": "ABC",
							"translatedValue": "TV - ABC"
						},
						{	
							"name": "Phase Lbls",
							"value": "123",
							"translatedValue": "TV - 123"
						}
					],
					[
						{	
							"name": "F Nominal",
							"value": "Value 1",
							"translatedValue": "TV - Value 1"
						},
						{	
							"name": "F Nominal",
							"value": "Value 2",
							"translatedValue": "TV - Value 2"
						}
					],
					
					
					[
						{	
							"name": "localTimezoneOffset",
							"value": "UTC -8:00",
							"translatedValue": "TV - UTC -8:00"
						},
						{	
							"name": "localTimezoneOffset",
							"value": "UTC -9:00",
							"translatedValue": "TV - UTC -9:00"
						},
						{	
							"name": "localTimezoneOffset",
							"value": "UTC -10:00",
							"translatedValue": "TV - UTC -10:00"
						}
					],
					[
						{	
							"name": "dstOffset",
							"value": "-1",
							"translatedValue": "TV - -1"
						},
						{	
							"name": "dstOffset",
							"value": "-2",
							"translatedValue": "TV - -2"
						},
						{	
							"name": "dstOffset",
							"value": "-3",
							"translatedValue": "TV - -3"
						}
					],
					[
						{	
							"name": "syncSource",
							"value": "Network (NTP)",
							"translatedValue": "TV - Network (NTP)"
						},
						{	
							"name": "syncSource",
							"value": "SNTP",
							"translatedValue": "TV - SNTP"
						},
						{	
							"name": "syncSource",
							"value": "SMTP",
							"translatedValue": "TV - SMTP"
						}
					],
					[
						{	
							"name": "clockSource",
							"value": "Clock Source",
							"translatedValue": "TV - Clock Source"
						},
						{	
							"name": "clockSource",
							"value": "Single Phase",
							"translatedValue": "TV - Single Phase"
						},
						{	
							"name": "clockSource",
							"value": "Two Phase",
							"translatedValue": "TV - Two Phase"
						}
					],
					
					// Setup > FTP Settings
					[
						{	
							"name": "enableFTP",
							"value": "Enabled",
							"translatedValue": "TV - Enabled"
						},
						{	
							"name": "enableFTP",
							"value": "Disabled",
							"translatedValue": "TV - Disabled"
						}
					],
					
					// Setup > Metering
					[
						{"name":"Volts Mode","value":"4W-WYE","translatedValue": "TV - 4W-WYE"},
						{"name":"Volts Mode","value":"DELTA","translatedValue": "TV - DELTA"},
						{"name":"Volts Mode","value":"3W-WYE","translatedValue": "TV - 3W-WYE"},
						{"name":"Volts Mode","value":"SINGLE","translatedValue": "TV - SINGLE"},
						{"name":"Volts Mode","value":"DEMO","translatedValue": "TV - DEMO"}
					],
					[
						{"name":"PM1 Nominal Frequency","value":"60Hz","translatedValue": "TV - 60Hz"},
						{"name":"PM1 Nominal Frequency","value":"50Hz","translatedValue": "TV - 50Hz"}
					],
					[
						{	
							"name": "v1Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "v1Polarity",
							"value": "Other",
							"translatedValue": "TV - Other"
						}
					],
					[
						{	
							"name": "v2Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "v2Polarity",
							"value": "Other",
							"translatedValue": "TV - Other"
						}
					],
					[
						{	
							"name": "v3Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "v3Polarity",
							"value": "Other",
							"translatedValue": "TV - Other"
						}
					],
					[
						{	
							"name": "i1Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "i1Polarity",
							"value": "Other",
							"translatedValue": "TV - Other"
						}
					],
					[
						{	
							"name": "i2Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "i2Polarity",
							"value": "Other",
							"translatedValue": "TV - Other"
						}
					],
					[
						{	
							"name": "i3Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "i3Polarity",
							"value": "Other",
							"translatedValue": "TV - Other"
						}
					],
					[
						{	
							"name": "i4Polarity",
							"value": "Normal",
							"translatedValue": "TV - Normal"
						},
						{	
							"name": "i4Polarity",
							"value": "Other",
							"translatedValue": "TV - Other"
						}
					],
					[
						{	
							"name": "rotationSelection",
							"value": "A B C",
							"translatedValue": "TV - A B C"
						},
						{	
							"name": "rotationSelection",
							"value": "C B A",
							"translatedValue": "TV - C B A"
						}
					],
					[
						{	
							"name": "distortionType",
							"value": "THD",
							"translatedValue": "TV - THD"
						},
						{	
							"name": "distortionType",
							"value": "Other",
							"translatedValue": "TV - Other"
						}
					],
					[
						{	
							"name": "powerQualityStandard",
							"value": "IEC / NEMA",
							"translatedValue": "TV - IEC / NEMA"
						},
						{	
							"name": "powerQualityStandard",
							"value": "Other",
							"translatedValue": "TV - Other"
						}
					],
					
					// Setup > Sag/Swell Setup
					[
						{	
							"name": "learnMode",
							"value": "learn mode",
							"translatedValue": "TV - learn mode"
						},
						{	
							"name": "learnMode",
							"value": "other learn mode",
							"translatedValue": "TV - other learn mode"
						}
					]
					
				]};
			return data;
		break;
		/*
		case "/registerValues/setRegisterValues":
			var data = {
				"errorCode": '',
				"errorMessage": ''
				};
			return data;
		break;
		*/
		
		
		// Dummy Data for Energy Readings
		case "/registerValues/getEnergyReadings":
			var data = {
				"result":[
					{	
						"name": "kWh del",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "activeEnergyLastReset",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "kVARh del",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "reactiveEnergyLastReset",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "kVAh del",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "apparentEnergyLastReset",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "inputMeteringChannel1Present",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "inputMeteringChannel1LastReset",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "inputMeteringChannel2Present",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "inputMeteringChannel2LastReset",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "inputMeteringChannel3Present",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "inputMeteringChannel3LastReset",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "inputMeteringChannel4Present",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "inputMeteringChannel4LastReset",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					// Dummy Data for Demand Readings
					{	
						"name": "I1LastInterval",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I1Peak",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I1TimeOfPeak",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I1TimeOfReset",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I2LastInterval",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I2Peak",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I2TimeOfPeak",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I2TimeOfReset",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I3LastInterval",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I3Peak",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I3TimeOfPeak",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I3TimeOfReset",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I4LastInterval",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I4Peak",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I4TimeOfPeak",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "I4TimeOfReset",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "kW td d-r Interval",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "kW td mx d-r",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "kW td mx d-r",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "DPATotalTimeOfReset",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "kVAR td d-r Interval",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "kVAR td mx d-r",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "kVAR td mx d-r",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "DRPTotalTimeOfReset",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "kVA td d-r Interval",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "kVA td mx d-r",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "kVA td mx d-r",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "DAPTotalTimeOfReset",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					// Dummy Data for Voltage Readings
					{	
						"name": "v12Min",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v12Present",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v12Max",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v23Min",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v23Present",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v23Max",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v31Min",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v31Present",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v31Max",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "Vll avg mn",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "Vll avg",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "Vll avg mx",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v1NMin",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v1NPresent",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v1NMax",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v2NMin",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "v2NPresent",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "v2NMax",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "v3NMin",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "v3NPresent",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "v3NMax",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln avg mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln avg",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln avg mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "V unbal low",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "V unbal mean",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "V unbal mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					// Dummy Data for Power Readings
					{	
						"name": "thdVoltageAverageMin",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "thdVoltageAveragePresent",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "thdVoltageAverageMax",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "thdCurrentAverageMin",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "thdCurrentAveragePresent",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "thdCurrentAverageMax",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "kFactorMin",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "kFactorPresent",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "kFactorMax",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "crestFactorMin",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "crestFactorPresent",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "crestFactorMax",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "thdVoltageMin",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "thdVoltagePresent",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "thdVoltageMax",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "V1 THD mn",
						"value": Math.floor(Math.random()*255 + 1),
						"units": ""
					},
					{	
						"name": "V1 Total HD 10m",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "V1 THD mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "V2 THD mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "V2 Total HD 10m",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "V2 THD mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "V3 THD mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "V3 Total HD 10m",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "V3 THD mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vll avg mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vll avg",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vll avg mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln a mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln a",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln a mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln b mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln b",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln b mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln c mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln c",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln c mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln avg mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln avg",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "Vln avg mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I1 THD mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I1 Total HD 3s",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I1 THD mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I2 THD mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I2 Total HD 3s",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I2 THD mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I3 THD mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I3 Total HD 3s",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I3 THD mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I avg mn",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I avg mean",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					},
					{	
						"name": "I avg mx",
						"value": Math.floor(Math.random()*10 + 1),
						"units": ""
					}
				]};
			return data;
		break;
		
		
		case "/api/registerValues/setRegisterValues":
			var data = {
				"result": 
					[
						{	
							"value": "true"
						},
						{	
							"value": "true"
						}
					]
				};
			return data;
		break;
		
		// Dummy Data for ITIC-SEMI Table
		case "/api/pq/voltageDisturbances/summary":
			//var data = {"errorCode":1,"errorMessage":"No voltage disturbance records available."};
			var data = {
				"voltageDisturbances":[
					{							"timestamp": {"seconds":1375809480, "uSeconds":950898},						"duration": 20 + Math.random() * 10, // 10-20 seconds range						"worstValue": Math.floor(Math.random()*500 + 1)					},					{							"timestamp": {"seconds":1375809480, "uSeconds":950898},						"duration": Math.random() * 10, // 1-10 seconds range						"worstValue": Math.floor(Math.random()*500 + 1)					},					{	
						"timestamp": {"seconds":1375495660, "uSeconds":676999},
						"duration": Math.random(), // 0-1 seconds range
						"worstValue": Math.floor(Math.random()*500 + 1)
					},
					{	
						"timestamp": {"seconds":1375494680, "uSeconds":985594},
						"duration": Math.random(),
						"worstValue": Math.floor(Math.random()*500 + 1)
					},
					{	
						"timestamp": {"seconds":1375494660, "uSeconds":676699},
						"duration": Math.random() / 100, // 0.001-0.009 seconds range
						"worstValue": Math.floor(Math.random()*500 + 1)
					},
					{	
						"timestamp": {"seconds":1375497060, "uSeconds":985594},
						"duration": Math.random() / 1000, // 0.0001-0.0009 seconds range
						"worstValue": Math.floor(Math.random()*500 + 1)
					}
				]};
			return data;
		break;
		
		// Dummy Data for Harmonics Chart
		case "/api/pq/harmonics/summary/v1":		case "/api/pq/harmonics/summary/v2":		case "/api/pq/harmonics/summary/v3":		case "/api/pq/harmonics/summary/i1":		case "/api/pq/harmonics/summary/i2":		case "/api/pq/harmonics/summary/i3":		case "/api/pq/harmonics/summary/i4":			var multiplier = 1;
			switch(reqObject.url) {				case "/api/pq/harmonics/summary/v1":					multiplier = 1;					break;				case "/api/pq/harmonics/summary/v2":					multiplier = .1;					break;				case "/api/pq/harmonics/summary/v3":					multiplier = .01;					break;				case "/api/pq/harmonics/summary/i1":					multiplier = .001;					break;				case "/api/pq/harmonics/summary/i2":					multiplier = .0001;					break;				case "/api/pq/harmonics/summary/i3":					multiplier = .00001;					break;				case "/api/pq/harmonics/summary/i4":					multiplier = .1;			}			var currentVals = [891,587,783,293,470,195,336,146,261,117,213,97,180,84,156,73,138,65,123,58,112,53,102,48,94,45,87,42,81,39,75,36,71,34,67,32,63,30,60,29,57,28,54,26,52,25,50,24,48,23,46,22,44,21,42,21,41,20,39,19,38,18,37];
			for(var i=0;i<currentVals.length;i++) {
				currentVals[i] = ((Math.random() * 20) - 10 +currentVals[i]) * multiplier;
			}
			return {"result":{"total":"5.0%","totalOdd":"2.0%","totalEven":"2.0%","totalLabel":"THD","totalOddLabel":"THD Odd","totalEvenLabel":"THD Even","currentValues":currentVals}};
			
			var currentValues = [];
			for(var i=31;i>0;i--) {
				var oddNum=i/3-1+Math.random()*1;
				var evenNum=i/5+Math.random()*1;
				currentValues.push(oddNum);
				currentValues.push(evenNum);
			}
			
			var data = { 
				"result":{
					"total":Math.round(Math.random()*5),
					"totalOdd":Math.round(Math.random()*5),
					"totalEven":Math.round(Math.random()*5),
					"currentValues":currentValues
					}
				}
			return data;
			
		break;
		
		
		// Custom User Pages
		case "/api/customPages/Monitoring":
			var data = {
				"result":[
				{
					"displayName":"Custom Monitor 1",
					"linkUrl":"/web/monitoring/Custom Monitor 1.html"
				},
				{
					"displayName":"Custom Monitor 2",
					"linkUrl":"/web/monitoring/Custom Monitor 2.html"
				},
				{
					"displayName":"Custom Monitor 3",
					"linkUrl":"/web/monitoring/Custom Monitor 3.html"
				}
			]};
			return data;
		break;
		case "/api/customPages/Control":
			var data = {
				"result":[
				{
					"displayName":"Custom Control 1",
					"linkUrl":"/web/control/Custom Control 1.html"
				},
				{
					"displayName":"Custom Control 2",
					"linkUrl":"/web/control/Custom Control 2.html"
				},
				{
					"displayName":"Custom Control 3",
					"linkUrl":"/web/control/Custom Control 3.html"
				}
			]};
			return data;
		break;
		case "/api/customPages/Diagnostics":
			var data = {
				"result":[
				{
					"displayName":"Custom Diagnostics 1",
					"linkUrl":"/web/diagnostics/Custom Diagnostics 1.html"
				},
				{
					"displayName":"Custom Diagnostics 2",
					"linkUrl":"/web/diagnostics/Custom Diagnostics 2.html"
				},
				{
					"displayName":"Custom Diagnostics 3",
					"linkUrl":"/web/diagnostics/Custom Diagnostics 3.html"
				}
			]};
			return data;
		break;
		case "/api/customPages/Setup":
			var data = {
				"result":[
				{
					"displayName":"Custom Setup 1",
					"linkUrl":"/web/setup/Custom Setup 1.html"
				},
				{
					"displayName":"Custom Setup 2",
					"linkUrl":"/web/setup/Custom Setup 2.html"
				},
				{
					"displayName":"Custom Setup 3",
					"linkUrl":"/web/setup/Custom Setup 3.html"
				}
			]};
			return data;
		break;
		case "/api/customPages/Maintenance":
			var data = {
				"result":[
				{
					"displayName":"Custom Maintenance 1",
					"linkUrl":"/web/setup/Custom Setup 1.html"
				},
				{
					"displayName":"Custom Maintenance 2",
					"linkUrl":"/web/setup/Custom Setup 2.html"
				},
				{
					"displayName":"Custom Maintenance 3",
					"linkUrl":"/web/setup/Custom Setup 3.html"
				}
			]};
			return data;
		break;
		case "/api/registerValues/getRegisterTimestamps":
			var data = {
				"timestamps":[
				{
					"seconds":1376051400,
					"uSeconds":0
				},
				{
					"seconds":1476451400,
					"uSeconds":0
				},
				{
					"seconds":1376551400,
					"uSeconds":0
				},
				{
					"seconds":1376451400,
					"uSeconds":0
				},
				{
					"seconds":1375051400,
					"uSeconds":0
				},
				{
					"seconds":1376051400,
					"uSeconds":0
				},
				{
					"seconds":1376041400,
					"uSeconds":0
				}
			]};
			return data;
		break;
		
		default:
			return null;
	}
}
