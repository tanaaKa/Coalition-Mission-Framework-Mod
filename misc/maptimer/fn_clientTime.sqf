/*
 * Author: tanaKa & FNF staff
 * Creates and updates mission time remaining display
 * Original script by FNF, updated for COALITION
 *
 * Called from CMF_fnc_showTimeOnMap for the CMF
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call CMF_fnc_clientTime;
 *
 * Public: False
 */

disableSerialization;
private _missionTime = (missionTimelimit * 60) + tnk_ssTime; //add variable safestart time
//Create displays in bottom left
("timeRsc" call BIS_fnc_rscLayer) cutRsc ["mapTimeLeft", "PLAIN"];

missionTimeUI_PFH = [{
	params ["_missionTime", "_handle"];

	//Update text in the displays to match the points markers
	_display = uiNameSpace getVariable "mapTimeLeft";
	_setText = _display displayCtrl 1003;
  
	if (missionTimeLimit isEqualTo -1) then {
		_setText ctrlSetStructuredText parseText "No Time Limit";
	} else {
		_timeLeft = (format ["Time Left: %1", [_missionTime - CBA_missionTime, "MM:SS"] call BIS_fnc_secondsToString]);
		_setText ctrlSetStructuredText parseText _timeLeft;
		
		if (_timeLeft isEqualTo "Time Left: 00:00") exitWith {
			tnk_timesUp = true;
			hint "Mission time has expired";
			systemChat format ["[CMF] Mission time has expired after %1 minutes",missionTimeLimit];
		};
	};	
}, 1, _missionTime] call CBA_fnc_addPerFrameHandler;
