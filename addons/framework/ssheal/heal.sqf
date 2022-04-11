/*
 * Author: tanaKa
 *
 * Heals target in new ace medical
 *
 * Arguments:
 * 0: target - <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_treatment_fnc_fullHealLocal
 *
 * Public: No
 */

_unit = _this select 0;
	
[_unit] call ace_medical_treatment_fnc_fullHealLocal;

_log = format ["[COA SSHEAL] %1 healed themselves at %2", (name _unit), serverTime];
_log remoteExec ["diag_log",2];
