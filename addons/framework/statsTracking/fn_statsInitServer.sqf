/*

	Filename:  fn_statsInitServer.sqf 
	Locality: Runs on server
	Description: Adds mission event handlers and defines Players_Data_Array.
	
	Params:
	N/A

*/

if (!isServer || (getText (missionConfigFile >> "cmfVers") isEqualTo "") || (getText (getMissionConfig "Header" >> "gameType") isEqualTo "CMFSPCL")) exitWith {};

Players_Data_Array = createHashMap;

addMissionEventHandler ["EntityRespawned", {
	params ["_newEntity", "_oldEntity"];
	[_unit] call CMF_fnc_respawnStats;
}];

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	[_unit, _id, _uid, _name] call CMF_fnc_handleDisconnect;
	false;
}];

addMissionEventHandler ["EntityKilled",{
	params ["_killed", "_killer", "_instigator"];
	[_killed, _killer, _instigator] call CMF_fnc_entityKilled;
}];