if ((funds >= transportcost) || (funds == -1)) then {
	_veh = blutransport createVehicle (getPos bluvehpad);
	_veh setDir 180;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	if (funds == -1) then {
		hint "Transport truck spawned. Funds remaining: Unlimited";
	} else {
		funds = funds - transportcost;
		hint format ["Transport truck spawned. Funds remaining: %1", funds];  
	};
};