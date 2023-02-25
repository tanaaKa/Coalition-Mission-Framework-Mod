/*
 * Author: tanaKa
 * Initializes the server database to be used
 * Server only
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * None
 *
 * Example:
 * [] spawn CMF_fnc_initDB;
 *
 * Public: No
*/
// Connect to database
try {
	_connect = "extDB3" callExtension "9:ADD_DATABASE:coalition";
	//[format ["_connect: %1",_connect]] remoteExec ["systemChat", 0];
	if (_connect isEqualTo "[0,""Already Connected to Database""]") exitWith{"[CMF] Connected to COALITION database" remoteExec ["systemChat", 0];};
	if (_connect isNotEqualTo "[1]") then {
		throw "Can't connect to the COALITION database";
	} else {
		"extDB3" callExtension "9:ADD_DATABASE_PROTOCOL:coalition:SQL:SQL";
		diag_log "[CMF] STATS - fn_initDB - connected to coalition database";

		"[CMF] Connected to COALITION database" remoteExec ["systemChat", 0];
		dbConnected = true; publicVariable "dbConnected";
	};
} catch {
	"[CMF] Could not connect to COALITION database or you are offline" remoteExec ["systemChat", 0];
	dbConnected = false; publicVariable "dbConnected";
}




