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

// Max threshold for sprinting
CMF_sprint_disabled = 0.8;

// Max threshold for jogging
CMF_jogging_disabled = 0.99;

// Debug
CMF_Stamina_debug = true;

// Main driver loop
waitUntil {gameLive}; // wait for safestart
CMF_Stamina_Loop = [CMF_fnc_stamina, 0] call CBA_fnc_addPerFrameHandler;