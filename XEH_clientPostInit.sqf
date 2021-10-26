// Backwards support for older missions to prevent duplication
_version = getText (missionConfigFile >> "cmfVers");
if (_version != "CMF2 1.0") exitWith {};

diag_log "[CMF]: Starting CMF PostInit Client";

[] spawn {
	//waitUntil {!isNil "initRan"};
	// Prevent players from losing side status
	player addRating 10000;
	player addEventHandler ["HandleRating", {0 max (_this select 1)}];

	// Set weapons to safe on spawn in
	player switchMove "AmovPercMstpSlowWrflDnon";

	// Disable random animals
	enableEnvironment [false, true];

	// Set eye aperture setting to auto
	setAperture -1;

	// Disable raycast checks for performance
	disableRemoteSensors true;

	// Set player recoil higher
	player setUnitRecoilCoefficient 1.5;
	player setCustomAimCoef 0.80;
	player addEventHandler ["Respawn", {player setUnitRecoilCoefficient 1.5}];
	player addEventHandler ["Respawn", {player setCustomAimCoef 0.80}];

	// Ensure NoVoice
	player setSpeaker "NoVoice";
	player addEventHandler ["Respawn", {[player, "NoVoice"] remoteExecCall ["setSpeaker"];}];

	// Client only scripts
	call CMF_fnc_addArsenal;
	call CMF_fnc_cbaEH;
	call CMF_fnc_fdsInit;
	//call CMF_fnc_factoryaction; -- Pending rewrite
	[{time > 0}, {call CMF_fnc_limitVD}] call CBA_fnc_waitUntilAndExecute;
	if (gameLive) then {
		call CMF_fnc_showTimeOnMap;
	};
	
	//EH to remove medical items for EI
	["CAManBase", "Killed", {
		params ["_unit"];
		if (!isPlayer _unit) then {
			//Delete medical items from AI only
			_medicalItems = ["FirstAidKit","ACE_packingBandage","ACE_morphine","ACE_epinephrine","ACE_tourniquet","ACE_salineIV","ACE_elasticBandage","ACE_fieldDressing"];
			{_unit removeItems _x} forEach _medicalItems;
		};
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	// Medical system choice for mission maker
	waitUntil {!isNil "medicalLoaded"};
	switch (side player) do
	{
		case WEST:			{if (!JST_mevBluEnabled) then {"buildccp\initmed.sqf" call CMF_Load;}};
		case INDEPENDENT:	{if (!JST_mevIndEnabled) then {"buildccp\initmed.sqf" call CMF_Load;}};
		case EAST:			{if (!JST_mevOpfEnabled) then {"buildccp\initmed.sqf" call CMF_Load;}};
	};
};

diag_log "[CMF]: Completed CMF PostInit Client";