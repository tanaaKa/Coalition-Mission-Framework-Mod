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

#include "\x\cmf\addons\framework\readyup\JST_readyUpFunctions.sqf"

#include "\x\cmf\addons\framework\loadouts\CMF_Loadout_Functions.sqf"

// Radio system support only
//radiosAssigned = false;