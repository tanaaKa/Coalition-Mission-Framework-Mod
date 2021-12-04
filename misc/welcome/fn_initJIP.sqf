/*
 * Author: tanaKa
 * Creates a welcome that explains what to do as a JIP
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call CMF_fnc_initJIP;
 *
 * Public: False
 */

// Show jip instruction message
[format["<t align='center'><t size='1.2'>You have joined a mission in progress<br/><br/>

Use your scrollwheel menu to JIP into a group and select your gear. It is a requirement to do this prior to joining the mission.<br><br>If there are any issues, send an admin message.</t>"]
		,"success"
		,10
] call CMF_fnc_notify;