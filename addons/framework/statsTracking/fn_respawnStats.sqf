/*

	Filename:  fn_respawnStats.sqf 
	Locality: Runs on server
	Description: Handles Player respawns so respawn missions actually work.
	
	Params:
	(handled by EH)

*/

params ["_newEntity", "_oldEntity"];

if (typeOf _newEntity isEqualTo "potato_spectate_spectator") exitWith {
	_PlayerTimeAlive = (CBA_missionTime - tnk_ssTime);
	[_PlayerTimeAlive, 2, (getPlayerUID _newEntity)] call CMF_fnc_updateStatArray;
};

player addEventHandler ["FiredMan", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
	shotsFired = shotsFired + 1;
}];

[
	{!alive player},
	{
		params ["_playerUID"];
		[shotsFired, 9, _playerUID] remoteExec ["CMF_fnc_updateStatArray", 2];
		shotsFired = 0;
	}, 
	[
		(getPlayerUID player)
	]
] call CBA_fnc_waitUntilAndExecute;