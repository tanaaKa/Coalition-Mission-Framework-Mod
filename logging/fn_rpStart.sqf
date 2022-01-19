/*
 * Author: tanaKa
 * Switches discord RP to starting text
 * Run locally.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call CMF_fnc_rpStart
 *
 * Public: No
 */

// Variables
_missionName = getText (missionConfigFile >> "MissionSQM" >> "Mission" >> "Intel" >> "briefingName");
_detail = format ["Playing %1",_missionName];
_mapName = getText (configFile >> "CfgWorlds" >> worldName >> "description");
_largeImageText = format ["In combat on %1",_mapName];

// Update it
[ 
	["UpdateDetails",_detail], 
	["UpdateLargeImageText",_largeImageText],
	["UpdatePartySize",{isPlayer _x && alive _x} count allUnits], 
	["UpdatePartyMax",count (allPlayers - entities "HeadlessClient_F")],
	["UpdateStartTimestamp",[0,0]]
] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}]);