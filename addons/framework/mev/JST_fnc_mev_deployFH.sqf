params ["_side", "_mev", "_fhClass", "_fhName"];
private _hintStr = nil;
private _which = nil;
private _fh = nil;
private _inv = nil;
private _pos = (getPos _mev) findEmptyPosition [8, 75, _fhClass];
if (count _pos > 1) then
{
	private _grid = mapGridPosition _pos;
	_hintStr = format ["%1 Field Hospital established at GR#%2", _fhName, _grid];
	private _inv = _mev getVariable ["JST_mevInv", nil];
	private _fh = _fhClass createVehicle _pos;
	_fh allowdamage false;
	if (isNil "_inv") then
	{
		_fh addItemCargoGlobal ["ACE_epinephrine", 20];
		_fh addItemCargoGlobal ["ACE_morphine", 40];
		_fh addItemCargoGlobal ["ACE_Bodybag", 20];
		_fh addItemCargoGlobal ["ACE_quikclot", 30];
		_fh addItemCargoGlobal ["ACE_bloodIV", 20];
		_fh addItemCargoGlobal ["ACE_bloodIV_500", 20];
		_fh addItemCargoGlobal ["ACE_bloodIV_250", 20];
		_fh addItemCargoGlobal ["ACE_plasmaIV", 20];
		_fh addItemCargoGlobal ["ACE_salineIV", 20];
		_fh addItemCargoGlobal ["ACE_tourniquet", 10];
		_fh addItemCargoGlobal ["ACE_elasticBandage", 40];
		_fh addItemCargoGlobal ["ACE_packingBandage",40];
		_fh addItemCargoGlobal ["ACE_atropine", 5];
		_fh addItemCargoGlobal ["ACE_splint", 20];
		_fh addItemCargoGlobal ["ACE_surgicalKit",2];
		_fh addItemCargoGlobal ["ACE_Chemlight_HiRed", 2]; 
		_fh addItemCargoGlobal ["ACE_Chemlight_HiYellow", 2]; 
		_fh addItemCargoGlobal ["ACE_Chemlight_HiWhite", 2];

		//Adds KAT medical if KAT is present - Blame phil
		if (isClass(configFile >> "CfgPatches" >> "kat_main")) then
		{
  			_fh addItemCargoGlobal ["kat_accuvac", 4];
			_fh addItemCargoGlobal ["kat_Pulseoximeter", 5];
			_fh addItemCargoGlobal ["kat_stethoscope", 5];
			_fh addItemCargoGlobal ["kat_X_AED", 2];
			_fh addItemCargoGlobal ["kat_AED", 2];
			_fh addItemCargoGlobal ["kat_IV_16", 50];
			_fh addItemCargoGlobal ["kat_IO_FAST", 25];
			_fh addItemCargoGlobal ["kat_aatKit", 50];
			_fh addItemCargoGlobal ["kat_chestseal", 50];
			_fh addItemCargoGlobal ["kat_larynx", 10];
			_fh addItemCargoGlobal ["kat_guedel", 10];
			_fh addItemCargoGlobal ["kat_lidocaine", 25];
			_fh addItemCargoGlobal ["kat_naloxone", 25];
			_fh addItemCargoGlobal ["kat_nitroglycerin", 25];
			_fh addItemCargoGlobal ["kat_norepinephrine", 25];
			_fh addItemCargoGlobal ["kat_phenylephrine", 25];
			_fh addItemCargoGlobal ["kat_amiodarone", 25];
			_fh addItemCargoGlobal ["kat_atropine", 25];
			_fh addItemCargoGlobal ["kat_TXA", 30];
			_fh addItemCargoGlobal ["kat_Carbonate", 10];
			_fh addItemCargoGlobal ["kat_Painkiller", 10];
			_fh addItemCargoGlobal ["Attachable_Helistretcher", 2];
			_fh addItemCargoGlobal ["kat_BVM", 5];
			_fh addItemCargoGlobal ["kat_oxygenTank_300_Item", 10];
		};
		
	}
	else
	{
		{
			_fh addItemCargoGlobal [_x, (_inv select 1) select _forEachIndex]
		} forEach (_inv select 0);
	};
	private _allMedicsOnSide = [];
	{
		if
		(
			(side _x isEqualTo _side) and
			(
				(typeOf player isEqualTo "potato_w_cm") or
				(typeOf player isEqualTo "potato_i_cm") or
				(typeOf player isEqualTo "potato_e_cm") or
				(typeOf player isEqualTo "potato_w_plm") or
				(typeOf player isEqualTo "potato_i_plm") or
				(typeOf player isEqualTo "potato_e_plm") or
				(typeOf player isEqualTo "potato_w_sm") or
				(typeOf player isEqualTo "potato_i_sm") or
				(typeOf player isEqualTo "potato_e_sm")
			)
		)
		then
		{
			_allMedicsOnSide pushBackUnique _x;
		};
	} forEach allPlayers;
	[_side, _mev, _fh, _fhClass, _fhName] remoteExec ["JST_fnc_mev_addPackAction", _allMedicsOnSide];
	[_side, _mev, _fh, _fhName] remoteExec ["JST_fnc_mev_removeBuildAction", _allMedicsOnSide];
	[true, _pos, _fhName] remoteExec ["JST_fnc_mev_handleFHMarkerBySide", _side];
	[_hintStr] remoteExec ["systemChat", _side];
}
else
{
	systemChat "Can't fit the Field Hospital here.";
};
