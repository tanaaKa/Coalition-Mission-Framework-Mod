////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//		Jester's Ready-Up
//
//			#include this script in init.sqf
//			
//			This has local operations and server/local functions for handling ready up
//			Pairs with JST_readyUp.sqf that should be execVM'd in initServer.sqf
//
//			Todo: reorder and categorize for readibility
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
diag_log "[CMF]: Starting Readyup Library";

////////////////////////////////////////////////////////////////////////////////////////////////////////
//		Function library
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Add safe start heal option ||| LOCAL
JST_fnc_addSafeStartHeal =
{
	JST_SSHeal = player addaction ["<t color='#0B6623'>Treat Yo Self (heal)</t>","\x\cmf\addons\framework\ssheal\heal.sqf",[],-1,true,false,"","_target == player"];
};

// Add admin force start action ||| LOCAL
JST_fnc_addAdminAction =
{
	if (isNil "JST_adminAction") then
	{
		JST_adminAction =
		[
			player,
			"Force All Ready",
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",
			"true",
			"true",
			{},
			{},
			{
				// tell server to start countdown with forced flag true
				private _forced = true;
				[_forced] remoteExec ["JST_fnc_ReadyUp", 2];
				JST_adminAction = nil;
			},
			{},
			[],
			3,
			10,
			true,
			false
		] call BIS_fnc_holdActionAdd;
	};
};

// Remove admin action ||| LOCAL
JST_fnc_removeAdminAction =
{
	if (!isNil "JST_adminAction") then
	{
		player removeAction JST_adminAction;
		JST_adminAction = nil;
	};
};

// Build admin list and send actions to newly found admins ||| SERVER
JST_fnc_handleCurrentAdmins =
{
	{
		private _ID = owner _x;
		if ((admin _ID isEqualTo 2) or (admin _ID isEqualTo 1)) then
		{
			private _count = count JST_admins;
			JST_admins pushBackUnique _x;
			private _newCount = count JST_admins;
			if (_newCount > _count) then
			{
				[] remoteExec ["JST_fnc_addAdminAction", _x];
			};
		};
	} forEach allPlayers;
	JST_admins
};

// Find current leader on each side, put him in array of leaders, send him needed action ||| SERVER
JST_fnc_handleCurrentLeaders =
{
	JST_leaders = [];
	{
		private _leader = [_x] call JST_fnc_findLeader;
		missionNameSpace setVariable [("JST_" + _x + "leader"), _leader];
		if !(isNull _leader) then
		{
			JST_leaders pushBackUnique _leader;
			if (missionNameSpace getVariable (_x + "for_ready")) then
			{
				[_x] remoteExec ["JST_fnc_addUnReadyAction", _leader];
			}
			else
			{
				[_x] remoteExec ["JST_fnc_addReadyAction", _leader];
			};
		}
		else
		{
			missionNameSpace setVariable [(_x + "for_ready"), true];
		};
		
		[_leader] remoteExec ["CMF_fnc_addSetGearAction", _leader];
	} forEach ["blu", "ind", "op"];
	JST_leaders
};

// Find and return correct leader on one side ||| SERVER
JST_fnc_findLeader =
{
	private _side = _this select 0;
    // everywhere else we can just use 2 letters for op, but here we need to expand it for their object name
    // which has a non-unique letter for the third letter (OPf_pl vs. BLU_pl / OPfor_ready vs. BLUfor_ready)
    if (_side isEqualTo "op") then {_side = "opf"};
    private _COY = missionNameSpace getVariable [(_side + "_COY"), objNull];
    private _PL = missionNameSpace getVariable [(_side + "_PL"), objNull];
    private _PL2 = missionNameSpace getVariable [(_side + "_PL2"), objNull];
    private _ASL = missionNameSpace getVariable [(_side + "_ASL"), objNull];
    private _A1 = missionNameSpace getVariable [(_side + "_A1_FTL"), objNull];
    private _leader = nil;
    switch (true) do
    {
        case (isPlayer _COY): {_leader = _COY};
        case (isPlayer _PL): {_leader = _PL};
        case (isPlayer _PL2): {_leader = _PL2};
        case (isPlayer _ASL): {_leader = _ASL};
        case (isPlayer _A1): {_leader = _A1};
        default {_leader = objNull};
    };
    _leader
};

