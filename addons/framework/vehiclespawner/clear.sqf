/* 	
	Vehicle Pad Clearing script
	By: tanaKa
	
	TODO:
		-Rewrite detection of vehicle on pad to give proper refund
		-Only works with BI vehs normally
*/

private _objs = nearestObjects [getPos bluvehpad, [], 8];
private _vehname = _objs param [1,""];
private _vehname = str _vehname splitString ":"""; 
private _vehname = _vehname param [1,""];
private _vehname = str _vehname splitString "."""; 
private _vehname = _vehname param [0,""];
private _vehname = _vehname select [1]; // gets rid of space

private _transport = (blutransport select [2]); //gets rid of prefix 'B_'
private _transport = (toLower _transport);
private _tank = (bluarmor select [2]);
private _tank = (toLower _tank);
private _boat = (boat select [2]);
private _boat = (toLower _boat);
private _ftvic = (bluftveh select [2]);
private _ftvic = (toLower _ftvic);
//hint str(_transport);
//hint str(_vehname);
{
	if (_x isKindOf "Building") then {
		false;
	} else { 
		deleteVehicle _x;
		if (funds > -1) then {
			switch (_vehname) do {
				case _transport:
				{
					funds = funds + transportcost;
					hint format ["Transport truck refunded. Current funds: %1", funds];
				};
				case _tank:
				{
					funds = funds + armorcost;
					hint format ["Armor refunded. Current funds: %1", funds];
				};
				case _boat:
				{
					funds = funds + boatcost;
					hint format ["Boat refunded. Current funds: %1", funds];
				};
				case _ftvic:
				{
					funds = funds + ftvehcost;
					hint format ["Fireteam vehicle refunded. Current funds: %1", funds];
				};
				default 
				{
					hint "Vehicle deleted but funds not refunded. Message admin for help if needed.";
					["potato_adminMsg", ["Vehicle funds lost! To add more funds: Open dev console and type: 'funds = funds + amount' where 'amount' is a number. Global execute."]] call CBA_fnc_globalEvent;
				};
			};
		} else {
			hint "Vehicle deleted";
		};
	};
} forEach _objs;