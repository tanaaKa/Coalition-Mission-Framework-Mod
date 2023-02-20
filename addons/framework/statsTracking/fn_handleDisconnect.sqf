/*

	Filename:  fn_handleDisconnect.sqf 
	Locality: Runs on server
	Description: handles player disconnect.
	
	Params:
	N/A

*/
params ["_unit", "_id", "_uid", "_name"];

if (typeOf _unit isEqualTo "potato_spectate_spectator" || typeOf _unit isEqualTo "potato_spectate_playableSpectator" || typeOf _unit isEqualTo "VirtualCurator_F") exitWith {};

[1, 10, _uid] call CMF_fnc_updateStatArray;

if (!isNil "shotsFired") then {
	[shotsFired, 9, _uid] remoteExec ["CMF_fnc_updateStatArray", 2];
};