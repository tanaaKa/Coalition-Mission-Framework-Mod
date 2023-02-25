_version = getText (missionConfigFile >> "cmfVers");
if (_version isEqualTo "") exitWith {};

diag_log "[CMF]: Starting CMF PostInit Client";

[] spawn {
	// Wait until the player inits
	waitUntil {!isNull player && time > 0 && !isNil dbConnected};

	// Verify player is registered - MP check to avoid issues in editor
	if (isMultiplayer && dbConnected) then {
		[player] remoteExec ["CMF_fnc_verifyRegistered", 2];
	};
	
	// Grab mission name for use later
	private _missionName = getText (missionConfigFile >> "MissionSQM" >> "Mission" >> "Intel" >> "briefingName");

	// Cutscene for the start of the game
	[1,["Initializing","BLACK"]] remoteExec ["cutText", player]; // it only works if we remoteexec it. idk

	// Set weapons to safe on spawn in
	player action ["SwitchWeapon", player, player, 299];

	// Disable player while initializing
	//player enableSimulation false;

	// Disable random animals
	enableEnvironment [false, true];

	// Set eye aperture setting to auto
	setAperture -1;

	// Disable raycast checks for performance
	disableRemoteSensors true;

	// Client only scripts and event handlers
	call CMF_fnc_localEHs;
	call CMF_fnc_fdsInit;
	//[] spawn CMF_fnc_factoryaction; -- Pending rewrite
	call CMF_fnc_limitVD;

	// Medical system choice for mission maker
	waitUntil {!isNil "medicalLoaded"};
	switch (side player) do
	{
		case WEST:			{if (!JST_mevBluEnabled) then {"buildccp\initmed.sqf" call CMF_Load;}};
		case INDEPENDENT:	{if (!JST_mevIndEnabled) then {"buildccp\initmed.sqf" call CMF_Load;}};
		case EAST:			{if (!JST_mevOpfEnabled) then {"buildccp\initmed.sqf" call CMF_Load;}};
	};
	
	// Persistant game started stuff
	if !(gameLive) then {
		// Add a crash-during-load check for the first ten minutes of safe start
		if (serverTime < 600) exitWith 
		{
			call CMF_fnc_addArsenal;
			call JST_fnc_addSafeStartHeal;
			player enableStamina false;
		};

		// If player is a JIP and has not connected prior (aka the player did not crash), kick him back to slotting
		[_missionName] call CMF_fnc_JIPCheck;

		call CMF_fnc_addArsenal;
		call JST_fnc_addSafeStartHeal;
		player enableStamina false;
	} else {
		player enableStamina true;
		if !(isNil "JST_SSHeal") then 
		{
			player removeAction JST_SSHeal;
		};
	};

	// Add deploy to JIP
	// Checks to see if the JIP options was added elsewhere first
	if (groupID group player find "JIP" > -1 && isNil "F3_JIP_reinforcementOptionsAction") then {
		F3_JIP_reinforcementOptionsAction = player addaction ["<t color='#dddd00'>"+ "JIP MENU" + "</t>","x\cmf\addons\framework\JIP\f_JIP_reinforcementOptions.sqf",[],6,true,false,"","_target == player"];
	};

	// Enable player
	//player enableSimulation true;
	[1,["","PLAIN"]] remoteExec ["cutText", player];
	
	call CMF_fnc_AddLoadoutModule;
	// Welcome message
	call CMF_fnc_initWelcome;

	// Mark player as connected in this mission
	profileNamespace setVariable ["cmf_hasPlayed", _missionName];

	// Begin player stat tracking
	call CMF_fnc_statsInitLocal;
	
	// Initialize stamina system - must be last due to scheduler
	call CMF_fnc_staminaHandler;
};

diag_log "[CMF]: Completed CMF PostInit Client";