/*

	Filename:  fn_handleMissionEnd.sqf 
	Locality: Runs on server
	Description: Export Still alive player data to main array.
	
	Params:
	N/A

*/

if (!isServer || (getText (missionConfigFile >> "cmfVers") isEqualTo "") || (getText (getMissionConfig "Header" >> "gameType") isEqualTo "CMFSPCL")) exitWith {};

{
	if (typeOf _x isEqualTo "potato_spectate_spectator" || typeOf _x isEqualTo "potato_spectate_playableSpectator" || typeOf _x isEqualTo "VirtualCurator_F") exitWith {};
	_Shots_Fired = _x getVariable "Shots_Fired";
	if !(isNil "_Shots_Fired") then {
		[_Shots_Fired, 9, (getPlayerUID _x)] remoteExec ["CMF_fnc_updateStatArray", 2];
	};

	_Player_Time_Alive = (CBA_missionTime - tnk_ssTime);
	[_Player_Time_Alive, 2, (getPlayerUID _x)] remoteExec ["CMF_fnc_updateStatArray", 2];
} forEach allPlayers;