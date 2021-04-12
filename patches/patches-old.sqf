/* 	
	Coalition left arm patch script
	By: tanaKa-
	1.) Assigns pre-designated patches (from coal_patches.pbo) depending on group.
	2.) Adds function to set unit patch later with usage below.
	
	TODO:
		-Needs a rewrite that's quicker and server only

*/
if (!patches) exitWith {};

//_players = allPlayers - entities "HeadlessClient_F";
_leader = leader group player;
if ((_this select 0) != _leader) exitWith {}; //Run on leaders only
_medics = ["potato_w_plm","potato_w_sm","potato_e_plm","potato_e_sm","potato_i_plm","potato_i_sm"];

//Set patches per group
//Will not set if the group doesnt have a player in it
{
	switch (toLower groupID (group player)) do {
		//BLU Groups-------------------------------------------------
		case "blu pl":
		{
			[_x,"PL"] call BIS_fnc_setUnitInsignia;
		};
		case "blu asl":
		{
			[_x,"ASL"] call BIS_fnc_setUnitInsignia;
		};
		case "blu a1":
		{
			[_x,"A1"] call BIS_fnc_setUnitInsignia;
		};
		case "blu a2":
		{
			[_x,"A2"] call BIS_fnc_setUnitInsignia;
		};
		case "blu bsl":
		{
			[_x,"BSL"] call BIS_fnc_setUnitInsignia;
		};
		case "blu b1":
		{
			[_x,"B1"] call BIS_fnc_setUnitInsignia;
		};
		case "blu b2":
		{
			[_x,"B2"] call BIS_fnc_setUnitInsignia;
		};
		case "blu csl":
		{
			[_x,"CSL"]call BIS_fnc_setUnitInsignia;
		};
		case "blu c1":
		{
			[_x,"C1"] call BIS_fnc_setUnitInsignia;
		};
		case "blu c2":
		{
			[_x,"C2"] call BIS_fnc_setUnitInsignia;
		};
		//IND Groups-------------------------------------------------
		case "ind pl":
		{
			[_x,"PL"] call BIS_fnc_setUnitInsignia;
		};
		case "ind asl":
		{
			[_x,"ASL"] call BIS_fnc_setUnitInsignia;
		};
		case "ind a1":
		{
			[_x,"A1"] call BIS_fnc_setUnitInsignia;
		};
		case "ind a2":
		{
			[_x,"A2"] call BIS_fnc_setUnitInsignia;
		};
		case "ind bsl":
		{
			[_x,"BSL"] call BIS_fnc_setUnitInsignia;
		};
		case "ind b1":
		{
			[_x,"B1"] call BIS_fnc_setUnitInsignia;
		};
		case "ind b2":
		{
			[_x,"B2"] call BIS_fnc_setUnitInsignia;
		};
		case "ind csl":
		{
			[_x,"CSL"] call BIS_fnc_setUnitInsignia;
		};
		case "ind c1":
		{
			[_x,"C1"] call BIS_fnc_setUnitInsignia;
		};
		case "ind c2":
		{
			[_x,"C2"] call BIS_fnc_setUnitInsignia;
		};
		//OPF Groups-------------------------------------------------
		case "opf pl":
		{
			[_x,"PL"] call BIS_fnc_setUnitInsignia;
		};
		case "opf asl":
		{
			[_x,"ASL"] call BIS_fnc_setUnitInsignia;
		};
		case "opf a1":
		{
			[_x,"A1"] call BIS_fnc_setUnitInsignia;
		};
		case "opf a2":
		{
			[_x,"A2"] call BIS_fnc_setUnitInsignia;
		};
		case "opf bsl":
		{
			[_x,"BSL"] call BIS_fnc_setUnitInsignia;
		};
		case "opf b1":
		{
			[_x,"B1"] call BIS_fnc_setUnitInsignia;
		};
		case "opf b2":
		{
			[_x,"B2"] call BIS_fnc_setUnitInsignia;
		};
		case "opf csl":
		{
			[_x,"CSL"] call BIS_fnc_setUnitInsignia;
		};
		case "opf c1":
		{
			[_x,"C1"] call BIS_fnc_setUnitInsignia;
		};
		case "opf c2":
		{
			[_x,"C2"] call BIS_fnc_setUnitInsignia;
		};
		default {""};
	};
} forEach units group player; 

//Set medic patches
if (toLower (typeOf player) in _medics) then {
	[player,"medic"] call BIS_fnc_setUnitInsignia;
};
