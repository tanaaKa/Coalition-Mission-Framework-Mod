
// Local Execution, Global Effect ||| Originally used to grab and set the gear of a unit, Deprecated
CMF_fnc_SetLoadout = {
params ["_unit"]; 
 
private _typeOf = typeOf _unit;  
private _unitRole = toLower _typeOf select [9]; 
 
private _faction = faction _unit;   
private _modFaction = toLower _faction select [0,6];
if (_modFaction isEqualTo "potato") then {
	switch (side _unit) do{ 
		case west:{
			if (JKL_LoadoutWest isEqualTo "Default") then {
				_path = missionConfigFile >> "CfgLoadouts" >> _faction >> _loadout;
			} else {
				_path = configFile >> "CfgCMFLoadouts" >> JKL_LoadoutWest >> _loadout;
			};
		};   
		case east:{ 
			if (JKL_LoadoutEast isEqualTo "Default") then {
				_path = missionConfigFile >> "CfgLoadouts" >> _faction >> _loadout;
			} else {
				_path = configFile >> "CfgCMFLoadouts" >> JKL_LoadoutEast >> _loadout;
			};
		};   
		case independent:{ 
			if (JKL_LoadoutInd isEqualTo "Default") then {
				_path = missionConfigFile >> "CfgLoadouts" >> _faction >> _loadout;
			} else {
				_path = configFile >> "CfgCMFLoadouts" >> JKL_LoadoutInd >> _loadout;
			}; 
		};
		default {_path = missionConfigFile >> "CfgLoadouts" >> _faction >> _loadout;};
		};
		_loadout = [_path >> _unitRole, _unit] call potato_assignGear_fnc_getLoadoutFromConfig;  
		_unit setUnitLoadout _loadout; 
	};
};

// Local Execution, Global Effect ||| Compiles list of Gear for the User, when one is selected it sets their side to that gearscript
CMF_fnc_LeaderSetGear = {
_ModLoadouts = "true" configClasses (ConfigFile >> "CfgCMFLoadouts") apply {configName _x}; 
_ModLoadouts sort true;
_loadouts = ["Default"];
_loadouts append _ModLoadouts;

["Select Loadout", [["LIST", "Loadouts", [_Loadouts, _Loadouts apply {[_x]}, 0]]],
	{
	params ["_dialog", "_args"];
	_dialog params ["_type"];
	_args params ["_Loadouts"];
	switch (side player) do 
	{
	case west: {
		JKL_LoadoutWest = _type;
		publicVariable "JKL_LoadoutWest";
		remoteExec ["CMF_fnc_SetLoadoutWest",2];
		if (JKL_LoadoutWest == JKL_LoadoutEast) then {["Blufor and Opfor have selected the Same Gearscript"] remoteExec ["Hint"]};
		if (JKL_LoadoutWest == JKL_LoadoutInd) then {["Blufor and Indfor have selected the Same Gearscript"] remoteExec ["Hint"]};
		};
	case east: {
		JKL_LoadoutEast = _type;
		publicVariable "JKL_LoadoutEast";
		remoteExec ["CMF_fnc_SetLoadoutEast",2];
		if (JKL_LoadoutEast == JKL_LoadoutInd) then {["Opfor and Indfor have selected the Same Gearscript"] remoteExec ["Hint"]};
		if (JKL_LoadoutEast == JKL_LoadoutWest) then {["Opfor and Blufor have selected the Same Gearscript"] remoteExec ["Hint"]};
		};
	case independent: {
		JKL_LoadoutInd = _type;
		publicVariable "JKL_LoadoutInd";
		remoteExec ["CMF_fnc_SetLoadoutInd",2]	;
		if (JKL_LoadoutInd == JKL_LoadoutEast) then {["Indfor and Opfor have selected the Same Gearscript"] remoteExec ["Hint"]};
		if (JKL_LoadoutInd == JKL_LoadoutWest) then {["Indfor and Blufor have selected the Same Gearscript"] remoteExec ["Hint"]};					
		};				
	};
	}, {}, [_Loadouts]
] call zen_dialog_fnc_create;
}; 

