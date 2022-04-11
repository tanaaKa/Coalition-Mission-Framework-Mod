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
waitUntil {player getVariable ["potato_assigngear_gearSetup", true]};
if !(getMissionConfigValue "potato_missionTesting_miniArsenal") exitWith {systemChat "[COA MA] MiniArsenal is disabled in this mission"};
if (CBA_missionTime > 15) exitWith {systemChat "[COA MA] MiniArsenal is disabled due to JIPing"};
if (gameLive) exitWith {};
_maType = getMissionConfigValue "potato_missionTesting_miniArsenalType";
_startingMags = count magazines player;

// Include gear based on init.sqf option and add to arsenal
if (_maType isEqualTo 2) then { // 'advanced' gearscript
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
	
	//JIP support check
	if (_startingMags == 0 || _startingMags == nil) exitWith {systemChat "[COA MA] Miniarsenal detected that you had zero mags originally. Reseting gear just in case."; [player] call potato_assignGear_fnc_assignGearMan;};
	
	//Check for extra magazines and reset gear if so
	_endingMags = count magazines player;
	
	if (_endingMags > _startingMags) then {
		[player] call potato_assignGear_fnc_assignGearMan;
		["potato_adminMsg", [format ["%1 took too many magazines. Resetting gear for good measure.", (name player)]]] call CBA_fnc_globalEvent;
		systemChat "[COA MA] ERROR: You attempted to take more magazines. This isn't allowed in our sessions. Your gear has been reset.";
	};
};

["ace_arsenal_displayClosed", tnk_closeMA] call CBA_fnc_addEventHandler;