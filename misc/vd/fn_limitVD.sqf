viewDistanceHandler = [{
	private _maxVD = parseNumber getMissionConfigValue "potato_missionTesting_maxViewDistance";
	if (_maxVD isEqualTo -1) exitWith {};

	if (viewDistance > _maxVD) then {
		setViewDistance _maxVD;
		setObjectViewDistance _maxVD;
		systemChat format ["View distance is limited to %1m by the mission.", _maxVD];
	};
  
	if (getTerrainGrid > 25) then {
		setTerrainGrid 25;
		systemChat "The Terrain Grid setting is limited to 25 by the CMF.";
	};
} , 5] call CBA_fnc_addPerFrameHandler;