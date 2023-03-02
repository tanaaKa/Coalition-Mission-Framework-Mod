/*

	Filename:  fn_respawnStatsLocal.sqf 
	Locality: Runs on player
	Description: Handles Player respawn.
	
	Params: N/A

*/

if (!hasInterface) exitWith {};

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