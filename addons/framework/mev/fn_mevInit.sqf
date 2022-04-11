/*
- Jester's medical vehicle setup, run everywhere at start to enable system
- Default variable names for medical vehicles:
	BLU_MEV_1PL
	BLU_MEV_2PL
	IND_MEV_1PL
	IND_MEV_2PL
	OPF_MEV_1PL
	OPF_MEV_2PL
- At least one must be present for this to work
- Field hospital types are defined in init.sqf per side
- Do not change the vehicles' variable names unless you know what you're doing (you probably don't)
*/

waitUntil {!isNull player};

// compile medical vehicle based field hospitals functions
JST_fnc_mev_deployFH = compileFinal preprocessFile "x\cmf\addons\framework\mev\JST_fnc_mev_deployFH.sqf";
JST_fnc_mev_addBuildAction = compileFinal preprocessFile "x\cmf\addons\framework\mev\JST_fnc_mev_addBuildAction.sqf";
JST_fnc_mev_removeBuildAction = compileFinal preprocessFile "x\cmf\addons\framework\mev\JST_fnc_mev_removeBuildAction.sqf";
JST_fnc_mev_addPackAction = compileFinal preprocessFile "x\cmf\addons\framework\mev\JST_fnc_mev_addPackAction.sqf";
JST_fnc_mev_removePackAction = compileFinal preprocessFile "x\cmf\addons\framework\mev\JST_fnc_mev_removePackAction.sqf";
JST_fnc_mev_handleFHMarkerBySide = compileFinal preprocessFile "x\cmf\addons\framework\mev\JST_fnc_mev_handleFHMarkerBySide.sqf";
JST_fnc_mev_packFH = compileFinal preprocessFile "x\cmf\addons\framework\mev\JST_fnc_mev_packFH.sqf";

// only continue if player
if !(hasInterface) exitWith {};

// check side and class and if medic give actions on corresponding med vics
switch (side player) do
{
	case WEST:
	{
		if ((JST_mevBluEnabled) and ((typeOf player isEqualTo "potato_w_cm") or (typeOf player isEqualTo "potato_w_plm") or (typeOf player isEqualTo "potato_w_sm"))) then
		{
			if !(isNil "BLU_MEV_1PL") then {[WEST, BLU_MEV_1PL, JST_bluFH, "1PL"] spawn JST_fnc_mev_addBuildAction};
			if !(isNil "BLU_MEV_2PL") then {[WEST, BLU_MEV_2PL, JST_bluFH, "2PL"] spawn JST_fnc_mev_addBuildAction};
			systemChat "[CMF Medical] You have a mobile FH that unpacks from your MEV.";
		};
	};
	case INDEPENDENT:
	{
		if ((JST_mevIndEnabled) and ((typeOf player isEqualTo "potato_i_cm") or (typeOf player isEqualTo "potato_i_plm") or (typeOf player isEqualTo "potato_i_sm"))) then
		{
			if !(isNil "IND_MEV_1PL") then {[INDEPENDENT, IND_MEV_1PL, JST_indFH, "1PL"] spawn JST_fnc_mev_addBuildAction};
			if !(isNil "IND_MEV_2PL") then {[INDEPENDENT, IND_MEV_2PL, JST_indFH, "2PL"] spawn JST_fnc_mev_addBuildAction};
			systemChat "[CMF Medical] You have a mobile FH that unpacks from your MEV.";
		};
	};
	case EAST:
	{
		if ((JST_mevOpfEnabled) and ((typeOf player isEqualTo "potato_e_cm") or (typeOf player isEqualTo "potato_e_plm") or (typeOf player isEqualTo "potato_e_sm"))) then
		{
			if !(isNil "OPF_MEV_1PL") then {[EAST, OPF_MEV_1PL, JST_opfFH, "1PL"] spawn JST_fnc_mev_addBuildAction};
			if !(isNil "OPF_MEV_2PL") then {[EAST, OPF_MEV_2PL, JST_opfFH, "2PL"] spawn JST_fnc_mev_addBuildAction};
			systemChat "[CMF Medical] You have a mobile FH that unpacks from your MEV.";
		};
	};
};