// Set ready ||| LOCAL
JST_fnc_setReadyPerSide =
{
	params ["_side"];
	if (_side isEqualTo "blu") then {blufor_ready = true; publicVariableServer "blufor_ready"};
	if (_side isEqualTo "ind") then {indfor_ready = true; publicVariableServer "indfor_ready"};
	if (_side isEqualTo "op") then {opfor_ready = true; publicVariableServer "opfor_ready"};
};

// Set unready ||| LOCAL
JST_fnc_setUnReadyPerSide =
{
	params ["_side"];
	if (_side isEqualTo "blu") then {blufor_ready = false; publicVariableServer "blufor_ready"};
	if (_side isEqualTo "ind") then {indfor_ready = false; publicVariableServer "indfor_ready"};
	if (_side isEqualTo "op") then {opfor_ready = false; publicVariableServer "opfor_ready"};
};

// Add ready action ||| LOCAL
JST_fnc_addReadyAction =
{
	params ["_side"];
	if (isNil "JST_readyAction") then
	{
		JST_readyAction = 
		[
			player,
			"<t color='#ff0000'>Ready Up</t>",
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",
			"true",
			"true",
			{},
			{},
			{
				[_this select 3 select 0] call JST_fnc_setReadyPerSide;
				JST_readyAction = nil;
			},
			{},
			[_side],
			2,
			0,
			true,
			true
		] call BIS_fnc_holdActionAdd;
	};
};
	
// Add unready action ||| LOCAL
JST_fnc_addUnReadyAction =
{
	params ["_side"];
	if (isNil "JST_unReadyAction") then
	{
		JST_unReadyAction = 
		[
			player,
			"<t color='#ff0000'>Unready</t>",
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",
			"true",
			"true",
			{},
			{},
			{
				[_this select 3 select 0] call JST_fnc_setUnReadyPerSide;
				JST_unReadyAction = nil;
			},
			{},
			[_side],
			2,
			0,
			true,
			true
		] call BIS_fnc_holdActionAdd;
	};
};

// Remove leader actions ||| LOCAL
JST_fnc_removeLeaderActions =
{
	if (!isNil "JST_readyAction") then {player removeAction JST_readyAction; JST_readyAction = nil;};
	if (!isNil "JST_unReadyAction") then {player removeAction JST_unReadyAction; JST_unReadyAction = nil};
	[player,1,["ACE_SelfActions","gearSelect"]] call ace_interact_menu_fnc_removeActionFromObject;
};

// Reset players when safe start turns off ||| LOCAL
JST_fnc_playersGoHot =
{
	[] spawn JST_fnc_removeAdminAction;
	[] spawn JST_fnc_removeLeaderActions;
	player enableStamina true;
	if !(isNil "JST_SSHeal") then 
	{
		player removeAction JST_SSHeal;
	};
	/* if (useSpawners) then {
		{
			private _factory = missionNameSpace getVariable [_x, objNull];
			if (!isNull _factory) then
			{
				removeAllActions _factory
			};
		} forEach ["vehfac1", "vehfac2", "vehfac3", "airfac1", "airfac2", "airfac3"];
	}; */
	// Reset markers on ready up if enabled
	if (potato_markers_groupAndUnitEnabled) then {
		["potato_adminMenu_resetMarkers", [player], player] call CBA_fnc_targetEvent;
	};
};

// Poll for admins at intervals, in case changes hands ||| SERVER
JST_pollForAdmins =
{
	JST_admins = [];
	while {true} do
	{
		[] spawn JST_fnc_handleCurrentAdmins;
		sleep 10;
	};
};

// Wait for all sides ready then do gamestart with forced flag false ||| SERVER
JST_fnc_waitForLeadersReady =
{
	waitUntil {blufor_ready and indfor_ready and opfor_ready};
	private _forced = false;
	[_forced] spawn JST_fnc_ReadyUp;
};

// Removes arsenal from ace menu ||| LOCAL
tnk_removeArsenal =
{
	[player,1,["ACE_SelfActions","ACE_Equipment","miniarsenal"]] call ace_interact_menu_fnc_removeActionFromObject;
	findDisplay 1127001 closeDisplay 2; // close arsenal if they're in it
};

