///////////////////////////////////////////////////////////////
//	Medical system init script
//	By: tanaKa-
//	Adds the needed action to each medic for ccp/fh
//  on spawn and respawn
// 
//	Should be ran local only
//
//  Note: 
//		ace_interact_menu_fnc_addActionToObject is local only
//	TODO:
//		Loop it rather than sequential if
//		Simplify medical ccp to one script
//
///////////////////////////////////////////////////////////////
// Vars for picking medic class
private _medics = ["BLU_PLM","BLU_2PLM","OPF_PLM","OPF_2PLM","IND_PLM","IND_2PLM","BLU_ASLM","OPF_ASLM","IND_ASLM","BLU_BSLM","OPF_BSLM","IND_BSLM",
					"BLU_CSLM","OPF_CSLM","IND_CSLM","BLU_DSLM","OPF_DSLM","IND_DSLM"];
ccpUsed = false;
private _playerClass = vehicleVarName player;

if (_playerClass in _medics) then {
	//Medical Officers
	if (_playerClass in ["BLU_PLM","BLU_2PLM","OPF_PLM","OPF_2PLM","IND_PLM","IND_2PLM"]) then {
		tnk_add_med_mo = {
			//Assign
			FH_Unpack_Action = ["unpackCCP","Unpack Field Hospital","",{[] execVM "cmf\buildccp\unpack_platoon.sqf";},{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions"], FH_Unpack_Action] call ace_interact_menu_fnc_addActionToObject;
			//Notify
			systemChat "[COA Medical] You are a medical officer and have been assigned a field hospital kit";
			if (FHVeh) then {
				systemChat format ["[COA Medical] Your FH will also spawn a %1 medical vehicle",FHVehicle];
			} else {
				systemChat "[COA Medical] Your FH will not spawn a medical vehicle";
			};
			systemChat "[COA Medical] Self Interact -> Unpack Field Hospital";			
		};
		[player] call tnk_add_med_mo;
	};
	//Alpha medics
	if (_playerClass in ["BLU_ASLM","OPF_ASLM","IND_ASLM"]) then {
		tnk_add_med_a = {
			//Assign
			CCP_Unpack_Action_A = ["unpackCCP","Unpack CCP","",{[] execVM "cmf\buildccp\unpack_alpha.sqf";},{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions"], CCP_Unpack_Action_A] call ace_interact_menu_fnc_addActionToObject;
			//Notify
			systemChat "[COA Medical] You are alpha squad medic and have been assigned a CCP kit";
			systemChat "[COA Medical] Self Interact -> Unpack CCP";			
		};
		[player] call tnk_add_med_a;
	};
	//Bravo medics
	if (_playerClass in ["BLU_BSLM","OPF_BSLM","IND_BSLM"]) then {
		tnk_add_med_b = {
			//Assign
			CCP_Unpack_Action_B = ["unpackCCP","Unpack CCP","",{[] execVM "cmf\buildccp\unpack_bravo.sqf";},{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions"], CCP_Unpack_Action_B] call ace_interact_menu_fnc_addActionToObject;
			//Notify
			systemChat "[COA Medical] You are bravo squad medic and have been assigned a CCP kit";
			systemChat "[COA Medical] Self Interact -> Unpack CCP";
		};	
		[player] call tnk_add_med_b;
	};
	//Charlie medics
	if (_playerClass in ["BLU_CSLM","OPF_CSLM","IND_CSLM"]) then {
		tnk_add_med_c = {
			//Assign
			CCP_Unpack_Action_C = ["unpackCCP","Unpack CCP","",{[] execVM "cmf\buildccp\unpack_charlie.sqf";},{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions"], CCP_Unpack_Action_C] call ace_interact_menu_fnc_addActionToObject;
			//Notify
			systemChat "[COA Medical] You are charlie squad medic and have been assigned a CCP kit";
			systemChat "[COA Medical] Self Interact -> Unpack CCP";
		};
		[player] call tnk_add_med_c;
	};
	//Delta medics
	if (_playerClass in ["BLU_DSLM","OPF_DSLM","IND_DSLM"]) then {
		tnk_add_med_d = {
			//Assign
			CCP_Unpack_Action_D = ["unpackCCP","Unpack CCP","",{[] execVM "cmf\buildccp\unpack_delta.sqf";},{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions"], CCP_Unpack_Action_D] call ace_interact_menu_fnc_addActionToObject;
			//Notify
			systemChat "[COA Medical] You are delta squad medic and have been assigned a CCP kit";
			systemChat "[COA Medical] Self Interact -> Unpack CCP";
		};
		[player] call tnk_add_med_d;
	};
};