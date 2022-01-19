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
if (isNull BLU_PL || isNull IND_PL || isNull OPF_PL) exitWith {};

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
			format ["Click the link above to view the visual AAR\n\nThe Leader ORBAT(s) can be found below\n",briefingName], 
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
				["BLU Bravo Squad Leader",name BLU_BSL,false],
				["BLU Charlie Squad Leader",name BLU_CSL,false],
				["BLU Delta Squad Leader",name BLU_DSL,false],
				["OPF Company Commander",name OPF_COY,false],
				["OPF 1st Platoon Leader",name OPF_PL,false],
				["OPF 2nd Platoon Leader",name OPF_PL2,false],
				["OPF Alpha Squad Leader",name OPF_ASL,false],
				["OPF Bravo Squad Leader",name OPF_BSL,false],
				["OPF Charlie Squad Leader",name OPF_CSL,false],
				["OPF Delta Squad Leader",name OPF_DSL,false],
				["IND Company Commander",name IND_COY,false],
				["IND 1st Platoon Leader",name IND_PL,false],
				["IND 2nd Platoon Leader",name IND_PL2,false],
				["IND Alpha Squad Leader",name IND_ASL,false],
				["IND Bravo Squad Leader",name IND_BSL,false],
				["IND Charlie Squad Leader",name IND_CSL,false],
				["IND Delta Squad Leader",name IND_DSL,false]   
			] 
		]  
	] 
] call DiscordEmbedBuilder_fnc_buildSqf;

remoteExecCall ["CMF_fnc_rpStart",-2];

diag_log "[CMF]: Mission Start Webhook Complete";