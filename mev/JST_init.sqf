/*

Jester's corner

*/

//only run once
if !(isNil "JST_initRan") exitWith {};
JST_initRan = true;

// compile medical vehicle based field hospitals functions
JST_fnc_mev_checkPlayer = compileFinal preprocessFile "cmf\mev\JST_fnc_mev_checkPlayer.sqf";
JST_fnc_mev_deployFH = compileFinal preprocessFile "cmf\mev\JST_fnc_mev_deployFH.sqf";
JST_fnc_mev_addBuildAction = compileFinal preprocessFile "cmf\mev\JST_fnc_mev_addBuildAction.sqf";
JST_fnc_mev_removeBuildAction = compileFinal preprocessFile "cmf\mev\JST_fnc_mev_removeBuildAction.sqf";
JST_fnc_mev_addPackAction = compileFinal preprocessFile "cmf\mev\JST_fnc_mev_addPackAction.sqf";
JST_fnc_mev_removePackAction = compileFinal preprocessFile "cmf\mev\JST_fnc_mev_removePackAction.sqf";
JST_fnc_mev_handleFHMarkerBySide = compileFinal preprocessFile "cmf\mev\JST_fnc_mev_handleFHMarkerBySide.sqf";
JST_fnc_mev_packFH = compileFinal preprocessFile "cmf\mev\JST_fnc_mev_packFH.sqf";

// define field hospital types per side
JST_bluFH = "RU_WarfareBFieldhHospital";
JST_indFH = "RU_WarfareBFieldhHospital";
JST_opfFH = "RU_WarfareBFieldhHospital";

// only continue if player
if !(hasInterface) exitWith {};

// give medics actions for their side's vehicles
[] spawn JST_fnc_mev_checkPlayer;