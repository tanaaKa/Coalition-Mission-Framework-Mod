//====================================================================================
//
//	fn_earplugInsert.sqf - Simulates inserting earpro.
//
//	call wh_ep_fnc_earplugInsert;
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Reduce player sound.
//------------------------------------------------------------------------------------

//	Emergency exit. TBD : TODO : Do better? Merge earplug funcs into a toggle?
if WH_EP_EARPLUGS_IN exitWith {};

//	Man, my documentation practices are bloated.
//	Update global variable.
WH_EP_EARPLUGS_IN = true; 

//	Reduce player sound.
//	TBD: Change sound depending on user settings.
2 fadeSound WH_EP_SOUNDLEVEL;

//	Update action.
call wh_ep_fnc_earplugUpdateAction;

//	Alert player with hint.
call wh_ep_fnc_earplugHint;