viewDistanceHandler = [{
	private _maxVD = parseNumber getMissionConfigValue "potato_missionTesting_maxViewDistance";
	if (_maxVD isEqualTo -1) exitWith {};

	if ((getObjectViewDistance select 0) > _maxVD) then {
		setObjectViewDistance _maxVD;
		systemChat format ["Object view distance is limited to %1m by the mission.", _maxVD];
	};
  
	if (getTerrainGrid > 25) then {
		setTerrainGrid 25;
		systemChat "The Terrain Grid setting is limited to 25 by the CMF.";
	};
} , 5] call CBA_fnc_addPerFrameHandler;