/*
 * Author: tanaKa
 * Hands out radios and assigns channels
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call CMF_fnc_initRadios;
 *
 * Public: No
 */
 
if !(isServer) exitWith {};

//Get radio value from potato settings menu
private _radioType = getMissionConfigValue "potato_missionTesting_radioSystem";

switch (_radioType) do {
	case 0:	//Squad nets
	{
		call CMF_fnc_sqdRadios;
		"[CMF] Squad nets active" remoteExec ["systemChat"];
	};
	case 1:	//FT nets
	{
		call CMF_fnc_ftRadios;
		"[CMF] Fireteam nets active" remoteExec ["systemChat"];
	};
	case 1:	//GI dont have radios
	{
		call CMF_fnc_ldrRadios;
		"[CMF] Leader nets active" remoteExec ["systemChat"];
	};
	default
	{
		call CMF_fnc_ftRadios;
	};
};