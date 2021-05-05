// Backwards support for older missions to prevent duplication
_version = getText (missionConfigFile >> "cmfVers");
systemChat format ["[CMF] Version: %1",_version];
if (_version != "CMF2 1.0") exitWith {systemChat "[CMF] Old or non-CMF2 mission detected. Reverting to mission files only.";};

diag_log "[CMF]: Starting CMF Post Init";

//
//Global post-inits
//
enableSaving [false, false];

//Var to check if game is live
if (isNil "gameLive") then 
{
	gameLive = false;
};

[] spawn {
	waitUntil {!isNil "initRan"};

	// Jesters medical rewrite
	// Auto enable medical vehicle based system per side if required vehicles present
	if (!isNil "BLU_MEV_1PL") then {JST_mevBluEnabled = true} else {JST_mevBluEnabled = false};
	if (!isNil "IND_MEV_1PL") then {JST_mevIndEnabled = true} else {JST_mevIndEnabled = false};
	if (!isNil "OPF_MEV_1PL") then {JST_mevOpfEnabled = true} else {JST_mevOpfEnabled = false};
	"mev\JST_mev_init.sqf" call CMF_Load;
};

"readyup\JST_readyUp.sqf" call CMF_Load;

diag_log "[CMF]: Completed CMF Post Init";