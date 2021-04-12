diag_log "[CMF]: Starting CMF PostInit Client";

// Prevent players from losing side status
player addRating 10000;
player addEventHandler ["HandleRating", {0 max (_this select 1)}];

// Set weapons to safe on spawn in
if (vehicle(player) == player) then {
	player switchMove "AmovPercMstpSlowWrflDnon";
};

// Disable random animals
enableEnvironment [false, true];

// Set eye aperture setting to auto
setAperture -1;

// Disable raycast checks for performance
disableRemoteSensors true;

// Set player recoil higher
player setUnitRecoilCoefficient 1.5;
player setCustomAimCoef 0.80;
player addEventHandler ["Respawn", {player setUnitRecoilCoefficient 1.5}];
player addEventHandler ["Respawn", {player setCustomAimCoef 0.80}];

// Ensure NoVoice
player setSpeaker "NoVoice";
player addEventHandler ["Respawn", {[player, "NoVoice"] remoteExecCall ["setSpeaker"];}];

// Client only scripts
[
	 "miniarsenal\addarsenal.sqf"
	,"EH\cbaEH.sqf"
	,"fds\wha_dp_init.sqf"
	,"earplugs\wh_earplugInit.sqf"
	//,"patches\patches.sqf" - Rewrite in progress
	,"vehiclespawner\factoryaction.sqf"
] call CMF_LoadAll;

// Medical system choice for mission maker
switch (side player) do
{
	case WEST:			{if (!JST_mevBluEnabled) then {"buildccp\initmed.sqf" call CMF_Load;}};
	case INDEPENDENT:	{if (!JST_mevIndEnabled) then {"buildccp\initmed.sqf" call CMF_Load;}};
	case EAST:			{if (!JST_mevOpfEnabled) then {"buildccp\initmed.sqf" call CMF_Load;}};
};

diag_log "[CMF]: Completed CMF PostInit Client";
