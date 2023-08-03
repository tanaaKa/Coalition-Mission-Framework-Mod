// common defines

// RADIOS
#define RADIO_SR "ACRE_PRC343"
#define RADIO_MR "ACRE_PRC148"
#define RADIO_LR "ACRE_PRC117F"

// GEAR
#define BASE_MEDICAL "ACE_elasticBandage:2","ACE_packingBandage:2","ACE_tourniquet:2","ACE_splint","kat_aatKit","kat_guedel","kat_chestSeal"
#define CLS_MEDICAL "ACE_elasticBandage:8","ACE_packingBandage:8","ACE_tourniquet:4","ACE_splint:6","kat_aatKit:2","kat_guedel:2","kat_chestSeal:2","kat_Painkiller"
#define MEDIC_MEDICAL "ACE_packingBandage:20","ACE_elasticBandage:20","ACE_splint:8","ACE_tourniquet:6","ACE_plasmaIV_500:4","kat_accuvac","kat_Pulseoximeter","kat_larynx:2","kat_aatKit:10","kat_guedel:5","kat_stethoscope","kat_chestSeal:10","kat_IO_FAST:5","kat_IV_16:15","ACE_morphine:8","ACE_epinephrine:8","ACE_adenosine:8","kat_Carbonate","kat_Painkiller","kat_nitroglycerin:4","kat_norepinephrine:4","kat_phenylephrine:4","kat_TXA:8","kat_atropine:4","kat_amiodarone:4","kat_naloxone","kat_lidocaine:4"
#define BASE_TOOLS "ACE_MapTools","ACE_IR_Strobe_item:2","ACE_Flashlight_XL50","ACE_SpraypaintRed","ACE_CableTie:2"
#define BASE_LEADER_TOOLS "ACE_personalAidKit","ACE_Fortify","ACE_microDAGR"
#define BASE_NODS ""
#define BASE_LINKED "ItemMap","ItemCompass","ItemWatch"
#define BASE_LEADER_LINKED ""
#define BASE_FRAG "HandGrenade:2"
#define BASE_SMOKES "SmokeShell:2"
#define BASE_GRENADES BASE_FRAG,BASE_SMOKES
#define LEADER_SMOKES BASE_SMOKES,"SmokeShellGreen:2","SmokeShellPurple"
#define MEDIC_GRENADES BASE_SMOKES,BASE_SMOKES,"SmokeShellPurple:2"
#define CREW_GRENADES BASE_SMOKES,"SmokeShellGreen:2"
#define BASE_ENG "ACE_DefusalKit"
#define BASE_EXP "DemoCharge_Remote_Mag:3","SatchelCharge_Remote_Mag:2","ACE_Clacker"
#define BASE_MINE "ATMine_Range_Mag:2","APERSBoundingMine_Range_Mag:2","APERSMine_Range_Mag:2"
#define MINE_DETECTOR "ACE_VMM3"
#define BINOS "Binocular"
#define RANGE_FINDER "ACE_Vector"
#define LASER "Laserdesignator_03"
#define LASER_BATTERY "Laserbatteries"
#define BASE_BALLISTICS "ACE_ATragMX","ACE_Kestrel4500"
#define BASE_ARTILLERY "ACE_artilleryTable",BASE_BALLISTICS
#define VZ99 "potato_vz99_carryWeapon"
#define VZ99HE "potato_vz99_HE:6"

// OPTIX
#define WARSAW_OPTICS "cup_optic_1p63","cup_optic_ekp_8_02","cup_optic_okp_7","cup_optic_pso_1_1_open","rhs_acc_rakurspm","rhs_acc_1p87","rhs_acc_ekp8_18"
#define STANAG_OPTICS WARSAW_OPTICS,"hlc_optic_docterr","rhsusf_acc_eotech_552","rhsusf_acc_compm4","optic_aco_grn","optic_holosight","cup_optic_compm2_low","cup_optic_mars","rhsusf_acc_mrds","rhsusf_acc_rx01_nofilter","cup_optic_zddot","cup_optic_mepro_tri_clear","cup_optic_mepro_openx_orange","cup_optic_mepro","cup_optic_trijiconrx01_black","cup_optic_vortexrazor_uh1_black","cup_optic_zeisszpoint"

// FUNCTIONS
#define SAM_GEAR(BACKPACK,MAG) backpack[] = {BACKPACK}; backpackItems[] = {}; magazines[] += {MAG}; items[] += {BASE_MEDICAL};
#define MORTAR_GEAR(BACKPACK) backpack[] = {BACKPACK}; items[] += {BASE_ARTILLERY};

