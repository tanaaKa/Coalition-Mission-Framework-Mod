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
private _medics = 
[
	"BLU_PLM","BLU_2PLM"
	,"OPF_PLM","OPF_2PLM"
	,"IND_PLM","IND_2PLM"
	,"BLU_ComMed","OPF_ComMed","IND_ComMed"
];
					
private _playerClass = vehicleVarName player;

if (_playerClass in _medics) then {
	//Medical Officers
	if (_playerClass in ["BLU_PLM","BLU_2PLM","OPF_PLM","OPF_2PLM","IND_PLM","IND_2PLM"]) then {
		tnk_add_med_mo = {
			//Assign
			FH_Unpack_Action = ["unpackCCP","Unpack Field Hospital","",{[] execVM "x\cmf\addons\framework\buildccp\unpack_platoon.sqf";},{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions"], FH_Unpack_Action] call ace_interact_menu_fnc_addActionToObject;
			//Notify
			systemChat "[CMF Medical] You are a medical officer and have been assigned a field hospital kit";
			if (getMissionConfigValue "potato_missionTesting_FHVeh") then {
				systemChat format ["[CMF Medical] Your FH will also spawn a %1 medical vehicle",getMissionConfigValue "potato_missionTesting_FHVehicle"];
			} else {
				systemChat "[CMF Medical] Your FH will not spawn a medical vehicle";
			};
			systemChat "[CMF Medical] Self Interact -> Unpack Field Hospital";			
		};
		[player] call tnk_add_med_mo;
	};
	//Alpha medics
	if (_playerClass in ["BLU_ComMed","OPF_ComMed","IND_ComMed"]) then {
		tnk_add_med_a = {
			//Assign
			CCP_Unpack_Action_A = ["unpackCCP","Unpack CCP","",{[] execVM "x\cmf\addons\framework\buildccp\unpack_alpha.sqf";},{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions"], CCP_Unpack_Action_A] call ace_interact_menu_fnc_addActionToObject;
			//Notify
			systemChat "[CMF Medical] You are a combat medic and have been assigned a CCP kit";
			systemChat "[CMF Medical] Self Interact -> Unpack CCP";			
		};
		[player] call tnk_add_med_a;
	};
};
