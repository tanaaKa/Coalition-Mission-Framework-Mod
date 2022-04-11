///////////////////////////////////////////////////////////////
//	Webhook script
//	By: tanaKa-
//	Webhook for game end
//
//	TODO:
//		N/A
//
///////////////////////////////////////////////////////////////
//if (count allPlayers < 10) exitWith {};
if (!isDedicated) exitWith {};

diag_log "[CMF]: Starting Mission End Webhook";

// Session - mission now ended notice
_durationSeconds = ceil(cba_missionTime);
_durationHours = floor (_durationSeconds / 3600);
_durationHoursRem = floor(_durationSeconds % 3600);
_durationMins = floor(_durationHoursRem / 60);
_durationMinsRem = floor(_durationHoursRem % 60);
_durationSecs = _durationMinsRem;

if (count str (_durationHours) == 1) then {
	_durationHours = "0" + str(_durationHours);
};
if (count str (_durationMins) == 1) then {
	_durationMins = "0" + str(_durationMins);
};
if (count str (_durationSecs) == 1) then {
	_durationSecs = "0" + str(_durationSecs);
};

_missionDuration = format["%1:%2:%3", _durationHours, _durationMins, _durationSecs];

_sides = [WEST,EAST,INDEPENDENT];
playersAlive = [];
{ 
	if (alive _x && side _x IN _sides) then {
		playersAlive pushBack (name _x);
	}; 
} forEach (allPlayers - entities "HeadlessClient_F");

[ 
	"session", 
	"", 
	"", 
	"", 
	false, 
	[ 
		[ 
			format ["%1 has now ended",briefingName], 
			format ["Slotting for the next mission is now starting\n\nJoin the 'Waiting to JIP / Slotting' channel to take part",briefingName], 
			"", 
			"FF0000", 
			true, 
			"", 
			"", 
			[ 
				"", 
				"", 
				"" 
			], 
			[ 
				"COALITION", 
				"https://coalitiongroup.net/images/logo.png" 
			], 
			[ 
				["Mission Length",_missionDuration,false],
				["Players Remaining",format["%1/%2",str(count (playableUnits select {alive _x})),count allPlayers],false],
				["Survivors", playersAlive joinstring ", ",false]
			] 
		]  
	] 
] call DiscordEmbedBuilder_fnc_buildSqf;

remoteExecCall ["CMF_fnc_rpEnd",-2];

diag_log "[CMF]: Mission End Webhook Complete";