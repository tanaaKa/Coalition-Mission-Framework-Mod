_version = getText (missionConfigFile >> "cmfVers");
if (_version isEqualTo "") exitWith {};

diag_log "[CMF]: Starting CMF PostInit Client";

[] spawn {	
	// Cutscene for the start of the game
	[1,["Initializing","BLACK"]] remoteExec ["cutText", player]; // it only works if we remoteexec it. idk

	// Set weapons to safe on spawn in
	player action ["SwitchWeapon", player, player, 299];

	// Disable player while initializing
	player enableSimulation false;

	// Disable random animals
	enableEnvironment [false, true];

	// Set eye aperture setting to auto
	setAperture -1;

	// Disable raycast checks for performance
	disableRemoteSensors true;

	// Client only scripts and event handlers
	call CMF_fnc_localEHs;
	call CMF_fnc_fdsInit;
	//call CMF_fnc_factoryaction; -- Pending rewrite
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
		call CMF_fnc_addArsenal;
		call JST_fnc_addSafeStartHeal;
		player enableStamina false;
	} else {
		player enableStamina true;
		if !(isNull "JST_SSHeal") then 
		{
			player removeAction JST_SSHeal;
		};
	};

	// Enable player
	player enableSimulation true;
	[1,["","PLAIN"]] remoteExec ["cutText", player];
	
	call CMF_fnc_AddLoadoutModule;
	// Welcome message
	call CMF_fnc_initWelcome;
	
	// Initialize stamina system - MUST BE CALLED LAST due to scheduled environment
	call CMF_fnc_staminaHandler;
};

diag_log "[CMF]: Completed CMF PostInit Client";