/*

	Filename:  fn_localShotsFired.sqf 
	Locality: Runs on player
	Description: add onto players "Shots_Fired" variable.
	
	Params:
	(handled by EH)

*/

params ["_unit"];

_Shots_Fired = _unit getVariable "Shots_Fired";

if (isNil "_Shots_Fired") exitWith {_unit setVariable ["Shots_Fired", 0];};

_Shots_Fired = _Shots_Fired + 1;
_unit setVariable ["Shots_Fired", _Shots_Fired];