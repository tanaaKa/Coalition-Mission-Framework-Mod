//====================================================================================
//
//	wha_dp_teleportUnit.sqf - 
//
//	Teleports target unit to target position.
//
//	call wha_dp_fnc_teleportUnit;
//
//	Contact: Whale #5963
//
//====================================================================================

//	Parameters
//		- unit = unit whose group will be moved
//		- position = position AGLS to be moved to
params["_position", "_unit"];

// Tell client machine to fade and teleport itself locally.
[_position, _unit] remoteExec ["wha_dp_fnc_teleportLocal", _unit];