//====================================================================================
//
//	wh_earplugToggleKey.sqf - Sets up a key that can be used to toggle plugs with a press.
//								Behavior varies depending on presence of CBA.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	If CBA is NOT present: Setup the Toggle Key, default '-'.
//------------------------------------------------------------------------------------

if !WH_EP_MOD_CBA then
{

//	Setup toggleKey names.
WH_EP_TOGGLE_ID = (actionKeys WH_EP_TOGGLE_KEY) select 0;// This key, a global variable.
WH_EP_TOGGLE_NAME = actionKeysNames WH_EP_TOGGLE_KEY;	// Which is named this...

//	Stop here (do not setup key handlers) if the system is disabled.
if (!WH_EP_TOGGLE) exitWith {};

//	Function that will determine when the disableKey is depressed.
WH_EP_KEYDOWN = 
{
	_key = _this select 1;
	_handled = false;
	if(_key == WH_EP_TOGGLE_ID) then
	{
		if !WH_EP_EARPLUGS_IN 
		then { call wh_ep_fnc_earplugInsert }
		else { call wh_ep_fnc_earplugRemove };
		
		_handled = true;
	};
	_handled;
};

//	Function that will determine when the disableKey is released.
WH_EP_KEYUP = 
{
	_key = _this select 1;
	_handled = false;
	if(_key == WH_EP_TOGGLE_ID) then
	{
		_handled = true;
	};
	_handled;
};

//	Add eventhandlers (functions above).
(findDisplay 46) displayAddEventHandler   ["keydown", "_this call WH_EP_KEYDOWN"];
(findDisplay 46) displayAddEventHandler   ["keyup", "_this call WH_EP_KEYUP"];

}


//------------------------------------------------------------------------------------
//	If CBA IS present: Setup the Toggle UserKey, default '-'.
//------------------------------------------------------------------------------------

else
{
	["WH Earplugs", // Mod name
	"WH_EP_TOGGLE_CBA", // Key name
	["Toggle Earplugs","Remove or insert WH earplugs with a keypress."], // Key display name
	{
		if !WH_EP_EARPLUGS_IN 
		then { call wh_ep_fnc_earplugInsert }
		else { call wh_ep_fnc_earplugRemove };
	}, // Code ran on keydown
	"", // Code ran on keyup
	[0x0C, [false, false, false]]] // Default keybind [KEY, [SHIFT,CTRL,ALT]]
	call CBA_fnc_addKeybind; // Function call
};