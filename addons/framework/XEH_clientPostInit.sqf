_version = getText (missionConfigFile >> "cmfVers");
if (_version isEqualTo "") exitWith {};

diag_log "[CMF]: Starting CMF PostInit Client";

[] spawn {	
	// Set weapons to safe on spawn in
	player action ["SwitchWeapon", player, player, 299];

	// Disable random animals
	enableEnvironment [false, true];

	// Set eye aperture setting to auto
	setAperture -1;

	// Disable raycast checks for performance
	disableRemoteSensors true;

	// Client only scripts and event handlers
	call CMF_fnc_localEHs;
	call CMF_fnc_addArsenal;
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
	if (gameLive) then {
		player enableStamina true;
		player removeAction JST_SSHeal;
	};
	
	call CMF_fnc_AddLoadoutModule;
	// Welcome message
	call CMF_fnc_initWelcome;
	
	// Initialize stamina system - MUST BE CALLED LAST due to scheduled environment
	call CMF_fnc_staminaHandler;
};

diag_log "[CMF]: Completed CMF PostInit Client";