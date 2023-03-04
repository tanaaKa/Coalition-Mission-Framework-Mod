/*

	Filename:  fn_respawnStats.sqf 
	Locality: Runs on server
	Description: Handles Player respawns on the server.
	
	Params:
	(handled by EH)

*/

params ["_newEntity"];

if (!isServer) exitWith {};

// Sleep so Player can boot into ACE Spectator and subsequently actually registers in the array that "ace_spectator_fnc_players" returns
uiSleep 0.15;

// Just in case the function "ace_spectator_fnc_players" doesn't return anything
_aceSpectatorArray = [];

// Get all players in ace spectator as a array
_aceSpectatorArray = [] call ace_spectator_fnc_players;

if (typeOf _newEntity isEqualTo "potato_spectate_spectator" || _newEntity in _aceSpectatorArray) exitWith {
	_playerTimeAlive = (serverTime - missionStartTime);
	[_playerTimeAlive, 2, (getPlayerUID _newEntity)] call CMF_fnc_updateStatArray;
};

_newEntity setVariable ["playerUID", (getPlayerUID _newEntity), true];

[] remoteExec ["CMF_fnc_respawnStatsLocal", _newEntity];