/*
 * Author: tanaKa
 * Switches discord RP to briefing text
 * Run locally.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call CMF_fnc_rpBrief
 *
 * Public: No
 */
 
// Variables
switch (typeOf player) do {
	case "potato_w_coy":
	{
		roleIcon = "officer";
	};
	case "potato_w_plt":
	{
		roleIcon = "officer";
	};
	case "potato_w_ftl":
	{
		roleIcon = "leader";
	};
	case "potato_w_sl":
	{
		roleIcon = "leader";
	};
	case "potato_w_lat":
	{
		roleIcon = "rat";
	};
	case "potato_w_ar":
	{
		roleIcon = "mg";
	};
	case "potato_w_cm":
	{
		roleIcon = "medic";
	};
	case "potato_w_plm":
	{
		roleIcon = "medic";
	};
	case "potato_w_sm":
	{
		roleIcon = "medic";
	};
	default
	{
		roleIcon = "man";
	};
};
_missionName = getText (missionConfigFile >> "MissionSQM" >> "Mission" >> "Intel" >> "briefingName");
_detail = format ["Briefing for %1",_missionName];
_groupName = groupId (group player);
_mapName = getText (configFile >> "CfgWorlds" >> worldName >> "description");
_role = roleDescription player splitString "@" select 0;
_state = format ["%1 on %2",_role,side player];
_smallImageText = format ["Playing as %1 (%2)",_role,_groupName];
_largeImageText = format ["Deployed to %1",_mapName];

//Update it
[ 
	["UpdateDetails",_detail], 
	["UpdateState",_state], 
	["UpdateLargeImageKey","discordavy"],
	["UpdateLargeImageText",_largeImageText],
	["UpdateSmallImageKey",roleIcon], 
	["UpdateSmallImageText",_smallImageText],
	["UpdatePartySize",{isPlayer _x && alive _x} count allUnits], 
	["UpdatePartyMax",count (allPlayers - entities "HeadlessClient_F")],
	["UpdateStartTimestamp",[0,0]],
	["UpdateButtons",["Join COALITION","https://coalitiongroup.net/arma/"]]
] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}]);