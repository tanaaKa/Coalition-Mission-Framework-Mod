
params ["_side","_mev","_fh","_fhClass", "_fhName"];
private _pos = getPos _fh;
private _inv = getItemCargo _fh;
_mev setVariable ["JST_mevInv", _inv, true];
deleteVehicle _fh;
private _allMedicsOnSide = [];
{
	if
	(
		(side _x isEqualTo _side) and
		(
			(typeOf player isEqualTo "potato_w_plm") or
			(typeOf player isEqualTo "potato_i_plm") or
			(typeOf player isEqualTo "potato_e_plm") or
			(typeOf player isEqualTo "potato_w_sm") or
			(typeOf player isEqualTo "potato_i_sm") or
			(typeOf player isEqualTo "potato_e_sm")
		)
	)
	then
	{
		_allMedicsOnSide pushBackUnique _x;
	};
} forEach allPlayers;
[_side, _mev, _fhClass, _fhName] remoteExec ["JST_fnc_mev_addBuildAction", _allMedicsOnSide];
[_side, _mev, _fh, _fhName] remoteExec ["JST_fnc_mev_removePackAction", _allMedicsOnSide];
[false, _pos, _fhName] remoteExec ["JST_fnc_mev_handleFHMarkerBySide", _side];