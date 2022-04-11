/*
 * Author: tanaKa
 * Assigns an eventhandler to the player for a custom stamina system
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call CMF_fnc_staminaHandler;
 *
 * Public: No
 */
 
// Global variables for all players
//Enable stamina if CMF mission
CMF_Stamina = true;

// Max threshold for sprinting aka forced jog
CMF_sprint_disabled = 0.80;

// Max threshold for jogging aka forced walk
CMF_jogging_disabled = 0.99;

// Animation slowdown thresholds
CMF_min_slow = 0.65;
CMF_max_slow = 0.85;

// Minimum animation slowdown
CMF_min_speed = 0.8;

// Debug
CMF_Stamina_debug = false;

// Main driver loop
waitUntil {gameLive}; // wait for safestart
CMF_Stamina_Loop = [CMF_fnc_stamina, 0] call CBA_fnc_addPerFrameHandler;