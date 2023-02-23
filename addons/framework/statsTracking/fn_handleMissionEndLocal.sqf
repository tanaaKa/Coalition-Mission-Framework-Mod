/*

	Filename:  fn_handleMissionEndLocal.sqf 
	Locality: Runs on Clients
	Description: Export alive player data to main array
	
	Params:
	N/A

	Usage:
	[] spawn CMF_fnc_handleMissionEndLocal;

*/
if (
	!hasInterface || 
	isServer || 
	typeOf _x isEqualTo "potato_spectate_spectator" || 
	typeOf _x isEqualTo "potato_spectate_playableSpectator" || 
	typeOf _x isEqualTo "VirtualCurator_F"
) exitWith {};

if (!isNil "shotsFired") then {
	[shotsFired, 9, (getPlayerUID player)] remoteExec ["CMF_fnc_updateStatArray", 2];
};

_playerTimeAlive = (serverTime - missionStartTime);
[_playerTimeAlive, 2, (getPlayerUID player)] remoteExec ["CMF_fnc_updateStatArray", 2];