// Add tun respawn EH to set radios back up on respawn
["Tun_respawn_EH_moveRespawns", 
{
	params["_side","_units"];
	{	
		"[CCE] Setting radios back up" remoteExec ["systemChat", _x];
		remoteExec ["potato_radios_fnc_reinitializeRadios", _x];
	} forEach _units;
}
] call CBA_fnc_addEventHandler;