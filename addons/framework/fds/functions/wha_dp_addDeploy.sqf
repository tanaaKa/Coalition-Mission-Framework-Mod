//====================================================================================
//
//	wha_dp_addDeploy.sqf - 
//	
//	Attempts to add deploy option to unit.
//	Will ensure code is run on local machine of unit.
//
//	call wha_ep_fnc_insert;
//
//	Contact: Whale #5963
//
//====================================================================================

//	Parameters
//		- unit = unit who will get deploy action
params["_unit"];

//	Exits if deploy action already present.
if (_unit getVariable ['WHA_DP_HASDEPLOY', false]) exitWith {};

// If deploy action not present, ensures code is running local to unit . . .
[[_unit],
{
	// Import unit into new function space.
	params["_unit"];

	// Add action to unit.
	// TODO - different action if not deploying as group
	// ACE mode - add self-interact action
	if (isClass (configFile >> "CfgPatches" >> "ace_common")) then
	{
		// If action doesn't exist yet, create it.
		if (isNil "WHA_DP_ACT_DEPLOY") then
		{
			//	Action definition for deploy function.
			WHA_DP_ACT_DEPLOY = 
			[
				"deploy", // Variable name.
				"Deploy", // Title to be displayed.
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa", // Icon in menus.
				// Code run upon use
				{
					// Establish variable to see if unit has deployed.
					WHA_DP_ISDEPLOYED = false;
					
					// Bring up map to move group / unit.
					[player] call wha_dp_fnc_deployLocal;
					
					// TODO more elegant solution
					// Wait for unit to close map, see if unit has deployed, if so, remove action.
					// TODO just move this to deploylocal, right?
					_null = [] spawn
					{
						waitUntil{sleep 0.2; (!visibleMap)};
						if WHA_DP_ISDEPLOYED then
						{
							[player, 1,['ACE_SelfActions','deploy']] call ace_interact_menu_fnc_removeActionFromObject;
							player setVariable ['WHA_DP_HASDEPLOY',false,true];
						};
					};
				},
				{true}	// Condition required to be useable.
			] call ace_interact_menu_fnc_createAction;
		};
		// Add it to the player.
		[player, 1, ['ACE_SelfActions'], WHA_DP_ACT_DEPLOY] call ace_interact_menu_fnc_addActionToObject;
	}
	// Vanilla mode - use addAction instead
	else
	{
		// TODO
	};
	
	// Update player variable and broadcast it
	_unit setVariable ['WHA_DP_HASDEPLOY',true,true];
	
	// Alert player with a hint.
	// TODO
	
}] remoteExec ["bis_fnc_call", _unit];