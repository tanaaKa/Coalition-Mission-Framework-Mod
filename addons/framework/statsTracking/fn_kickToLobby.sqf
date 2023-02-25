/*
 * Author: tanaKa
 * Kicks a player back to the lobby with a message
 * Local only
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * None
 *
 * Example:
 * [_kickMessage] spawn CMF_fnc_kickToLobby;
 *
 * Public: No
*/
params["_kickMessage","_unit"];

[1,[_kickMessage,"BLACK"]] remoteExec ["cutText", _unit];
uiSleep 5;
endMission "LOSER";