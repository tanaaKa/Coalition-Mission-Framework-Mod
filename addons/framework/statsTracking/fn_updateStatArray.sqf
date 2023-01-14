/*

	Filename:  fn_updateStatArray.sqf 
	Locality: Runs on server
	Description: Modifies/Creates individual player array on the server.
	
	Params:
	* _Input  -> Inputted Integer/string, gets added to the individual players array on the server.
	* _Array_Pos -> Where to place _Input in the individual players array on the server.
	* _Player -> Physical player array that we're modifying.
	
	Optional Params:
	* _isNewArray -> Boolean that tells us if we need to check if player needs an array.
	
	Usage:

		[1, 4, _killer] call CMF_fnc_updateStatArray;
 
*/

if (!isServer) exitWith {};

if (isNil "Players_Data_Array") then {
	waitUntil {uiSleep 1; !(isNil "Players_Data_Array")};
};

params [["_Input", 0], ["_Array_Pos", 0], ["_Player", objNull], ["_isNewArray", false], "_uid"];

if (!isNil "_uid" && _isNewArray && ((Players_Data_Array findIf {_Input == _x select 0}) == -1)) then {
	_tvt_kills = 0;
	_tvt_deaths = 0;
	_coop_kills = 0;
	_coop_deaths = 0;
	_ff_events = 0;
	_civ_killed = 0;
	_time_alive = 0;
	_shots_fired = 0;
	_player_left_mid_Mission = 0;
	_Missions_Attended = 1;
	_Player_Local_Array = [_uid, "Role_Status", _Missions_Attended, _time_alive, _tvt_kills, _tvt_deaths, _coop_kills, _coop_deaths, _ff_events, _civ_killed, _shots_fired, _player_left_mid_Mission];
	
	Players_Data_Array pushBack _Player_Local_Array;
} else {
	//Get Player UID.
	if !(isNil "_uid") then {
		_Player_UID = _uid;
	} else {
		_Player_UID = getPlayerUID _Player;
	};
	//Find Players array that's hosted in the main array (Players_Data_Array).
	_Player_Local_Array_pos = (Players_Data_Array findIf {_Player_UID == _x select 0});
	_Player_Local_Array = Players_Data_Array select _Player_Local_Array_pos;
	//select location in players array to update.
	_Update_Variable = _Player_Local_Array select _Array_Pos;
	switch true do {
		//If it's a text variable (UID or Role_Status) overwrite completely.
		case ((typeName _Update_Variable) isEqualTo "STRING"): 
		{
			_Player_Local_Array set [_Array_Pos, _Input];
		};
		//If it's a integer simply add onto the already existing integer in the array and re-set the integer.
		default 
		{
			_Updated_Input = _Update_Variable + _Input; 
			_Player_Local_Array set [_Array_Pos, _Updated_Input];
		};
	};
};