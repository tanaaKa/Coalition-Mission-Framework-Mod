/*

	Filename:  fn_handleMissionEnd.sqf 
	Locality: Runs on server
	Description: Export player data to server database.
	
	Params:
	N/A

	Usage:
	[] Spawn CMF_fnc_handleMissionEnd;

*/

if (
	!isServer 
	|| (getText (missionConfigFile >> "cmfVers") isEqualTo "") 
	|| (getText (getMissionConfig "Header" >> "gameType") isEqualTo "CMFSPCL")
) exitWith {};

if !(dbConnected) exitWith {
	diag_log "[CMF] STATS - fn_handleMissionEnd - Skiiping stat reporting due to dbConnected = false";
	"[CMF] Stat recording skipped since the DB is not connected" remoteExec ["systemChat", 0];
};

diag_log "[CMF] STATS - fn_handleMissionEnd - Beginning stat tracking reporting due to mission end";

// Get still alive player data
[] remoteExec ["CMF_fnc_handleMissionEndLocal", 0];

numberOfPlayersInDataArray = count playersDataArray;
playersComplete = 0;

// Announce to players stats are updating
"[CMF] Stats will begin updating in 5 seconds!" remoteExec ["systemChat", 0];

// Sleep to allow CMF_fnc_handleMissionEndLocal to propagate and get all users info into the main array
uiSleep 5;

