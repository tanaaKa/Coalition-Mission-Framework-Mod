/*
 * Author: tanaKa
 * Assigns limited ace arsenal to players from gearscripts on CMF.
 * Run locally.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] execVM "addarsenal.sqf";
 *
 * Public: No
 */


// If safestart disabled, exit (for jips)
if (gameLive) exitWith {};

// Include gear based on init.sqf option and add to arsenal
if (ArsenalOption == 2) then { // 'advanced' gearscript
	private _class = [typeOf player, 9] call BIS_fnc_trimString;
	private _path = missionConfigFile >> "CfgLoadouts" >> toLower faction player >> _class;
	private _Uniform = getArray (_path >> "uniform");
	private _Vest = getArray (_path >> "vest");
	private _Backpack = getArray (_path >> "backpack");
	private _Headgear = getArray (_path >> "headgear");
	private _Goggles = getArray (_path >> "goggles");
	private _basicItems = ["ItemMap","ItemWatch","ItemCompass"];
	
	//Specify virtual items available
	[player, _Uniform] call ace_arsenal_fnc_addVirtualItems;
	[player, _Vest] call ace_arsenal_fnc_addVirtualItems;
	[player, _Backpack] call ace_arsenal_fnc_addVirtualItems;
	[player, _Headgear] call ace_arsenal_fnc_addVirtualItems;
	[player, _Goggles] call ace_arsenal_fnc_addVirtualItems;
	[player, _basicItems] call ace_arsenal_fnc_addVirtualItems;
} else { // default 'normal' gearscript
	private _path = missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "rifleman";
	private _Uniform = getArray (_path >> "uniform");
	private _Vest = getArray (_path >> "vest");
	private _Backpack = getArray (_path >> "backpack");
	private _Headgear = getArray (_path >> "headgear");
	private _Goggles = getArray (_path >> "goggles");
	private _basicItems = ["ItemMap","ItemWatch","ItemCompass"];
	
	//Specify virtual items available
	[player, _Uniform] call ace_arsenal_fnc_addVirtualItems;
	[player, _Vest] call ace_arsenal_fnc_addVirtualItems;
	[player, _Backpack] call ace_arsenal_fnc_addVirtualItems;
	[player, _Headgear] call ace_arsenal_fnc_addVirtualItems;
	[player, _Goggles] call ace_arsenal_fnc_addVirtualItems;
	[player, _basicItems] call ace_arsenal_fnc_addVirtualItems;
};

