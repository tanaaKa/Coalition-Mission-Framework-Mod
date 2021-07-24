#define DLG (uiNamespace getVariable "KitPick_Dlg")
#define COMBO (uiNamespace getVariable "KitPick_Combo")
#define USEBUTTON (uiNamespace getVariable "KitPick_UseBtn")

KitPickInit =
{
    uiNamespace setVariable ["KitPick_Dlg", _this select 0];
    uiNamespace setVariable ["KitPick_Combo", (_this select 0) displayCtrl 1];
    uiNamespace setVariable ["KitPick_UseBtn", (_this select 0) displayCtrl 3];

    USEBUTTON ctrlEnable false;

    private "_idx";
	COMBO lbAdd "---- Leadership ----";
	_idx = COMBO lbAdd "Company Commander"; COMBO lbSetData [_idx, "coy"];
	_idx = COMBO lbAdd "First Sergeant"; COMBO lbSetData [_idx, "xo"];
	_idx = COMBO lbAdd "Platoon Leader"; COMBO lbSetData [_idx, "plt"];
	_idx = COMBO lbAdd "Squad Leader"; COMBO lbSetData [_idx, "sl"];
	_idx = COMBO lbAdd "Team Leader"; COMBO lbSetData [_idx, "ftl"];
	
	COMBO lbAdd "---- Medical ----";
	_idx = COMBO lbAdd "Medical Officer"; COMBO lbSetData [_idx, "plm"];
	_idx = COMBO lbAdd "Medic"; COMBO lbSetData [_idx, "sm"];
	
	COMBO lbAdd "---- Infantry ----";
    _idx = COMBO lbAdd "Automatic Rifleman"; COMBO lbSetData [_idx, "ar"];
    _idx = COMBO lbAdd "Asst. Automatic Rifleman"; COMBO lbSetData [_idx, "aar"];
	_idx = COMBO lbAdd "Grenadier"; COMBO lbSetData [_idx, "rifleman_02"];
    _idx = COMBO lbAdd "Rifleman (AT)"; COMBO lbSetData [_idx, "lat"];

	COMBO lbAdd "---- Spcl Infantry ----";
	_idx = COMBO lbAdd "MMG Team Lead"; COMBO lbSetData [_idx, "mmgl"];
	_idx = COMBO lbAdd "MMG Gunner"; COMBO lbSetData [_idx, "mmgg"];
	_idx = COMBO lbAdd "MMG Assistant"; COMBO lbSetData [_idx, "mmgag"];
	_idx = COMBO lbAdd "MAT Team Lead"; COMBO lbSetData [_idx, "matl"];
	_idx = COMBO lbAdd "MAT Gunner"; COMBO lbSetData [_idx, "matg"];
	_idx = COMBO lbAdd "MAT Assistant"; COMBO lbSetData [_idx, "matag"];
	_idx = COMBO lbAdd "MTR Team Lead"; COMBO lbSetData [_idx, "mtrl"];
	_idx = COMBO lbAdd "MTR Gunner"; COMBO lbSetData [_idx, "mtrg"];
	_idx = COMBO lbAdd "MTR Assistant"; COMBO lbSetData [_idx, "mtrag"];
	_idx = COMBO lbAdd "SAM Team Lead"; COMBO lbSetData [_idx, "msaml"];
	_idx = COMBO lbAdd "SAM Gunner"; COMBO lbSetData [_idx, "msamg"];
	_idx = COMBO lbAdd "SAM Assistant"; COMBO lbSetData [_idx, "msamag"];
	_idx = COMBO lbAdd "Engineer Leader"; COMBO lbSetData [_idx, "engl"];
	_idx = COMBO lbAdd "Engineer"; COMBO lbSetData [_idx, "eng"];
	
	COMBO lbAdd "---- Armor / Aircraft ----";
	_idx = COMBO lbAdd "Armor Commander"; COMBO lbSetData [_idx, "vicl"];
	_idx = COMBO lbAdd "Armor Gunner"; COMBO lbSetData [_idx, "vicc"];
	_idx = COMBO lbAdd "Armor Driver"; COMBO lbSetData [_idx, "vicd"];
	_idx = COMBO lbAdd "Pilot"; COMBO lbSetData [_idx, "pilot"];
	_idx = COMBO lbAdd "Heli Crewchief"; COMBO lbSetData [_idx, "cc"];
	
    _sel = player getVariable "KitPicker_Selection";
    if (!isNil '_sel') then
    {
        COMBO lbSetCurSel _sel;
    };
};

