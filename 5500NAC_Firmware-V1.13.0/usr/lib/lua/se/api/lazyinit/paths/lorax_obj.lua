LJ¹=   3  3 3  :3 :3 3 3 ::	3
 :3 ::2 3 3 :;:: H  	post  parameters 	$ref!#/definitions/LoraxObjCreate description"Data for CAC object creation.	name	datarequiredin	bodyresponses409 descriptionResource already exists400 description7Invalid input data, see error description in reply201  schema formatcac_object_address	typestring descriptionCreatedconsumes  application/json	tags description•9Creates CAC object for given address.<br/>Error Application (206) -<br/>Note 1: The following channels are specific for object type: 251->Channel Aggregator Error; 252->Line A Error; 253->Line B Error; 254->Unit Error.<br/>Note 2: To create network error use device id 255; to create project error use network id 255 and device id 255.<br/><br/>Security Application (208) -<br/>Note 1: For zone related parameters{Zone isolated, Zone state, Zone name}, subgroup (Zone Number) in the range of 1-127 shall be provided in address field.
            <br/>Unit parameter (255) -
            Note 1: The timeout period will always be set to three times the poll interval, unless it is set to zero. The timeout period can also be greater than three times the poll interval. If the poll interval is not specified, the default value of 5 will be used. If the timeoutperiod is not specified(for the very first time), the default value of 0 will be used. 
            <br>Refer below for the examples of JSON body
            <br><b>Lighting</b> <br>
            {
                "comment": "Lighting object",
                "export": true,
                "log": true,
                "address": "0/56/1",
                "cbustagmap": {
                    "network":"Local",
                    "application":"Lighting",
                    "group":"LightingGroup"
                },
                "highpriolog": false,
                "tags": [
                    "Test keyword"
                ]
            }
            <br><b>Media Transport</b> <br>
            {
                "comment": "Media Transport object",
                "export": true,
                "log": true,
                "address": "0/192/0/0",
                "cbustagmap": {
                    "network":"Local",
                    "application":"Media Transport",
                    "group":"Grp1",
                    "subgroup":"Play/Stop"
                },
                "highpriolog": false,
                "tags": [
                    "Test keyword"
                ]
            }
            <br><b>Trigger</b> <br>
            {
                "comment": "Trigger object",
                "export": true,
                "log": true,
                "address": "0/202/0",
                "cbustagmap": {
                    "group":"Grp1"
                },
                "highpriolog": false,
                "tags": [
                    "Test keyword"
                ]
            }
            <br><b>Enable</b> <br>
            {
                "comment": "Enable object",
                "export": true,
                "log": true,
                "address": "0/203/0",
                "cbustagmap": {
                    "group":"Grp1"
                },
                "highpriolog": false,
                "tags": [
                    "Test keyword"
                ]
            }
            <br><b>Audio</b> <br>
            {
                "comment": "Audio object",
                "export": true,
                "log": true,
                "address": "0/205/0/1",
                "cbustagmap": {
                },
                "highpriolog": false,
                "tags": [
                    "Test keyword"
                ]
            }
            <br><b>Security</b> <br>
            {
                "comment": "Security object",
                "export": true,
                "log": true,
                "address": "0/208/21/1",
                "cbustagmap": {
                    "subgroup":"Zone 1"
                },
                "highpriolog": false,
                "tags": [
                    "Test keyword"
                ]
            }
            <br><b>Error -> Device Error</b> <br>
            {
                "comment": "Device Error object",
                "export": true,
                "log": true,
                "address": "0/206/0/0",
                "cbustagmap": {
                    "group":"Dev_0",
                    "subgroup":"Ch_0"
                },
                "highpriolog": false,
                "errorparams":{
                    "cbe_devicetype":"872",
                    "is_native": false
                },
                "tags": [
                    "Test keyword"
                ]
            }
            <br><b>Error -> Network Error</b> <br>
            {
                "comment": "Network Error object",
                "export": true,
                "log": true,
                "address": "0/206/255",
                "cbustagmap": {
                    "group":"NetworkError"
                },
                "highpriolog": false,
                "tags": [
                    "Test keyword"
                ],
                "errorparams":{}
            }
            <br><b>Measurement</b> <br>
            {
                "comment": "Measurement object",
                "export": true,
                "log": true,
                "address": "0/228/1/1",
                "cbustagmap": {
                    "group":"Device1",
                    "subgroup":"Channel1"
                },
                "highpriolog": false,
                "tags": [
                    "Test keyword"
                ]
            }
            <br><b>Emergency exit light</b> <br>
            {
                "comment": "Emergency exit light",
                "export": true,
                "log": false,
                "address": "0/238/0/0/0",
                "datahex": "",
                "lightsourcelife": 1666,
                "cbustagmap": {
                  "node": "obj-0",
                  "group": "cdg",
                  "network": "Local",
                  "subgroup": "line -0",
                  "levels": [],
                  "application": "Emergency Exit Light"
                },
                "highpriolog": false,
                "tags": [
                    "Test keyword"
                ]
            }
            <br><b>User Parameter</b> <br>
            {
                "comment": "User parameter",
                "suffix": "px",
                "datatype": 1,
                "highpriolog": false,
                "log": true,
                "cbustagmap": {
                  "levels": [ ],
                  "group": "Variable_Address",
                  "network": "Local",
                  "application": "User Parameter"
                },
                "tags": [
                  "Test keyword"
                ],
                "export": false,
                "address": "0/250/84",
                "addtagmap": false
            }
            <br><b>Unit Parameter</b> <br>
            {
                "comment": "Unit parameter",
                "log": true,
                "highpriolog": false,
                "timeoutperiod": 20,
                "pollinterval": 6,
                "tags": [
                  "test keyword"
                ],
                "cbustagmap": {
                  "levels": [ ],
                  "group": "Unit_addres_group",
                  "network": "Local",
                  "subgroup": "Light Level",
                  "application": "Unit Parameter"
                },
                "export": false,
                "address": "0/255/221/2",
                "addtagmap": false
            }
        operationIdlorax.obj.postsummaryCreate CAC object  CAC Object 