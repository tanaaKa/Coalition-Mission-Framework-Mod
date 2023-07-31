if (isNil "opfWaves") then {
	bluWaves = 0;
};

if (opfWaves isEqualTo opfMaxWaves) then {
	systemChat "[CCE Respawn] You are out of respawn waves";
} else {
	// Increment wave count
	opfWaves = opfWaves + 1;
	publicVariable "opfWaves";
	systemChat format ["[CCE Respawn] You have used %1/%2 waves",opfWaves,opfMaxWaves];
	// Spawn wave
	[east, false] remoteExec ["Tun_Respawn_fnc_force_Respawn", 2];
};