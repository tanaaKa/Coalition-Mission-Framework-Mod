/* 	
	Heli Pad Clearing script
	By: tanaKa
	
	TODO:
		-Rewrite detection of vehicle on pad to give proper refund
		-Only works with BI helis normally
*/

private _objs = nearestObjects [getPos indhelipad, [], 8];
private _vehname = _objs param [1,""];
private _vehname = str _vehname splitString ":"""; 
private _vehname = _vehname param [1,""];
private _vehname = str _vehname splitString "."""; 
private _vehname = _vehname param [0,""];
private _vehname = _vehname select [1]; // gets rid of space

private _heli = (indheli select [2]); //gets rid of prefix 'I_'
private _heli = (toLower _transport);
//hint str(_transport);
//hint str(_vehname);
{
	if (_x isKindOf "Building") then {
		false;
	} else { 
		deleteVehicle _x;
		if (funds > -1) then {
			switch (_vehname) do {
				case _heli:
				{
					funds = funds + helicost;
					hint format ["Heli refunded. Current funds: %1", funds];
				};
				default 
				{
					hint "Heli deleted but funds not refunded. Message admin for help if needed.";
					["potato_adminMsg", ["Heli funds lost! To add more funds: Open dev console and type: 'funds = funds + amount' where 'amount' is a number. Global execute."]] call CBA_fnc_globalEvent;
				};
			};
		} else {
			hint "Vehicle deleted";
		};
	};
} forEach _objs;