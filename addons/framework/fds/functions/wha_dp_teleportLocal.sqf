//====================================================================================
//
//	wha_dp_teleportLocal.sqf - 
//
//	Local function to teleport current player to a location.
//	Notifies, counts down, fades out.
//
//	call wha_dp_fnc_teleportLocal;
//
//	Contact: Whale #5963
//
//====================================================================================

//	Parameters
//		- position = position AGLS to be moved to
//		- unit (optional, default player) = unit to teleport
params["_position", ["_unit", player]];

// Create scheduled environment that can pause
_null = [_position, _unit] spawn
{
	params["_position", "_unit"];
	
	//	Count down
	// TODO - Do I need to spawn this separately?
	// why cant i use a for loop scheduled, wtf
	_timer = 10;
	while { _timer > 3 } do
	{
		// TODO - prettier
		hint format["Forward Deploying in %1",_timer];
		_timer = _timer - 1;
		sleep 0.9;
	};
	// Fade to black
	titleText["", "BLACK OUT", 3];
	while { _timer > 0 } do
	{
		// TODO - prettier
		hint format["Forward Deploying in %1",_timer];
		_timer = _timer - 1;
		sleep 0.9;
	};
	
	// Pre-teleport
	if (isNull objectParent _unit) then {
		_unit = player;
	} else {
		_unit = (objectParent player);
	};
	
	// Teleport
	if (surfaceIsWater _position) then {
		_unit allowDamage false;
		_unit setPosASLW [(_position) select 0, (_position) select 1, +2];
	} else {
		_unit allowDamage false;
		_unit setPos _position;
	};

	// Fade back in
	titleText["", "BLACK IN", 3];

	// Silent notification
	hintSilent "Deployed.";
	
	//wait 5 secs and enable damage
	sleep 5;
	_unit allowDamage true;
};