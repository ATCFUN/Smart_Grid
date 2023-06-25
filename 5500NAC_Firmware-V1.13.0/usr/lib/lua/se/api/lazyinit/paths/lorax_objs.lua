LJ÷/   03  3 3  :2  :3	 3 3 3 :::
:: 3 3 :3 :2 3 3 3 ::;:3 3 3 3 :::
:: 3 3 :2  :3 3 :
:: H  delete   descriptionOK. descriptionDeletes all CAC objects.operationIdlorax.objs.delsummaryDelete CAC objects  CAC Object	post   	$ref'#/definitions/LoraxObjSimpleResult 	type
array descriptionOK 	$ref!#/definitions/LoraxObjCreate 	type
array description1List of CAC object definition to be created.	nameobjectsrequiredin	bodyconsumes  application/json description═(Creates multiple CAC objects at once.<br>
        <br>Refer below for the example of JSON body
        [
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        ]
        operationIdlorax.objs.savesummary Create multiple CAC objects  CAC Objectget  responses200  schema
items 	$ref#/definitions/CacObjGet 	type
array descriptionOKparameters	tags description.Returns list of all existing CAC objects.operationIdlorax.objs.listsummary!List of existing CAC objects  CAC Object 