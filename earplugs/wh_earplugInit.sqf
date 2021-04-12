//====================================================================================
//
//	wh_earplugInit.sqf - Initializes values for WH earplugs.
//
//	[] execVM "wh\earplugs\wh_earplugInit.sqf";
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Initial setup and function compilation.
//------------------------------------------------------------------------------------

//	Used so that I don't have to use actual #include command, which can create issues.
#define SOFT_INCLUDE call compile preprocessFileLineNumbers

//	Make sure this isn't a dedicated server or headless client.
if (!hasInterface) exitWith {};

//	Global variables that will be flipped on and off.
WH_EP_EARPLUGS = true;		// Whether the earpro system is enabled
WH_EP_EARPLUGS_IN = false;	// Whether the earplugs are currently in and sound reduced
WH_EP_MANUAL = false;		// used for purely keeping track of player actions

//	Determine which mods are active.
SOFT_INCLUDE "cmf\earplugs\include\wh_earplugCheckMods.sqf";

//	Construct & compile action code (earplugUpdateAction) based on presence of ACE.
SOFT_INCLUDE "cmf\earplugs\include\wh_earplugCompileAction.sqf";

//	Construct & compile hint system based on presence of ACE.
SOFT_INCLUDE "cmf\earplugs\include\wh_earplugCompileHint.sqf";


//------------------------------------------------------------------------------------
//	Configuration, settings import, and additional setup.
//------------------------------------------------------------------------------------

//	Allows for missionmaker configuration of important settings.
SOFT_INCLUDE "cmf\earplugs\wh_earplugCONFIG.sqf";

//	Imports settings if CBA is not present,
//	sets up an options menu if it is.
SOFT_INCLUDE "cmf\earplugs\include\wh_earplugSettings.sqf";

//	Emergency exit if the earplug system is disabled.
if (!WH_EP_EARPLUGS) exitWith {};

//	Setting up our toggle key (Default '-').
//	If CBA is present, code will run regardless of CONFIG setup.
SOFT_INCLUDE "cmf\earplugs\include\wh_earplugToggleKey.sqf";

//	TODO : TBD - CBA special keybinding.

//	Add basic briefing detailing script features.
//	If CBA is not present, add a settings menu and import profile settings.
SOFT_INCLUDE "cmf\earplugs\include\wh_earplugBriefing.sqf";


//------------------------------------------------------------------------------------
//	Initializing for player.
//------------------------------------------------------------------------------------

//	Reducing volume if player has set that as default.
if WH_EP_DEFAULT then
{	call wh_ep_fnc_earplugInsert	};

//	Updating player eventhandlers for respawning and getting in vehicles.
call wh_ep_fnc_earplugUpdateHandlers;


//------------------------------------------------------------------------------------
//	Adding nametag actions to player.
//------------------------------------------------------------------------------------

//	Add earplug self-interact or addaction.
if WH_EP_ACTION then
{	call wh_ep_fnc_earplugUpdateAction;	};
