if ((funds >= helicost) || (funds == -1)) then {
	_veh = opfheli createVehicle (getPos opfhelipad);
	_veh setDir 180;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	if (funds == -1) then {
		hint "Heli spawned. Funds remaining: Unlimited";
	} else {
		funds = funds - helicost;
		hint format ["Heli spawned. Funds remaining: %1", funds];  
	};
};