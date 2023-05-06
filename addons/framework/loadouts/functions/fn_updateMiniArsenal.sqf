if (!hasInterface) exitWith {};
	[player, true, false] call ace_arsenal_fnc_removeVirtualItems;
	private _typeOf = typeOf player;  
	private _class = toLower _typeOf select [9];
	private _faction = faction player; 
	private _path = missionConfigFile >> "CfgLoadouts" >> _faction >> _class;
	switch (side player) do{ 
		case west:
		{
			if (JKL_LoadoutWest isEqualTo "Default") then {
				_path = missionConfigFile >> "CfgLoadouts" >> _faction >> _class;
			} else {
				_path = configFile >> "CfgCMFLoadouts" >> JKL_LoadoutWest >> _class;
			};
		};   

		case east: 
		{ 
			if (JKL_LoadoutEast isEqualTo "Default") then {
				_path = missionConfigFile >> "CfgLoadouts" >> _faction >> _class;
			} else {
				_path = configFile >> "CfgCMFLoadouts" >> JKL_LoadoutEast >> _class;
			};
		};   

		case independent:
		{ 
			if (JKL_LoadoutInd isEqualTo "Default") then {
				_path = missionConfigFile >> "CfgLoadouts" >> _faction >> _class;
			} else {
				_path = configFile >> "CfgCMFLoadouts" >> JKL_LoadoutInd >> _class;
			}; 
		};

		default {
			_path = missionConfigFile >> "CfgLoadouts" >> _faction >> _class;
		};
	};
	private _Uniform = getArray (_path >> "uniform");
	private _Vest = getArray (_path >> "vest");
	private _Backpack = getArray (_path >> "backpack");
	private _Headgear = getArray (_path >> "headgear");
	private _Goggles = getArray (_path >> "goggles");
	private _Attach = getArray (_path >> "attachments");
	private _Optics = getArray (_path >> "opticChoices");
	private _basicItems = ["ItemMap","ItemWatch","ItemCompass"];
	
	//Specify virtual items available
	[player, _Uniform] call ace_arsenal_fnc_addVirtualItems;
	[player, _Vest] call ace_arsenal_fnc_addVirtualItems;
	[player, _Backpack] call ace_arsenal_fnc_addVirtualItems;
	[player, _Headgear] call ace_arsenal_fnc_addVirtualItems;
	[player, _Goggles] call ace_arsenal_fnc_addVirtualItems;
	[player, _Attach] call ace_arsenal_fnc_addVirtualItems;
	[player, _Optics] call ace_arsenal_fnc_addVirtualItems;
	[player, _basicItems] call ace_arsenal_fnc_addVirtualItems;