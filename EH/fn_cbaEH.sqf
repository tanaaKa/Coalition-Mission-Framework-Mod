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