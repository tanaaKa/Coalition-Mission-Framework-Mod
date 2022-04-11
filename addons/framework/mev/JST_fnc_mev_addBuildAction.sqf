params ["_side", "_mev", "_fhClass", "_fhName"];
private _str = str _mev;
private _actionVar = "JST_action_" + _str;
private _actionID = _mev getVariable [_actionVar, nil];
if (isNil "_actionID") then
{
	_mev setVariable
	[
		_actionVar,
		[
			_mev,
			format ["Deploy %1 Field Hospital (10s)", _fhName],
			"",
			"",
			"(_this distance _target < 5)",
			"(_caller distance _target < 5)",
			{
				[player, "AinvPknlMstpSnonWrflDr_medic5"] call ace_common_fnc_doAnimation;
			},
			{},
			{
				[
					(_this select 3 select 0),
					(_this select 3 select 1),
					(_this select 3 select 2),
					(_this select 3 select 3)
				] spawn JST_fnc_mev_deployFH;
				player switchMove ([player] call ace_common_fnc_getDefaultAnim);
			},
			{
				player switchMove ([player] call ace_common_fnc_getDefaultAnim);
			},
			[
				_side,
				_mev,
				_fhClass,
				_fhName
			],
			10,
			1,
			false,
			false
		] call BIS_fnc_holdActionAdd,
		false
	];
};