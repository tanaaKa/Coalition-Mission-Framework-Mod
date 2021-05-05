/* 	
	Vehicle "factory" script
	By: tanaKa- and Vauun
	Adds action each client based on which sides are on the map
	
	TODO:
		
*/
if (!useSpawners) exitWith {};

//blu check, add
if (isNil "vehfac1") then {
} else {
	//Add actions to each factory
	vehfac1 addaction ["Spawn <t color='#1279d1'>Transport Truck</t>", "x\cmf\addons\framework\vehiclespawner\createtruck.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac1 addaction ["Spawn <t color='#1279d1'>Fireteam Vehicle</t>", "x\cmf\addons\framework\vehiclespawner\createftveh.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac1 addaction ["Spawn <t color='#1279d1'>Armor</t>", "x\cmf\addons\framework\vehiclespawner\createarmor.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac1 addaction ["Spawn <t color='#1279d1'>Boat</t>", "x\cmf\addons\framework\vehiclespawner\createboat.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac1 addaction ["<t color='#FF0000'>CLEAR PAD</t>", "x\cmf\addons\framework\vehiclespawner\clear.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
};

if (isNil "airfac1") then {
} else {
	//Add actions to each factory
	airfac1 addaction ["Spawn <t color='#1279d1'>Helicopter</t>", "x\cmf\addons\framework\vehiclespawner\createheli.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	airfac1 addaction ["<t color='#FF0000'>CLEAR PAD</t>", "x\cmf\addons\framework\vehiclespawner\clearheli.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
};

//ind check, add
if (isNil "vehfac2") then {
} else {
	//Add actions to each factory
	vehfac2 addaction ["Spawn <t color='#1279d1'>Transport Truck</t>", "x\cmf\addons\framework\vehiclespawner\indcreatetruck.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac2 addaction ["Spawn <t color='#1279d1'>Fireteam Vehicle</t>", "x\cmf\addons\framework\vehiclespawner\indcreateftveh.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac2 addaction ["Spawn <t color='#1279d1'>Armor</t>", "x\cmf\addons\framework\vehiclespawner\indcreatearmor.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac2 addaction ["Spawn <t color='#1279d1'>Boat</t>", "x\cmf\addons\framework\vehiclespawner\indcreateboat.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac2 addaction ["<t color='#FF0000'>CLEAR PAD</t>", "x\cmf\addons\framework\vehiclespawner\indclear.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
};

if (isNil "airfac2") then {
} else {
	//Add actions to each factory
	airfac2 addaction ["Spawn <t color='#1279d1'>Helicopter</t>", "x\cmf\addons\framework\vehiclespawner\indcreateheli.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	airfac2 addaction ["<t color='#FF0000'>CLEAR PAD</t>", "x\cmf\addons\framework\vehiclespawner\indclearheli.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
};

//opf check, add
if (isNil "vehfac3") then {
} else {
	//Add actions to each factory
	vehfac3 addaction ["Spawn <t color='#1279d1'>Transport Truck</t>", "x\cmf\addons\framework\vehiclespawner\opfcreatetruck.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac3 addaction ["Spawn <t color='#1279d1'>Fireteam Vehicle</t>", "x\cmf\addons\framework\vehiclespawner\opfcreateftveh.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac3 addaction ["Spawn <t color='#1279d1'>Armor</t>", "x\cmf\addons\framework\vehiclespawner\opfcreatearmor.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac3 addaction ["Spawn <t color='#1279d1'>Boat</t>", "x\cmf\addons\framework\vehiclespawner\opfcreateboat.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac3 addaction ["<t color='#FF0000'>CLEAR PAD</t>", "x\cmf\addons\framework\vehiclespawner\opfclear.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
};

if (isNil "airfac3") then {
} else {
	//Add actions to each factory
	airfac3 addaction ["Spawn <t color='#1279d1'>Helicopter</t>", "x\cmf\addons\framework\vehiclespawner\opfcreateheli.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	airfac3 addaction ["<t color='#FF0000'>CLEAR PAD</t>", "x\cmf\addons\framework\vehiclespawner\opfclearheli.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
};