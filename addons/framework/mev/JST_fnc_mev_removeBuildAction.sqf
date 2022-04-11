params ["_side", "_mev", "_fh", "_fhName"];
private _str = str _mev;
private _actionVar = "JST_action_" + _str;
private _actionID = _mev getVariable [_actionVar, nil];
if !(isNil "_actionID") then
{
	_mev removeAction _actionID;
	_mev setVariable [_actionVar, nil];
};