// Update database values
{	
	[_x, _y] Spawn {
		params ["_playerUID", "_statArray"];

		// Assign variables from hashmap
		_roleStatus				= _statArray select 0;  // Str | String of type of role selected
		_missionsAttended 		= _statArray select 1;  // Int | Will always be 1
		_timeAlive 				= _statArray select 2;  // Int | Time in seconds player was not a spectator
		_tvtKills				= _statArray select 3;  // Int | PvP Kills
		_tvtDeaths 				= _statArray select 4;  // Int | PvP Deaths
		_coopKills				= _statArray select 5;  // Int | PvAI Kills
		_coopDeaths				= _statArray select 6;  // Int | PvAI Deaths
		_friendlyFireEvents		= _statArray select 7;  // Int | Dumbass friendly fired one or more friendlies, this is how many they killed	
		_civsKilled				= _statArray select 8;  // Int | This is how many non-potato based AI a player has killed
		_shotsFired				= _statArray select 9;  // Int | amount of shots fired by player
		_playerLeftMidMission	= _statArray select 10; // Int | 1 == true | 0 == false	

		// Log data
		diag_log format ["[CMF] STATS - fn_handleMissionEnd - Updating stats for steamid: %1",_playerUID];
		
		// Update specific sql entries
		switch _roleStatus do
		{
			case "inf_pl_roles":{
				"extDB3" callExtension format ["0:SQL:UPDATE a3rolestats SET inf_pl_roles = inf_pl_roles + 1 WHERE steamid = %1",_playerUID];
			};
			case "inf_sl_roles":{
				"extDB3" callExtension format ["0:SQL:UPDATE a3rolestats SET inf_sl_roles = inf_sl_roles + 1 WHERE steamid = %1",_playerUID];
			};
			case "inf_ftl_roles":{
				"extDB3" callExtension format ["0:SQL:UPDATE a3rolestats SET inf_ftl_roles = inf_ftl_roles + 1 WHERE steamid = %1",_playerUID];
			};
			case "inf_gi_roles":{
				"extDB3" callExtension format ["0:SQL:UPDATE a3rolestats SET inf_gi_roles = inf_gi_roles + 1 WHERE steamid = %1",_playerUID];
			};
			case "inf_specialty_roles":{
				"extDB3" callExtension format ["0:SQL:UPDATE a3rolestats SET inf_specialty_roles = inf_specialty_roles + 1 WHERE steamid = %1",_playerUID];
			};
			case "inf_medical_roles":{
				"extDB3" callExtension format ["0:SQL:UPDATE a3rolestats SET inf_medical_roles = inf_medical_roles + 1 WHERE steamid = %1",_playerUID]; 
			};
			case "pilot_roles":{
				"extDB3" callExtension format ["0:SQL:UPDATE a3rolestats SET pilot_roles = pilot_roles + 1 WHERE steamid = %1",_playerUID]; 
			};
			case "tanker_roles":{
				"extDB3" callExtension format ["0:SQL:UPDATE a3rolestats SET tanker_roles = tanker_roles + 1 WHERE steamid = %1",_playerUID]; 
			};
		}; 

		uiSleep 0.05;

		// Add mission attended
		"extDB3" callExtension format ["0:SQL:UPDATE a3stats SET missions_attended = missions_attended + 1 WHERE steamid = %1",_playerUID]; uiSleep 0.05;

		// Update total time alive
		if (_timeAlive > 0) then {
			"extDB3" callExtension format ["0:SQL:UPDATE a3stats SET time_alive = time_alive + %1 WHERE steamid = %2",_timeAlive,_playerUID]; uiSleep 0.05;
			diag_log format ["[CMF] STATS - fn_handleMissionEnd - Finished updating shotsFired. Total seconds: %1",_timeAlive];
		};
		
		// Update shot count
		if (_shotsFired > 0) then {
			"extDB3" callExtension format ["0:SQL:UPDATE a3stats SET shots_fired = shots_fired + %1 WHERE steamid = %2",_shotsFired,_playerUID]; uiSleep 0.05;
			diag_log format ["[CMF] STATS - fn_handleMissionEnd - Finished updating shotsFired. Count: %1",_shotsFired];
		};
		
		// Update stats based on game mode, if any
		if (_tvtKills > 0 || _tvtDeaths > 0) then {
			"extDB3" callExtension format ["0:SQL:UPDATE a3stats SET tvt_kills = tvt_kills + %1 WHERE steamid = %2",_tvtKills,_playerUID]; uiSleep 0.05;
			"extDB3" callExtension format ["0:SQL:UPDATE a3stats SET tvt_deaths = tvt_deaths + %1 WHERE steamid = %2",_tvtDeaths,_playerUID]; uiSleep 0.05;
			diag_log format ["[CMF] STATS - fn_handleMissionEnd - Finished updating TVT stats. Total kills: %1 Total deaths: %2",_tvtKills,_tvtDeaths];
		};
		if (_coopKills > 0 || _coopDeaths > 0) then {
			"extDB3" callExtension format ["0:SQL:UPDATE a3stats SET coop_kills = coop_kills + %1 WHERE steamid = %2",_coopKills,_playerUID]; uiSleep 0.05;
			"extDB3" callExtension format ["0:SQL:UPDATE a3stats SET coop_deaths = coop_deaths + %1 WHERE steamid = %2",_coopDeaths,_playerUID]; uiSleep 0.05;
			diag_log format ["[CMF] STATS - fn_handleMissionEnd - Finished updating COOP stats. Total kills: %1 Total deaths: %2",_coopKills,_coopDeaths];
		};

		// Update friendly fires, if any
		if (_friendlyFireEvents > 0) then {
			"extDB3" callExtension format ["0:SQL:UPDATE a3stats SET ff_events = ff_events + %1 WHERE steamid = %2",_friendlyFireEvents,_playerUID]; uiSleep 0.05;
			diag_log format ["[CMF] STATS - fn_handleMissionEnd - Finished updating friendly fire events. Count: %1",_friendlyFireEvents];
		};

		// Update civs killed, if any
		if (_civsKilled > 0) then {
			"extDB3" callExtension format ["0:SQL:UPDATE a3stats SET civs_killed = civs_killed + %1 WHERE steamid = %2",_civsKilled,_playerUID]; uiSleep 0.05;
			diag_log format ["[CMF] STATS - fn_handleMissionEnd - Finished updating civ kill events. Count: %1",_civsKilled];
		};

		// Update leave status, if left mission
		if (_playerLeftMidMission isEqualTo 1) then {
			"extDB3" callExtension format ["0:SQL:UPDATE a3stats SET leaves = leaves + %1 WHERE steamid = %2",_playerLeftMidMission,_playerUID]; uiSleep 0.05;
			diag_log format ["[CMF] STATS - fn_handleMissionEnd - Marked player as a leaver",_playerLeftMidMission];
		};

		diag_log format ["[CMF] STATS - fn_handleMissionEnd - Finished updating stats for steamid: %1",_playerUID];

		playersComplete = playersComplete + 1;

		[format ["[CMF] Player Stats Updated : %1/%2", playersComplete, numberOfPlayersInDataArray]] remoteExec ["systemChat", 0];

	};
} forEach playersDataArray;

waitUntil {playersComplete isEqualTo numberOfPlayersInDataArray};

"[CMF] Stats finished updating!" remoteExec ["systemChat", 0];