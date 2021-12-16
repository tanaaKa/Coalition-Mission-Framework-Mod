///////////////////////////////////////////////////////////////
//	Webhook script
//	By: tanaKa-
//	Webhook for game beginning brief
//
//	TODO:
//		N/A
//
///////////////////////////////////////////////////////////////
if (count allPlayers < 10) exitWith {};
diag_log "[CMF]: Starting Mission Brief Webhook";

if (isDedicated) then {
	// Session - Now briefing notice
	_mapName = getText (configFile >> "CfgWorlds" >> worldName >> "description");
	_author = getMissionConfigValue ["Author",""];
	startingPlayers = str(count (playableUnits select {alive _x}));

	[ 
		"session", 
		"", 
		"", 
		"", 
		false, 
			[ 
				[ 
					format ["Now Briefing: %1",briefingName], 
					format ["Players are now briefing for %1\n\n__Please do not JIP until the mission is live__\n",briefingName], 
					"https://aar.coalitiongroup.net/", 
					"CC5500", 
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
					["By",_author,true],
					["Map",_mapName,true],
					["Current Players",startingPlayers,false]
				] 
			]  
		] 
	] call DiscordEmbedBuilder_fnc_buildSqf;

diag_log "[CMF]: Mission Brief Webhook Complete";