///////////////////////////////////////////////////////////////
//	Logging script
//	By: tanaKa-
//	Logs various mission information to the server which is
//	read by the coalition bot and discord webhook.
//
//	TODO:
//		N/A
//
///////////////////////////////////////////////////////////////
diag_log "[CMF]: Starting Server Logging";

//Add mission title to attendance log
if (isDedicated) then {
	_title = getText (missionConfigFile >> "MissionSQM" >> "Mission" >> "Intel" >> "briefingName");
	
	[format ["--------------------------------------------"], "PlayerConnectLog"] call A3Log;
	[format ["Attendance for mission: %1", _title], "PlayerConnectLog"] call A3Log;
	
	//testing variables
	_bluforSlots = playableSlotsNumber blufor;
	_opforSlots = playableSlotsNumber opfor;
	_indforSlots = playableSlotsNumber independent;
	
	[format ["--------------------------------------------"], "sessionLog"] call A3Log;
	[format ["Leader ORBAT for mission: %1", _title], "sessionLog"] call A3Log;
	
	// Loops to log each leader slotted on the server
	if (_bluforSlots > 0) then {
		[format ["-- BLUFOR --"], "sessionLog"] call A3Log;
		_bluLeaders = 
		[
			BLU_COY
			,BLU_PL
			,BLU_ASL,BLU_A1_FTL,BLU_A2_FTL
			,BLU_BSL,BLU_B1_FTL,BLU_B2_FTL
			,BLU_PL2
			,BLU_CSL,BLU_C1_FTL,BLU_C2_FTL
			,BLU_DSL,BLU_D1_FTL,BLU_D2_FTL
		];
		{
			if !(isNull _x) then 
			{
				[format ["%1: %2", _x, name _x], "sessionLog"] call A3Log;
			};
		} forEach _bluLeaders;
	};
	
	if (_opforSlots > 0) then {
		[format ["-- OPFOR --"], "sessionLog"] call A3Log;
		_opfLeaders = 
		[
			OPF_COY
			,OPF_PL
			,OPF_ASL,OPF_A1_FTL,OPF_A2_FTL
			,OPF_BSL,OPF_B1_FTL,OPF_B2_FTL
			,OPF_PL2
			,OPF_CSL,OPF_C1_FTL,OPF_C2_FTL
			,OPF_DSL,OPF_D1_FTL,OPF_D2_FTL
		];
		{
			if !(isNull _x) then 
			{
				[format ["%1: %2", _x, name _x], "sessionLog"] call A3Log;
			};
		} forEach _opfLeaders;
	}; 
	
	if (_indforSlots > 0) then {
		[format ["-- INDFOR --"], "sessionLog"] call A3Log;
		_indLeaders = 
		[
			IND_COY
			,IND_PL
			,IND_ASL,IND_A1_FTL,IND_A2_FTL
			,IND_BSL,IND_B1_FTL,IND_B2_FTL
			,IND_PL2
			,IND_CSL,IND_C1_FTL,IND_C2_FTL
			,IND_DSL,IND_D1_FTL,IND_D2_FTL
		];
		{
			if !(isNull _x) then 
			{
				[format ["%1: %2", _x, name _x], "sessionLog"] call A3Log;
			};
		} forEach _indLeaders;
	};
	
	[format ["ORBAT Complete"], "sessionLog"] call A3Log;
	["--------------------------------------------", "sessionLog"] call A3Log;
};

diag_log "[CMF]: Server Logging Complete";