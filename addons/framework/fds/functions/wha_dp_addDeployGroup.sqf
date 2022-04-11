//====================================================================================
//
//	wha_dp_addDeployGroup.sqf - 
//
//	Attempts to add deploy action to group leaders or 
//	all group members, depending on settings.
//
//	call wha_dp_fnc_addDeployGroup;
//
//	Contact: Whale #5963
//
//====================================================================================

//	Parameters
//		- unit = unit whose group deploy action will be added to
params["_unit"];

//	If as group CONFIG option true, only add to group leader.
//if WHA_DP_ASGROUP then
//{
[(leader group _unit)] call wha_dp_fnc_addDeploy;
//};
//	Otherwise, add to each individual unit in unit group.
//else
//{
//	// TODO
//};