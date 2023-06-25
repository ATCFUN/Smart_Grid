/**
 * the common modules method
 *
 * Call the API to check the availability of the modules, and variant the display
 * 
 */

/**
 *
 * check the communication modules availability
 * 
 */
var commModuleList = {

	checkCommModuleList: function ()
	{
		var reqRegisterObject = ({
			type: 'GET',
			url: '/api/commModuleList',
			returnType: 'json',
			successCallback: commModuleList.getDataSuccess,
			failCallback: commModuleList.getFail,
		});	
		// Request values for Registers
		pmAjax.sendGet(reqRegisterObject);		
	},
	
	getDataSuccess: function(data, reqObj)
	{
		function checkModuleExist(module)
		{
			for(var i=0; i<data.result.length; i++)  
			{  
				if(typeof data['result'][i]['name'] !== 'undefined')
				{
					if(data['result'][i]['name'].indexOf(module) >= 0)
					{
						// console.log("module available");
						return 1;
					}
				}			
			}	
			return 0;	
		}
		
		if(checkModuleExist("IR") !== 1)
		{
			// console.log("hide items for COM2/IR port");
			$(".IR").hide();
		}
		if(checkModuleExist("485") !== 1)
		{
			// console.log("hide items for COM1/RS485 port");
			$(".RS485").hide();
		}
		if(checkModuleExist("Ethernet") !== 1)
		{
			// console.log("hide items for Ethernet port");
			$(".ETH").hide();
		}
		if(checkModuleExist("USB") !== 1)
		{
			// console.log("hide items for USB");
			$(".USB").hide();
		}
		if(checkModuleExist("Comm 4") !== 1)
		{
		   // console.log("hide items for COM4/RS485 port");
		   $(".Com4").hide();
		}
	},

	getFail: function()
	{
		console.log("getFail not defined");
	}
}

/**
 *
 * check a specified module availability
 * 
 */
var modulesStateCheck = {
	modulesCheck: function (id)
	{
		var reqRegisterObject = ({
			type: 'GET',
			url: '/api/modulesCheck?module=' + id,
			returnType: 'json',
			successCallback: modulesStateCheck.getDataSuccess,
			failCallback: modulesStateCheck.getFail,
			elementId: id
		});	
		// Request values for Registers
		pmAjax.sendGet(reqRegisterObject);		
	},
	
	getDataSuccess: function(data, reqObj)
	{
		function checkModuleExist(module)
		{
		   // console.log(module);
			for(var i=0; i<data.result.length; i++)  
			{  
				if(typeof data['result'][i]['name'] !== 'undefined')
				{
					if(data['result'][i]['name'].indexOf(module) >= 0)
					{
						// console.log("module available");
						return 1;
					}
				}			
			}	
			return 0;	
		}
		
		if(checkModuleExist(reqObj.elementId) !== 1)
		{
			// console.log("hide modules not supported");
			$("." + reqObj.elementId).hide();
		}
	},

	getFail: function()
	{
		console.log("getFail not defined");
	}
}