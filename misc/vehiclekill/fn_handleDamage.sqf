/*
 * Author: tanaKa
 * Function used to handle random damage on vehicle destruction
 * for the CMF
 *
 * Params: 
 * 0: vehicle <OBJECT>
 *
 * Return value:
 * N/A
 *
 * Usage: 
 * [vehicle] spawn CMF_fnc_handleDamage
 *
 * Public: no
 */
params ["_vehicle"];

{
	_kill = random [1,50,100];

	if (_kill > 29) then {
		_bodyPart = selectRandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
		_damage = 1; // full damage
		_type = selectRandom ["bullet", "vehiclecrash", "collision", "grenade", "explosive", "shell", "backblast", "stab", "unknown"];
		[_x, _damage, _bodyPart, _type] call ace_medical_fnc_addDamageToUnit;
		_x setDamage 1; // kill player
		diag_log format ["[CMF VEHICLE]: %1 damage added to %2's %3 with a %4 value with _kill set to %5",_type,(name player),_bodypart,_damage,_kill];
		//systemChat format ["[CMF VEHICLE]: %1 damage added to %2's %3 with a %4 value with _kill set to %5",_type,(name player),_bodypart,_damage,_kill];
	} else {
		_damage = selectRandom [0,0,0,0,0,0.2,0.3,0.4]; //small chance to be slightly injured in a limb
		if (_damage > 0) then {
			_bodyPart = selectRandom ["LeftArm", "RightArm", "LeftLeg", "RightLeg"];
			_type = selectRandom ["bullet", "vehiclecrash", "collision", "grenade", "explosive", "shell", "backblast", "stab", "unknown"];
			[_x, _damage, _bodyPart, _type] call ace_medical_fnc_addDamageToUnit;
			diag_log format ["[CMF VEHICLE]: %1 damage added to %2's %3 with a %4 value with _kill set to %5",_type,(name player),_bodypart,_damage,_kill];
			//systemChat format ["[CMF VEHICLE]: %1 damage added to %2's %3 with a %4 value with _kill set to %5",_type,(name player),_bodypart,_damage,_kill];
			uiSleep 1;
			waitUntil {speed _vehicle < 1};
			moveOut _x;
		} else { 
			diag_log format ["[CMF VEHICLE]: No damage added to %1 when their vehicle exploded",(name player)];
			//systemChat format ["[CMF VEHICLE]: No damage added to %1's when their vehicle exploded",(name player)];
			uiSleep 1;
			waitUntil {speed _vehicle < 1};
			moveOut _x;
		};
	};
} forEach crew _vehicle;

