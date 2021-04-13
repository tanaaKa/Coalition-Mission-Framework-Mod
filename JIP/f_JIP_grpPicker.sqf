#define DLG (uiNamespace getVariable "GrpPick_Dlg")
#define COMBO (uiNamespace getVariable "GrpPick_Combo")
#define USEBUTTON (uiNamespace getVariable "GrpPick_UseBtn")

GrpPickInit =
{
    uiNamespace setVariable ["GrpPick_Dlg", _this select 0];
    uiNamespace setVariable ["GrpPick_Combo", (_this select 0) displayCtrl 1];
    uiNamespace setVariable ["GrpPick_UseBtn", (_this select 0) displayCtrl 3];

    USEBUTTON ctrlEnable false;
    GrpList = [];
    GrpCount = 0;
    {
        private "_grp";
        _grp = _x;
		_grpNum = (count units _grp);
        if (side(_grp) isEqualTo side(player) && {(faction (leader _grp) isEqualTo faction player ) && (alive (leader _grp)) && !(_grp isEqualTo group player)}) then
        {
            GrpList set [GrpCount, _grp];
            private "_idx";
            _idx = COMBO lbAdd ((str _grp) + " " + "(" + (str _grpNum) + " players)"); COMBO lbSetValue [_idx, GrpCount + 1];
            GrpCount = GrpCount + 1;
        };

        if (_grp isEqualTo group player && {count units _grp > 1}) then {
            GrpList set [GrpCount, _grp];
            private "_idx";
            _idx = COMBO lbAdd ("Stay in " + str(_grp)); COMBO lbSetValue [_idx, GrpCount + 1];
            GrpCount = GrpCount + 1;
        };
    } forEach allGroups;

     GrpList set [GrpCount, grpNull];
     _idx = COMBO lbAdd "NONE"; COMBO lbSetValue [_idx, GrpCount + 1];

    _sel = player getVariable "GrpPicker_Selection";
    if (!isNil '_sel') then
    {
        COMBO lbSetCurSel _sel;
    };
};

GrpPicker_Pick =
{
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith {};

    private "_data";
    _data = COMBO lbValue _idx;
    if (_data isEqualTo 0) exitWith {};

    private "_grp";
    _grp = GrpList select (_data - 1);
	_grpNum = (count units _grp);
	if (_grpNum >= 6) then {
		hint "That group is full! Please  pick another.";
		systemChat "[CMF JIP] ERROR: Group is full. Pick another";
	} else {
		closeDialog 0;
		player setVariable ["f_var_JIP_grp", _grp];
		player setVariable ["GrpPicker_Selection", _idx];
		f_var_JIP_state = 1;
	};
};

GrpPicker_OnSelChanged =
{
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith
    {
        USEBUTTON ctrlEnable false;
    };

    _data = COMBO lbValue _idx;
    if (_data isEqualTo 0) exitWith
    {
        USEBUTTON ctrlEnable false;
    };
    USEBUTTON ctrlEnable true;
};
