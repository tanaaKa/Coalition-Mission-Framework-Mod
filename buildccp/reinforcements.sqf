/* 	
	Allows medics to request reinforcements to their CCPs
	By: tanaKa
*/

params["_site"];
private["_grid","_name"];

_grid = mapGridPosition _site; //define grid location of CCP for hint
_name = name player; //define name of player for hint

_hintString = format ["%1 is requesting reinforcements at the GR#%2 CCP!",_name,_grid]; //define global hint
_hintString remoteExec ["hint", 0];

_null = [_site] spawn {
	params["_site"];
	
	sleep 10; // Wait ten seconds before adding action back.
	
	[  _site,  
	"Call Reinforcements Again",  // title
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  // icon
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  // icon while in-progress
	"_this distance _target < 8",  // distance to initiate
	"_caller distance _target < 12",// distance to hold
	{},  
	{},  
	{[_target] execVM "scripts\buildccp\reinforcements.sqf";},  // code to run on completion. recursive
	{},  
	[],  
	2,  // duration
	0,  
	true,  // disappears on completion
	false  
	] remoteExecCall ["BIS_fnc_holdActionAdd",0]; // syncs across clients
};
