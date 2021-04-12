//====================================================================================
//
//	fn_vehicleOfType.sqf - Checks is player vehicle is in an array of config types.
//							For use with WH Earplugs system.
//
//	call wh_ep_fnc_vehicleOfType;
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Import parameters.
//	- vehicle: The unit ID of the vehicle being checked, ie: 78a4a040# 163977
//	- types: The types to compare it to, ie: ["Tank","Car","Plane_F"]
//------------------------------------------------------------------------------------

params ["_vehicle", "_types"];


//------------------------------------------------------------------------------------
//	Check if _vehicle inherits hierarchy from _types.
//------------------------------------------------------------------------------------

//	Initialize result.
_result = false;

//	Iterate through the array of _types...
{
	// ...and if the vehicle inherits from one of the types, set the result to true.
	if ( (_vehicle) isKindOf _x ) 
	then {_result = true;};
} forEach _types;

//	Return the result.
_result