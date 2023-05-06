_ModLoadouts = "true" configClasses (ConfigFile >> "CfgCMFLoadouts") apply {configName _x}; 
_ModLoadouts sort true;
_loadouts = ["Default"];
_loadouts append _ModLoadouts;

["Select Loadout", [["LIST", "Loadouts", [_Loadouts, _Loadouts apply {[_x]}, 0]]],
	{
	params ["_dialog", "_args"];
	_dialog params ["_type"];
	_args params ["_Loadouts"];
	switch (side player) do 
	{
		case west: {
			JKL_LoadoutWest = _type;
			publicVariable "JKL_LoadoutWest";

			[WEST] remoteExec ["CMF_fnc_setLoadout",2];

			if (JKL_LoadoutWest == JKL_LoadoutEast) then {["Blufor and Opfor have selected the Same Gearscript"] remoteExec ["Hint"]};
			if (JKL_LoadoutWest == JKL_LoadoutInd) then {["Blufor and Indfor have selected the Same Gearscript"] remoteExec ["Hint"]};
			};
		case east: {
			JKL_LoadoutEast = _type;
			publicVariable "JKL_LoadoutEast";

			[EAST] remoteExec ["CMF_fnc_setLoadout",2];

			if (JKL_LoadoutEast == JKL_LoadoutInd) then {["Opfor and Indfor have selected the Same Gearscript"] remoteExec ["Hint"]};
			if (JKL_LoadoutEast == JKL_LoadoutWest) then {["Opfor and Blufor have selected the Same Gearscript"] remoteExec ["Hint"]};
			};
		case independent: {
			JKL_LoadoutInd = _type;
			publicVariable "JKL_LoadoutInd";

			[INDEPENDENT] remoteExec ["CMF_fnc_setLoadout",2];

			if (JKL_LoadoutInd == JKL_LoadoutEast) then {["Indfor and Opfor have selected the Same Gearscript"] remoteExec ["Hint"]};
			if (JKL_LoadoutInd == JKL_LoadoutWest) then {["Indfor and Blufor have selected the Same Gearscript"] remoteExec ["Hint"]};	

		};				
	};
	}, {}, [_Loadouts]
] call zen_dialog_fnc_create;