/*

	Filename:  fn_handleDisconnect.sqf 
	Locality: Runs on server
	Description: handles player disconnect.
	
	Params:
	N/A

*/
params ["_unit", "_id", "_uid", "_name"];

// Just in case the function "ace_spectator_fnc_players" doesn't return anything
_aceSpectatorArray = [];

// Get all players in ace spectator as a array
_aceSpectatorArray = [] call ace_spectator_fnc_players;

if (typeOf _unit isEqualTo "potato_spectate_spectator" || typeOf _unit isEqualTo "potato_spectate_playableSpectator" || typeOf _unit isEqualTo "VirtualCurator_F" || _unit in _aceSpectatorArray) exitWith {};

[1, 10, _uid] call CMF_fnc_updateStatArray;