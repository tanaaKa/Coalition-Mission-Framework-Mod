//====================================================================================
//
//	wha_dp_teleportGroup.sqf - 
//
//	Teleports group of a unit to a new location with dispersion.
//
//	call wha_dp_fnc_teleportGroup;
//
//	Contact: Whale #5963
//
//====================================================================================

//	Parameters
//		- unit = unit whose group will be moved
//		- position = position AGLS to be moved to
params["_position", "_unit", ["_dispersion",-1]];

//	Get units in group of parameter unit.
_units = units group _unit;

// If dispersion not passed through, use global default
if ( _dispersion < 0 ) then
{ _dispersion = WHA_DP_DISPERSION; };

// Iterate through units in group of unit . . .
{
	// Randomize target position with dispersion
	_randomDispersion = random[0,(_dispersion-_dispersion/3),_dispersion];
	_randomDirection = random 360;
		
	// Get new position
	_position = _position getPos [_randomDispersion, _randomDirection];
	
	// If the unit is in a vehicle, only teleport them if they are the
	// lead unit in the vehicle.
	// TODO - if non-group member is commanding vehicle, deploy anyways
	//_unit_not_in_vehicle = (isNull objectParent _unit);
	//_unit_commands_vehicle = (_unit == effectiveCommander objectParent _unit);
	//if ( _unit_not_in_vehicle || _unit_commands_vehicle )
	//then { [_position, _x] call wha_dp_fnc_teleportUnit; };
	[_position, _x] call wha_dp_fnc_teleportUnit;
	// TODO - tell everyone that this vehicle will deploy
} forEach _units;