// FACES
#define F_C "WhiteHead_04","WhiteHead_08","WhiteHead_02","WhiteHead_18","WhiteHead_12","WhiteHead_13","WhiteHead_16","WhiteHead_27" // Caucasian
#define F_G "GreekHead_A3_06","GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_03"                     // Mediterranean (Greek)
#define F_M "PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","PersianHead_A3_02"             // Middle-Eastern
#define F_P "AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_06","AsianHead_A3_07"   // East-Asian
#define F_A "AfricanHead_01","AfricanHead_02","AfricanHead_03","TanoanHead_A3_01","TanoanHead_A3_08"   // African  

// NATIONALITIES
// North African - Mixed, Middle-Eastern/African 
#define MIXED "PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","AfricanHead_01","AfricanHead_02","AfricanHead_03"
// North-American - Mixed, Caucasian/African/Asian/Middle-Eastern 
#define F_USA "WhiteHead_04","WhiteHead_18","WhiteHead_02","WhiteHead_04","WhiteHead_18","WhiteHead_02","WhiteHead_06","WhiteHead_03","WhiteHead_02","AfricanHead_01","AfricanHead_02","AfricanHead_03","AfricanHead_01","AfricanHead_02","TanoanHead_A3_08","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03" 
// Russian - Mixed, Caucasian/Asian
#define F_RUS "WhiteHead_04","WhiteHead_04","WhiteHead_02","WhiteHead_04","WhiteHead_18","WhiteHead_02","WhiteHead_04","WhiteHead_08","WhiteHead_02","WhiteHead_06","WhiteHead_08","WhiteHead_02","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03"
// British - Mixed, Caucasian/Middle-Eastern/African
#define F_GBR "WhiteHead_04","WhiteHead_03","WhiteHead_02","WhiteHead_04","WhiteHead_03","WhiteHead_02","WhiteHead_04","WhiteHead_08","WhiteHead_02","AfricanHead_01","AfricanHead_02","AfricanHead_03","PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"
// French - Mixed, Caucasian/Middle-Eastern/African
#define F_FRA "WhiteHead_04","WhiteHead_06","WhiteHead_08","WhiteHead_06","WhiteHead_03","WhiteHead_02","WhiteHead_04","WhiteHead_03","WhiteHead_02","GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_03","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"
// Greek - Caucasian/Mediterranean
#define F_MED "GreekHead_A3_06","GreekHead_A3_11","GreekHead_A3_02","GreekHead_A3_12","GreekHead_A3_13","GreekHead_A3_02","GreekHead_A3_03","WhiteHead_06","WhiteHead_03","WhiteHead_02" 
// Mixed - All
#define F_MN F_C,F_M,F_P,F_A,F_G


/* VOICES */
#define FARSI "Male01PER","Male02PER","Male03PER"
#define IND_ENG "Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE" 
#define ENG "Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG" 
#define POL "Male01POL","Male02POL","Male03POL", 
#define BRI_ENG "Male01ENGB","Male02ENGB","Male03ENGB","Male04ENGB","Male05ENGB" 
#define CHI "Male01CHI","Male02CHI","Male03CHI" 
#define RUS "Male01RUS","Male02RUS","Male03RUS" 
#define FRE "Male01FRE","Male02FRE","Male03FRE" 
#define FRE_ENG "Male01ENGFRE","Male02ENGFRE" 
#define R_RUS "RHS_Male01RUS","RHS_Male02RUS","RHS_Male03RUS","RHS_Male04RUS","RHS_Male05RUS" 
#define R_CZ "RHS_Male01CZ","RHS_Male02CZ","RHS_Male03CZ","RHS_Male04CZ","RHS_Male05CZ" 
#define C_RUS "CUP_D_Male01_RU","CUP_D_Male02_RU","CUP_D_Male03_RU","CUP_D_Male04_RU","CUP_D_Male05_RU" 
#define C_TAK "CUP_D_Male01_TK","CUP_D_Male02_TK","CUP_D_Male03_TK","CUP_D_Male04_TK","CUP_D_Male05_TK" 
#define C_CZ "CUP_D_Male01_CZ","CUP_D_Male02_CZ","CUP_D_Male03_CZ","CUP_D_Male04_CZ","CUP_D_Male05_CZ" 
#define ALL_RUS RUS,R_RUS,C_RUS