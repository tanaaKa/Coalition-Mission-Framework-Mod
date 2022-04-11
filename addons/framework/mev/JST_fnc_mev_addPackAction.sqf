params ["_side", "_mev", "_fh", "_fhClass", "_fhName"];
missionNameSpace setVariable [("JST_mev_pair_" + _fhName), [_mev, _fh]];
private _str = str _fh;
private _actionVar = "JST_action_" + _str;
private _actionID = _fh getVariable [_actionVar, nil];
if (isNil "_actionID") then
{
	_fh setVariable
	[
		_actionVar,
		[
			_fh,
			format ["Pack %1 Field Hospital (10s)", _fhName],
			"",
			"",
			"(_this distance _target < 8)",
			"(_caller distance _target < 8)",
			{
				[player, "AinvPknlMstpSnonWrflDr_medic5"] call ace_common_fnc_doAnimation;
			},
			{},
			{
				[
					_this select 3 select 0,
					_this select 3 select 1,
					_this select 3 select 2,
					_this select 3 select 3,
					_this select 3 select 4
				] spawn JST_fnc_mev_packFH;
				player switchMove ([player] call ace_common_fnc_getDefaultAnim);
			},
			{
				player switchMove ([player] call ace_common_fnc_getDefaultAnim);
			},
			[
				_side,
				_mev,
				_fh,
				_fhClass,
				_fhName
			],
			10,
			1,
			true,
			false
		] call BIS_fnc_holdActionAdd,
		false
	];
};