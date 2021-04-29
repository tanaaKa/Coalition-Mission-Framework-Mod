diag_log "[CMF]: Starting CMF Pre Init";

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

diag_log "[CMF]: Completed CMF Pre Init";
