// ====================================================================================
//
//	wha_dp_functions.sqf - Compiles functions for WHA deploy script.
//
//	Contact: Whale #5963
//
// ====================================================================================

//-------------------------------------------------------------------------------------
//	Parameters:
//	1. _acePresent (BOOL) - Presence of ACE addon in mission. Default: false
//-------------------------------------------------------------------------------------

//params [["_acePresent",false]];


//-------------------------------------------------------------------------------------
//	Preprocess and compile static functions.
//-------------------------------------------------------------------------------------

// TODO - removed deprecated
//	Preprocessor shortcut for compiling a function and permanently saving it.
#define COMPILE_FINAL compileFinal preprocessFileLineNumbers

//	Establishing functions.
wha_dp_fnc_addDeploy = COMPILE_FINAL "cmf\fds\functions\wha_dp_addDeploy.sqf";
wha_dp_fnc_addDeployGroup = COMPILE_FINAL "cmf\fds\functions\wha_dp_addDeployGroup.sqf";
wha_dp_fnc_deployLocal = COMPILE_FINAL "cmf\fds\functions\wha_dp_deployLocal.sqf";
wha_dp_fnc_teleportGroup = COMPILE_FINAL "cmf\fds\functions\wha_dp_teleportGroup.sqf";
wha_dp_fnc_teleportUnit = COMPILE_FINAL "cmf\fds\functions\wha_dp_teleportUnit.sqf";
wha_dp_fnc_teleportLocal = COMPILE_FINAL "cmf\fds\functions\wha_dp_teleportLocal.sqf";

//-------------------------------------------------------------------------------------
//	Preprocess and compile functions that vary depending on mod presence.
//-------------------------------------------------------------------------------------

//	Preprocessor shortcut for compiling and running code once without saving.
//	Used because all the compiling is done within the files below.

/*
//	Construct hint system based on presence of ACE.
//	Compilation takes place within the file. TODO : TBD : Don't do this.
[_acePresent] CALL_NOSAVE "wha\earplugs\functions\wha_ep_compileHint.sqf";

//	Construct & compile action system based on presence of ACE.
//	Compilation takes place within the file. TODO : TBD : Don't do this.
[_acePresent] CALL_NOSAVE "wha\earplugs\functions\wha_ep_compileAction.sqf";
*/