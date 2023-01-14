/*

	Filename:  fn_statsInitLocal.sqf 
	Locality: Runs on individual players after they push into a mission
	Description:  Adds event handlers and scripts that have to be local to the player, and remoteExecs player array onto the server.
	
	Params:
	N/A

*/

waitUntil { not isNull player };

if (typeOf player isEqualTo "potato_spectate_playableSpectator" || typeOf player isEqualTo "VirtualCurator_F") exitWith {};

_uid = getPlayerUID player;
[0, 0, player, true, _uid] remoteExec ["CMF_fnc_updateStatArray", 2];

player setVariable ["Shots_Fired", 0];

player addEventHandler ["FiredMan", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

	_Shots_Fired = _unit getVariable "Shots_Fired";
	
	if (isNil "_Shots_Fired") exitWith {_unit setVariable ["Shots_Fired", 0];};

	_Shots_Fired = _Shots_Fired + 1;
	_unit setVariable ["Shots_Fired", _Shots_Fired];

}];

switch true do
{

	case ((typeOf player) in ["potato_w_pilot","potato_e_pilot","potato_i_pilot","potato_w_helicrew","potato_e_helicrew","potato_i_helicrew"]):{
		["pilot_roles", 1, player] remoteExec ["CMF_fnc_updateStatArray", 2];
	};
	
	case ((typeOf player) in ["potato_w_vicd","potato_e_vicd","potato_i_vicd","potato_w_vicl","potato_e_vicl","potato_i_vicl","potato_w_vicc","potato_e_vicc","potato_i_vicc"]):{
		["tanker_roles", 1, player] remoteExec ["CMF_fnc_updateStatArray", 2];
	};

	case ((typeOf player) in ["potato_w_mmgg","potato_e_mmgg","potato_i_mmgg","potato_w_mmgl","potato_e_mmgl","potato_i_mmgl","potato_w_mmgag","potato_e_mmgag","potato_i_mmgag","potato_w_matg","potato_e_matg","potato_i_matg","potato_w_matl","potato_e_matl","potato_i_matl","potato_w_matag","potato_e_matag","potato_i_matag","potato_w_mtrg","potato_e_mtrg","potato_i_mtrg","potato_w_mtrl","potato_e_mtrl","potato_i_mtrl","potato_w_mtrag","potato_e_mtrag","potato_i_mtrag","potato_w_msamg","potato_e_msamg","potato_i_msamg","potato_w_msaml","potato_e_msaml","potato_i_msaml","potato_w_msamag","potato_e_msamag","potato_i_msamag"]):{
		["inf_specialty_roles", 1, player] remoteExec ["CMF_fnc_updateStatArray", 2];
	};
	
	case ((typeOf player) in ["potato_w_ftl","potato_e_ftl","potato_i_ftl"]):{
		["inf_ftl_roles", 1, player] remoteExec ["CMF_fnc_updateStatArray", 2];
	};
	
	case ((typeOf player) in ["potato_w_plm","potato_e_plm","potato_i_plm","potato_w_sm","potato_e_sm","potato_i_sm"]):{
		["inf_medical_roles", 1, player] remoteExec ["CMF_fnc_updateStatArray", 2];
	};
	
	case ((typeOf player) in ["potato_w_sl","potato_e_sl","potato_i_sl"]):{
		["inf_sl_roles", 1, player] remoteExec ["CMF_fnc_updateStatArray", 2];
	};

	case ((typeOf player) in ["potato_w_plt","potato_e_plt","potato_i_plt","potato_w_coy","potato_e_coy","potato_i_coy"]):{
		["inf_pl_roles", 1, player] remoteExec ["CMF_fnc_updateStatArray", 2];
	};

	default {
		["inf_gi_roles", 1, player] remoteExec ["CMF_fnc_updateStatArray", 2];
	};
};