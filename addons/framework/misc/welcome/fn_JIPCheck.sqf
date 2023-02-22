/*
 * Author: tanaKa
 * Checks if a player JIP'd during safe start. Kicks them back to slotting if so.
 * Local
 *
 * Arguments:
 * 0 - STRING - Mission name
 *
 * Return Value:
 * None
 *
 * Example:
 * [] spawn CMF_fnc_JIPCheck;
 *
 * Public: No
 */
params["_missionName"];

if (groupId (group player) isEqualTo "BLU JIP" || groupId (group player) isEqualTo "OPF JIP" || groupId (group player) isEqualTo "IND JIP" && (profileNamespace getVariable "cmf_hasPlayed") isNotEqualTo _missionName) exitWith 
{
	_kickMessage = "JIPPING is not enabled during safe start\n\nGrab a regular slot in the slotting screen";
	[_kickMessage] call CMF_fnc_kickToLobby;
};