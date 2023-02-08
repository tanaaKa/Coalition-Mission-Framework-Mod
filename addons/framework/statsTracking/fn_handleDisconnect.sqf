/*

	Filename:  fn_handleDisconnect.sqf 
	Locality: Runs on server
	Description: handles player disconnect.
	
	Params:
	N/A

*/
params ["_unit", "_id", "_uid", "_name"];

if (typeOf _unit isEqualTo "potato_spectate_spectator" || typeOf _unit isEqualTo "potato_spectate_playableSpectator" || typeOf _unit isEqualTo "VirtualCurator_F") exitWith {};

_unit getVariable "Shots_Fired";

if !(isNil "_Shots_Fired") then {
	[_Shots_Fired, 9, _uid] call CMF_fnc_updateStatArray;
};

[1, 10, _uid] call CMF_fnc_updateStatArray;