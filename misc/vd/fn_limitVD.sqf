viewDistanceHandler = [{
	private _maxVD = parseNumber getMissionConfigValue "potato_missionTesting_maxViewDistance";
	if (_maxVD isEqualTo -1) exitWith {};

	if (viewDistance > _maxVD) then {
		setViewDistance _maxVD;
	};
  
	if (getTerrainGrid > 25) then {
		setTerrainGrid 25;
	};
} , 0.5] call CBA_fnc_addPerFrameHandler;