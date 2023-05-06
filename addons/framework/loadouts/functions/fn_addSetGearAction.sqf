params ["_unit"]; 
_MissionType = getMissionConfigValue "potato_missionTesting_missionType";

if (_MissionType isEqualTo 4) then {
	_action = ["gearSelect", "Select Gear", "", {call CMF_fnc_leaderSetGear}, {true}] call ace_interact_menu_fnc_createAction;
	[_unit, 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToObject;
};