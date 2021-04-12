//====================================================================================
//
//	wh_nametagSettings.sqf - Imports settings if CBA is not present, sets up a 
//								settings interface if it is.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	If CBA is not present, get saved settings from player profile.
//------------------------------------------------------------------------------------

if !WH_EP_MOD_CBA then
{

	if (!isNil {profileNamespace getVariable "WH_EP_DEFAULT"}) then 
	{	WH_EP_DEFAULT = profileNamespace getVariable "WH_EP_DEFAULT";	};

	if (!isNil {profileNamespace getVariable "WH_EP_ACTION"}) then 
	{	WH_EP_ACTION = profileNamespace getVariable "WH_EP_ACTION";	};
	
	if (!isNil {profileNamespace getVariable "WH_EP_SOUNDLEVEL"}) then 
	{	WH_EP_SOUNDLEVEL = profileNamespace getVariable "WH_EP_SOUNDLEVEL";	};
	
	if (!isNil {profileNamespace getVariable "WH_EP_AUTO"}) then 
	{	WH_EP_AUTO = profileNamespace getVariable "WH_EP_AUTO";	};
	
	if (!isNil {profileNamespace getVariable "WH_EP_AUTO_VEHICLES"}) then 
	{	WH_EP_AUTO_VEHICLES = profileNamespace getVariable "WH_EP_AUTO_VEHICLES";	};
	
	if (!isNil {profileNamespace getVariable "WH_EP_TOGGLE"}) then 
	{	WH_EP_TOGGLE = profileNamespace getVariable "WH_EP_TOGGLE";	};

}


//------------------------------------------------------------------------------------
//	If CBA is present, set up settings interface.
//------------------------------------------------------------------------------------

else
{
	//	Setting for whether plugs should be automatically put in when entering vehicles.
	[
		"WH_EP_AUTO",		// Internal setting name and value set.
		"CHECKBOX", 				// Setting type.
		"Vehicle Earplugs", 		// Name shown in menu.
		"WH Earplugs", 				// Category shown in menu.
		WH_EP_AUTO, 		// Setting type-specific data.
		nil, 						// Nil or 0 for changeable, 1 to reset to default, 2 to lock.
		{ call wh_ep_fnc_earplugUpdateHandlers; }
	] call CBA_Settings_fnc_init;

	//	Which vehicles to apply automatic plugs to.
	[
		"WH_EP_AUTO_VEHICLES",		// Internal setting name and value set.
		"LIST", 					// Setting type.
		"Which Vehicles?", 			// Name shown in menu.
		"WH Earplugs", 				// Category shown in menu.
		[
			[WH_EP_AUTO_VEHICLES,['Tank','Helicopter','Car','Plane','Ship','StaticWeapon'],['Tank','Helicopter','Car','Plane','Ship'],['Tank','Helicopter','Plane'],['Helicopter','Plane'],['Plane']],
			["Default","All Vehicles","All Except Turrets","Tanks and Air","Helicopters and Planes","Just Planes"],
			0
		] 							// Setting type-specific data.
									// Executed at mission start and every change.
	] call CBA_Settings_fnc_init;

	//	Setting for whether plugs should be in at mission start / respawns.
	[
		"WH_EP_DEFAULT",	// Internal setting name and value set.
		"CHECKBOX", 				// Setting type.
		"Plugs at Mission Start", 	// Name shown in menu.
		"WH Earplugs", 				// Category shown in menu.
		WH_EP_DEFAULT, 	// Setting type-specific data.
		nil, 						// Nil or 0 for changeable, 1 to reset to default, 2 to lock.
		{ call wh_ep_fnc_earplugUpdateHandlers; }
	] call CBA_Settings_fnc_init;

	//	Setting for whether plugs should be in at mission start / respawns.
	[
		"WH_EP_ACTION",	// Internal setting name and value set.
		"CHECKBOX", 				// Setting type.
		"Show Earplug Action", 		// Name shown in menu.
		"WH Earplugs", 				// Category shown in menu.
		WH_EP_ACTION, 		// Setting type-specific data.
		nil, 						// Nil or 0 for changeable, 1 to reset to default, 2 to lock.
		{ if WH_EP_ACTION then {call wh_ep_fnc_earplugUpdateAction;}; }
	] call CBA_Settings_fnc_init;
	
	//	Setting to dynamically alter sound level.
	[
		"WH_EP_SOUNDLEVEL",			// Internal setting name and value set.
		"SLIDER", 					// Setting type.
		"Sound Level", 				// Name shown in menu.
		"WH Earplugs", 				// Category shown in menu.
		[0.1, 0.9, WH_EP_SOUNDLEVEL, 2]// Setting type-specific data.
	] call CBA_Settings_fnc_init;
};