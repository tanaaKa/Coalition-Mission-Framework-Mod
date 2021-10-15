/*
*
*	[player] call CMF_fnc_removeArsenal;
*
*/

params["_unit"];

[_unit,1,["ACE_SelfActions","ACE_Equipment","miniarsenal"]] call ace_interact_menu_fnc_removeActionFromObject;