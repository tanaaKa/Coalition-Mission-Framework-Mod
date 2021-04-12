//====================================================================================
//
//	fn_earplugRemove.sqf - Simulates removing earpro.
//
//	call wh_ep_fnc_earplugRemove;
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Restore player sound.
//------------------------------------------------------------------------------------

//	Emergency exit. TBD : TODO : Do better?
if !WH_EP_EARPLUGS_IN exitWith {};

//	Man, my documentation practices are bloated.
//	Update global variable.
WH_EP_EARPLUGS_IN = false; 

//	Reduce player sound.
//	TBD: Change sound depending on user settings.
2 fadeSound 1;

//	Update action.
call wh_ep_fnc_earplugUpdateAction;

//	Alert player with hint.
call wh_ep_fnc_earplugHint;