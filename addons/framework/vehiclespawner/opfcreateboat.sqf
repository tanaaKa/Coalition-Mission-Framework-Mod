if ((funds >= boatcost) || (funds == -1)) then {
	_veh = boat createVehicle (getPos opfvehpad);
	_veh setDir 180;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	if (funds == -1) then {
		hint "Boat spawned. Funds remaining: Unlimited";
	} else {
		funds = funds - boatcost;
		hint format ["Boat spawned. Funds remaining: %1", funds];  
	};
};