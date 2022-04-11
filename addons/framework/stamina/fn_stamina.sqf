/*
 * Author: tanaKa
 * Handles the stamina system for the CMF. Should only be called from staminaHandler.sqf
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * None
 *
 * Example:
 * CMF_Stamina_Loop = [CMF_fnc_stamina, 0] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

// Check unit states
if (!hasInterface) exitWith {};
if (!CMF_Stamina) exitWith {};
if (!alive player) exitWith {};
if (!isStaminaEnabled player) exitWith {};
if (vehicle player isNotEqualTo player) exitWith
{
	player setAnimSpeedCoef 1;
};

// Get unit stamina states
_fatigue = getFatigue player;
_currentAnim = animationState player;
_minSpeed = CMF_min_speed max getNumber(configFile >> "CfgMovesMaleSdr" >> "States" >> _currentAnim >> "relSpeedMin");
_speedAdj = linearConversion [CMF_min_slow, CMF_max_slow, _fatigue, 1.0, _minSpeed, true];
// Ensure animation is full speed if transitioning
if (((_currentAnim find "_") isNotEqualTo -1) || {_currentAnim select [0, 4] isEqualTo "Aovr"}) exitWith
{
	player setAnimSpeedCoef 1;
};

// Adjust state(s)
player allowSprint (_fatigue < CMF_sprint_disabled);
player forceWalk (_fatigue > CMF_jogging_disabled);
player setAnimSpeedCoef _speedAdj;
if (isForcedWalk player) exitWith { // Recursive function to force walking for a bit, then start again
	[CMF_Stamina_Loop] call CBA_fnc_removePerFrameHandler;
	[{getFatigue player < 0.3}, {player forceWalk false; CMF_Stamina_Loop = [CMF_fnc_stamina, 0] call CBA_fnc_addPerFrameHandler;}, player] call CBA_fnc_waitUntilAndExecute;
};

// Debug
if (CMF_Stamina_debug) then {
	if (!CMF_Stamina_debug) exitWith {systemChat "Debug disabled"};
	
	hintSilent format ["Fatigue: %1\nCurrent Anim: %2\nWalk Forced: %3\nAnim speed: %4",
				_fatigue,
				_currentAnim,
				isForcedWalk player,
				_speedAdj
				];
};