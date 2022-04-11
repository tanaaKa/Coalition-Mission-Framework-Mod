/*
 * Author: tanaKa & FNF staff
 * Adds event handler to show time on the map
 * Original script by FNF, updated for COALITION
 *
 * Called from the readyup system in the CMF
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call CMF_fnc_showTimeOnMap;
 *
 * Public: Yes
 */
 
// Remove if no interface
if (!hasInterface) exitWith {};
 
// Old CMF missions support
if (isNil "potato_missionTesting_missionTimeLength") then {
	potato_missionTesting_missionTimeLength = -1; // aka no time limit
};

mapTimeShown = false;
mapMissionTime = addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];

	if (_mapIsOpened) then {
		call CMF_fnc_clientTime;
		mapTimeShown = true;
	} else {
		[missionTimeUI_PFH] call CBA_fnc_removePerFrameHandler;
		mapTimeShown = false;
		uiNameSpace getVariable "mapTimeLeft" closeDisplay 1;
	};
}];

// Remove the EH after time is up
[{!isNil "tnk_timesUp"}, {removeMissionEventHandler ["Map", mapMissionTime]; uiNameSpace getVariable "mapTimeLeft" closeDisplay 1;}] call CBA_fnc_waitUntilAndExecute;
