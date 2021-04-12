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
	vehfac1 addaction ["Spawn <t color='#1279d1'>Transport Truck</t>", "scripts\vehiclespawner\createtruck.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac1 addaction ["Spawn <t color='#1279d1'>Fireteam Vehicle</t>", "scripts\vehiclespawner\createftveh.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac1 addaction ["Spawn <t color='#1279d1'>Armor</t>", "scripts\vehiclespawner\createarmor.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac1 addaction ["Spawn <t color='#1279d1'>Boat</t>", "scripts\vehiclespawner\createboat.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac1 addaction ["<t color='#FF0000'>CLEAR PAD</t>", "scripts\vehiclespawner\clear.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
};

if (isNil "airfac1") then {
} else {
	//Add actions to each factory
	airfac1 addaction ["Spawn <t color='#1279d1'>Helicopter</t>", "scripts\vehiclespawner\createheli.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	airfac1 addaction ["<t color='#FF0000'>CLEAR PAD</t>", "scripts\vehiclespawner\clearheli.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
};

//ind check, add
if (isNil "vehfac2") then {
} else {
	//Add actions to each factory
	vehfac2 addaction ["Spawn <t color='#1279d1'>Transport Truck</t>", "scripts\vehiclespawner\indcreatetruck.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac2 addaction ["Spawn <t color='#1279d1'>Fireteam Vehicle</t>", "scripts\vehiclespawner\indcreateftveh.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac2 addaction ["Spawn <t color='#1279d1'>Armor</t>", "scripts\vehiclespawner\indcreatearmor.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac2 addaction ["Spawn <t color='#1279d1'>Boat</t>", "scripts\vehiclespawner\indcreateboat.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac2 addaction ["<t color='#FF0000'>CLEAR PAD</t>", "scripts\vehiclespawner\indclear.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
};

if (isNil "airfac2") then {
} else {
	//Add actions to each factory
	airfac2 addaction ["Spawn <t color='#1279d1'>Helicopter</t>", "scripts\vehiclespawner\indcreateheli.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	airfac2 addaction ["<t color='#FF0000'>CLEAR PAD</t>", "scripts\vehiclespawner\indclearheli.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
};

//opf check, add
if (isNil "vehfac3") then {
} else {
	//Add actions to each factory
	vehfac3 addaction ["Spawn <t color='#1279d1'>Transport Truck</t>", "scripts\vehiclespawner\opfcreatetruck.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac3 addaction ["Spawn <t color='#1279d1'>Fireteam Vehicle</t>", "scripts\vehiclespawner\opfcreateftveh.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac3 addaction ["Spawn <t color='#1279d1'>Armor</t>", "scripts\vehiclespawner\opfcreatearmor.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac3 addaction ["Spawn <t color='#1279d1'>Boat</t>", "scripts\vehiclespawner\opfcreateboat.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	vehfac3 addaction ["<t color='#FF0000'>CLEAR PAD</t>", "scripts\vehiclespawner\opfclear.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
};

if (isNil "airfac3") then {
} else {
	//Add actions to each factory
	airfac3 addaction ["Spawn <t color='#1279d1'>Helicopter</t>", "scripts\vehiclespawner\opfcreateheli.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
	airfac3 addaction ["<t color='#FF0000'>CLEAR PAD</t>", "scripts\vehiclespawner\opfclearheli.sqf",nil,6,false,true,"","(_target distance _this) < 8"];
};