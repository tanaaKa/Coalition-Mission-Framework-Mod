/* 	
	Constructs CCP
	By: tanaKa & Whale

	TODO:
		-Get ACE interact nodes to work with CUP MASH
*/
params["_site"];

// Starts player construction animation.
[player] call ace_common_fnc_goKneeling;
[player, "AinvPknlMstpSnonWrflDr_medic5"] call ace_common_fnc_doAnimation;

// The entire action is within the ACE progressbar call.
[13,_site,{
	params["_site"];
	private["_pos", "_dir", "_grid", "_ccp", "_name", "_marker", "_hintString"];
	
	_pos = getPos _site; // Gets position of CCP
	_dir = getDir _site;
	_grid = mapGridPosition _pos; // Define grid position of player for hint
	_name = name player; // Define name of player for hint
	_hintString = format ["Platoon Field Hospital established at GR#%1 by %2",_grid,_name]; // Predefine hint

	// Delete backpack pile.
	deleteVehicle _site;
	
	// Creates physical MASH at location of construction site
	_ccp = (getMissionConfigValue "potato_missionTesting_FHBuilding") createVehicle _pos;
	_ccp addItemCargoGlobal ["ACE_epinephrine", 40];
	_ccp addItemCargoGlobal ["ACE_morphine", 40];
	_ccp addItemCargoGlobal ["ACE_Bodybag", 20];
	_ccp addItemCargoGlobal ["ACE_quikclot", 30];
	_ccp addItemCargoGlobal ["ACE_bloodIV", 20];
	_ccp addItemCargoGlobal ["ACE_bloodIV_500", 20];
	_ccp addItemCargoGlobal ["ACE_bloodIV_250", 20];
	_ccp addItemCargoGlobal ["ACE_plasmaIV", 20];
	_ccp addItemCargoGlobal ["ACE_salineIV", 20];
	_ccp addItemCargoGlobal ["ACE_tourniquet", 10];
	_ccp addItemCargoGlobal ["ACE_elasticBandage", 50];
	_ccp addItemCargoGlobal ["ACE_packingBandage",50];
	_ccp addItemCargoGlobal ["ACE_adenosine", 20];
	_ccp addItemCargoGlobal ["ACE_splint", 20];
	_ccp addItemCargoGlobal ["ACE_surgicalKit",2];
	_ccp addItemCargoGlobal ["ACE_Chemlight_HiRed", 2]; 
	_ccp addItemCargoGlobal ["ACE_Chemlight_HiYellow", 2]; 
	_ccp addItemCargoGlobal ["ACE_Chemlight_HiWhite", 2];
	_ccp addItemCargoGlobal ["ace_marker_flags_black", 2];
	_ccp addItemCargoGlobal ["ace_marker_flags_red", 2];
	_ccp addItemCargoGlobal ["ace_marker_flags_yellow", 2];
	_ccp addItemCargoGlobal ["ace_marker_flags_white", 2];
	_ccp setDir _dir;
	_ccp allowdamage false;

	//Adds KAT medical if KAT is present - Blame phil
	if (isClass(configFile >> "CfgPatches" >> "kat_main")) then 
	{
  		_ccp addItemCargoGlobal ["kat_accuvac", 4];
		_ccp addItemCargoGlobal ["kat_Pulseoximeter", 5];
		_ccp addItemCargoGlobal ["kat_stethoscope", 5];
		_ccp addItemCargoGlobal ["kat_X_AED", 2];
		_ccp addItemCargoGlobal ["kat_AED", 2];
		_ccp addItemCargoGlobal ["kat_IV_16", 100];
		_ccp addItemCargoGlobal ["kat_IO_FAST", 25];
		_ccp addItemCargoGlobal ["kat_aatKit", 50];
		_ccp addItemCargoGlobal ["kat_chestseal", 50];
		_ccp addItemCargoGlobal ["kat_larynx", 10];
		_ccp addItemCargoGlobal ["kat_guedel", 10];
		_ccp addItemCargoGlobal ["kat_lidocaine", 25];
		_ccp addItemCargoGlobal ["kat_naloxone", 35];
		_ccp addItemCargoGlobal ["kat_nitroglycerin", 35];
		_ccp addItemCargoGlobal ["kat_norepinephrine", 35];
		_ccp addItemCargoGlobal ["kat_phenylephrine", 35];
		_ccp addItemCargoGlobal ["kat_amiodarone", 35];
		_ccp addItemCargoGlobal ["kat_atropine", 35];
		_ccp addItemCargoGlobal ["kat_TXA", 30];
		_ccp addItemCargoGlobal ["kat_Carbonate", 10];
		_ccp addItemCargoGlobal ["kat_Painkiller", 10];
		_ccp addItemCargoGlobal ["kat_retractor", 20];
		_ccp addItemCargoGlobal ["kat_scalpel", 20;
		_ccp addItemCargoGlobal ["kat_nalbuphine", 25];
		_ccp addItemCargoGlobal ["kat_lorazepam", 25];
		_ccp addItemCargoGlobal ["kat_flumazenil", 35];
		_ccp addItemCargoGlobal ["kat_kat_fentanyl", 25];
		_ccp addItemCargoGlobal ["kat_etomidate", 25];
		_ccp addItemCargoGlobal ["kat_EACA", 30];
		_ccp addItemCargoGlobal ["kat_vacuum", 10];
		_ccp addItemCargoGlobal ["kat_clamp", 20];
		_ccp addItemCargoGlobal ["kat_plate", 40];
		_ccp addItemCargoGlobal ["Attachable_Helistretcher", 4];
	};

	// Add ACE interact to call reinforcements
	//_reinforceAction = ["reinforceCCP","Call for Reinforcements","",{_target execVM "scripts\buildccp\reinforcements.sqf";},{true},{}] call ace_interact_menu_fnc_createAction;
	//[_ccp, 0, ["ACE_MainActions"], _reinforceAction] remoteExecCall ["ace_interact_menu_fnc_addActionToObject",0]; 
	// Or, rather we would -- if the node wasn't configured terribly for the CUP mash building.
	// It appears inside the thing in the center. We're using holdAction for now.
	/* [  _ccp,  
	"Call Reinforcements",  // title
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  // icon
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  // icon while in-progress
	"_this distance _target < 8",  // distance to initiate
	"_caller distance _target < 12",// distance to hold
	{},  
	{},  
	{[_target] execVM "scripts\buildccp\reinforcements.sqf";},  // code to run on completion
	{},  
	[],  
	2,  // duration
	0,  
	true,  // disappears on completion
	false  
	] remoteExecCall ["BIS_fnc_holdActionAdd",0]; // syncs across clients */
	
	// Creates a marker for the new physical MASH
	{
		if (side _x isEqualTo side player) then {
			_marker = createMarkerLocal [format["PLT FH %1", time], _ccp];
			_marker setMarkerShapeLocal "ICON";
			_marker setMarkerTypeLocal "loc_hospital";
			_marker setMarkerColorLocal "ColorWhite";
			_marker setMarkerTextLocal "PLT FH";
		};
	} forEach allPlayers;
	
	// Alert the appropriate players that a MASH has been constructed
	_notificationTargets = side player;
	_hintString remoteExec ["hint", _notificationTargets];
	[_marker,1] remoteExec ["setMarkerAlpha", _notificationTargets];
	
	// Ends animation
	player switchMove ([player] call ace_common_fnc_getDefaultAnim);
}, {
	// Ends animation if play exits progress bar
	player switchMove ([player] call ace_common_fnc_getDefaultAnim);
}, "Constructing FH..."] call ace_common_fnc_progressBar;

	// Spawn veh for adv med purposes
	if (getMissionConfigValue "potato_missionTesting_FHVeh") then {
		uiSleep 10;
		_veh1 = createVehicle [getMissionConfigValue "potato_missionTesting_FHVehicle", player modelToWorld [10, 0, 0], [], 0, "NONE"];
		_veh1 addItemCargoGlobal ["ACE_epinephrine", 10];
		_veh1 addItemCargoGlobal ["ACE_morphine", 10];
		_veh1 addItemCargoGlobal ["ACE_Bodybag", 5];
		_veh1 addItemCargoGlobal ["ACE_quikclot", 10];
		_veh1 addItemCargoGlobal ["ACE_salineIV", 5];
		_veh1 addItemCargoGlobal ["ACE_elasticBandage", 10];
		_veh1 addItemCargoGlobal ["ACE_packingBandage",10]; 
	};

ccpUsed = true;
