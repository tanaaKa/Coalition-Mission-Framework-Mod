viewDistanceHandler = [{
	if (maxViewDistance isEqualTo -1) exitWith {};

	if (viewDistance > maxViewDistance) then {
		setViewDistance maxViewDistance;
	};
  
	if (getTerrainGrid > 25) then {
		setTerrainGrid 25;
	};
} , 0.5] call CBA_fnc_addPerFrameHandler;