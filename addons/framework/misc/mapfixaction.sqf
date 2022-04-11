tnk_fixmap =
{
	false call RR_mapStuff_fnc_mapEH; 
	{detach _x; deleteVehicle _x} forEach attachedObjects player;
};

_action = ["fixmap","Fix map bug","",{call tnk_fixmap},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToObject;