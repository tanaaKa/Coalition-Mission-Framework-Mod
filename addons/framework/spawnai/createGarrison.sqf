//------------------Edit these-----------------
//Create as many spawn points
//as you'd like
//---------------------------------------------
_spawnPos = getMarkerPos "spawn";
//---------------No more editing---------------
//Server check
if (!isServer) exitWith {};

//Create group
["blu_f",60,70,100,1,3,_spawnPos] call potato_zeusHC_fnc_garrisonSpawn;