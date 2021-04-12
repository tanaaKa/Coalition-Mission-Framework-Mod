
params ["_side","_mev","_fh","_fhName"];
private _str = str _fh;
private _actionVar = "JST_action_" + _str;
private _actionID = _fh getVariable [_actionVar, nil];
if !(isNil "_actionID") then
{
	_fh removeAction _actionID;
	_fh setVariable [_actionVar, nil];
};