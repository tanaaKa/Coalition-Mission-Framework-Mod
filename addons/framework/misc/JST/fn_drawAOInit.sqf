// Wait for client to init into mission then draw the AO
waitUntil {UIsleep 2; ((!isNull (findDisplay 46)) or (time >= 60))};
systemChat "[CMF] Loading Area of Operations";
UIsleep 1;
call CMF_fnc_drawAO;