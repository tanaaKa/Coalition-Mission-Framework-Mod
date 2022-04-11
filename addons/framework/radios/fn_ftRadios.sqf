/*
 * Author: tanaKa
 * Hands out radios for fireteam nets
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call CMF_fnc_initRadios;
 *
 * Public: No
 */
params["_coyLeaders","_pltLeaders","_squadLeaders","_ftLeaders","_medics","_specialties"];

systemChat "[CMF] Fireteam nets active";

//Add 343s to all
player additem "ACRE_PRC343";

//FTLs
//343 - fireteam
//148 - squad net
if (typeof player in _ftLeaders || typeof player in _medics || typeof player in _specialties) then {
	player additem "ACRE_PRC148";
};

//SLs, PLs, COYs
//343 - team
//148 - squad/platoon/coy
//117 - squad/platoon/coy
if (typeof player in _squadLeaders || typeof player in _pltLeaders || typeof player in _coyLeaders) then {
	player additem "ACRE_PRC148";
	player additem "ACRE_PRC117F";
};

//Choose channels for infantry


// Set radios to assigned so potato calls the channel setup
radiosAssigned = true;