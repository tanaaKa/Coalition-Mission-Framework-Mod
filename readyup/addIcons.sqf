//Exit if not server
if (!isServer) exitWith {};

//Check
_bluforSlots = playableSlotsNumber blufor;
_indforSlots = playableSlotsNumber independent;
_opforSlots = playableSlotsNumber opfor;

//blu marker add
if (_bluforSlots > 10) then {
	//blu markers
	if (!isNil "BLU_ASL") then { 
		aslmarker attachTo [BLU_ASL, [0, 0, 3] ];
	};
	if (!isNil "BLU_BSL") then {
		bslmarker attachTo [BLU_BSL, [0, 0, 3] ];
	};
	if (!isNil "BLU_CSL") then {
		cslmarker attachTo [BLU_CSL, [0, 0, 3] ]; 
	};
	if (!isNil "BLU_DSL") then {
		dslmarker attachTo [BLU_DSL, [0, 0, 3] ]; 
	};
	if (!isNil "BLU_PL") then {
		plmarker attachTo [BLU_PL, [0, 0, 3] ];
	};
	if (!isNil "BLU_PL2") then {
		plmarker2 attachTo [BLU_PL2, [0, 0, 3] ];
	};
	if (!isNil "BLU_COY") then {
		coymarker attachTo [BLU_COY, [0, 0, 3] ];
	};
} else {
	deletevehicle aslmarker;
	deletevehicle bslmarker;
	deletevehicle cslmarker;
	deletevehicle dslmarker;
	deletevehicle plmarker;
	deletevehicle plmarker2;
	deletevehicle coymarker;
};

//opf marker add
if (_opforSlots > 10) then {
	//opf markers
	if (!isNil "OPF_ASL") then { 
		aslmarker_1 attachTo [OPF_ASL, [0, 0, 3] ];
	};
	if (!isNil "OPF_BSL") then {
		bslmarker_1 attachTo [OPF_BSL, [0, 0, 3] ]; 
    };
	if (!isNil "OPF_CSL") then {
		cslmarker_1 attachTo [OPF_CSL, [0, 0, 3] ]; 
    };
	if (!isNil "OPF_DSL") then {
		dslmarker_1 attachTo [OPF_DSL, [0, 0, 3] ]; 
	};
	if (!isNil "OPF_PL") then {
		plmarker_1 attachTo [OPF_PL, [0, 0, 3] ];
	};
	if (!isNil "OPF_PL2") then {
		plmarker2_1 attachTo [OPF_PL2, [0, 0, 3] ];
	};
	if (!isNil "OPF_COY") then {
		coymarker_1 attachTo [OPF_COY, [0, 0, 3] ];
	};
} else {
	deletevehicle aslmarker_1;
	deletevehicle bslmarker_1;
	deletevehicle cslmarker_1;
	deletevehicle dslmarker_1;
	deletevehicle plmarker_1;
	deletevehicle plmarker2_1;
	deletevehicle coymarker_1;
};

//ind marker add
if (_indforSlots > 10) then {
	//ind markers
	if (!isNil "IND_ASL") then {
		aslmarker_2 attachTo [IND_ASL, [0, 0, 3] ]; 
	};
	if (!isNil "IND_BSL") then {
		bslmarker_2 attachTo [IND_BSL, [0, 0, 3] ];
    };
	if (!isNil "IND_CSL") then {
		cslmarker_2 attachTo [IND_CSL, [0, 0, 3] ]; \
	};
	if (!isNil "IND_DSL") then {
		dslmarker_2 attachTo [IND_DSL, [0, 0, 3] ]; 
	};
	if (!isNil "IND_PL") then {
		plmarker_2 attachTo [IND_PL, [0, 0, 3] ];
	};
	if (!isNil "IND_PL2") then {
		plmarker2_2 attachTo [IND_PL2, [0, 0, 3] ];
	};
	if (!isNil "IND_COY") then {
		coymarker_2 attachTo [IND_COY, [0, 0, 3] ];
	};
} else {
	deletevehicle aslmarker_2;
	deletevehicle bslmarker_2;
	deletevehicle cslmarker_2;
	deletevehicle dslmarker_2;
	deletevehicle plmarker_2;
	deletevehicle plmarker2_2;
	deletevehicle coymarker_2;
};