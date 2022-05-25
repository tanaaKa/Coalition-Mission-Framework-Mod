class Extended_PreInit_EventHandlers {
    class ADDON {
        init = "call compile preprocessFileLineNumbers '\x\cmf\addons\framework\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
	class ADDON {
        init = "call compile preprocessFileLineNumbers '\x\cmf\addons\framework\XEH_postInit.sqf'";
		serverInit = "call compile preprocessFileLineNumbers '\x\cmf\addons\framework\XEH_serverPostInit.sqf'";
		clientInit = "call compile preprocessFileLineNumbers '\x\cmf\addons\framework\XEH_clientPostInit.sqf'";
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
		class jst_vehCrewDeath
		{ 
			serverInit = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; [_unit] spawn CMF_fnc_handleDamage;}])";
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
			serverInit = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; [_unit] spawn CMF_fnc_handleDamage;}])";
		};
	};
	class Helicopter 
	{
		class cmf_nothermals 
		{ 
			init = "(_this select 0) disableTIEquipment true;"; 
		};
	};
};
