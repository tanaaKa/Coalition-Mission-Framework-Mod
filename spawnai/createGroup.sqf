//------------------Edit these-----------------
//Create as many spawn points and attack points
//as you'd like
//---------------------------------------------
_spawnPos = getMarkerPos "spawn";
_attackPos = getMarkerPos "attack";
//---------------No more editing---------------
//Server check
if (!isServer) exitWith {};

//Create group
private _group = createGroup [east, true];
private _unit = _group createUnit ["O_Soldier_F", _spawnPos, [], 0, "NONE"];
private _leader = group _unit selectLeader _unit;

/* private _group1 = createGroup [east, true];
private _unit1 = _group1 createUnit ["O_Soldier_F", _spawnPos1, [], 0, "NONE"];
private _leader1 = group _unit1 selectLeader _unit; */

//Loop to create unit and add to group
private _counter = 0;
while {_counter < 4} do {
	_newUnit = "O_Soldier_F" createUnit [_spawnPos, _group];
	_counter = _counter + 1;
};

/* private _counter1 = 0;
while {_counter1 < 4} do {
	_newUnit = "O_Soldier_F" createUnit [_spawnPos1, _group1];
	_counter1 = _counter1 + 1;
}; */

//Move group to HC
[true] call potato_zeusHC_fnc_transferGroupsToHC;

//Attack point
[_group, _attackPos, 100, "SAD", "AWARE", "RED", "NORMAL", "LINE"] call CBA_fnc_addWaypoint;
[_group1, _attackPos, 100, "SAD", "AWARE", "RED", "NORMAL", "LINE"] call CBA_fnc_addWaypoint;