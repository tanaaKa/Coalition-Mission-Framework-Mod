/* 	
	Drops a bunch of CCP backpacks to be constructed.
	By: Whale
	
	TODO:
		-Make more efficient?
*/

private["_pos"];

// Get position cursor is pointing to unless position is already passed as a param.
_pos = 0;
_pos = screenToWorld [0.5, 0.5];

// If player is more than six meters from pointing direction, exit with a hint.
if ((player distance _pos)>6) exitWith {
	_errorString = "Desired CCP position too far from player. Look at a closer position.";
	hint _errorString;
};

// The entire action is within the ACE progressbar call.
[5,_pos,{
	params["_pos"];
	private["_site"];
	
	// Spawn backpacks the CCP can be constructed from. Rotates packs towards player.
	_site = "Misc_BackpackHeap" createVehicle _pos;
	_rot = [_site, player] call BIS_fnc_relativeDirTo;
	_site setDir (getDir _site)+_rot;

	// Add ACE interact to construct CCP packs into a tent.
	_constructAction = ["constructCCP","Construct","",{_target execVM "scripts\buildccp\construct_charlie.sqf";},{true},{},_site] call ace_interact_menu_fnc_createAction;  
	[_site, 0, ["ACE_MainActions"], _constructAction] remoteExecCall ["ace_interact_menu_fnc_addActionToObject",0];
	
	// Add ACE interact to pack up ccp backpacks ONLY for the person that placed it.
	_packupAction = ["packupCCP","Pack Up","",{_target execVM "scripts\buildccp\packup_charlie.sqf";},{true}] call ace_interact_menu_fnc_createAction;  
	[_site, 0, ["ACE_MainActions"], _packupAction] call ace_interact_menu_fnc_addActionToObject;

	// Remove 'unpack CCP' action from inventory.
	[player,1,["ACE_SelfActions","unpackCCP"]] call ace_interact_menu_fnc_removeActionFromObject;
}, {}, "Unpacking CCP..."] call ace_common_fnc_progressBar;
