/*

	Filename:  fn_respawnStats.sqf 
	Locality: Runs on server
	Description: Handles Player respawns so respawn missions actually work.
	
	Params:
	(handled by EH)

*/

params ["_newEntity", "_oldEntity"];

if (typeOf _newEntity isEqualTo "potato_spectate_spectator") exitWith {
	_Player_Time_Alive = (CBA_missionTime - tnk_ssTime);
	[_Player_Time_Alive, 2, (getPlayerUID _newEntity)] call CMF_fnc_updateStatArray;
};

_newEntity addEventHandler ["FiredMan", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
	[] call CMF_fnc_localShotsFired;
}];

[
	{!alive player},
	{
		params ["_Player_UID"];
		[Shots_Fired, 9, _Player_UID] remoteExec ["CMF_fnc_updateStatArray", 2];
		Shots_Fired = 0;
	}, 
	[
		(getPlayerUID player)
	]
] call CBA_fnc_waitUntilAndExecute;