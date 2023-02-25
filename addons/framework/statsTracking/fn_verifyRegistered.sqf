/*
 * Author: tanaKa
 * Checks if a player is registered in COALITION. Kicks them if not.
 * Server only
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] spawn CMF_fnc_verifyRegistered;
 *
 * Public: No
 */
params["_unit"];

private _notRegistered = "[1,[]]";
private _uid = getPlayerUID _unit;

// Query db
_query = "extDB3" callExtension format ["0:SQL:SELECT * FROM users WHERE steamid = %1",_uid];
//[format ["_query: %1",_query]] remoteExec ["systemChat", 0];

switch (_query) do {
	// Boot to lobby if not registered
	case _notRegistered: 
	{
		_kickMessage = "You must register at discord.gg/armacoalition to play here!";
		[_kickMessage,_unit] remoteExec ["CMF_fnc_kickToLobby",_unit];

		[format ["%1: You must register at discord.gg/armacoalition to play here!",name _unit]] remoteExec ["systemChat", 0];
	};
	default 
	{
		"[CMF] Registration validated. Welcome (back) to COALITION." remoteExec ["systemChat", _unit];
	}
};