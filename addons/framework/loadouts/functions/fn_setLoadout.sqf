params["_side"];
//systemChat format ["_Side: %1", _side];

switch (toLower _side) do {
	case "west":
	{
		{
			[_x] call potato_assignGear_fnc_assignGearMan; 
			call CMF_fnc_updateMiniArsenal;
		} forEach units WEST;
		//systemChat "Side west";
	};
	case "east":
	{
		{
			[_x] call potato_assignGear_fnc_assignGearMan; 
			call CMF_fnc_updateMiniArsenal;
		} forEach units EAST; 
		//systemChat "Side east";
	};
	case "independent":
	{
		{
			[_x] call potato_assignGear_fnc_assignGearMan; 
			call CMF_fnc_updateMiniArsenal;
		} forEach units INDEPENDENT;
		//systemChat "Side ind";
	};

	default 
	{
		diag_log format ["[CMF Loadouts] - Tried to set loadout for unknown side: %1",_side];
		hint format ["[CMF Loadouts] - Tried to set loadout for unknown side: %1",_side];
	}
};