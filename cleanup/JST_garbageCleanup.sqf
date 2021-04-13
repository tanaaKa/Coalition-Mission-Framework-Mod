/*
Simple garbage cleanup script by Jester
Will delete all vehicle wrecks, building wrecks, dead units, abandoned ammo, weapon holders, craters, etc.
... if not near living player or static weapon
... and if been existant long enough
*/
if (!isServer) exitWith {};
_nul = [] spawn {
	private _minDis = 50;		
	private _sleep = 120;		
	private _minLife = 2;		
	private _ruinsMinLife = 5;	
	JST_garbage_tick = 0;
	JST_garbage_list = [];
	"[CMF] Garbage cleanup running" remoteExec ["systemChat"];
	while {true} do
	{
		JST_garbage_tick = JST_garbage_tick + 1;
		private _allStatics = allMissionObjects "StaticWeapon";
		_allStatics deleteAt (_allStatics findIf 
		{
			!(alive _x);
		});
		private _allPlayers = [];
		{
			if ((alive _x) and {isPlayer _x} and {!(_x isKindOf "potato_spectate_spectator")}) then
			{
				_allPlayers pushBack _x;
			};
		} forEach allUnits;
		{
			private _item = _x select 0;
			private _deleteAtTick = _x select 1;
			if ((!isNil "_deleteAtTick") and {_deleteAtTick <= JST_garbage_tick}) then
			{
				private _itemPos = getPos _item;
				private _toDelete = true;
				{
					if ((_itemPos distance2D (getPos _x)) < _minDis) then {_toDelete = false};
				} forEach _allStatics;
				{
					if ((_itemPos distance2D (getPos _x)) < _minDis) then {_toDelete = false};
				} forEach _allPlayers;
				if (_toDelete) then
				{
					JST_garbage_list = JST_garbage_list - [_x];
					deleteVehicle _item;
				};
			};
		} forEach JST_garbage_list;
		UIsleep 5;
		{
			private _item = _x;
			private _inAlready = JST_garbage_list findIf {(_x select 0) isEqualTo _item};
			if !(_inAlready > -1) then {JST_garbage_list pushBack [_item, (JST_garbage_tick + _minLife)]};
		} forEach (allMissionObjects "WeaponHolder");
		{
			private _item = _x;
			private _inAlready = JST_garbage_list findIf {(_x select 0) isEqualTo _item};
			if !(_inAlready > -1) then {JST_garbage_list pushBack [_item, (JST_garbage_tick + _minLife)]};
		} forEach (allMissionObjects "GroundWeaponHolder");
		{
			private _item = _x;
			private _inAlready = JST_garbage_list findIf {(_x select 0) isEqualTo _item};
			if !(_inAlready > -1) then {JST_garbage_list pushBack [_item, (JST_garbage_tick + _minLife)]};
		} forEach (allMissionObjects "WeaponHolderSimulated");
		{
			private _item = _x;
			private _inAlready = JST_garbage_list findIf {(_x select 0) isEqualTo _item};
			if !(_inAlready > -1) then {JST_garbage_list pushBack [_item, (JST_garbage_tick + _ruinsMinLife)]};
		} forEach (allMissionObjects "Ruins");
		{
			private _item = _x;
			private _inAlready = JST_garbage_list findIf {(_x select 0) isEqualTo _item};
			if !(_inAlready > -1) then {JST_garbage_list pushBack [_item, (JST_garbage_tick + _minLife)]};
		} forEach allDead;
		UIsleep _sleep;
	};
};