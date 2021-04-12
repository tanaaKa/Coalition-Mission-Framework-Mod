if ((funds >= armorcost) || (funds == -1)) then {
	_veh = opfarmor createVehicle (getPos opfvehpad);
	_veh setDir 180;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	if (funds == -1) then {
		hint "Armor spawned. Funds remaining: Unlimited";
	} else {
		funds = funds - armorcost;
		hint format ["Armor spawned. Funds remaining: %1", funds];  
	};
};