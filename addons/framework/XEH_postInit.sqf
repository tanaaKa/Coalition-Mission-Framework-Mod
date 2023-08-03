// Backwards support for older missions to prevent duplication
_newestVer = "CMF3 1.0.4";
_version = getText (missionConfigFile >> "cmfVers");
systemChat format ["[CMF] Version: %1",_version];
if (_version isEqualTo "") exitWith {systemChat "[CMF] Non-CMF mission detected. Reverting to mission files only.";};
if (_version isNotEqualTo _newestVer) then {systemChat format ["[CMF] Old mission framework detected. Update to %1 when possible.",_newestVer]};

diag_log "[CMF]: Starting CMF Post Init";

//
//Global post-inits
//

//Var to check if game is live
if (isNil "gameLive") then 
{
	gameLive = false;
};

[] spawn {
	// Jesters medical rewrite
	// Define hospital models
	JST_bluFH = "RU_WarfareBFieldhHospital";
	JST_indFH = "RU_WarfareBFieldhHospital";
	JST_opfFH = "RU_WarfareBFieldhHospital";
	
	// If the MM chooses the MEV system
	switch (getMissionConfigValue "potato_missionTesting_medSystem") do
	{
		case 0:	// MEVs
		{
			if (!isNil "BLU_MEV_1PL") then { 	// Check for MEV
				JST_mevBluEnabled = true;		// Set to MEV mode if MEV exists
			} else {
				JST_mevBluEnabled = false;		// Else revert to CCP system
			};
			if (!isNil "IND_MEV_1PL") then { 
				JST_mevIndEnabled = true;
			} else {
				JST_mevIndEnabled = false;	
			};
			if (!isNil "OPF_MEV_1PL") then { 
				JST_mevOpfEnabled = true;
			} else {
				JST_mevOpfEnabled = false;
			};
		};
		default 
		{
			JST_mevBluEnabled = false;
			JST_mevIndEnabled = false;
			JST_mevOpfEnabled = false;
		};
	};
	// Initialize with the settings above
	call CMF_fnc_mevInit;
	medicalLoaded = true;
};

diag_log "[CMF]: Completed CMF Post Init";