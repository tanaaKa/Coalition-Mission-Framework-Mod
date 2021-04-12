//====================================================================================
//
//	wh_earplugCompileAction.sqf - Sets up "put in" and "remove" earplug actions.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	If ACE is present, setup the ACE self-interact actions.
//------------------------------------------------------------------------------------

if WH_EP_MOD_ACE then
{

//	Action definition for putting in the earplugs.
WH_EP_ACT_INSERTPLUGS = 
[
	"earplugs",	// Variable name.
	"Insert Earplugs",	// Title to be displayed.
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Icon in menus.
	{ WH_EP_MANUAL = true; call wh_ep_fnc_earplugInsert; },	// Code run upon use.
	{true}	// Condition required to be useable.
] call ace_interact_menu_fnc_createAction;

//	Action definition for removing earplugs.
WH_EP_ACT_REMOVEPLUGS = 
[
	"earplugs",	// Variable name.
	"Remove Earplugs",	// Title to be displayed.
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Icon in menus.
	// TBD : Replace with another icon.
	{ WH_EP_MANUAL = false; call wh_ep_fnc_earplugRemove; },	// Code run upon use.
	{true}	// Condition required to be useable.
] call ace_interact_menu_fnc_createAction;

//	Save code that will toggle actions.
wh_ep_fnc_earplugUpdateAction =
{
	//	If the earplugs aren't in, remove the action that allows removal,
	//	and add the action that allows insertion.
	if !WH_EP_EARPLUGS_IN then
	{
		[player, 1,["ACE_SelfActions","ACE_Equipment","earplugs"]] call ace_interact_menu_fnc_removeActionFromObject;
		
		//	Only add the action to put them back in if the system is still enabled.
		if (WH_EP_EARPLUGS && {WH_EP_ACTION}) then
		{ [player, 1, ["ACE_SelfActions","ACE_Equipment"], WH_EP_ACT_INSERTPLUGS] call ace_interact_menu_fnc_addActionToObject; };
	}
	//	If they are in, do the opposite.
	else
	{
		[player, 1,["ACE_SelfActions","ACE_Equipment","earplugs"]] call ace_interact_menu_fnc_removeActionFromObject;
		[player, 1, ["ACE_SelfActions","ACE_Equipment"], WH_EP_ACT_REMOVEPLUGS] call ace_interact_menu_fnc_addActionToObject;
	};
};

}

//------------------------------------------------------------------------------------
//	Otherwise, setup vanilla addActions.
//------------------------------------------------------------------------------------

else
{

//	Save code that will toggle actions.
wh_ep_fnc_earplugUpdateAction =
{
	//	If the earplugs aren't in, remove the action that allows removal,
	//	and add the action that allows insertion.
	if !WH_EP_EARPLUGS_IN then
	{
		if (!isNil "WH_EP_ACT") then { player removeAction WH_EP_ACT; };
		
		//	Only add the action to put them back in if the system is still enabled.
		if (WH_EP_EARPLUGS && {WH_EP_ACTION}) then
		{
			WH_EP_ACT = player addAction 
			["<t color='#94C67F'>Insert Earplugs</t>", 
			{ WH_EP_MANUAL = true; call wh_ep_fnc_earplugInsert; }, [], 0.5, false];
		};
	}
	//	If they are in, do the opposite.
	else
	{
		if (!isNil "WH_EP_ACT") then { player removeAction WH_EP_ACT; };
		
		if (WH_EP_ACTION) then
		{
			WH_EP_ACT = player addAction 
			["<t color='#C67F7F'>Remove Earplugs</t>", 
			{ WH_EP_MANUAL = false; call wh_ep_fnc_earplugRemove; }, [], 0.5, false];
		};
	};
};

};