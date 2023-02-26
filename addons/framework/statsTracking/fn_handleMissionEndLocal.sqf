/*

	Filename:  fn_handleMissionEndLocal.sqf 
	Locality: Runs on Clients
	Description: Export alive player data to main array
	
	Params:
	N/A

	Usage:
	[] spawn CMF_fnc_handleMissionEndLocal;

*/

// Just in case the function "ace_spectator_fnc_players" doesn't return anything
_aceSpectatorArray = [];

// Get all players in ace spectator as a array
_aceSpectatorArray = [] call ace_spectator_fnc_players;

if (
	!hasInterface || 
	isServer || 
	player in _aceSpectatorArray ||
	typeOf player isEqualTo "potato_spectate_spectator" || 
	typeOf player isEqualTo "potato_spectate_playableSpectator" || 
	typeOf player isEqualTo "VirtualCurator_F"
) exitWith {};

if (!isNil "shotsFired") then {
	[shotsFired, 9, (getPlayerUID player)] remoteExec ["CMF_fnc_updateStatArray", 2];
};

_playerTimeAlive = (serverTime - missionStartTime);
[_playerTimeAlive, 2, (getPlayerUID player)] remoteExec ["CMF_fnc_updateStatArray", 2];