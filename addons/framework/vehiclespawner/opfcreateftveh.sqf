if ((funds >= ftvehcost) || (funds == -1)) then {
	_veh = opfftveh createVehicle (getPos opfvehpad);
	_veh setDir 180;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	if (funds == -1) then {
		hint "Fireteam vehicle spawned. Funds remaining: Unlimited";
	} else {
		funds = funds - ftvehcost;
		hint format ["Fireteam vehicle spawned. Funds remaining: %1", funds];  
	};
};