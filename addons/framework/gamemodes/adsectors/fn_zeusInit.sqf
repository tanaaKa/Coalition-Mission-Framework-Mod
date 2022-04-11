/*
 * Author: tanaKa
 * Function used to create the CMF Attack & Defend
 * game mode for CMF missions in zeus only
 *
 * Some logic taken from the FNF game mode
 */
params ["_logic"];
if (!isServer) exitWith {};

// Variables from module
_logicpos = getPos _logic;
_numberOfSectors = _logic getVariable ["cmf_ad_createSectors", 1];
_randomSectors = _logic getVariable ["cmf_ad_randomSectors", false];
attackerSide = _logic getVariable ["cmf_ad_attackingSide", WEST];
defenderSide = _logic getVariable ["cmf_ad_defendingSide", EAST];
captureInOrder = _logic getVariable ["cmf_ad_capInOrder", false];
// Logic variables
sectorCapNum = 0;
_sectors = [];

//Hotfix for module string to value
switch (attackerSide) do {
  case "WEST": {attackerSide = WEST};
  case "EAST": {attackerSide = EAST};
  case "INDEPENDENT": {attackerSide = INDEPENDENT};
};
switch (defenderSide) do {
  case "WEST": {defenderSide = WEST};
  case "EAST": {defenderSide = EAST};
  case "INDEPENDENT": {defenderSide = INDEPENDENT};
};

InAreaRandomPosition = { //parameters: [center, a, b, angle, isRectangle] - see inArea command alternative syntax
	params ["_pos", "_sza", "_szb", "_dir", "_rct"]; _pos params ["_psx", "_psy"];
	if (_rct) then {
		private _dsx = random _sza * 2 - _sza;
		private _dsy = random _szb * 2 - _szb;			
		[_psx + _dsx * cos -_dir - _dsy * sin -_dir, _psy + _dsx * sin -_dir + _dsy * cos -_dir]
	} else {
		private _ang = random 360;
		private _rad = sqrt random 1.0;
		private _dsx = _sza * _rad * sin _ang;
		private _dsy = _szb * _rad * cos _ang;
		[_psx + _dsx * cos -_dir - _dsy * sin -_dir, _psy + _dsx * sin -_dir + _dsy * cos -_dir]
	}
};

tnk_createRandomSectors = 
{
  switch (_numberOfSectors) do 
  { 
    case 0: // 1 sector
    { 
      //Get the play area from the logic transformation values
      _zone = [_logicpos,1000,1000,0,false] call InAreaRandomPosition;
      //Create the triggers within the play area
      sector1 = createTrigger ["EmptyDetector", _zone, true];
      _randomSize = floor(random [50,75,100]);
      sector1 setTriggerArea [_randomSize, _randomSize, 0, false];
      sector1 setTriggerActivation ["NONE", "NONE", true];
      sector1 setTriggerStatements ["this", "", ""];
      _sectors pushBack sector1;
    };
    case 1: // 2 sectors
    {
      for [{_i = 1}, {_i < 3}, {_i = _i + 1}] do
      {
        //Get the play area from the logic transformation values
        _sectorName = "sector" + str(_i);
        _zone = [_logicpos,1000,1000,0,false] call InAreaRandomPosition;
        //Create the triggers within the play area
        _sectorName = createTrigger ["EmptyDetector", _zone, true];
        _randomSize = floor(random [50,75,100]);
        _sectorName setTriggerArea [_randomSize, _randomSize, 0, false];
        _sectorName setTriggerActivation ["NONE", "NONE", true];
        _sectorName setTriggerStatements ["this", "", ""];
        _sectors pushBack _sectorName;
      };
    };
    case 2: // 3 sectors
    {
      for [{_i = 1}, {_i < 4}, {_i = _i + 1}] do
      {
        //Get the play area from the logic transformation values
        _sectorName = "sector" + str(_i);
        _zone = [_logicpos,1000,1000,0,false] call InAreaRandomPosition;
        //Create the triggers within the play area
        _sectorName = createTrigger ["EmptyDetector", _zone, true];
        _randomSize = floor(random [50,75,100]);
        _sectorName setTriggerArea [_randomSize, _randomSize, 0, false];
        _sectorName setTriggerActivation ["NONE", "NONE", true];
        _sectorName setTriggerStatements ["this", "", ""];
        _sectors pushBack _sectorName;
      };
    };
  };
  call tnk_createSectors;
};

