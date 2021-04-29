///////////////////////////////////////////////////////////////
//	Logging script
//	By: tanaKa-
//	Logs various mission information to the server which is
//	read by the coalition bot.
//
//	TODO:
//		N/A
//
///////////////////////////////////////////////////////////////
diag_log "[CMF]: Starting Server Logging";
if !(CMF_Mission) exitWith {};

//Add mission title to attendance log
if (isDedicated) then {
	_title = getText (missionConfigFile >> "MissionSQM" >> "Mission" >> "Intel" >> "briefingName");
	
	[format ["--------------------------------------------"], "PlayerConnectLog"] call A3Log;
	[format ["Attendance for mission: %1", _title], "PlayerConnectLog"] call A3Log;
};
	
//Leadership orbat printed to sessionLog
if (isDedicated) then {
	_title = getText (missionConfigFile >> "MissionSQM" >> "Mission" >> "Intel" >> "briefingName");
	//Blu leaders
	_bCoyName = name BLU_COY;
	_b1PlName = name BLU_PL;
	_bAslName = name BLU_ASL;
	_bA1Name = name BLU_A1_FTL;
	_bA2Name = name BLU_A2_FTL;
	_bBslName = name BLU_BSL;
	_bB1Name = name BLU_B1_FTL;
	_bB2Name = name BLU_B2_FTL;
	_b2PlName = name BLU_PL2;
	_bCslname = name BLU_CSL;
	_bC1Name = name BLU_C1_FTL;
	_bC2Name = name BLU_C2_FTL;
	_bDslname = name BLU_DSL;
	_bD1Name = name BLU_D1_FTL;
	_bD2Name = name BLU_D2_FTL;
	//Opf leaders
	_oCoyName = name OPF_COY;
	_o1PlName = name OPF_PL;
	_oAslName = name OPF_ASL;
	_oA1Name = name OPF_A1_FTL;
	_oA2Name = name OPF_A2_FTL;
	_oBslName = name OPF_BSL;
	_oB1Name = name OPF_B1_FTL;
	_oB2Name = name OPF_B2_FTL;
	_o2PlName = name OPF_PL2;
	_oCslname = name OPF_CSL;
	_oC1Name = name OPF_C1_FTL;
	_oC2Name = name OPF_C2_FTL;
	_oDslname = name OPF_DSL;
	_oD1Name = name OPF_D1_FTL;
	_oD2Name = name OPF_D2_FTL;
	//Ind leaders
	_iCoyName = name IND_COY;
	_i1PlName = name IND_PL;
	_iAslName = name IND_ASL;
	_iA1Name = name IND_A1_FTL;
	_iA2Name = name IND_A2_FTL;
	_iBslName = name IND_BSL;
	_iB1Name = name IND_B1_FTL;
	_iB2Name = name IND_B2_FTL;
	_i2PlName = name IND_PL2;
	_iCslname = name IND_CSL;
	_iC1Name = name IND_C1_FTL;
	_iC2Name = name IND_C2_FTL;
	_iDslname = name IND_DSL;
	_iD1Name = name IND_D1_FTL;
	_iD2Name = name IND_D2_FTL;
	
	//testing variables
	_bluforSlots = playableSlotsNumber blufor;
	_indforSlots = playableSlotsNumber independent;
	_opforSlots = playableSlotsNumber opfor;
	
	[format ["--------------------------------------------"], "sessionLog"] call A3Log;
	[format ["Leader ORBAT for mission: %1", _title], "sessionLog"] call A3Log;
	
	// Bunch of messy if statements to keep the leadership ORBAT log clean
	// on the server
	if (_bluforSlots > 0) then {
		[format ["-- BLUFOR --"], "sessionLog"] call A3Log;
		if (!isNil "BLU_COY") then {
			[format ["Company Commander: %1", _bCoyName], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_PL") then {
			[format ["First Platoon Leader: %1", _b1PlName], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_ASL") then {
			[format ["Alpha Squad Leader: %1", _bAslName], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_A1_FTL") then {
			[format ["A1 Team Leader: %1", _bA1Name], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_A2_FTL") then {
			[format ["A2 Team Leader: %1", _bA2Name], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_BSL") then {
			[format ["Bravo Squad Leader: %1", _bBslName], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_B1_FTL") then {
			[format ["B1 Team Leader: %1", _bB1Name], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_B2_FTL") then {
			[format ["B2 Team Leader: %1", _bB2Name], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_PL2") then {
			[format ["Second Platoon Leader: %1", _b2PlName], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_CSL") then {
			[format ["Charlie Squad Leader: %1", _bCslName], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_C1_FTL") then {
			[format ["C1 Team Leader: %1", _bC1Name], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_C2_FTL") then {
			[format ["C2 Team Leader: %1", _bC2Name], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_DSL") then {
			[format ["Delta Squad Leader: %1", _bDslName], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_D1_FTL") then {
			[format ["D1 Team Leader: %1", _bD1Name], "sessionLog"] call A3Log;
		};
		if (!isNil "BLU_D2_FTL") then {
			[format ["D2 Team Leader: %1", _bD2Name], "sessionLog"] call A3Log;
		};
	};
	
	if (_opforSlots > 0) then {
		[format ["-- OPFOR --"], "sessionLog"] call A3Log;
		if (!isNil "OPF_COY") then {
			[format ["Company Commander: %1", _oCoyName], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_PL") then {
			[format ["First Platoon Leader: %1", _o1PlName], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_ASL") then {
			[format ["Alpha Squad Leader: %1", _oAslName], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_A1_FTL") then {
			[format ["A1 Team Leader: %1", _oA1Name], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_A2_FTL") then {
			[format ["A2 Team Leader: %1", _oA2Name], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_BSL") then {
			[format ["Bravo Squad Leader: %1", _oBslName], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_B1_FTL") then {
			[format ["B1 Team Leader: %1", _oB1Name], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_B2_FTL") then {
			[format ["B2 Team Leader: %1", _oB2Name], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_PL2") then {
			[format ["Second Platoon Leader: %1", _o2PlName], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_CSL") then {
			[format ["Charlie Squad Leader: %1", _oCslName], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_C1_FTL") then {
			[format ["C1 Team Leader: %1", _oC1Name], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_C2_FTL") then {
			[format ["C2 Team Leader: %1", _oC2Name], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_DSL") then {
			[format ["Delta Squad Leader: %1", _oDslName], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_D1_FTL") then {
			[format ["D1 Team Leader: %1", _oD1Name], "sessionLog"] call A3Log;
		};
		if (!isNil "OPF_D2_FTL") then {
			[format ["D2 Team Leader: %1", _oD2Name], "sessionLog"] call A3Log;
		};
	}; 
	
	if (_indforSlots > 0) then {
		[format ["-- INDFOR --"], "sessionLog"] call A3Log;
		if (!isNil "IND_COY") then {
			[format ["Company Commander: %1", _iCoyName], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_PL") then {
			[format ["First Platoon Leader: %1", _i1PlName], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_ASL") then {
			[format ["Alpha Squad Leader: %1", _iAslName], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_A1_FTL") then {
			[format ["A1 Team Leader: %1", _iA1Name], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_A2_FTL") then {
			[format ["A2 Team Leader: %1", _iA2Name], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_BSL") then {
			[format ["Bravo Squad Leader: %1", _iBslName], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_B1_FTL") then {
			[format ["B1 Team Leader: %1", _iB1Name], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_B2_FTL") then {
			[format ["B2 Team Leader: %1", _iB2Name], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_PL2") then {
			[format ["Second Platoon Leader: %1", _i2PlName], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_CSL") then {
			[format ["Charlie Squad Leader: %1", _iCslName], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_C1_FTL") then {
			[format ["C1 Team Leader: %1", _iC1Name], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_B2_FTL") then {
			[format ["C2 Team Leader: %1", _iC2Name], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_DSL") then {
			[format ["Delta Squad Leader: %1", _iDslName], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_D1_FTL") then {
			[format ["D1 Team Leader: %1", _iD1Name], "sessionLog"] call A3Log;
		};
		if (!isNil "IND_D2_FTL") then {
			[format ["D2 Team Leader: %1", _iD2Name], "sessionLog"] call A3Log;
		};
	};
	[format ["ORBAT Complete"], "sessionLog"] call A3Log;
	["--------------------------------------------", "sessionLog"] call A3Log;
};

diag_log "[CMF]: Server Logging Complete";