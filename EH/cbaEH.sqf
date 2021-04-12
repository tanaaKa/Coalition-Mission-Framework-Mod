///////////////////////////////////////////////////////////////
//	Event Handler Script
//	By: tanaKa-
//	CBA-specific event handlers
//
//	TODO:
//		N/A
//
///////////////////////////////////////////////////////////////
//EH to tag all buildings with white dot
if (!isServer) then {
	_id = ["ace_tagCreated", 
    {
        _building = _this select 2;
        if (_building isKindOf "house") then {     
            _markerPos = getpos _building; 
            _markerName = ((name player) + str time);
            _marker = createMarker[ _markerName , _markerPos];    
            _marker setmarkerShape "ICON";    
            _marker setMarkerType "hd_dot";
            _marker setMarkerColor "colorWhite";       
        };
    }
] call cba_fnc_addEventhandler;
};

//EH to remove medical items for EI
["CAManBase", "Killed", {
    params ["_unit"];
    if (!isPlayer _unit) then {
        //Delete medical items from AI only
        _medicalItems = ["FirstAidKit","ACE_packingBandage","ACE_morphine","ACE_epinephrine","ACE_tourniquet","ACE_salineIV","ACE_elasticBandage","ACE_fieldDressing"];
		{_unit removeItems _x} forEach _medicalItems;
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;