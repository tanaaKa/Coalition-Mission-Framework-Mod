/*

	Filename:  fn_statsInitServer.sqf 
	Locality: Runs on server
	Description: Adds mission event handlers and defines playersDataArray.
	
	Params:
	N/A

*/

if (!isServer || (getText (missionConfigFile >> "cmfVers") isEqualTo "") || (getText (getMissionConfig "Header" >> "gameType") isEqualTo "CMFSPCL")) exitWith {};

playersDataArray = createHashMap;

addMissionEventHandler ["EntityRespawned", {
	params ["_newEntity", "_oldEntity"];
	[_newEntity] spawn CMF_fnc_respawnStats;
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

missionStartTime = serverTime;
publicVariable "missionStartTime";