KitPicker_Pick =
{
    private "_idx";
    _idx = lbCurSel COMBO;

    _data = COMBO lbData _idx;

    closeDialog 0;

	removeAllItems player; 
	removeallWeapons player; 
	removeBackpack player; 
	removeUniform player; 
	removeVest player; 
	removeHeadgear player;

	switch (_data) do {
		case "coy": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "coy"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a Company Commander on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "xo": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "xo"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a Company 1SG on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "plt": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "plt"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a Platoon Leader %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "sl": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "sl"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a squad leader on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "plm": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "plm"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			player setUnitTrait ["Medic",true];
			[player] execVM "x\cmf\addons\framework\buildccp\initmed.sqf";
			["potato_adminMsg", [format ["%1 JIP'd as a medical officer on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "sm": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "sm"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			player setUnitTrait ["Medic",true];
			[player] execVM "x\cmf\addons\framework\buildccp\initmed.sqf";
			["potato_adminMsg", [format ["%1 JIP'd as a squad medic on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "ftl": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "ftl"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a team leader on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "ar": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "ar"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as an AR on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "aar": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "aar"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as an AAR on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "rifleman_02": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "rifleman_02"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a Grenadier on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "lat": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "lat"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a RAT on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "mmgl":
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "mmgl"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a MMG Team Lead on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "mmgg":
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "mmgg"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a MMG Gunner on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "mmgag": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "mmgag"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a MMG Assistant on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "matl":
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "matl"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a MAT Team Lead on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "matg": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "matg"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a MAT Gunner on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "matag": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "matag"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a MAT assistant on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "mtrl":
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "mtrl"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a MTR Team Lead on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "mtrg": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "mtrg"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a Mortar Gunner on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "mtrag": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "mtrg"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a Mortar Assistant on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "msamg": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "msamg"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a SAM Gunner on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "msamag": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "msamag"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			["potato_adminMsg", [format ["%1 JIP'd as a SAM Assistant on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "engl":
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "engl"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			player setVariable ["ACE_IsEngineer", 1, false];
			["potato_adminMsg", [format ["%1 JIP'd as an Engineer Leader on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "eng":
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "eng"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			player setVariable ["ACE_IsEngineer", 1, false];
			["potato_adminMsg", [format ["%1 JIP'd as an Engineer on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "vicl": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "vicl"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			player setVariable ["ACE_IsEngineer", 1, false];
			["potato_adminMsg", [format ["%1 JIP'd as an Armor Commander on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "vicc": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "vicc"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			player setVariable ["ACE_IsEngineer", 1, false];
			["potato_adminMsg", [format ["%1 JIP'd as an Armor Crewman on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "vicd": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "vicd"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			player setVariable ["ACE_IsEngineer", 1, false];
			["potato_adminMsg", [format ["%1 JIP'd as an Armor Driver on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "pilot": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "pilot"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			player setVariable ["ACE_IsEngineer", 1, false];
			["potato_adminMsg", [format ["%1 JIP'd as a Pilot on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		case "cc": 
		{
			_loadout = [missionConfigFile >> "CfgLoadouts" >> toLower faction player >> "cc"] call potato_assignGear_fnc_getLoadoutFromConfig;
			player setUnitLoadout _loadout;
			player setVariable ["ACE_IsEngineer", 1, false];
			["potato_adminMsg", [format ["%1 JIP'd as a Crewchief on %2", (name player),(side player)]]] call CBA_fnc_globalEvent;
		};
		
		default {systemChat "[COA JIP] Error on gear update. Message admin."};
	};
	
	f_var_JIP_state = 3;
};

KitPicker_OnSelChanged =
{
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith
    {
        USEBUTTON ctrlEnable false;
    };

    _data = COMBO lbData _idx;
    if (_data == "") exitWith
    {
        USEBUTTON ctrlEnable false;
    };
    USEBUTTON ctrlEnable true;
};
