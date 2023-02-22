/*

	Filename:  fn_statsInitLocal.sqf 
	Locality: Runs on individual players after they push into a mission
	Description:  Adds event handlers and scripts that have to be local to the player, and remoteExecs player array onto the server.
	
	Params:
	N/A

	Usage:
	[] spawn CMF_fnc_statsInitLocal;
*/

// Exit if player is spectating or not a CMF mission
if (typeOf player isEqualTo "potato_spectate_playableSpectator" || 
	typeOf player isEqualTo "VirtualCurator_F" ||
	!hasInterface || 
	isServer || 
	(getText (missionConfigFile >> "cmfVers") isEqualTo "") || 
	(getText (getMissionConfig "Header" >> "gameType") isEqualTo "CMFSPCL")) exitWith {};

// Initialize new stat tracking hash map for player 
_localPlayerID = getPlayerUID player;
[0, 0, _localPlayerID, true] remoteExec ["CMF_fnc_updateStatArray", 2];

// Set player UID via variable
// This is needed because dead bodies don't carry player IDs
player setVariable ["playerUID", _localPlayerID, true];
//systemChat format ["Local player id: %1", _localPlayerID];

// Shot fired EH
shotsFired = 0;
player addEventHandler ["FiredMan", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
	shotsFired = shotsFired + 1;
}];

// Main driver for role assignment to hash map
private _unitRole = toLower (typeOf player) select [9];
switch true do
{
	case (_unitRole in ["pilot","helicrew"]):
	{
		["pilot_roles", 0, _localPlayerID] remoteExec ["CMF_fnc_updateStatArray", 2];
	};
	
	case (_unitRole in ["vicd","vicl","vicc"]):
	{
		["tanker_roles", 0, _localPlayerID] remoteExec ["CMF_fnc_updateStatArray", 2];
	};

	case (_unitRole in ["hmgg","hmgl","hmgag","hatg","hatl","hatag","mmgg","mmgl","mmgag","matg","matl","matag","mtrg","mtrl","mtrag","msamg","msaml","msamag","artg","artl","spotter","sniper"]):{
		["inf_specialty_roles", 0, _localPlayerID] remoteExec ["CMF_fnc_updateStatArray", 2];
	};
	
	case (_unitRole isEqualTo "ftl"):
	{
		["inf_ftl_roles", 0, _localPlayerID] remoteExec ["CMF_fnc_updateStatArray", 2];
	};
	
	case (_unitRole in ["plm","sm"]):
	{
		["inf_medical_roles", 0, _localPlayerID] remoteExec ["CMF_fnc_updateStatArray", 2];
	};
	
	case (_unitRole isEqualTo "ftl"):
	{
		["inf_sl_roles", 0, _localPlayerID] remoteExec ["CMF_fnc_updateStatArray", 2];
	};

	case (_unitRole in ["plt","coy"]):
	{
		["inf_pl_roles", 0, _localPlayerID] remoteExec ["CMF_fnc_updateStatArray", 2];
	};

	default {
		["inf_gi_roles", 0, _localPlayerID] remoteExec ["CMF_fnc_updateStatArray", 2];
	};
};

[
	{!alive player},
	{
		params ["_playerUID"];
		[shotsFired, 9, _playerUID] remoteExec ["CMF_fnc_updateStatArray", 2];
		shotsFired = 0;
	}, 
	[
		_localPlayerID 
	]
] call CBA_fnc_waitUntilAndExecute;