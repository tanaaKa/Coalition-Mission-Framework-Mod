/*

	Filename:  fn_updateStatArray.sqf 
	Locality: Runs on server
	Description: Modifies/Creates individual player array on the server.
	
	Params:
	* _Input  -> Inputted Integer/string, gets added to the individual players array on the server.
	* _arrayPos -> Where to place _Input in the individual players array on the server.
	* _playerUID -> Physical player array that we're modifying.
	
	Optional Params:
	* _isNewArray -> Boolean that tells us if we need to check if player needs an array.
	
	Usage:

		[1, 4, _killer] call CMF_fnc_updateStatArray;
 
*/

if (!isServer) exitWith {};

if (isNil "playersDataArray") then {
	waitUntil {uiSleep 1; !(isNil "playersDataArray")};
};

params [["_input", 0], ["_arrayPos", 0], ["_uid", "0"], ["_isNewArray", false]];

if (!(_uid in playersDataArray) || _isNewArray) then {
	_tvtKills = 0;
	_tvtDeaths = 0;
	_coopKills = 0;
	_coopDeaths = 0;
	_freindlyFireEvents = 0;
	_civsKilled = 0;
	_timeAlive = 0;
	_shotsFired = 0;
	_playerLeftMidMission = 0;
	_missionsAttended = 1;
	_playerLocalArray = [_uid, ["Role_Status", _missionsAttended, _timeAlive, _tvtKills, _tvtDeaths, _coopKills, _coopDeaths, _freindlyFireEvents, _civsKilled, _shotsFired, _playerLeftMidMission]];
	
	playersDataArray set _playerLocalArray;
} else {
	_playerLocalArray = playersDataArray get _uid;
	_updateVariable = _playerLocalArray # _arrayPos;
	switch true do {
		//If it's a text variable (UID or Role_Status) overwrite completely.
		case ((typeName _updateVariable) isEqualTo "STRING"): 
		{
			_playerLocalArray set [_arrayPos, _input];
		};
		//If it's a integer simply add onto the already existing integer in the array and re-set the integer.
		default 
		{
			_updatedInput = _updateVariable + _input; 
			_playerLocalArray set [_arrayPos, _updatedInput];
		};
	};
};