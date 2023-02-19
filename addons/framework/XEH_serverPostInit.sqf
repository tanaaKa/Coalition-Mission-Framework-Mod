// Backwards support for older missions to prevent duplication
_version = getText (missionConfigFile >> "cmfVers");
if (_version isEqualTo "") exitWith {};

[] spawn CMF_fnc_readyUp;
[] spawn CMF_fnc_garbageCleanup;
[] spawn CMF_fnc_patchInit;
[] spawn CMF_fnc_webhookBrief;
[] spawn CMF_fnc_serverEHs;
[] spawn CMF_fnc_statsInitServer;