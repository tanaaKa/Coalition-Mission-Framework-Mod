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
	wh_ep_fnc_earplugHint =
	{
		_hint = if WH_EP_EARPLUGS_IN
		then { "Earplugs inserted." }
		else { "Earplugs removed." };
	
		_hint call ace_common_fnc_displayTextStructured;
	};
}

//------------------------------------------------------------------------------------
//	Otherwise, setup vanilla addActions.
//------------------------------------------------------------------------------------

else
{
	wh_ep_fnc_earplugHint =
	{
		_hint = if WH_EP_EARPLUGS_IN
		then { "Earplugs inserted." }
		else { "Earplugs removed." };
		
		hintSilent _hint;
	};
};