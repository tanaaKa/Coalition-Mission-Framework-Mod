private "_prestart";
_prestart = diag_tickTime;
diag_log [_prestart, "[CMF]: Starting CMF PreInit"];

// Load script function
CMF_Load =
{
    private "_filename";
    _filename =  "\cmf\" + _this;
    call compile preprocessFileLineNumbers _filename;
};

// Load alotta script function (array)
CMF_LoadAll =
{
    {_x call CMF_Load} forEach(_this);
};

diag_log [diag_tickTime, "[CMF]: Completed CMF PreInit in ", diag_tickTime - _prestart];
