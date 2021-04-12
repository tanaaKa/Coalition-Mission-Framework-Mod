/*
Jester's medical vehicle setup, run locally on medics of a given side
Default variable names for medical vehicles:
	BLU_MEV_1PL
	BLU_MEV_2PL
At least one must be present for this to work
Do not change the vehicles' variable names unless you know what you're doing (you probably don't)
*/

params ["_fhClass"];

private _side = side player;

switch (_side) do
{
	case WEST:
	{
		if !(isNil "BLU_MEV_1PL") then {[_side, BLU_MEV_1PL, _fhClass, "1PL"] spawn JST_fnc_mev_addBuildAction};
		if !(isNil "BLU_MEV_2PL") then {[_side, BLU_MEV_2PL, _fhClass, "2PL"] spawn JST_fnc_mev_addBuildAction};
	};
	case INDEPENDENT:
	{
		if !(isNil "IND_MEV_1PL") then {[_side, IND_MEV_1PL, _fhClass, "1PL"] spawn JST_fnc_mev_addBuildAction};
		if !(isNil "IND_MEV_2PL") then {[_side, IND_MEV_2PL, _fhClass, "2PL"] spawn JST_fnc_mev_addBuildAction};
	};
	case EAST:
	{
		if !(isNil "OPF_MEV_1PL") then {[_side, OPF_MEV_1PL, _fhClass, "1PL"] spawn JST_fnc_mev_addBuildAction};
		if !(isNil "OPF_MEV_2PL") then {[_side, OPF_MEV_2PL, _fhClass, "2PL"] spawn JST_fnc_mev_addBuildAction};
	};
};