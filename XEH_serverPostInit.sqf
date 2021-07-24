// Backwards support for older missions to prevent duplication
_version = getText (missionConfigFile >> "cmfVers");
if (_version != "CMF2 1.0") exitWith {};

[] spawn {
	waitUntil {!isNil "initRan"};

	// Server-only scripts
	[
		 "readyup\JST_readyUp.sqf"
		,"logging\session.sqf"
		,"cleanup\JST_garbageCleanup.sqf"
		,"patches\patchesinit.sqf"
	] call CMF_LoadAll;
};