// Returns list of players in the passed leaders group
// Param 0: leader object (unit)
params["_leader"];
_groupNames = [];
{
	_groupNames pushBackUnique name _x;
} forEach units _leader;

_groupNames = _groupNames joinString ", ";

_groupNames
