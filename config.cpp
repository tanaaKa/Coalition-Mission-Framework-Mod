class CfgPatches
{
	class cmf
	{
		units[]=
		{
			
		};
		weapons[]={};
		requiredVersion=1;
		requiredAddons[]=
		{
			"A3_Modules_F",
			"CBA_MAIN",
			"A3_UI_F"
		};
		author="tanaKa";
		authorUrl="http://coalitiongroup.net";
	};
};
class CfgAddons
{
	class PreloadAddons
	{
		class cmf
		{
			list[]=
			{
				"cmf"
			};
		};
	};
};

class CBA_Extended_EventHandlers;
class CfgDiary
{
	class FixedPages
	{
		delete Statistics;
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

class Extended_PreInit_EventHandlers
{
	CMF_PreInit="call compile preProcessFileLineNumbers 'cmf\preinit.sqf'";
};

class Extended_PostInit_EventHandlers
{
	CMF_PostInit="call compile preProcessFileLineNumbers 'cmf\postinit.sqf'";
};

class Extended_InitPost_EventHandlers
{
	class Car 
	{
		class cmf_noeject 
		{ 
			init = "(_this select 0) allowCrewInImmobile true;"; 
		};
		class cmf_nothermals 
		{ 
			init = "(_this select 0) disableTIEquipment true;"; exclude = "LSV_01_AT_base_F";  
		};
	};
	class Tank
	{
		class cmf_noeject 
		{ 
			init = "(_this select 0) allowCrewInImmobile true;"; 
		};
		class cmf_nothermals 
		{ 
			init = "(_this select 0) disableTIEquipment true;"; 
		};
	};
	class Helicopter 
	{
		class cmf_nothermals 
		{ 
			init = "(_this select 0) disableTIEquipment true;"; 
		};
	};
	class Plane 
	{
		class cmf_nothermals 
		{ 
			init = "(_this select 0) disableTIEquipment true;"; 
		};
	};
};
