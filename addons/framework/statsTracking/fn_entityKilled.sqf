/*

	Filename:  fn_entityKilled.sqf 
	Locality: Runs on server
	Description: Checks if Entity is a player and what side they're on, then adds onto the local player stats array based on that info.
	
	Params:
	N/A

*/

params ["_killed", "_killer", "_instigator"];

_sideKilled = (typeOf _killed) select [0, 8];
_sideInstigator = (typeOf _instigator) select [0, 8];

switch true do
{
	//If a player kills a CIV
	case (isPlayer _instigator && !(_sideKilled in ["potato_w", "potato_i", "potato_e"])):{
		[1, 8, (_instigator getVariable "playerUID")] call CMF_fnc_updateStatArray;
	};
	//If both parties are players and are on separate sides, then it's a TVT kill/death
	case ((isPlayer _killed && isPlayer _instigator) && _sideKilled != _sideInstigator):{
		[1, 4, (_killed getVariable "playerUID")] call CMF_fnc_updateStatArray;
		[1, 3, (_instigator getVariable "playerUID")] call CMF_fnc_updateStatArray;
	};
	//If both parties are players and are on the same side, then it's a FF kill
	case ((isPlayer _killed && isPlayer _instigator) && _sideKilled == _sideInstigator):{
		[1, 7, (_instigator getVariable "playerUID")] call CMF_fnc_updateStatArray;
	};
	//If one party is a player and the other party is not a player and died, and they are on the same side, then it's a FF kill
	case ((!isPlayer _killed && isPlayer _instigator) && _sideKilled == _sideInstigator):{
		[1, 7, (_instigator getVariable "playerUID")] call CMF_fnc_updateStatArray;
	};
	//If one party is a player and said player died, and they are on the separate sides, then it's a COOP death
	case (isPlayer _killed &&  !isPlayer _instigator && _sideKilled != _sideInstigator):{
		[1, 6, (_killed getVariable "playerUID")] call CMF_fnc_updateStatArray;
	};
	//If one party is a player and the other party is not a player and died, and they are on the separate sides, then it's a COOP kill
	case (!isPlayer _killed &&  isPlayer _instigator && _sideKilled != _sideInstigator):{
		[1, 5, (_instigator getVariable "playerUID")] call CMF_fnc_updateStatArray;
	};
};