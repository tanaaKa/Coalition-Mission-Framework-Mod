["CMF Loadouts", "Select Loadout",
    {
		_ModLoadouts = "true" configClasses (ConfigFile >> "CfgCMFLoadouts") apply {configName _x}; 
		_ModLoadouts sort true;
		_loadouts = ["Default"];
		_loadouts append _ModLoadouts;

		["Select Loadout", [
			["SIDES","Side, Select One"],
			["COMBO", "Loadouts", [_Loadouts, _Loadouts apply {[_x]}, 0]],
			["CHECKBOX", "Reset Currently Equipped Gear", [true]]
			],
			{
			params ["_dialog", "_args"];
			_dialog params ["_sides","_type","_reset"];
			_args params ["_Loadouts"];
				_side = _sides select 0;
				switch (_side) do {
					case WEST: {
						JKL_LoadoutWest = _type;
						publicVariable "JKL_LoadoutWest";

						if (_reset) then {
							[WEST] remoteExec ["CMF_fnc_setLoadout",2]
						} else {
							remoteExec ["CMF_fnc_updateMiniArsenal",WEST];
						};
					};
					case EAST: {
						JKL_LoadoutEast = _type;
						publicVariable "JKL_LoadoutEast";

						if (_reset) then {
							[EAST] remoteExec ["CMF_fnc_setLoadout",2]
						} else {
							remoteExec ["CMF_fnc_updateMiniArsenal",EAST];
						};
					};
					case INDEPENDENT: {
						JKL_LoadoutInd = _type;
						publicVariable "JKL_LoadoutInd";

						if (_reset) then {
							[INDEPENDENT] remoteExec ["CMF_fnc_setLoadout",2]
						} else {
							remoteExec ["CMF_fnc_updateMiniArsenal",independent];
						};	
					};
					case RESISTANCE: {
						JKL_LoadoutInd = _type;
						publicVariable "JKL_LoadoutInd";

						if (_reset) then {
							[RESISTANCE] remoteExec ["CMF_fnc_setLoadout",2]
						} else {
							[RESISTANCE] remoteExec ["CMF_fnc_updateMiniArsenal",resistance];
						};	
					};
					default {
						diag_log format ["[CMF Loadouts] - Tried to set loadout for unknown side: %1",_side];
					};
				};
			}, {}, [_Loadouts]
		] call zen_dialog_fnc_create;
    }
] call zen_custom_modules_fnc_register;