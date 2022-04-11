/*
 * Author: tanaKa
 * Switches discord RP to ending text
 * Run locally.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call CMF_fnc_rpEnd
 *
 * Public: No
 */
// Update it
[ 
	["UpdateDetails","Slotting next mission"], 
	["UpdateState",""], 
	["UpdateSmallImageKey",""], 
	["UpdateSmallImageText",""],
	["UpdateLargeImageText","Deploying to a new mission"],
	["UpdatePartySize",""], 
	["UpdatePartyMax",""],
	["UpdateStartTimestamp",[0,0]]
] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}]);