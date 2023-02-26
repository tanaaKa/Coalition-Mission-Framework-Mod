/*

	Filename:  fn_respawnStats.sqf 
	Locality: Runs on server
	Description: Handles Player respawns so respawn missions actually work.
	
	Params:
	(handled by EH)

*/

params ["_newEntity", "_oldEntity"];

// Just in case the function "ace_spectator_fnc_players" doesn't return anything
_aceSpectatorArray = [];

// Get all players in ace spectator as a array
_aceSpectatorArray = [] call ace_spectator_fnc_players;

if (typeOf _newEntity isEqualTo "potato_spectate_spectator" || player in _aceSpectatorArray) exitWith {
	_playerTimeAlive = (serverTime - missionStartTime);
	[_playerTimeAlive, 2, (getPlayerUID _newEntity)] call CMF_fnc_updateStatArray;
};

player setVariable ["playerUID", (getPlayerUID _newEntity), true];

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