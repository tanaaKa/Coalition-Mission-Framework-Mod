//====================================================================================
//
//	wha_dp_checkMods.sqf - Returns the presence of certain mods.
//
//	Contact: Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Checking for mods using the configs they add to CfgPatches.
//------------------------------------------------------------------------------------

//	CBA
_cbaPresent = (isClass (configFile >> "CfgPatches" >> "cba_common"));

//	ACE core
_acePresent = (isClass (configFile >> "CfgPatches" >> "ace_common"));

//	Return results.
[_cbaPresent, _acePresent]