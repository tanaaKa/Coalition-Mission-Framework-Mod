// Backwards support for older missions to prevent duplication
_version = getText (missionConfigFile >> "cmfVers");
if (_version isEqualTo "") exitWith {};

[] spawn {
	//waitUntil {!isNil "initRan"};

	// Server-only scripts and event handlers	
	call CMF_fnc_readyUp;
	call CMF_fnc_garbageCleanup;
	call CMF_fnc_sessionLog;
	call CMF_fnc_patchInit;
	call CMF_fnc_webhookBrief;
	call CMF_fnc_serverEHs;
};