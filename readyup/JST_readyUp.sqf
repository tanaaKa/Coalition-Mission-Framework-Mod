////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//		Jester's Ready-Up
//
//			This file controls the ready-up state of mission
//			[] execVM in initServer.sqf
//
//			The priority order for the ready up action is PL, ASL, then A1 FTL
//			It gives the action to the highest ranked person present and rolls down if people d/c
//
//			Admins have the ability force start (with countdown, but no unready option)
//
//			Adding/removing actions is controlled by server so everything is in sync with mission state
//
//			Functions referenced that aren't here are in JST_readyUpFunctions.sqf #include in init.sqf
//
//			Todo:
//
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Initial state
blufor_ready = false;
indfor_ready = false;
opfor_ready = false;
gameLive = false; publicVariable "gameLive";
JST_admins = [];
JST_leaders = [];

// On mission load build first lists and send actions
JST_leaders = [] call JST_fnc_handleCurrentLeaders;
JST_admins = [] call JST_fnc_handleCurrentAdmins;

// Then start wait for ready ups and keep list of current admins
JST_waitForLeadersReadyHandle = [] spawn JST_fnc_waitForLeadersReady;
JST_pollForAdminsHandle = [] spawn JST_pollForAdmins;

// Add leader arrows
[] execVM "cmf\readyup\addIcons.sqf";

// Add player connected handler to give safe start heal only while unready
JST_safeStartHealHandler = addMissionEventHandler ["PlayerConnected",
{
	if !(blufor_ready || indfor_ready || opfor_ready) then
	{
		remoteExec ["JST_addSafeStartHeal", _owner];
	};
}];

// EH to delete dead bodies during safestart
tnk_SSDisconnect = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	
	deleteVehicle _unit;
	false;
}];

// Add public variable event handlers on server to monitor players' ready status
if (JST_bluLeader in JST_leaders) then
{
	"blufor_ready" addPublicVariableEventHandler
	{ 
		if (blufor_ready) then
		{
			"BLU IS READY" remoteExec ["systemChat"];
			["blu"] remoteExec ["JST_fnc_addUnReadyAction", JST_bluLeader];
		}
		else
		{
			"BLU IS UNREADY" remoteExec ["systemChat"];
			["blu"] remoteExec ["JST_fnc_addReadyAction", JST_bluLeader];
		};
	};
};
if (JST_indLeader in JST_leaders) then
{
	"indfor_ready" addPublicVariableEventHandler
	{ 
		if (indfor_ready) then
		{
			"IND IS READY" remoteExec ["systemChat"];
			["ind"] remoteExec ["JST_fnc_addUnReadyAction", JST_indLeader];
		}
		else
		{
			"IND IS UNREADY" remoteExec ["systemChat"];
			["ind"] remoteExec ["JST_fnc_addReadyAction", JST_indLeader];
		};
	};
};
if (JST_opLeader in JST_leaders) then
{
	"opfor_ready" addPublicVariableEventHandler
	{
		if (opfor_ready) then
		{
			"OPF IS READY" remoteExec ["systemChat"];
			["op"] remoteExec ["JST_fnc_addUnReadyAction", JST_opLeader];
		}
		else
		{
			"OPF IS UNREADY" remoteExec ["systemChat"];
			["op"] remoteExec ["JST_fnc_addReadyAction", JST_opLeader];
		};
	};
};

// Add event handler to re-do the leadership and admin arrays if one disconnects
addMissionEventHandler ["HandleDisconnect",
{
	params ["_unit"];
	if (_unit in JST_leaders) then
	{
		sleep 2;
		private _index = JST_leaders find _unit;
		JST_leaders deleteAt _index;
		sleep 2;
		[] call JST_fnc_handleCurrentLeaders;
	};
	false
}];