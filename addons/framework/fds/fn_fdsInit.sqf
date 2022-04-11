//====================================================================================
//
//	wha_dp_init.sqf - 
//	
//	Initializes values for WHA deploy function.
//
//	[] execVM "wha\deploy\wha_dp_init.sqf";
//
//	Contact: Whale#5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Initial setup.
//------------------------------------------------------------------------------------

private _fdsEnabled = getMissionConfigValue "potato_missionTesting_forwardDeploy";
if !(_fdsEnabled) exitWith {};

//	Used so that I don't have to use actual #include command, which can create issues.
#define CALL_NOSAVE call compile preprocessFileLineNumbers

//	User-friendly name to track script.
scriptName "WHA DEPLOY";

//	Make sure this isn't a dedicated server or headless client.
if (!hasInterface) exitWith {};


//------------------------------------------------------------------------------------
//	Configuration, functions, settings import, and additional setup.
//------------------------------------------------------------------------------------

// TODO 
//	Get an array of which mods are currently active.
//_modsArray = [] CALL_NOSAVE "wha\deploy\init\wha_dp_checkMods.sqf";

//	Interpret returned array from checkMods.
///_modsArray params [ ["_cbaPresent",false], ["_acePresent",true] ];

//	Allows for missionmaker configuration of important settings.
CALL_NOSAVE "x\cmf\addons\framework\fds\wha_dp_CONFIG.sqf";

//	Emergency exit if the deploy system is disabled.
if ( !WHA_DP_DEPLOY ) exitWith 
{
	diag_log "[WHA-DP] System still present, but disabled. Consider removing WHA 
	Deploy system if it is not being used."
};

//	Construct & compile functions.
//	Uses local variables collected earlier to determine which functions to use.
CALL_NOSAVE "x\cmf\addons\framework\fds\wha_dp_functions.sqf";

//	Imports settings if CBA is not present,
//	sets up an options menu if it is.

// need settings so players can decide whether chute autoopens
// TODO
//[_cbaPresent] CALL_NOSAVE "wha\deploy\init\wha_dp_settings.sqf";

//	Add basic briefing detailing script features.
//	If CBA is not present, add a settings menu and import profile settings.
// TODO
//[_cbaPresent] CALL_NOSAVE "wha\deploy\init\wha_dp_briefing.sqf";


//------------------------------------------------------------------------------------
//	Add action and finalize.
//------------------------------------------------------------------------------------

//	Add deploy self-interact or action to group leader if they do not have it already.
// TODO
//if ( [player] call wha_dp_fnc_canDeploy ) then { 
// waituntil safestart
//[player] call wha_dp_fnc_addDeployGroup;
// band-aid below:
if (leader player == player) then
{ [player] call wha_dp_fnc_addDeploy; };
//};

//	Script tracing.
diag_log "[WHA-DP] Initialization finished.";