tnk_createSectors =
{
  //Skip this if we already set up random sectors
  if !(_randomSectors) then {
    switch (_numberOfSectors) do { // Module config always starts at 0, so 0 = 1 here, 1 = 2, etc..
      case 0: {_sectors pushBack sector1};
      case 1: {_sectors pushBack sector1; _sectors pushBack sector2};
      case 2: {_sectors pushBack sector1; _sectors pushBack sector2; _sectors pushBack sector3};
    };
  };

  _sectorNum = 0;
  {
    //"[debug] Creating cap zone in trigger" remoteExec ["systemChat"];
    _area = triggerArea _x;
    _mark = createMarker [(str _x) + "Mark", getPos _x];
    _mark setMarkerShape (if (_area select 3) then {"RECTANGLE"} else {"ELLIPSE"});
    _mark setMarkerSize [_area select 0, _area select 1];
    _mark setMarkerDir (_area select 2);
    _mark setMarkerBrush "SolidBorder";
    _mark setMarkerColor "ColorBlack";
    //"[debug] Marker created" remoteExec ["systemChat"];

    //"[debug] Setting Marker text" remoteExec ["systemChat"];
    _textMark = createMarker [(str _x) + "TextMark", getPos _x];
    _textMark setMarkerType "mil_dot";
    _sectorNum = _sectorNum + 1;
    _textMark setMarkerText ("Sector " + str(_sectorNum));

    //"[debug] Spawning loop per sector" remoteExec ["systemChat"];
    [_x,_mark,_textMark,_sectorNum] spawn {
      params ["_sector","_mark","_textMark","_sectorNum","_dTask","_aTask"];

      if (captureInOrder) then {
        waitUntil {sectorCapNum == (_sectorNum - 1)};
      };

      //"[debug] Coloring the sector per side" remoteExec ["systemChat"];
      switch (defenderSide) do {
        case EAST: {_mark setMarkerColor "ColorEAST"};
        case WEST: {_mark setMarkerColor "ColorWEST"};
        case INDEPENDENT: {_mark setMarkerColor "ColorGUER"};
        default {"ColorCIV"};
      };

      //"[debug] Assigning task to each side" remoteExec ["systemChat"];
      _dTask = "dtask" + str(_sectorNum);
      _aTask = "atask" + str(_sectorNum);
      _dTaskTitle = "Defend Sector " + str(_sectorNum);
      _aTaskTitle = "Attack Sector " + str(_sectorNum);

      [defenderSide, [_dTask], [_dTaskTitle, _dTaskTitle, ""], getPos _sector, "AUTOASSIGNED"] call BIS_fnc_taskCreate;
      [attackerSide, [_aTask], [_aTaskTitle, _aTaskTitle, ""], getPos _sector, "AUTOASSIGNED"] call BIS_fnc_taskCreate;

      _units = [];

      while {alive _sector} do {
        _dPresent = false;
        _aPresent = false;

        _units = allUnits inAreaArray _sector;

        {
          if (_x call BIS_fnc_objectSide == defenderSide && vehicle _x isKindOf "Man" && lifeState _x != "INCAPACITATED" && !isObjectHidden _x) then {
            _dPresent = true;
          };
          if (_x call BIS_fnc_objectSide == attackerSide && vehicle _x isKindOf "Man" && lifeState _x != "INCAPACITATED" && !isObjectHidden _x) then {
            _aPresent = true;
          };
        } forEach _units;

        if (_aPresent && !_dPresent) then {
          sectorCapNum = sectorCapNum + 1;

          deleteVehicle _sector;
          deleteMarker _mark;
          deleteMarker _textMark;

          [_dTask,"FAILED"] call BIS_fnc_taskSetState;
          [_aTask,"SUCCEEDED"] call BIS_fnc_taskSetState;

          ["Attackers have captured Sector " + str(_sectorNum)]  remoteExec ["hint",0,false];    
        };

        sleep 2;
      };
    };
  } forEach _sectors;
};

call tnk_createRandomSectors;