// Backwards support for older missions to prevent duplication
_version = getText (missionConfigFile >> "cmfVers");
if (_version != "CMF2 1.0") exitWith {};

diag_log "[CMF]: Starting CMF PostInit Client";

[] spawn {
	//waitUntil {!isNil "initRan"};
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
	
	player addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		
		if (!isNull _instigator && (side (group _instigator) == playerSide) && (_unit != _instigator)) exitWith {
			[_unit, _instigator] remoteExecCall ["CMF_fnc_tkMsg", 2];
		};
		
		if (side (group _killer) == playerSide && (_unit != _killer)) exitWith {
			[_unit, _instigator] remoteExecCall ["CMF_fnc_tkMsg", 2];
		};
		
		// Set discord rich presence text
		[ 
			["UpdateDetails","Spectating (KIA)"], 
			["UpdateLargeImageText","Died in combat"],
			["UpdateSmallImageKey",""], 
			["UpdateSmallImageText",""],
			["UpdatePartySize",{isPlayer _x && alive _x} count allUnits], 
			["UpdatePartyMax",count (allPlayers - entities "HeadlessClient_F")],
			["UpdateStartTimestamp",[0,0]]
		] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}]);
	}];

	// Medical system choice for mission maker
	waitUntil {!isNil "medicalLoaded"};
	switch (side player) do
	{
		case WEST:			{if (!JST_mevBluEnabled) then {"buildccp\initmed.sqf" call CMF_Load;}};
		case INDEPENDENT:	{if (!JST_mevIndEnabled) then {"buildccp\initmed.sqf" call CMF_Load;}};
		case EAST:			{if (!JST_mevOpfEnabled) then {"buildccp\initmed.sqf" call CMF_Load;}};
	};
	
	// Welcome message
	waitUntil {CBA_missionTime > 5};
	call CMF_fnc_initWelcome;
};

diag_log "[CMF]: Completed CMF PostInit Client";