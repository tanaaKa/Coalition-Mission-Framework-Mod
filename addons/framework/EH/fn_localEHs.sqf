///////////////////////////////////////////////////////////////
//	Event Handler Script
//	By: tanaKa-
//	Local event handlers
//
//	TODO:
//		N/A
//
///////////////////////////////////////////////////////////////

// No voice check
player setSpeaker "NoVoice";
player addEventHandler ["Respawn", {[player, "NoVoice"] remoteExecCall ["setSpeaker"];}];

// Recoil checks
player setUnitRecoilCoefficient 1.3;
player setCustomAimCoef 0.8;
player addEventHandler ["Respawn", {player setUnitRecoilCoefficient 1.3}];
player addEventHandler ["Respawn", {player setCustomAimCoef 0.8}];

// Killed EH for teamkills and discord rich presence
player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	
	if (!isNull _instigator && (side (group _instigator) == playerSide) && (_unit != _instigator)) exitWith {
		[_unit, _instigator] remoteExecCall ["CMF_fnc_tkMsg", 2];
	};
	
	if (side (group _killer) == playerSide && (_unit != _killer)) exitWith {
		[_unit, _instigator] remoteExecCall ["CMF_fnc_tkMsg", 2];
	};
	
	// Set discord rich presence text
	[ 
		["UpdateDetails","Spectating (KIA)"], 
		["UpdateLargeImageText","Died in combat"],
		["UpdateSmallImageKey",""], 
		["UpdateSmallImageText",""],
		["UpdatePartySize",{isPlayer _x && alive _x} count allUnits], 
		["UpdatePartyMax",count (allPlayers - entities "HeadlessClient_F")],
		["UpdateStartTimestamp",[0,0]]
	] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}]);
}];