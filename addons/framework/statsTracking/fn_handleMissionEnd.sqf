/*

	Filename:  fn_handleMissionEnd.sqf 
	Locality: Runs on server
	Description: Export Still alive player data to main array then export player data to server database.
	
	Params:
	N/A

*/

if (!isServer || (getText (missionConfigFile >> "cmfVers") isEqualTo "") || (getText (getMissionConfig "Header" >> "gameType") isEqualTo "CMFSPCL")) exitWith {};

{
	if (typeOf _x isEqualTo "potato_spectate_spectator" || typeOf _x isEqualTo "potato_spectate_playableSpectator" || typeOf _x isEqualTo "VirtualCurator_F") exitWith {};

	if (!isNil "Shots_Fired") then {
		[Shots_Fired, 9, _Player_UID] remoteExec ["CMF_fnc_updateStatArray", 2];
	};

	_Player_Time_Alive = (CBA_missionTime - tnk_ssTime);
	[_Player_Time_Alive, 2, (getPlayerUID _x)] remoteExec ["CMF_fnc_updateStatArray", 2];
} forEach allPlayers;

{	
	
	_Player_UID                  = _x;// Str | Player Steam ID
	_Role_Status                 = _y select 0;// Str | String of type of role selected
	_Missions_Attended           = _y select 1;// Int | Will always be 1
	_Time_Alive                  = _y select 2;// Int | Time in seconds players was not a spectator
	_Tvt_Kills                   = _y select 3;// Int | PvP Kills
	_Tvt_Deaths                  = _y select 4;// Int | PvP Deaths
	_Coop_Kills                  = _y select 5;// Int | PvAI Kills
	_Coop_Deaths                 = _y select 6;// Int | PvAI Deaths
	_FF_Events                   = _y select 7;// Int | Dumbass friendly fired one or more friendlies, this is how many they killed	
	_Civ_Killed                  = _y select 8;// Int | This is how many non-potato based AI a player has killed
	_Shots_Fired                 = _y select 9;// Int | amount of shots fired by player
	_Player_Left_Mid_Mission     = _y select 10;// Int | 1 == true | 0 == false	

	//----------------------- DATABASE CODE HERE -------------------------\\

	
	switch _Role_Status do
	{
		case "inf_pl_roles":{
			//DATABASE Code
		};
		case "inf_sl_roles":{
			//DATABASE Code
		};
		case "inf_ftl_roles":{
			//DATABASE Code
		};
		case "inf_gi_roles":{
			//DATABASE Code
		};
		case "inf_specialty_roles":{
			//DATABASE Code
		};
		case "inf_medical_roles":{
			//DATABASE Code
		};
		case "pilot_roles":{
			//DATABASE Code
		};
		case "tanker_roles":{
			//DATABASE Code
		};
	};

	//-\\

} forEach Players_Data_Array;