// Function to countdown and start game ||| SERVER
JST_fnc_ReadyUp =
{
	params ["_forced"];
	terminate JST_pollForAdminsHandle;
	gameLive = true; publicVariable "gameLive";
	if (_forced) then
	{
		terminate JST_waitForLeadersReadyHandle;
		sleep 2;
		{
			[] remoteExec ["JST_fnc_removeLeaderActions", _x];
		} forEach JST_leaders;
		blufor_ready = true; indfor_ready = true; opfor_ready = true;
	}
	else
	{
		sleep 2;
		{
			[] remoteExec ["JST_fnc_removeAdminAction", _x];
		} forEach JST_admins;
	};
	// Countdown
	"MISSION IS LIVE IN 30 SECONDS" remoteExec ["systemChat"];
	sleep 15;
	// If unforced check if still ready, if not ready then exit and go back to waiting
	if ((!blufor_ready or !indfor_ready or !opfor_ready) and !_forced) exitWith
	{
		JST_waitForLeadersReadyHandle = [] spawn JST_fnc_waitForLeadersReady;
		JST_pollForAdminsHandle = [] spawn JST_pollForAdmins;
	};
	"MISSION IS LIVE IN 15 SECONDS" remoteExec ["systemChat"];
	sleep 10;
	if ((!blufor_ready or !indfor_ready or !opfor_ready) and !_forced) exitWith
	{
		JST_waitForLeadersReadyHandle = [] spawn JST_fnc_waitForLeadersReady;
		JST_pollForAdminsHandle = [] spawn JST_pollForAdmins;
	};
	"MISSION IS LIVE IN 5 SECONDS" remoteExec ["systemChat"];
	sleep 4;
	if ((!blufor_ready or !indfor_ready or !opfor_ready) and !_forced) exitWith
	{
		JST_waitForLeadersReadyHandle = [] spawn JST_fnc_waitForLeadersReady;
		JST_pollForAdminsHandle = [] spawn JST_pollForAdmins;
	};
	"MISSION IS LIVE" remoteExec ["systemChat"];
	tnk_ssTime = CBA_missionTime; publicVariable "tnk_ssTime";
	remoteExec ["CMF_fnc_showTimeOnMap", 0, true]; // start game timer
	// Remove icons
	[] execVM "\x\cmf\addons\framework\readyup\removeIcons.sqf";
	// Handle players actions/stamina/etc. going live
	remoteExec ["JST_fnc_playersGoHot", -2, true];
	// Call the starting webhook
	call CMF_fnc_webhookStart;
	// Remove safe start
	[false] call potato_safeStart_fnc_toggleSafeStart;
	// Remove arsenal
	remoteExec ["tnk_removeArsenal", -2, true];
	uisleep 5;
	// Do title
	_title = getText (missionConfigFile >> "MissionSQM" >> "Mission" >> "Intel" >> "briefingName");
	_author = getMissionConfigValue ["Author",0];
	_cmfvers = getText (missionConfigFile >> "cmfVers");
	[
		[
			[_title, "<t align = 'center' shadow = '1' size = '0.9'>%1</t><br/>",5],
			["By: " + _author,"<t align = 'center' shadow = '1' size = '0.6'>%1</t><br/>",5],
			[_cmfvers,"<t align = 'center' shadow = '1' size = '0.4'>%1</t><br/>",5],
			[format ["%3/%2/%1 %4:%5",date select 0, date select 1, date select 2,date select 3, date select 4],"<t align = 'center' shadow = '1' size = '0.4'>%1</t>",10]
		] , 1, 1.05
	] remoteExec ["BIS_fnc_typeText", 0];
	// Remove event handlers
	removeMissionEventHandler ["PlayerConnected", JST_safeStartHealHandler];
	removeMissionEventHandler ["HandleDisconnect", tnk_SSDisconnect];
	// Log
	if (isDedicated) then
	{
		[format ["Now beginning mission: %1", _title], "sessionLog"] call A3Log;
	};
};

diag_log "[CMF]: Readyup Library Complete";