private "_poststart";
_poststart = diag_tickTime;
diag_log [_poststart, "[CMF]: Starting CMF PostInit"];

enableSaving [false, false];

// Jesters readyup function library
"readyup\JST_readyUpFunctions.sqf" call CMF_Load;

// Jesters medical rewrite
// Auto enable medical vehicle based system per side if required vehicles present
if (!isNil "BLU_MEV_1PL") then {JST_mevBluEnabled = true} else {JST_mevBluEnabled = false};
if (!isNil "IND_MEV_1PL") then {JST_mevIndEnabled = true} else {JST_mevIndEnabled = false};
if (!isNil "OPF_MEV_1PL") then {JST_mevOpfEnabled = true} else {JST_mevOpfEnabled = false};
"mev\JST_init.sqf" call CMF_Load;

// Server-only functions
if (isServer) then {
	[
         "readyup\JST_readyUp.sqf"
        ,"logging\session.sqf"
		,"cleanup\JST_garbageCleanup.sqf"
		,"patches\patchesinit.sqf"
    ] call CMF_LoadAll;
};

// Run postinitclients only on clients
if (hasInterface) then
{
	"postinit_client.sqf" call CMF_Load;
};

diag_log [diag_tickTime, "[CMF]: Completed CMF PostInit in ", diag_tickTime - _poststart];
