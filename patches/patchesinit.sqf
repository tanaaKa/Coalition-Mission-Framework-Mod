JKL_fnc_PatchAssignGrp = 
{
	{
		private _typeOf = typeOf _x;
		private _unitRole = toLower _typeOf select [9];//Select is Faster then BIS_fnc_trimString
		_group =  groupid (group _x);
 
		//Assigns Patch Based on Group, Finds Group Name Ignoring side in GroupID 
		//(incase its changed from BLU/OPF/IND to ARMY/RUSSIAN/ETC)
		switch (true) do {
			case (_group find "ASL" != -1): // If the group name is not found in the GroupID it returns -1, making it false
			{
				[_x,"ASL"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "BSL" != -1): 
			{
				[_x,"BSL"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "CSL" != -1): 
			{
				[_x,"CSL"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "DSL" != -1): 
			{
				[_x,"DSL"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "A1" != -1): 
			{
				[_x,"A1"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "A2" != -1): 
			{
				[_x,"A2"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "B1" != -1): 
			{
				[_x,"B1"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "B2" != -1): 
			{
				[_x,"B2"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "C1" != -1): 
			{
				[_x,"C1"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "C2" != -1): 
			{
				[_x,"C2"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "D1" != -1): 
			{
				[_x,"D1"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "D2" != -1): 
			{
				[_x,"D2"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "IFV" != -1): 
			{
				[_x,"IFV"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "TNK" != -1): 
			{
				[_x,"TNK"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "AH" != -1): 
			{
				[_x,"AH"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "TH" != -1): 
			{
				[_x,"TH"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "CAS" != -1): 
			{
				[_x,"CAS"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "1PLT" != -1): 
			{
				[_x,"PL1"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "2PLT" != -1): 
			{
				[_x,"PL2"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "PL" != -1): 
			{
				[_x,"PL"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "COY" != -1): 
			{
				[_x,"COY"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "MMG" != -1): 
			{
				[_x,"MMG"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "MAT" != -1): 
			{
				[_x,"MAT"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "HMG" != -1): 
			{
				[_x,"HMG"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "HAT" != -1): 
			{
				[_x,"HAT"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "SAM" != -1): 
			{
				[_x,"SAM"] call BIS_fnc_setUnitInsignia;
			};
			case (_group find "MTR" != -1): 
			{
				[_x,"MTR"] call BIS_fnc_setUnitInsignia;
			};
			default 
			{
				[_x,""] call BIS_fnc_setUnitInsignia;
			};
		};
		//Applies Patch For Specific Units Rather then Group
		switch (_unitRole) do {
			case"cm": {[_x,"MEDIC"] call BIS_fnc_setUnitInsignia;};
			case"plm": {[_x,"MEDIC"] call BIS_fnc_setUnitInsignia;};
			case"sm": {[_x,"MEDIC"] call BIS_fnc_setUnitInsignia;};
			case"artl": {[_x,"ARTY"] call BIS_fnc_setUnitInsignia;};
			case"artg": {[_x,"ARTY"] call BIS_fnc_setUnitInsignia;};
			case"stl": {[_x,"RECON"] call BIS_fnc_setUnitInsignia;};
			case"sniper": {[_x,"RECON"] call BIS_fnc_setUnitInsignia;};
			case"spotter": {[_x,"RECON"] call BIS_fnc_setUnitInsignia;};
			case"eng": {[_x,"ENG"] call BIS_fnc_setUnitInsignia;};
			case"engl": {[_x,"ENG"] call BIS_fnc_setUnitInsignia;};
			case"demo": {[_x,"ENG"] call BIS_fnc_setUnitInsignia;};
			case"demol": {[_x,"ENG"] call BIS_fnc_setUnitInsignia;};
			case"mine": {[_x,"ENG"] call BIS_fnc_setUnitInsignia;};
		};
		
	} forEach AllPlayers;
	
	"[CMF] Patches assigned based on group" remoteExec ["systemChat"];
};

JKL_fnc_PatchAssignClr = 
{
	{
		private _typeOf = typeOf _x;
		private _unitRole = toLower _typeOf select [9];
		//Switch Case For Color team and assigns patch based on that
		switch (assignedTeam _x) do {
			case "RED": { [_x,"RED"] call BIS_fnc_setUnitInsignia; };
			case "YELLOW": { [_x,"YELLOW"] call BIS_fnc_setUnitInsignia; };
			case "GREEN": { [_x,"GREEN"] call BIS_fnc_setUnitInsignia; };
			case "BLUE": { [_x,"BLUE"] call BIS_fnc_setUnitInsignia; };
			case "MAIN": { [_x,"WHITE"] call BIS_fnc_setUnitInsignia; };
			default { [_x,"BLANK"] call BIS_fnc_setUnitInsignia; };
		};
		//Assigns Patches to Medic
		switch (_unitRole) do {
			case"cm": {[_x,"MEDIC"] call BIS_fnc_setUnitInsignia;};
			case"plm": {[_x,"MEDIC"] call BIS_fnc_setUnitInsignia;};
			case"sm": {[_x,"MEDIC"] call BIS_fnc_setUnitInsignia;};
		};
	} forEach AllPlayers;
	
	"[CMF] Patches assigned based on color team" remoteExec ["systemChat"];
};

JKL_fnc_PatchAssignGS = 
{
	{
		//Finds and Grabs Patch Array in GS
		private _typeOf = typeOf _x;
		private _unitRole = toLower _typeOf select [9];
		private _faction = faction _x;
		private _path = missionConfigFile >> "CfgLoadouts" >> _faction >> _unitRole;
		private _configpatch = selectRandom getArray (_path >> "patch");
		[_x,_configpatch] call BIS_fnc_setUnitInsignia;
	} forEach AllPlayers;
	
	"[CMF] Patches assigned based on gearscript" remoteExec ["systemChat"];
};

[] spawn
{
    sleep 1;
	if !(CMF_Mission) exitWith {};
	
	//Runs FNCs based on Numbers defined in init.sqf, Options are -1,0,1,2
	Switch (patches) do { //Grabs from init.sqf somehow
		case -1: {};// Exits 
		case 0: { [] call JKL_fnc_PatchAssignGS }; // Assigns Patch from GS if Defined
		case 1: { [] call JKL_fnc_PatchAssignGrp }; // Assigns Patch Based off of Group
		case 2: { [] call JKL_fnc_PatchAssignClr }; // Assigns Patch Based offf of Color Team
		default {}; // Exits
	};
};