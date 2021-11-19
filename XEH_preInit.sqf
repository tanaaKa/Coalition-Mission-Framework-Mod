// Load script function
CMF_Load =
{
	private "_filename";
	_filename =  "\x\cmf\addons\framework\" + _this;
	call compile preprocessFileLineNumbers _filename;
};

// Load alotta script function (array)
CMF_LoadAll =
{
	{_x call CMF_Load} forEach(_this);
};

// Backwards support for older missions to prevent duplication
_version = getText (missionConfigFile >> "cmfVers");
if (_version != "CMF2 1.0") exitWith {};

#include "\x\cmf\addons\framework\readyup\JST_readyUpFunctions.sqf"

// Radio system support only
//radiosAssigned = false;