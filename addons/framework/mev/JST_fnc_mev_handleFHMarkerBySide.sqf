
params ["_state", "_pos", "_fhName"];
if (_state) then
{
	private _markerVar = "JST_mkr_FH_" + _fhName;
	_markerVar = createMarkerLocal [format ["JST_mkr_FH_%1", _fhName], _pos];
	_markerVar setMarkerShapeLocal "ICON";
	_markerVar setMarkerTypeLocal "loc_hospital";
	_markerVar setMarkerColorLocal "ColorWhite";
	private _markerTxt = format ["%1 Field Hospital", _fhName];
	_markerVar setMarkerTextLocal _markerTxt;
}
else
{
	deleteMarkerLocal ("JST_mkr_FH_" + _fhName);
};