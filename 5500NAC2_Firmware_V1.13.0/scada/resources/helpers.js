[
  {
    text: 'Conditionals',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'If - Then',
        leaf: true,
        script: "if (condition) then\n  dosomething()\nend"
      },
      {
        text: 'If (AND) - Then',
        leaf: true,
        script: "if (condition1 and condition2) then\n  dosomething()\nend"
      },
      {
        text: 'If (OR) - Then',
        leaf: true,
        script: "if (condition or condition2) then\n  dosomething()\nend"
      },
      {
        text: 'If - Then - Else',
        leaf: true,
        script: "if (condition) then\n  dosomething()\nelse\n  dosomethingelse()\nend"
      },
      {
        text: 'If - Else If',
        leaf: true,
        script: "if (condition) then\n  dosomething()\nelseif (othercondition) then\n  dosomethingelse()\nend"
      }
    ]
  },
  {
    text: 'Loops and iterators',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Hashtable iteration',
        leaf: true,
        script: "-- hashtable = { a = 1, b = 2, c = 3 }\nfor key, value in pairs(hashtable) do\n  dosomething()\nend"
      },
      {
        text: 'Array iteration',
        leaf: true,
        script: "-- arraytable = { 'a', 'b', 'c' }\nfor index, value in ipairs(arraytable) do\n  dosomething()\nend"
      },
      {
        text: 'Numeric for loop',
        leaf: true,
        script: "-- for i = START, STOP, STEP\nfor i = 1, 10, 2 do\n  dosomething()\nend"
      },
      {
        text: 'While loop',
        leaf: true,
        script: "-- loop while condition is met\nwhile (condition) do\n  dosomething()\nend"
      },
      {
        text: 'Repeat..until loop',
        leaf: true,
        script: "-- loop until condition is met\nrepeat\n  dosomething()\nuntil (condition)"
      }
    ]
  },
  {
    text: 'Math',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Absolute value',
        leaf: true,
        script: "-- e.g. x = -12, y = 12\ny = math.abs(x)"
      },
      {
        text: 'Ceiling',
        leaf: true,
        script: "-- e.g. x = 12.2, y = 13\ny = math.ceil(x)"
      },
      {
        text: 'Floor',
        leaf: true,
        script: "-- e.g. x = 12.7, y = 12\ny = math.floor(x)"
      },
      {
        text: 'Round to integer',
        leaf: true,
        script: "-- e.g. x = 12.7, y = 13; x = 12.3, y = 12\ny = math.floor(x + 0.5)"
      },
      {
        text: 'Random value',
        leaf: true,
        script: "-- get random integer value between min and max (inclusive)\ny = math.random(min, max)"
      },
      {
        text: 'Seed the pseudo random number generator',
        leaf: true,
        script: "-- Seed PRNG\nSeedRNG()"
      }
    ]
  },
  {
    text: 'Objects',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Get event value',
        leaf: true,
        script: "-- object mapped to this event must have its data type set\nvalue = event.getvalue()"
      }
    ]
  },
  {
    text: 'Storage',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Get data from storage',
        leaf: true,
        script: "-- mydata will be set nil when data was not found\nmydata = storage.get(|>'myobjectdata'<|)"
      },
      {
        text: 'Get data (with default value)',
        leaf: true,
        script: "-- mydata will be set to a predefined value (e.g. 127) when data was not found\nmydata = storage.get(|>'myobjectdata'<|, 127)"
      },
      {
        text: 'Save data to storage',
        leaf: true,
        script: "-- set storage variable myobjectdata to a specified value (e.g. 127)\nstorage.set(|>'myobjectdata'<|, 127)"
      }
    ]
  },
  {
    text: 'Script control',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Enable script',
        leaf: true,
        script: "script.enable(|>'scriptname'<|)"
      },
      {
        text: 'Disable script',
        leaf: true,
        script: "script.disable(|>'scriptname'<|)"
      },
      {
        text: 'Get script status',
        leaf: true,
        script: "-- return true/false if script is found, nil otherwise\nstatus = script.status(|>'scriptname'<|)"
      }
    ]
  },
  {
    text: 'Alerts and logs',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Alert',
        leaf: true,
        script: "alert('|>My alert text<|')"
      },
      {
        text: 'Formatted alert',
        leaf: true,
        script: "-- see string.format for more info\nalert('Group address %s, numeric value: %d', '1/1/1', 127)"
      },
      {
        text: 'Log variables',
        leaf: true,
        script: "a = { f1 = 10, f2 = 20 }\nb = 127\nc = 'test'\n-- all passed arguments will appear in Logs module\nlog(a, b, c)"
      }
    ]
  },
  {
    text: 'Time functions',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Delay script execution',
        leaf: true,
        script: "-- wait for 1.5 seconds\nos.sleep(|>1.5<|)"
      }
    ]
  },
  {
    text: 'Miscellaneous',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Send an e-mail',
        leaf: true,
        script: "-- make sure mail settings are set in user function library before using this function\nsubject = 'E-mail test'\nmessage = 'Testing e-mail'\nmail('user@example.com', subject, message)"
      },
      {
        text: 'Sunrise / sunset',
        leaf: true,
        script: "-- returns number of minutes from 0:00 until sunrise and sunset\nlatitude = 57\nlongitude = 24.15\nsunrise, sunset = rscalc(latitude, longitude)"
      },
      {
        text: 'Convert sunrise / sunset to readable time',
        leaf: true,
        script: "sunrise = string.format('%d:%.2d', math.floor(sunrise / 60), sunrise % 60)\nsunset = string.format('%d:%.2d', math.floor(sunset / 60), sunset % 60)"
      },
      {
        text: 'Send a Wake-On-LAN packet',
        leaf: true,
        script: "SendWOL('00:11:22:33:44:55')"
      }
    ]
  },
  {
    text: 'Serial',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Open connection',
        leaf: true,
        script: "require('serial')\nport = serial.open('/dev/RS232', {\n  baudrate = 38400,\n  databits = 8,\n  stopbits = 1,\n  parity = 'none',\n  duplex = 'full'\n})"
      },
      {
        text: 'Write to port',
        leaf: true,
        script: "port:write('test data')"
      },
      {
        text: 'Blocking read',
        leaf: true,
        script: "-- script will block until 10 characters are read\ndata = port:read(10)"
      },
      {
        text: 'Timeout read',
        leaf: true,
        script: "-- script will wait for 10 characters for 20 seconds\ndata = port:read(10, 20)"
      },
      {
        text: 'Close serial port',
        leaf: true,
        script: "port:close()"
      }
    ]
  },
  {
    text: 'Modbus',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Create Modbus TCP object',
        leaf: true,
        script: "require('luamodbus')\nmb = luamodbus.tcp()"
      },
      {
        text: 'Create Modbus RTU object',
        leaf: true,
        script: "require('luamodbus')\nmb = luamodbus.rtu()"
      },
      {
        text: 'Open Modbus TCP connection',
        leaf: true,
        script: "-- IP: 192.168.1.2, port: 1234\nmb:open('192.168.1.2', 1234)\nmb:connect()"
      },
      {
        text: 'Open Modbus RTU connection',
        leaf: true,
        script: "-- 19200 baud rate, even parity, 8 data bits, 1 stop bit, half duplex\nmb:open('/dev/RS485', 19200, 'E', 8, 1, 'H')\nmb:connect()"
      },
      {
        text: 'Set slave address',
        leaf: true,
        script: "mb:setslave(123)"
      },
      {
        text: 'Read single coil',
        leaf: true,
        script: "-- read 1 coil from address 1000\ncoil = mb:readcoils(1000)"
      },
      {
        text: 'Read multiple coils',
        leaf: true,
        script: "-- read 3 coils from address 1000\ncoil1, coil2, coil3 = mb:readcoils(1000, 3)"
      },
      {
        text: 'Read discrete input',
        leaf: true,
        script: "-- read from address 1000\nvalue = mb:readdiscreteinputs(1000)"
      },
      {
        text: 'Read registers',
        leaf: true,
        script: "-- read from address 1000\nvalue = mb:readregisters(1000)"
      },
      {
        text: 'Read input registers',
        leaf: true,
        script: "-- read from address 1000\nvalue = mb:readinputregisters(1000)"
      },
      {
        text: 'Write single bit',
        leaf: true,
        script: "-- set bit at address 1000 to 'on'\nmb:writebits(1000, true)"
      },
      {
        text: 'Write multiple bits',
        leaf: true,
        script: "-- set bit at address 1000 to 'on', bit at address 1001 to 'off'\nmb:writebits(1000, true, false)"
      },
      {
        text: 'Write single register',
        leaf: true,
        script: "-- set register at address 1000 to 123\nmb:writeregisters(1000, 123)"
      },
      {
        text: 'Write multiple registers',
        leaf: true,
        script: "-- set register at address 1000 to 123, register at address 1001 to 321\nmb:writeregisters(1000, 123, 321)"
      },
      {
        text: 'Close modbus connection',
        leaf: true,
        script: "mb:close()"
      }
    ]
  },
  {
    text: 'C-Bus',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Get all networks',
        leaf: true,
        script: "-- Return network numbers as a table (or empty table) of current project\nnetworks = GetCBusNetwork()"
      },
      {
        text: 'Get applications under a specified network',
        leaf: true,
        script: "-- Return application numbers as a table (or empty table) of \'House\' network'\nnet = GetCBusApplication(net)(\'House\')"
      },
      {
        text: 'Convert network tag to address',
        leaf: true,
        script: "-- Return network number (or nil) of \'House\' network'\nnet = GetCBusNetworkAddress(\'House\')"
      },
      {
        text: 'Convert application tag to address',
        leaf: true,
        script: "-- Return application (or nil) number for \'Lighting\' in network 3\napp = GetCBusApplicationAddress(3, \'Lighting\')"
      },
      {
        text: 'Convert group tag to address',
        leaf: true,
        script: "-- Return group number (or nil) for \'Kitchen\' in application 56, network 3\napp = GetCBusGroupAddress(3, 56, \'Kitchen\')"
      },
      {
        text: 'Convert level tag to address',
        leaf: true,
        script: "-- Return level number (or nil) for \'Off\' in group 0 application 56, network 3\nlev = GetCBusLevelAddress(3, 56, 0, \'Off\')"
      },
      {
        text: 'Convert network address to tag',
        leaf: true,
        script: "-- Return network tag (or nil) for network 3\nnetag = GetCBusNetworkTag(3)"
      },
      {
        text: 'Convert application address to tag',
        leaf: true,
        script: "-- Return application tag (or nil) for application 56, network 3\napptag = GetCBusApplicationTag(3, 56)"
      },
      {
        text: 'Convert group address to tag',
        leaf: true,
        script: "-- Return group tag (or nil) for group 0 application 56, network 3\ngrptag = GetCBusGroupTag(3, 56, 0)"
      },
      {
        text: 'Convert level address to tag',
        leaf: true,
        script: "-- Return level tag (or nil) for level 0 in group 0 application 56, network 3\nlevtag = GetCBusLevelTag(3, 56, 0, 0)"
      },
      {
	text: 'Convert a set of network, application and group tags to addresses (or validate them if they are addresses)',
	leaf: true,
	script: "-- Convert tags to addresses\nnet, app, group = CBusLookupTags(\'House\', \'Lighting\', \'Kitchen\')"
      },
      {
	text: 'Convert a set of network, application and group addresses to tags (or validate them if they are tags)',
	leaf: true,
	script: "-- Convert addresses to tags\nnettag, apptag, grouptag = CBusLookupAddresses(0, 56, 0)"
      },
      {
	text: 'Lookup object ID of a lighting object, accepts tags or numbers',
	leaf: true,
	script: "-- Find ID of a lighting object\nid = CBusGetLightingID(\'Local\', \'Lighting\', \'Light 1\')"
      },
      {
	text: 'Lookup object ID of a trigger object, accepts tags or numbers',
	leaf: true,
	script: "-- Find ID of a trigger object\nid = CBusGetTriggerID(\'Local\', \'Trig 1\')"
      },
      {
	text: 'Lookup object ID of an enable object, accepts tags or numbers',
	leaf: true,
	script: "-- Find ID of an enable object\nid = CBusGetEnableID(\'Local\', \'Enable 1\')"
      },
      {
	text: 'Lookup object ID of a measurement object, accepts tags or numbers',
	leaf: true,
	script: "-- Find ID of measurement object\nid = CBusGetMeasurementID(\'Local\', \'Sensor 2\', 0)"
      },
      {
	text: 'Lookup object ID of a user parameter object, accepts tags or numbers',
	leaf: true,
	script: "-- Find ID of user paramater object\nid = CBusGetUserParamID(\'Local\', \'Colour Picker\')"
      },
      {
        text: 'Convert C-Bus percentage to level',
        leaf: true,
        script: "-- Convert 40% to a C-Bus level\nvalue = CBusPctToLevel(40)"
      },
      {
        text: 'Convert C-Bus level to percentage',
        leaf: true,
        script: "-- Convert level 200 to percentage\nvalue = CBusLevelToPct(200)"
      },
      {
        text: 'Get C-Bus level',
        leaf: true,
        script: "-- Get level of the Kitchen group in the Lights 1 application on the local network\nvalue = GetCBusLevel('Local',  'Lights 1', 'Kitchen')"
      },
      {
        text: 'Set C-Bus level',
        leaf: true,
        script: "-- Set application 56 group 1 on the local network to full brightness over 12 seconds.\nSetCBusLevel(0, 56, 1, 255, 12)"
      },
      {
        text: 'Get C-Bus state',
        leaf: true,
        script: "-- Get state of application 56 group 1 on the local network\nvalue = GetCBusState(0, 56, 1)"
      },
      {
        text: 'Set C-Bus state',
        leaf: true,
        script: "-- Turn off application 56 group 1 on the local network\nSetCBusState(0, 56, 1, false)"
      },
      {
        text: 'Get C-Bus objects by keyword',
        leaf: true,
        script: "-- Return all objects with keywords foo and bar\nvalue = GetCBusByKW({'foo', 'bar'}, 'and')\n\n-- Return objects with keywords foo or bar\nvalue = GetCBusByKW({'foo', 'bar'}, 'or')\n\n-- Return objects with keyword foo\nvalue = GetCBusByKW({'foo'}, 'or')\n\n-- or this way\nvalue = GetCBusByKW('foo', 'or')\n\n-- Print target level of first object returned with keyword foo\nvalue = GetCBusByKW('foo', 'or')[1].data.target\n\n-- For a user parameter `data` is a bare value\nvalue = GetCBusByKW('baz', 'or')[1].data"
      },
      {
        text: 'Set C-Bus objects by keyword',
        leaf: true,
        script: "-- Set lighting-like objects with keywords foo and bar to 255 over 12 seconds.\nSetCBusByKW({'foo', 'bar'}, 'and', {target = 255, ramprate = 12})\n\n-- Set lighting-like objects with keywords foo or bar to 255 over 12 seconds.\nSetCBusByKW({'foo', 'bar'}, 'or', {target = 255, ramprate = 12})\n\n-- Set lighting-like objects with keywords foo or bar to 0 instantaneously\nSetCBusByKW({'foo', 'bar'}, 'or', {target = 0, ramprate = 0})"
      },
      {
        text: 'Get C-Bus ramp rate',
        leaf: true,
        script: "-- Get ramp rate of application 56 group 1 on the local network\nvalue = GetCBusRampRate(0, 56, 1)"
      },
      {
        text: 'Get C-Bus target level',
        leaf: true,
        script: "-- Get target level of application 56 group 1 on the local network\nvalue = GetCBusTargetLevel(0, 56, 1)"
      },
      {
        text: 'Get enable level',
        leaf: true,
        script: "-- Get enable level of group 1\nvalue = GetEnableLevel(1)"
      },
      {
        text: 'Get enable state',
        leaf: true,
        script: "-- Get enable state of group 1\nvalue = GetEnableState(1)"
      },
      {
        text: 'Set enable level',
        leaf: true,
        script: "-- Set enable level of group 1 to 128\nSetEnableLevel(1, 128)"
      },
      {
        text: 'Set enable state',
        leaf: true,
        script: "-- Set enable state of group 1 to false\nSetEnableState(1, false)"
      },
	  {
        text: 'Get lighting level',
        leaf: true,
        script: "-- Get lighting level of group 1\nvalue = GetLightingLevel(1)"
      },
      {
        text: 'Get lighting state',
        leaf: true,
        script: "-- Get lighting state of group 1\nvalue = GetLightingState(1)"
      },
      {
        text: 'Set lighting state',
        leaf: true,
        script: "-- Set lighting state of group 1 to false\nSetLightingState(1, false)"
      },
      {
        text: 'Set lighting level',
        leaf: true,
        script: "-- Set lighting level of group 1 to 128 with ramp rate 4\nSetLightingLevel(1, 128, 4)"
      },
	  {
        text: 'Get trigger level',
        leaf: true,
        script: "-- Get trigger level of group 1\nvalue = GetTriggerLevel(1)"
      },
      {
        text: 'Set trigger level',
        leaf: true,
        script: "-- Set trigger level of group 1 to 123\nSetTriggerLevel(1, 123)"
      },
      {
        text: 'Pulse C-Bus group',
        leaf: true,
        script: "-- Set group 'Kitchen' on application 'Lighting' in network 'Local' to 255 over 4 seconds and after 5 seconds and reset to current level.\nPulseCBusLevel('Local', 'Lighting', 'Kitchen', 255, 4, 5, -1)"
      },
      {
        text: 'Track group in one-way',
        leaf: true,
        script: "-- Set group 'MeetingRoom2' on application 'Lighting' in network 'Local' to be the same level (and ramp rate if ramping) as gourp 'MeetingRoom1'.\nTrackGroup('Local', 'Lighting', 'MeetingRoom1', 'MeetingRoom2')"
      },
      {
        text: 'Track group in two-way',
        leaf: true,
        script: "-- Make group 'MeetingRoom1' on application 'Lighting1' in network 'Local1' and group 'MeetingRoom2' on application 'Lighting2' in network 'Local2' track each other.\nTrackGroup2('Local1', 'Lighting1', 'MeetingRoom1', 'Local2', 'Lighting2', 'MeetingRoom2')"
      },
      {
        text: 'Set state of C-Bus remote on',
        leaf: true,
        script: "-- Set remote on to true\nCBusRemoteOn(true)"
	  },
      {
        text: 'Set state of C-Bus remote off',
        leaf: true,
        script: "-- Set remote off to true\nCBusRemoteOff(true)"
      },
      {
        text: 'Get C-Bus measurement value',
        leaf: true,
        script: "-- Get temperature and units of channel 1 of sensor 1 on the local network\n-- temp is a float and units is a string (eg '°C')\ntemp, units = GetCBusMeasurement('Local', 'sensor1', 1)"
      },
      {
        text: 'Get C-Bus measurement Status',
        leaf: true,
        script: "-- Get Status of channel 1 of sensor 1 on the local network\n-- temp is a float and units is a string (eg '°C')\ntemp, units = GetCBusMeasurement('Local', 'sensor1', 1)"
      },
      
      {
        text: 'Set C-Bus measurement value',
        leaf: true,
        script: "-- Set temperature and units of channel 1 of sensor 1 on the local network to 25.2 degC\nSetCBusMeasurement('Local', 'sensor1', 1, 25.2, 0) -- 0 is the units parameter as per chapter 28 of the C-Bus documentation"
      },
      {
	text: 'Set C-Bus label',
	leaf: true,
	script: "-- Set the label to \"Hello\" for English, variant 1 on the Kitchen group on the Lighting application.\nSetCBusLabel('Local', 'Lighting', 'Kitchen', 'English', 'Variant1', 'Hello')",
      },
      {
	text: 'Set Unicode C-Bus label',
	leaf: true,
	script: "-- Set the unicode label to \"kjøling\" for Norwegian, variant 1 on the Kitchen group on the Lighting application.\nSetCBusUnicodeLabel('Local', 'Lighting', 'Kitchen', 'Norwegian', 'Variant1', 'kjøling')",
      },
      {
	text: 'Set C-Bus action selector label',
	leaf: true,
	script: "-- Set the unicode label to \"Hello\" for English, variant 1 on the Kitchen group, action selector 1.\nSetCBusActSelLabel('Local', 'Kitchen', 'English', 'Variant1', 1, 'Hello')",
      },
      {
	text: 'Set Unicode C-Bus action selector label',
	leaf: true,
	script: "-- Set the unicode label to \"kjøling\" for Norwegian, variant 1 on the Kitchen group, action selector 1.\nSetCBusActSelUnicode('Local', 'Kitchen', 'Norwegian', 'Variant1', 1, 'kjøling')",
      },
      {
	text: 'Set C-Bus language',
	leaf: true,
	script: "-- Set the language to Spanish for the lighting application on the local network.\nSetCBusLanguage('Local', 'Lighting', 'Spanish')",
      },
      {
	text: 'Get C-Bus language ID',
	leaf: true,
	script: "-- Returns the language ID for German.\nlangid = GetCBusLanguageID('German')",
      },
      {
        text: 'Get scene ID',
        leaf: true,
        script: "-- Get ID for scene 'off'\nvalue = GetSceneID('off')"
      },
      {
        text: 'Get scene name',
        leaf: true,
        script: "-- Get name for scene 10\nvalue = GetSceneName(10)"
      },
      {
        text: 'Get scene level',
        leaf: true,
        script: "-- Get level for scene 'off'\nvalue = GetSceneLevel('off')"
      },
      {
        text: 'Get minimum scene level',
        leaf: true,
        script: "-- Get minimum level for scene 'off'\nvalue = GetSceneMinLevel('off')"
      },
      {
        text: 'Get maximum scene level',
        leaf: true,
        script: "-- Get maximum level for scene 'off'\nvalue = GetSceneMaxLevel('off')"
      },
      {
	text: 'Store live values into scene',
	leaf: true,
	script: "-- Update scene 'Off' with  the live values currently set\nStoreScene('Off')"
      },
      {
        text: 'Get scene setting',
        leaf: true,
        script: "-- Get setting for scene 'off'\nvalue = SceneIsSet('off')"
      },
      {
        text: 'Get C-Bus unit address',
        leaf: true,
        script: "-- Get C-Bus unit address for this device\nvalue = GetCBusUnitAddr()"
      },
      {
        text: 'Get unit parameter age',
        leaf: true,
        script: "-- Get age in seconds of unit parameter 1 in unit 210 on the local network\nvalue = GetUnitParamAge(0, 210, 1)"
      },
      {
        text: 'Get unit parameter status',
        leaf: true,
        script: "-- Get status of unit parameter 1 in unit 210 on the local network\nvalue = GetUnitParamStatus(0, 210, 1)"
      },
      {
        text: 'Get unit parameter',
        leaf: true,
        script: "-- Get unit parameter 1 in unit 210 on the local network\nvalue = GetUnitParameter(0, 210, 1)"
      },
      {
        text: 'Get C-Bus status',
        leaf: true,
        script: "-- Get online status of C-Bus network\nvalue = GetCBusStatus()"
      },
      {
        text: 'Wait for C-Bus status',
        leaf: true,
        script: "-- Wait up to 30 sec for C-Bus to come online\n--value is false if the timeout expired\nvalue = WaitForCBusStatus(30)"
      },
      {
        text: 'Return the local network number',
        leaf: true,
        script: "-- Return local network number.\nlocalnet = GetLocalNetwork()"
      },
      {
        text: 'Return the default lighting application',
        leaf: true,
        script: "-- Return default lighting application.\napp = GetDefaultLightingApplication()"
      },
    ]
  },
  /*{
    text: 'C-Bus Error',
    cls: 'folder',
    expanded: false,
    children: [
          {
        text: 'Get C-Bus error variable addresses as a table',
        leaf: true,
        script: "-- Get C-Bus error variable address on network \'Local\'.\ncberr = GetCBusErrorVarAddr('Local')"
      },
      {
	text: 'Get C-Bus error information as a table',
	leaf: true,
	script: "-- Get most recent C-Bus error for LE dimmer with channel 1 device ID 122.\ncberr = GetCBusError('Local', 'LE Dimmer', 122, true, 1)"
      },
      {
        text: 'Get C-Bus error information as a table',
        leaf: true,
        script: "-- Get most recent C-Bus error for LE dimmer on network \'Local\'.\ncberr = GetCBusErrorByVarAddr('Local', 'LE Dimmer')"
      },
      {
	text: 'Format a C-Bus error as a text string',
	leaf: true,
	script: "-- Log formatted C-Bus error.\nlog(CBusFormatError(cberr))"
      },
      {
	text: 'Send a C-Bus error acknowledge message',
	leaf: true,
	script: "-- Acknowledge the most recent error from LE dimmer with channel 1 device ID 122.\nCBusAckError('Local', 'LE Dimmer', 122, true, 1)"
      },
      {
        text: 'Send a C-Bus error acknowledge message',
        leaf: true,
        script: "-- Acknowledge the most recent error from LE dimmer on network \'Local\'.\nCBusAckErrorByVarAddr('Local', 'LE Dimmer')"
      },
      {
        text: 'Send a C-Bus message to clear the most severe error',
        leaf: true,
        script: "-- Clear the most severe error from LE dimmer with channel 1 device ID 122.\nCBusClearMostSevereError('Local', 'LE Dimmer', 122, 1)"
      },
      {
        text: 'Send a C-Bus message to clear the most severe error',
        leaf: true,
        script: "-- Clear the most severe error from LE dimmer on network \'Local\'.\nCBusClearMostSevereError('Local', 'LE Dimmer')"
      },
    ]
  },*/
  {
    text: 'C-Bus Security',
    cls: 'folder',
    expanded: false,
    children: [
      {
	text: 'Send keypress on security application',
	leaf: true,
	script: "-- Send keypress '0' to network 'Local'\nCBusSecurityKeypress('Local', '0')\n-- Send keypress 'Enter' to network 'Local'\nCBusSecurityKeypress('Local', 'Enter')\n"
      },
      {
	text: 'Send a raise alarm message on the security application',
	leaf: true,
	script: "-- Raise the alarm on the network 'Local'\nCBusSecurityRaiseAlarm('Local')"
      },
      {
	text: 'Send an arm system message on the security application',
	leaf: true,
	script: "-- Arm the system on network 'Local' to the maximum level\nCBusSecurityArm('Local', 'Highest')\n-- Or just\nCBusSecurityArm('Local')"
      },
      {
	text: 'Send a raise tamper message on the security application',
	leaf: true,
	script: "-- Raise a tamper on network 'Local'\nCBusSecurityRaiseTamper('Local')"
      },
      {
	text: 'Send a drop tamper message on the security application',
	leaf: true,
	script: "-- Drop tamper on network 'Local'\nCBusSecurityDropTamper('Local')"
      },
      {
	text: 'Display a message on the security application',
	leaf: true,
	script: "-- Display message on panel\nCBusSecurityMessage('Local', 'test')"
      },
      {
	text: 'Get a security parameter',
	leaf: true,
	script: "-- Check if the alarm is sounding\nlog(CBusSecurityGet('Local', 'Alarm Sounding'))\n-- Check if there is a mains failure\nlog(CBusSecurityGet('Local', 'Mains failure'))\n-- Check the isolation status of zone 2\nlog(CBusSecurityGet('Local', 'Zone isolated', 2))"
      },
    ]
  },
  {
    text: 'C-Bus MRA',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Send current feed as part response for a previous MRA set feed command',
        leaf: true,
        script: "-- Send current feed '2' on zone '7' with -3db gain to network 'Local'\nCBusMRARespCurrentFeed('Local', 7, 2, 3)\n"
      },      
      {
        text: 'Get a MRA object value as a table',
        leaf: true,
        script: "-- Get current source(feed) '5' on zone '7' from network 'Local'\nCBusMRAGetObjectValue('Local', 7, 5)\n"
      },
      {
        text: 'Set a value to a MRA object',
        leaf: true,
        script: "-- Set 'Next Feed' to the command object '10' on zone '7' to network 'Local'\nCBusMRASetObjectValue('Local', 7 , 10, {value='Next Feed'})\n"
      },
    ]
  },
  {
    text: 'C-Bus MTC',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Send the number of entries that it is about to send as part response for a previous MTC enumerate command',
        leaf: true,
        script: "-- Send response to MRA enumerate tracks command on media link group '1' from start '6' with size '12' to network 'Local'\nCBusMTCEnumSize('Local', 1, 2, 6, 12)\n"
      },
      {
        text: 'Get a MTC object value as a table',
        leaf: true,
        script: "-- Get current track name ('FunctionAddr=11') on medial link group '7' from network 'Local'\nCBusMTCGetObjectValue('Local', 7, 11)\n"
      },
      {
        text: 'Set a value to a MTC object',
        leaf: true,
        script: "-- Set 'Next Track' to the command object ('FunctionAddr=26') on media link group '7' to network 'Local'\nCBusMTCSetObjectValue('Local', 7 , 26, {value='Next Track'})\n"
      },
    ]
  },
  {
    text: 'User Parameters',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Get user parameter',
        leaf: true,
        script: "-- Get value of user parameter 'now_temp' on local network\nvalue = GetUserParam('Local', 'now_temp')"
      },
      {
        text: 'Set user parameter',
        leaf: true,
        script: "-- Set value of user parameter 'now_temp' on local network to 12.1\nSetUserParam('Local', 'now_temp', 12.1)"
      }
    ]  
  },
  {
    text: 'I/O',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Read digital input',
        leaf: true,
        script: "-- Read state of digital input\nvalue = ReadDigitalInput()"
      },
      {
        text: 'Read digital input range',
        leaf: true,
        script: "-- Read range of digital input\nvalue = ReadDigitalInputRng()"
      },
      {
        text: 'Read digital input text representation',
        leaf: true,
        script: "-- Read text representation of digital input state\nvalue = ReadDigitalInputTxt()"
      },
      {
        text: 'Set relay state',
        leaf: true,
        script: "-- Set state of the relay to on\nSetRelayState(true)"
      },
      {
        text: 'Get relay state',
        leaf: true,
        script: "-- Get state of the relay\nvalue = GetRelayState()"
      },
      {
        text: 'Set LED mode',
        leaf: true,
        script: "-- Set mode of LED to 'normal'\nSetLEDMode('normal')"
      },
      {
        text: 'Set LED state',
        leaf: true,
        script: "-- Set state of LED on\nSetLEDState(true)"
      },
      {
        text: 'Get LED state',
        leaf: true,
        script: "-- Get state of LED\nvalue = GetLEDState()"
      },
      {
        text: 'Toggle LED state',
        leaf: true,
        script: "-- Toggle state of LED\nToggleLEDState()"
      }
    ]
  },
  {
    text: 'C-Bus Error',
    cls: 'folder',
    expanded: false,
    children: [
      {
        text: 'Get error object ids based on the network id or name, system id or name, device id or name, channel id or name.',
        leaf: true,
        script: `-- Will get all the object ids associated with the given network id or network tag name (Optional), system id or name (Optional), device id or name (Optional), channel id or name (Optional). \nvalue = GetCbusErrorObjectId(network, system, device, channel)`
      },
      {
        text: 'Get error by object id.',
        leaf: true,
        script: `-- Depends on the most_recent parameter, It will return the error of object id. If most recent is true, it will return the most recent error otherwise it will return most severe error.\nvalue = GetCBusErrorByObjectId(most_recent, object_id)`
      },
      {
        text: 'Get error based on parameters.',
        leaf: true,
        script: `-- This function will return one or more error based on parameters like network (Optional), system (Optional), device (Optional), channel (optional) and most_recent. If most recent is true, it will return the most recent error otherwise it will return most severe error.\nvalue = GetCBusError(most_recent, network, system, device, channel)`
      },
      {
        text: 'Acknowledge error based on object id.',
        leaf: true,
        script: `-- This function will acknowledge error based on the object id passed. If most_recent is true, it will acknowledge most recent error otherwise it will acknowledge most severe error.\nvalue = CBusAckErrorByObjectId(most_recent, object_id)`
      },
      {
        text: 'Acknowledge error based on parameters.',
        leaf: true,
        script: `-- This function will acknowledge one or more error based on the network, device, channel (optional) passed. If most_recent is true, it will acknowledge most recent error otherwise it will acknowledge most severe error.\nvalue = CBusAckError(most_recent, network, device, channel)`
      },
      {
        text: 'Clear error based on object id.',
        leaf: true,
        script: `-- This function clear error based on the object id passed.\nvalue = CBusClearErrorByObjectId(object_id)`
      },
      {
        text: 'Clear error based on parameters.',
        leaf: true,
        script: `-- This function will clear one or more error based on the parameters like network, device, channel (optional).\nvalue = CBusClearError(network, device, channel)`
      }
    ]
  }
]