// Server Exec ||| Runs during CMF_fnc_readyUp, If ZBM Gamemode is selected, will add the select gear option to Leadership
CMF_fnc_AddSetGearAction = {
params ["_unit"]; 
_MissionType = getMissionConfigValue "potato_missionTesting_missionType";
if (_MissionType isEqualTo 3) then {
_action = ["gearSelect", "Select Gear", "", {call CMF_fnc_LeaderSetGear}, {true}] call ace_interact_menu_fnc_createAction;
[_unit, 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToObject;
};
};

//Local Exec ||| Adds the Zeus Module to change the gearscript for each side
CMF_fnc_AddLoadoutModule = {
["CMF Loadouts", "Select Loadout",
    {
_ModLoadouts = "true" configClasses (ConfigFile >> "CfgCMFLoadouts") apply {configName _x}; 
_ModLoadouts sort true;
_loadouts = ["Default"];
_loadouts append _ModLoadouts;

      ["Select Loadout", [
			["SIDES","Side, Select One"],
          ["COMBO", "Loadouts", [_Loadouts, _Loadouts apply {[_x]}, 0]],
          ["CHECKBOX", "Reset Currently Equipped Gear?", [false]]
        ],
        {
          params ["_dialog", "_args"];
          _dialog params ["_side","_type","_reset"];
          _args params ["_Loadouts"];
			_sides = _side select 0;
			switch (_sides) do {
				case WEST: {
				JKL_LoadoutWest = _type;
				publicVariable "JKL_LoadoutWest";
				if (_reset) then {remoteExec ["CMF_fnc_SetLoadoutWest",2]} else {remoteExec ["CMF_fnc_UpdateMiniArsenal",WEST];};
				};
				case EAST: {
				JKL_LoadoutEast = _type;
				publicVariable "JKL_LoadoutEast";
				if (_reset) then {remoteExec ["CMF_fnc_SetLoadoutEast",2]} else {remoteExec ["CMF_fnc_UpdateMiniArsenal",EAST];};
				};
				case resistance: {
				JKL_LoadoutInd = _type;
				publicVariable "JKL_LoadoutInd";
				if (_reset) then {remoteExec ["CMF_fnc_SetLoadoutInd",2]} else {remoteExec ["CMF_fnc_UpdateMiniArsenal",resistance];};	
			};
		};
          
        }, {}, [_Loadouts]
      ] call zen_dialog_fnc_create;
    }
  ] call zen_custom_modules_fnc_register;
};

/// Server Exec ||| Decrease load on players by calling these on the server
CMF_fnc_SetLoadoutWest = {
{[_x] call potato_assignGear_fnc_assignGearMan; _x call CMF_fnc_UpdateMiniArsenal} forEach Units West 
};
CMF_fnc_SetLoadoutEast = {
{[_x] call potato_assignGear_fnc_assignGearMan; _x call CMF_fnc_UpdateMiniArsenal} forEach Units East 
};
CMF_fnc_SetLoadoutInd = {
{[_x] call potato_assignGear_fnc_assignGearMan; _x call CMF_fnc_UpdateMiniArsenal} forEach Units Independent 
};

// Local Exec ||| Updates Mini Arsenal with the new gear
CMF_fnc_UpdateMiniArsenal = {
	if (!hasInterface) exitWith {};
	[player, true, false] call ace_arsenal_fnc_removeVirtualItems;
	private _typeOf = typeOf player;  
	private _class = toLower _typeOf select [9];
	private _faction = faction player; 
	private _path = missionConfigFile >> "CfgLoadouts" >> _faction >> _class;
	switch (side player) do{ 
		case west:{
			if (JKL_LoadoutWest isEqualTo "Default") then {
				_path = missionConfigFile >> "CfgLoadouts" >> _faction >> _class;
			} else {
				_path = configFile >> "CfgCMFLoadouts" >> JKL_LoadoutWest >> _class;
			};
		};   
		case east:{ 
			if (JKL_LoadoutEast isEqualTo "Default") then {
				_path = missionConfigFile >> "CfgLoadouts" >> _faction >> _class;
			} else {
				_path = configFile >> "CfgCMFLoadouts" >> JKL_LoadoutEast >> _class;
			};
		};   
		case independent:{ 
			if (JKL_LoadoutInd isEqualTo "Default") then {
				_path = missionConfigFile >> "CfgLoadouts" >> _faction >> _class;
			} else {
				_path = configFile >> "CfgCMFLoadouts" >> JKL_LoadoutInd >> _class;
			}; 
		};
		default {_path = missionConfigFile >> "CfgLoadouts" >> _faction >> _class;};
	};
	private _Uniform = getArray (_path >> "uniform");
	private _Vest = getArray (_path >> "vest");
	private _Backpack = getArray (_path >> "backpack");
	private _Headgear = getArray (_path >> "headgear");
	private _Goggles = getArray (_path >> "goggles");
	private _Attach = getArray (_path >> "attachments");
	private _Optics = getArray (_path >> "opticChoices");
	private _basicItems = ["ItemMap","ItemWatch","ItemCompass"];
	
	//Specify virtual items available
	[player, _Uniform] call ace_arsenal_fnc_addVirtualItems;
	[player, _Vest] call ace_arsenal_fnc_addVirtualItems;
	[player, _Backpack] call ace_arsenal_fnc_addVirtualItems;
	[player, _Headgear] call ace_arsenal_fnc_addVirtualItems;
	[player, _Goggles] call ace_arsenal_fnc_addVirtualItems;
	[player, _Attach] call ace_arsenal_fnc_addVirtualItems;
	[player, _Optics] call ace_arsenal_fnc_addVirtualItems;
	[player, _basicItems] call ace_arsenal_fnc_addVirtualItems;
};
JKL_LoadoutWestSet = false;
JKL_LoadoutEastSet = false;
JKL_LoadoutIndSet = false;

JKL_LoadoutWest = "Default";
JKL_LoadoutEast = "Default";
JKL_LoadoutIndependent = "Default";