if (isServer) then {	
	//Check
	_bluforSlots = playableSlotsNumber blufor;
	_indforSlots = playableSlotsNumber independent;
	_opforSlots = playableSlotsNumber opfor;

	//blu marker remove
	if (_bluforSlots > 10) then {
		deletevehicle aslmarker;
		deletevehicle bslmarker;
		deletevehicle cslmarker;
		deletevehicle dslmarker;
		deletevehicle plmarker;
		deletevehicle plmarker2;
		deletevehicle coymarker;
	};
	
	//opf marker remove
	if (_opforSlots > 10) then {
		deletevehicle aslmarker_1;
		deletevehicle bslmarker_1;
		deletevehicle cslmarker_1;
		deletevehicle dslmarker_1;
		deletevehicle plmarker_1;
		deletevehicle plmarker2_1;
		deletevehicle coymarker_1;
	};
	
	//ind marker remove
	if (_indforSlots > 10) then {
		deletevehicle aslmarker_2;
		deletevehicle bslmarker_2;
		deletevehicle cslmarker_2;
		deletevehicle dslmarker_2;
		deletevehicle plmarker_2;
		deletevehicle plmarker2_2;
		deletevehicle coymarker_2;
	};
};		