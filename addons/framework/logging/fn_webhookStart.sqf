///////////////////////////////////////////////////////////////
//	Webhook script
//	By: tanaKa-
//	Webhook for game start
//
//	TODO:
//		N/A
//
///////////////////////////////////////////////////////////////
//if (count allPlayers < 10) exitWith {};
if (!isDedicated) exitWith {};
diag_log "[CMF]: Starting Mission Start Webhook";

// Session - Now briefing notice
_mapName = getText (configFile >> "CfgWorlds" >> worldName >> "description");
_author = getMissionConfigValue ["Author",""];

_sides = [WEST,EAST,INDEPENDENT];
playersAlive = [];
{ 
	if (alive _x && side _x IN _sides) then {
		playersAlive pushBack (name _x);
	}; 
} forEach (allPlayers - entities "HeadlessClient_F");

// Session - Now live notice
[ 
	"session", 
	"", 
	"", 
	"", 
	false, 
		[ 
			[ 
				format ["[%2] - %1 is now live",briefingName,getText (missionConfigFile >> "MissionSQM" >> "ScenarioData" >> "Header" >> "gameType")], 
				format ["Players have begun playing %1\n\n__You may now JIP__",briefingName], 
				"https://aar.coalitiongroup.net/", 
				"00FF00", 
				true, 
				"", 
				"", 
			[ 
				"", 
				"", 
				"" 
			], 
			[ 
				"COALITION", 
				"https://coalitiongroup.net/images/logo.png" 
			], 
			[
				["Current Players",str(count (playableUnits select {alive _x})),false],
				["Briefing Length",str(floor(CBA_missionTime / 60)) + " minutes",true],
				["Attendees:", playersAlive joinstring ", ",false]
			] 
		]  
	] 
] call DiscordEmbedBuilder_fnc_buildSqf;
	
// Basic check for spcls so this isn't printing to AAR
if (getText (getMissionConfig "Header" >> "gameType") isEqualTo "CMFSPCL") exitWith {};

// AAR - Leader Orbat
[ 
	"aar", 
	"", 
	"", 
	"", 
	false, 
	[ 
		[ 
			format ["%1 is now live",briefingName], 
			format ["Click the link above to view the visual AAR\n\nThe ORBAT(s) can be found below\n",briefingName], 
			"https://aar.coalitiongroup.net/", 
			"00FF00", 
			true, 
			"", 
			"", 
			[ 
				"", 
				"", 
				"" 
			], 
			[ 
				"COALITION", 
				"https://coalitiongroup.net/images/logo.png" 
			], 
			[	
				["BLU Company Commander",name BLU_COY,false],
				["BLU 1st Platoon Leader",name BLU_PL,false],
				["BLU 2nd Platoon Leader",name BLU_PL2,false],
				["BLU Alpha Squad Leader",name BLU_ASL,false],
				["BLU Alpha Medic",name BLU_ASLM,false],
				["BLU A1",[BLU_A1_FTL] call CMF_fnc_playerGroupNames,false],
				["BLU A2",[BLU_A2_FTL] call CMF_fnc_playerGroupNames,false],
				["BLU Bravo Squad Leader",name BLU_BSL,false],
				["BLU Bravo Medic",name BLU_BSLM,false],
				["BLU B1",[BLU_B1_FTL] call CMF_fnc_playerGroupNames,false],
				["BLU B2",[BLU_B2_FTL] call CMF_fnc_playerGroupNames,false],
				["BLU Charlie Squad Leader",name BLU_CSL,false],
				["BLU Charlie Medic",name BLU_CSLM,false],
				["BLU C1",[BLU_C1_FTL] call CMF_fnc_playerGroupNames,false],
				["BLU C2",[BLU_C2_FTL] call CMF_fnc_playerGroupNames,false],
				["BLU Delta Squad Leader",name BLU_DSL,false],
				["BLU Delta Medic",name BLU_DSLM,false],
				["BLU D1",[BLU_D1_FTL] call CMF_fnc_playerGroupNames,false],
				["BLU D2",[BLU_D2_FTL] call CMF_fnc_playerGroupNames,false],
				["OPF Company Commander",name OPF_COY,false],
				["OPF 1st Platoon Leader",name OPF_PL,false],
				["OPF 2nd Platoon Leader",name OPF_PL2,false],
				["OPF Alpha Squad Leader",name OPF_ASL,false],
				["OPF Alpha Medic",name OPF_ASLM,false],
				["OPF A1",[OPF_A1_FTL] call CMF_fnc_playerGroupNames,false],
				["OPF A2",[OPF_A2_FTL] call CMF_fnc_playerGroupNames,false],
				["OPF Bravo Squad Leader",name OPF_BSL,false],
				["OPF Bravo Medic",name OPF_BSLM,false],
				["OPF B1",[OPF_B1_FTL] call CMF_fnc_playerGroupNames,false],
				["OPF B2",[OPF_B2_FTL] call CMF_fnc_playerGroupNames,false],
				["OPF Charlie Squad Leader",name OPF_CSL,false],
				["OPF Charlie Medic",name OPF_CSLM,false],
				["OPF C1",[OPF_C1_FTL] call CMF_fnc_playerGroupNames,false],
				["OPF C2",[OPF_C2_FTL] call CMF_fnc_playerGroupNames,false],
				["OPF Delta Squad Leader",name OPF_DSL,false],
				["OPF Delta Medic",name OPF_DSLM,false],
				["OPF D1",[OPF_D1_FTL] call CMF_fnc_playerGroupNames,false],
				["OPF D2",[OPF_D2_FTL] call CMF_fnc_playerGroupNames,false],
				["IND Company Commander",name IND_COY,false],
				["IND 1st Platoon Leader",name IND_PL,false],
				["IND 2nd Platoon Leader",name IND_PL2,false],
				["IND Alpha Squad Leader",name IND_ASL,false],
				["IND Alpha Medic",name IND_ASLM,false],
				["IND A1",[IND_A1_FTL] call CMF_fnc_playerGroupNames,false],
				["IND A2",[IND_A2_FTL] call CMF_fnc_playerGroupNames,false],
				["IND Bravo Squad Leader",name IND_BSL,false],
				["IND Bravo Medic",name IND_BSLM,false],
				["IND B1",[IND_B1_FTL] call CMF_fnc_playerGroupNames,false],
				["IND B2",[IND_B2_FTL] call CMF_fnc_playerGroupNames,false],
				["IND Charlie Squad Leader",name IND_CSL,false],
				["IND Charlie Medic",name IND_CSLM,false],
				["IND C1",[IND_C1_FTL] call CMF_fnc_playerGroupNames,false],
				["IND C2",[IND_C2_FTL] call CMF_fnc_playerGroupNames,false],
				["IND Delta Squad Leader",name IND_DSL,false],
				["IND Delta Medic",name IND_DSLM,false],
				["IND D1",[IND_D1_FTL] call CMF_fnc_playerGroupNames,false],
				["IND D2",[IND_D2_FTL] call CMF_fnc_playerGroupNames,false]  
			] 
		]  
	] 
] call DiscordEmbedBuilder_fnc_buildSqf;

remoteExecCall ["CMF_fnc_rpStart",-2];

diag_log "[CMF]: Mission Start Webhook Complete";