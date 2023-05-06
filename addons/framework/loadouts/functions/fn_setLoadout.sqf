params["_side"];

switch (toLower _side) do {
	case "west":
	{
		{
			[_x] call potato_assignGear_fnc_assignGearMan; 
			call CMF_fnc_updateMiniArsenal;
		} forEach units WEST;
	};
	case "east":
	{
		{
			[_x] call potato_assignGear_fnc_assignGearMan; 
			call CMF_fnc_updateMiniArsenal;
		} forEach units EAST; 
	};
	case "independent":
	{
		{
			[_x] call potato_assignGear_fnc_assignGearMan; 
			call CMF_fnc_updateMiniArsenal;
		} forEach units INDEPENDENT;
	};

	default 
	{
		diag_log format ["[CMF Loadouts] - Tried to set loadout for unknown side: %1",_side];
		hint format ["[CMF Loadouts] - Tried to set loadout for unknown side: %1",_side];
	}
};