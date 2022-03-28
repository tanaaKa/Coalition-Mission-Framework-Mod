/*
 * Author: tanaKa
 * Handles the stamina system for the CMF. Should only be called from staminaHandler.sqf
 *
 * Arguments:
 * 0: unit
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

// Check unit states
if (!hasInterface) exitWith {};
if (!CMF_Stamina) exitWith {systemChat "CMF stam disabled"};
if (!alive player) exitWith {systemChat "player ded"};
if (!isStaminaEnabled player) exitWith {systemChat "Stamina disabled"};

// Get unit stamina states
_fatigue = getFatigue player;
_currentAnim = animationState player;

// Adjust state(s)
player allowSprint (_fatigue < CMF_sprint_disabled);
player forceWalk (_fatigue > CMF_jogging_disabled);
if (isForcedWalk player) exitWith { // Recursive function to force walking for a bit, then start again
	[CMF_Stamina_Loop] call CBA_fnc_removePerFrameHandler;
	[{getFatigue player < 0.6}, {player forceWalk false; CMF_Stamina_Loop = [CMF_fnc_stamina, 0] call CBA_fnc_addPerFrameHandler;}, player] call CBA_fnc_waitUntilAndExecute;
};

// Debug
if (CMF_Stamina_debug) then {
	if (!CMF_Stamina_debug) exitWith {systemChat "Debug disabled"};
	
	hint format ["Fatigue: %1\nCurrent Anim: %2\nWalk Forced: %3",
				_fatigue,
				_currentAnim,
				isForcedWalk player
				];
};