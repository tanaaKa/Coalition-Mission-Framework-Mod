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
private _medicalofficer = 
[	
	"BLU_PLM","BLU_2PLM"
	,"OPF_PLM","OPF_2PLM"
	,"IND_PLM","IND_2PLM"
];
private _medics = 
[
	"BLU_ComMed","OPF_ComMed","IND_ComMed"
	,"BLU_ComMed1","OPF_ComMed1","IND_ComMed1"
	,"BLU_ComMed2","OPF_ComMed2","IND_ComMed2"
	,"BLU_ComMed3","OPF_ComMed3","IND_ComMed3"
	,"BLU_ComMed4","OPF_ComMed4","IND_ComMed4"
];
					
private _playerClass = vehicleVarName player;

//Medical Officers
if (_playerClass in _medicalofficer) then {
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
if (_playerClass in _medics) then {
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
