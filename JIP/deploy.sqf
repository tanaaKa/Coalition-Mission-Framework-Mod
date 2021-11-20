/* 	
	Gives JIPs the possibility to deploy to teams
	By: tanaKa-
	
	TODO:
		
*/

//Set up variables
_unit = _this select 0;

//Open the map on action click
deployed = false;
openMap [true, false];

//Show tutorial notification and await deploy
titleText["","BLACK IN",3];
systemChat "[CMF JIP] Alt-left click to teleport to desired team";

onMapSingleClick "if (_alt) then {player setPosATL _pos; openMap false; deployed = true;};";

//wait until player deploys
waitUntil {deployed};
_newG = player getVariable "f_var_JIP_grp";
["potato_adminMsg", [format ["%1 has JIP deployed to %2", (name player),_newG]]] call CBA_fnc_globalEvent;
onMapSingleClick '';

//re-enable stamina for JIP
_unit enableFatigue true;

//remove heal action jic
// if (blufor_ready || indfor_ready || opfor_ready) then {
	// _unit removeAction sshealaction;
// };

//remove action
_unit removeAction F3_JIP_reinforcementOptionsAction;

/* //Automatically join group deployed to
_nearestPlayer = _unit nearEntities ["Man",100];

if ((count _nearestPlayer) == 1) then {

	//no players were found, checking for vehicles instead
	//the following code keys off the driver
	//it's assumed that if the vehicle doesn't have a driver,
	//someone will be outside the vic and this code will never run
	
	_nearestVehicles = player nearEntities [["Car","Truck","Tank"],30];
	_nearestTeams = [];
	{
		_driver = driver _x;
		_nearestTeams pushback _driver;
	} foreach _nearestVehicles;
	
	//we're just going to pick the first team in the array for now
	//still getting the data from all vehilcles for future improvements i.e. choosing the team when multiple are found
	_driver = _nearestTeams select 0;
	_nearestGroup = group (_nearestTeams select 0);
	_leader = leader (_nearestTeams select 0);
	_leaderName = name _leader;
	_leaderV = vehicle _driver;
	sleep 1;

	if (_nearestGroup != group _unit) then {
		//Join group silently if successful
		[_unit] joinSilent (_nearestGroup);
		//put the player in the teams vehicle
		[_unit, _leaderV] remoteExec ["moveInAny", _unit];
		//potato admin log
		["potato_adminMsg", [format ["%1 JIP deployed to fireteam %2.", (name _unit), _nearestGroup]]] call CBA_fnc_globalEvent;
		systemChat format ["You've joined %1. Get your orders from the leader: %2.", _nearestGroup, _leaderName];
		hint format ["You've joined %1. Get your orders from the leader: %2.", _nearestGroup, _leaderName];
	} else {
		systemChat "Could not find a new group to join! Message admin for teleport if needed.";
	};
	
} else {
	_nearestGroup = group (_nearestPlayer select 0);
	_leader = leader _nearestGroup;
	_leaderName = name _leader;
	sleep 1;

	if (_nearestGroup != group _unit) then {
		//Join group silently if successful
		[_unit] joinSilent (_nearestGroup);
		//potato admin log
		["potato_adminMsg", [format ["%1 JIP deployed to fireteam %2.", (name _unit), _nearestGroup]]] call CBA_fnc_globalEvent;
		systemChat format ["You've joined %1. Get your orders from the leader: %2.", _nearestGroup, _leaderName];
		hint format ["You've joined %1. Get your orders from the leader: %2.", _nearestGroup, _leaderName];
	} else {
		systemChat "Could not find a new group to join! Message admin for teleport if needed.";
	};

	//log to server
	if (isDedicated) then {
		[format ["[COAL JIP] %1 deployed to fireteam: %2", (name _unit), _nearestGroup], "sessionLog"] call A3Log;
	};
}; */
