/*

Jester's vehicle service script
Run on server
Repairs/rearms/refuels any vehicle parked inside 8 meters from an objects center when empty/engine off, e.g. helipad

*/

// time it takes to service a vehicle
JST_serviceTime = 60;

// define function
JST_fnc_serviceVehicles =
{
	params ["_nearVehs", "_pad"];
	while {UIsleep 5; alive _pad} do
	{
		private _list = _pad nearEntities [["Air", "Car", "Ship", "Tank"], 8];
		{
			private _veh = _x;
			private _isNew = _nearVehs pushBackUnique _veh;
			if (_isNew > -1) then
			{
				private _type = typeOf _veh;
				private _name = getText (configFile >> "CfgVehicles" >> _type >> "displayName");
				private _veh = _x;
				private _crew = crew _veh;
				{
					["Shut down and get out to receive vehicle service."] remoteExec ["systemChat", _x];
				} forEach _crew;
				private _timeStop = time + 15;
				waitUntil {(time >= _timeStop) or (!(isEngineOn _veh) and ((count crew _veh) isEqualTo 0))};
				if (time >= _timeStop) exitWith
				{
					_nearVehs deleteAt (_nearVehs findIf {_x isEqualTo _veh});
				};
				_veh setVariable ["JST_servicingVehicle", true];
				{
					[format ["Servicing the %1 will take %2 seconds.", _name, JST_serviceTime]] remoteExec ["systemChat", _x];
				} forEach _crew;
				private _timeServiceComplete = time + JST_serviceTime;
				private _stopService = false;
				while {time < _timeServiceComplete} do
				{
					UIsleep 1;
					if ((_veh distance2D _pad) > 8) exitWith {_stopService = true};
				};
				if (!_stopService) then
				{
					[_veh, 1] remoteExec ["setVehicleAmmo", _veh];
					[_veh, 0] remoteExec ["setDamage", _veh];
					[_veh, 1] remoteExec ["setFuel", _veh];
					{
						[format ["Servicing the %1 is complete!", _name]] remoteExec ["systemChat", _x];
					} forEach _crew;
				}
				else
				{
					{
						["Hey! What are you doing!?"] remoteExec ["systemChat", _x];
					} forEach _crew;
				};
			};
		} forEach _list;
		{
			private _veh = _x;
			if !(_veh in _list) then
			{
				_nearVehs deleteAt (_nearVehs findIf {_x isEqualTo _veh});
			};
		} forEach _nearVehs;
	};
};

// create empty arrays of vehicles near given pad
JST_bluPadNearVehs = [];
JST_indPadNearVehs = [];
JST_opfPadNearVehs = [];

// start loop if given pad object present, can add/remove pads with corresponding arrays as-needed here
if (!isNil "blu_veh_pad") then
{
	[JST_bluPadNearVehs, blu_veh_pad] spawn JST_fnc_serviceVehicles;
};
if (!isNil "ind_veh_pad") then
{
	[JST_indPadNearVehs, ind_veh_pad] spawn JST_fnc_serviceVehicles;
};
if (!isNil "opf_veh_pad") then
{
	[JST_opfPadNearVehs, opf_veh_pad] spawn JST_fnc_serviceVehicles;
};