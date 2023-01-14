/*

	Filename:  fn_statsInitServer.sqf 
	Locality: Runs on server
	Description: Adds mission event handlers and defines Players_Data_Array.
	
	Params:
	N/A

*/

if !(isServer) exitWith {};

Players_Data_Array = [];

addMissionEventHandler ["EntityRespawned", {
	params ["_newEntity", "_oldEntity"];

	if (typeOf _newEntity isEqualTo "potato_spectate_spectator") exitWith {

		_Shots_Fired = _oldEntity getVariable "Shots_Fired";
		if !(isNil "_Shots_Fired") then {
			[_Shots_Fired, 10, _newEntity] call CMF_fnc_updateStatArray;
		};

		_Player_Time_Alive = (CBA_missionTime - tnk_ssTime);
		[_Player_Time_Alive, 3, _newEntity] call CMF_fnc_updateStatArray;
	};

	_newEntity addEventHandler ["FiredMan", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

		_Shots_Fired = _unit getVariable "Shots_Fired";
		
		if (isNil "_Shots_Fired") exitWith {_unit setVariable ["Shots_Fired", 0];};

		_Shots_Fired = _Shots_Fired + 1;
		_unit setVariable ["Shots_Fired", _Shots_Fired];
	}];
}];

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

	if (typeOf _unit isEqualTo "potato_spectate_spectator" || typeOf _unit isEqualTo "potato_spectate_playableSpectator" || typeOf _unit isEqualTo "VirtualCurator_F") exitWith {false;};
	
	_unit getVariable "Shots_Fired";

	if !(isNil "_Shots_Fired") then {
		[_Shots_Fired, 10, _unit, false, _uid] call CMF_fnc_updateStatArray;
	};

	[1, 11, _unit, false, _uid] call CMF_fnc_updateStatArray;
	false;
}];

addMissionEventHandler ["EntityKilled",{
	params ["_killed", "_killer", "_instigator"];

	switch true do
	{
		//If both parties are players and are on separate sides, then it's a TVT kill
		case ((isPlayer _killed && isPlayer _killer) && (side _killed != side _killer)):{
			[1, 5, _killed] call CMF_fnc_updateStatArray;
			[1, 4, _killer] call CMF_fnc_updateStatArray;
		};
		//If both parties are players and are on the same side, then it's a FF kill
		case ((isPlayer _killed && isPlayer _killer) && (side _killed == side _killer)):{
			[1, 8, _killer] call CMF_fnc_updateStatArray;
		};
		//If one party is a player and the other party is not a player and died, and they are on the same side, then it's a FF kill
		case ((!isPlayer _killed && isPlayer _killer) && (side _killed == side _killer)):{
			[1, 8, _killer] call CMF_fnc_updateStatArray;
		};
		//If one party is a player and said player died, and they are on the separate sides, then it's a COOP death
		case (isPlayer _killed &&  !isPlayer _killer && (side _killed != side _killer)):{
			[1, 7, _killed] call CMF_fnc_updateStatArray;
		};
		//If one party is a player and the other party is not a player and died, and they are on the separate sides, then it's a COOP kill
		case (!isPlayer _killed &&  isPlayer _killer && (side _killed != side _killer)):{
			[1, 6, _killer] call CMF_fnc_updateStatArray;
		};
		//If a player kills a CIV
		case (isPlayer _killer && (side _killed == civilian)):{
			[1, 9, _killer] call CMF_fnc_updateStatArray;
		};
	};
}];