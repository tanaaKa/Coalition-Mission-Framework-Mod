//====================================================================================
//
//	wh_earplugCheckMods.sqf - Checks the presence of certain mods.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Checking for mods using the configs they add to CfgPatches.
//------------------------------------------------------------------------------------

//	CBA
WH_EP_MOD_CBA = (isClass (configFile >> "CfgPatches" >> "cba_common"));

//	ACE
WH_EP_MOD_ACE = (isClass (configFile >> "CfgPatches" >> "ace_common"));