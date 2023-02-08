/*

	Filename:  fn_respawnStats.sqf 
	Locality: Runs on server
	Description: Handles Player respawns so respawn missions actually work.
	
	Params:
	(handled by EH)

*/

params ["_newEntity", "_oldEntity"];

if (typeOf _newEntity isEqualTo "potato_spectate_spectator") exitWith {

	_Shots_Fired = _oldEntity getVariable "Shots_Fired";
	if !(isNil "_Shots_Fired") then {
		[_Shots_Fired, 9, (getPlayerUID _newEntity)] call CMF_fnc_updateStatArray;
	};

	_Player_Time_Alive = (CBA_missionTime - tnk_ssTime);
	[_Player_Time_Alive, 2, (getPlayerUID _newEntity)] call CMF_fnc_updateStatArray;
};

_newEntity addEventHandler ["FiredMan", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
	[_unit] call CMF_fnc_localShotsFired;
}];