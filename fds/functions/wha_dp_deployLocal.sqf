//====================================================================================
//
//	wha_dp_deployLocal.sqf - 
//
//	Opens map interface and allows player unit to deploy group.
//
//	call wha_dp_fnc_deployLocal;
//
//	Contact: Whale #5963
//
//====================================================================================

//	Parameters
//		- unit = unit who will be deploying their group
//params["_unit"];

// Show notification to unit
hint format["%1","DEPLOY:\nClick on the map to deploy group.\nClose the map to cancel."];// call ace_common_fnc_displayTextStructured;

// Wait for map click unless map closes
// Establish code that will be executed upon click
_onMapClick =
{
	[_pos, player] call wha_dp_fnc_teleportGroup;
	// Remove click EH
	["wha_dp_eh_mapclick", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	// Close map
	openMap false;
	WHA_DP_ISDEPLOYED = true; // flag to remove deploy action
};
// Add it to click event
["wha_dp_eh_mapclick", "onMapSingleClick", _onMapClick] call BIS_fnc_addStackedEventHandler;

// Soft open map 
openMap true;

// If player closes map prematurely, cancel deploy
// Spawn environment to wait with . . .
_null = [] spawn
{
	// Wait for map to be closed . . .
	waitUntil{sleep 0.05; (!visibleMap)};
	
	// Remove click EH
	["wha_dp_eh_mapclick", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};