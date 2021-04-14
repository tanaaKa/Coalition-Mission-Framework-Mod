/* 	
	Packs up the CCP for medics
	By: tanaKa & Whale

	TODO:
		-Make more efficient?
*/

params["_site"];

// Starts player packup animation.
[player] call ace_common_fnc_goKneeling;
[player, "AinvPknlMstpSnonWrflDr_medic5"] call ace_common_fnc_doAnimation;

// The entire action is within the ACE progressbar call.
[5,_site,{
	params["_site"];
	private["_pos", "_grid", "_ccp", "_name", "_marker", "_hintString"];
	
	// Delete backpack pile.
	_site = _this select 0;
	deleteVehicle _site;
	
	// Add 'Unpack' action back to person who picked it up.
	_CCP_Unpack_Action = ["unpackCCP","Unpack CCP","",{[] execVM "cmf\buildccp\unpack_alpha.sqf";},{true}] call ace_interact_menu_fnc_createAction;  
	[player, 1, ["ACE_SelfActions"], _CCP_Unpack_Action] call ace_interact_menu_fnc_addActionToObject;
	
	// End animation at end of action.
	player switchMove ([player] call ace_common_fnc_getDefaultAnim);
}, {
	// End animation if player cancels action.
	player switchMove ([player] call ace_common_fnc_getDefaultAnim);
}, "Packing up CCP..."] call ace_common_fnc_progressBar;
