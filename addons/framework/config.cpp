class CfgPatches
{
	class CMF
	{
		units[]=
		{
			"cmfADModule"
		};
		weapons[]={};
		requiredVersion=1;
		requiredAddons[]=
		{
			"A3_Modules_F",
			"CBA_MAIN",
			"A3_UI_F",
			"acre_sys_sounds"
		};
		author="tanaKa";
		authorUrl="http://coalitiongroup.net";
	};
};

class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay
{
	class Spotlight
	{
		class NoApex
		{
			text="Apex is required to play with COALITION";
			condition="!isClass (configfile >> 'CfgPatches' >> 'A3_Map_Tanoabuka')";
			picture="";
			video="";
			action="(ctrlParent(_this select 0)) createDisplay 'RscDisplayDLCContentBrowser'";
			actionText="";
		};
	};
};

class CfgMPGameTypes
{
	class CMFTVT
	{
		statsStandard="";
		statsRanked="";
		shortcut="CMFTVT";
		name="COALITION TvT Mission";
		id=6;
		icon="#(argb,8,8,3)color(0,0,0,0)";
		description="";
	};
	class CMFCOOP
	{
		statsStandard="";
		statsRanked="";
		shortcut="CMFCOOP";
		name="COALITION COOP Mission";
		id=7;
		icon="#(argb,8,8,3)color(0,0,0,0)";
		description="";
	};
	class CMFSPCL
	{
		statsStandard="";
		statsRanked="";
		shortcut="CMFSPCL";
		name="COALITION SPCL Mission";
		id=8;
		icon="#(argb,8,8,3)color(0,0,0,0)";
		description="";
	};
};

#include "CfgEventhandlers.hpp"
#include "CfgModuleCategories.hpp"
#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "sounds\CfgSounds.hpp"
#include "misc\acrebeep\CfgAcreSounds.hpp"
#include "logging\CfgDiscordRichPresence.hpp"
#include "stamina\CfgMovesFatigue.hpp"
#include "ui\Displays.hpp"
#include "JIP\f_JIP_common.h"
#include "JIP\f_JIP_grpPicker.h"
#include "JIP\f_JIP_kitPicker.h"