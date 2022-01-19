/*
 * Author: tanaKa 
 * Sends a tk message to the server logging channel
 *
 * Called from team kill event
 *
 * Arguments:
 * 0: Victim
 * 1: Killer
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [victimObject, killerObject] call CMF_fnc_tkMsg;
 *
 * Public: False
 */
 
params ["_killed", "_killer"];

if (!isServer) exitWith {};

private _inVehicle = "N/A";
if (vehicle _killer != _killer) then {
	_inVehicle = getText(configFile >> "CfgVehicles" >> (typeOf (vehicle _killer)) >> "displayName");
};

private _killerOrgGroup = groupId (group _killer);
if ((roleDescription _killer) find '@' > -1) then {
	_killerOrgGroup = (roleDescription _killer) splitString '@' select 1;
};
private _killedOrgGroup = groupId (group _killed);
if ((roleDescription _killed) find '@' > -1) then {
	_killedOrgGroup = (roleDescription _killed) splitString '@' select 1;
};

[
	"serverlog",
	"",
	"",
	"",
	false,
	[
		[
			format["TEAMKILL [%1]",[side (group _killer)] call BIS_fnc_sideName],
			format[
				"KILLER: `%1 (%2)`
				VICTIM: `%4 (%5)`
				VEH: %3 | WEP: `%6` | RNG: `%7m`
				TIME ON AAR: `%8`
				MISSION: `%9`",
				name _killer,
				// groupId (group _killer),
				_killerOrgGroup,
				format["`%1`", _inVehicle],
				name _killed,
				// groupId (group _killed),
				_killedOrgGroup,
				getText(configFile >> "CfgWeapons" >> (weaponState _killer select 0) >> "displayName"),
				str(ceil(_killer distance _killed)),
				[(CBA_missionTime / 60), "MM:SS"] call BIS_fnc_secondsToString,
				missionName
			],
			"",
			"00FF00",
			false,
			"",
			"",
			[],
			[],
			[]
		]
	]
] call DiscordEmbedBuilder_fnc_buildSqf;