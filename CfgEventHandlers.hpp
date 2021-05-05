class Extended_PreInit_EventHandlers {
    class ADDON {
        init = "call compile preprocessFileLineNumbers '\x\cmf\addons\framework\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
	class ADDON {
        init = "call compile preprocessFileLineNumbers '\x\cmf\addons\framework\XEH_postInit.sqf'";
		clientInit = "call compile preprocessFileLineNumbers '\x\cmf\addons\framework\XEH_clientPostInit.sqf'";
		serverInit = "call compile preprocessFileLineNumbers '\x\cmf\addons\framework\XEH_serverPostInit.sqf'";
	};
};

class Extended_InitPost_EventHandlers
{
	class Car 
	{
		class cmf_noeject 
		{ 
			init = "(_this select 0) allowCrewInImmobile true;"; 
		};
		class cmf_nothermals 
		{ 
			init = "(_this select 0) disableTIEquipment true;"; exclude = "LSV_01_AT_base_F";  
		};
	};
	class Tank
	{
		class cmf_noeject 
		{ 
			init = "(_this select 0) allowCrewInImmobile true;"; 
		};
		class cmf_nothermals 
		{ 
			init = "(_this select 0) disableTIEquipment true;"; 
		};
	};
	class Helicopter 
	{
		class cmf_nothermals 
		{ 
			init = "(_this select 0) disableTIEquipment true;"; 
		};
	};
	class Plane 
	{
		class cmf_nothermals 
		{ 
			init = "(_this select 0) disableTIEquipment true;"; 
		};
	};
};
