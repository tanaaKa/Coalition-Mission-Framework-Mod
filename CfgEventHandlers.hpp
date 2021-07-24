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
			init = "(_this select 0) disableTIEquipment true;"; 
		};
		class jst_vehCrewDeath
		{ 
		  init = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; if !(isServer) exitWith {}; {_x setDamage 1;} forEach crew _unit}])";
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
		class jst_vehCrewDeath
		{ 
		  init = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; if !(isServer) exitWith {}; {_x setDamage 1;} forEach crew _unit}])";
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