// Add arsenal action to player self-interact
_action = ["miniarsenal","Customize Loadout","",{[player, player, false] call ace_arsenal_fnc_openBox},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToObject;

// Eventhandler for missing items in uniform
// and mag check
tnk_closeMA =
{
	//Readd map/watch/compass JIC
	player linkItem "ItemMap";
	player linkItem "ItemWatch";
	player linkItem "ItemCompass";
	
	//This section defines and checks magazines
	//Reset players gear if they added too many magazines
	
	// Base Defines
	_class = [typeOf player, 9] call BIS_fnc_trimString;
	_gearpath = missionConfigFile >> "CfgLoadouts" >> toLower faction player >> _class;
	_magazinesArray = getArray (_gearpath >> "magazines"); 
	_magazines = _magazinesArray param [0,""];
	_magazines = str _magazines splitString ":,""";
	_magClassname = _magazines param [0,""];
	_maxMags = _magazines param [1,""];
	_maxMags = parseNumber _maxMags;
	
	// Rifle Magazine Check
	if ({_x == _magClassname} count magazines player > _maxMags) then {
		hint "Too many magazines detected. Resetting gear.";
		systemChat "[COA MA] ERROR: Too many magazines detected. Resetting gear. Message admin you filthy casual.";
		removeAllWeapons player;
		removeBackpack player;
		removeAllItems player;
		//[player] call potato_assignGear_fnc_assignGearMan;
		["potato_adminMsg", [format ["%1 attempted to take too many magazines. Resetting gear. Reset manually for good measure.", (name player)]]] call CBA_fnc_globalEvent;
	};
	// LAT Rocket Check
	_atClass = ["potato_w_lat","potato_e_lat","potato_i_lat"];
	if ((typeOf player) in _atClass) then {
		private _rocketmagazines = _magazinesArray param [3,""]; 
		private _rocketmagazines = str _rocketmagazines splitString ":,"""; 
		private _rockets = _rocketmagazines param [0,""];
		if ({_x == _rockets} count magazines player > 1) then {
			hint "Too many rockets detected. Resetting gear.";
			systemChat "[COA MA] ERROR: Too many rockets detected. Resetting gear. Message admin you filthy casual.";
			removeAllWeapons player;
			removeBackpack player;
			removeAllItems player;
			//[player] call potato_assignGear_fnc_assignGearMan;
			["potato_adminMsg", [format ["%1 attempted to take too many rockets. Resetting gear. Reset manually for good measure.", (name player)]]] call CBA_fnc_globalEvent;
		};
	};
	// MAT Rocket/Missile Check
	_matClass = ["potato_w_matg","potato_e_matg","potato_i_matg"
	,"potato_w_matl","potato_e_matl","potato_i_matl","potato_w_matag","potato_e_matag","potato_i_matag"];
	if ((typeOf player) in _atClass) then {
		private _rocketmagazine1 = _magazinesArray param [3,""];
		private _rocketmagazine2 = _magazinesArray param [4,""];
		private _rocketmagazine1 = str _rocketmagazine1 splitString ":,"""; 
		private _rocketmagazine2 = str _rocketmagazine2 splitString ":,"""; 
		private _rocketmagazine1 = _rocketmagazine1 param [0,""];
		private _rocketmagazine2 = _rocketmagazine2 param [0,""];
		private _rocketmagazine1max = _rocketmagazine1 param [1,""];
		private _rocketmagazine2max = _rocketmagazine2 param [1,""];
		private _rocketmagazine1max = parseNumber _rocketmagazine1max;
		private _rocketmagazine2max = parseNumber _rocketmagazine2max;
		if ({_x == _rocketmagazine1} count magazines player > _rocketmagazine1max || {_x == _rocketmagazine2} count magazines player > _rocketmagazine2max) then {
			hint "Too many rockets/missiles detected. Resetting gear.";
			systemChat "[COA MA] ERROR: Too many rockets/missiles detected. Resetting gear. Message admin you filthy casual.";
			removeAllWeapons player;
			removeBackpack player;
			removeAllItems player;
			//[player] call potato_assignGear_fnc_assignGearMan;
			["potato_adminMsg", [format ["%1 attempted to take too many rockets. Resetting gear. Reset manually for good measure.", (name player)]]] call CBA_fnc_globalEvent;
		};
	};
	// M203/GP25 Check
	_gpClass = ["potato_w_plt","potato_e_plt","potato_i_plt","potato_w_sl","potato_e_sl","potato_i_sl"
	,"potato_w_ftl","potato_e_ftl","potato_i_ftl","potato_w_rifleman_02","potato_e_rifleman_02","potato_i_rifleman_02"];
	if ((typeOf player) in _gpClass) then {
		private _40mm = _magazinesArray param [1,""]; // Only works if there's one mag defined in gs
		private _40mm = str _40mm splitString ":,"""; 
		private _40mmammo = _40mm param [0,""];
		private _40mmmax = _40mm param [1,""];
		if ({_x == _40mmammo} count magazines player > _40mmmax) then {
			hint "Too many 40mm grenades detected. Resetting gear.";
			systemChat "[COA MA] ERROR: Too many 40mm grenades detected. Resetting gear. Message admin you filthy casual.";
			removeAllWeapons player;
			removeBackpack player;
			removeAllItems player;
			//[player] call potato_assignGear_fnc_assignGearMan;
			["potato_adminMsg", [format ["%1 attempted to take too many M203s/GP25s. Resetting gear. Reset manually for good measure.", (name player)]]] call CBA_fnc_globalEvent;
		};
	};
};

["ace_arsenal_displayClosed", tnk_closeMA] call CBA_fnc_addEventHandler;