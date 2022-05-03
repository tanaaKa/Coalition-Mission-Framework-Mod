// Author: jkl25
// Description: paste your loadout config from the arseanal exporter
// ------------------- PASTE BELOW THIS LINE

// Camo set
#ifdef CAMO_UNIFORM
#else
#define CAMO_UNIFORM "U_O_CombatUniform_ocamo"
#endif
#ifdef CAMO_VEST
#else
#define CAMO_VEST "V_HarnessO_brn","V_HarnessOGL_brn","V_Chestrig_khk"
#endif
#ifdef CAMO_BACKPACK
#else
#define CAMO_BACKPACK "B_FieldPack_ocamo_Medic","B_FieldPack_cbr"
#endif
#ifdef CAMO_HEADGEAR
#else
#define CAMO_HEADGEAR "H_HelmetO_ocamo","H_HelmetSpecO_ocamo","H_HelmetLeaderO_ocamo"
#endif
// Rifle
#ifdef RIFLE
#else
#define RIFLE "arifle_Katiba_ACO_F"
#endif
#ifdef RIFLE_MAG
#else
#define RIFLE_MAG "30Rnd_65x39_caseless_green:6","30Rnd_65x39_caseless_green_mag_Tracer:4"
#endif
#ifdef RIFLE_ATTACHMENTS
#else
#define RIFLE_ATTACHMENTS "optic_ACO_grn"
#endif
#ifdef AR_ATTACHMENTS
#else
#define AR_ATTACHMENTS RIFLE_ATTACHMENTS, "acc_pointer_IR"
#endif
#ifdef ALT_OPTICS
#else
#define ALT_OPTICS "optic_Aco","CUP_optic_CompM2_Black","CUP_optic_TrijiconRx01_black","CUP_optic_MRad",STANAG_OPTICS,WARSAW_OPTICS
#endif
// GL Rifle
#ifdef GLRIFLE
#else
#define GLRIFLE "arifle_Katiba_GL_ACO_F"
#endif
#ifdef GLRIFLE_MAG
#else
#define GLRIFLE_MAG "30Rnd_65x39_caseless_green:6","30Rnd_65x39_caseless_green_mag_Tracer:4"
#endif
#ifdef GLRIFLE_MAG_FLARE
#else
#define GLRIFLE_MAG_FLARE "UGL_FlareYellow_F:4"
#endif
#ifdef GLRIFLE_MAG_SMOKE
#else
#define GLRIFLE_MAG_SMOKE "1Rnd_Smoke_Grenade_shell:6","1Rnd_SmokeRed_Grenade_shell:4","1Rnd_SmokeOrange_Grenade_shell:4",GLRIFLE_MAG_FLARE
#endif
#ifdef GLRIFLE_MAG_HE
#else
#define GLRIFLE_MAG_HE "1Rnd_HE_Grenade_shell:4"
#endif
// Carbine
#ifdef CARBINE
#else
#define CARBINE "arifle_Katiba_C_ACO_pointer_F"
#endif
#ifdef CARBINE_MAG
#else
#define CARBINE_MAG "30Rnd_65x39_caseless_green:6","30Rnd_65x39_caseless_green_mag_Tracer:4"
#endif
// AR
#ifdef AR
#else
#define AR "LMG_Zafir_pointer_F"
#endif
#ifdef AR_MAG
#else
#define AR_MAG "150Rnd_762x54_Box_Tracer:4"
#endif
// AT
#ifdef AT
#else
#define AT "launch_RPG32_F"
#endif
#ifdef AT_MAG
#else
#define AT_MAG "RPG32_F:1"
#endif
// MMG
#ifdef MMG
#else
#define MMG "MMG_01_hex_ARCO_LP_F"
#endif
#ifdef MMG_MAG
#else
#define MMG_MAG "150Rnd_93x64_Mag:4"
#endif
#ifdef MMG_ATT
#else
#define MMG_ATT "acc_pointer_IR", "optic_Arco", "bipod_02_F_hex"
#endif
// MAT
#ifdef MAT
#else
#define MAT "launch_O_Vorona_brown_F"
#endif
#ifdef MAT_MAG
#else
#define MAT_MAG "Vorona_HEAT:1"
#endif
#ifdef MAT_MAG2
#else
#define MAT_MAG2 "Vorona_HEAT:1"
#endif
#ifdef MAT_OPTIC
#else
#define MAT_OPTIC ""
#endif
// HMG
#ifdef HMG
#else
#define HMG "ace_csw_staticHMGCarry"
#endif
#ifdef HMG_MAG
#else
#define HMG_MAG 
#endif
#ifdef HMG_TRI_LO
#else
#define HMG_TRI_LO "ace_csw_m3CarryTripodLow"
#endif
#ifdef HMG_TRI_HI
#else
#define HMG_TRI_HI "ace_csw_m3CarryTripod"
#endif
// HAT
#ifdef HAT
#else
#define HAT "launch_O_Titan_short_F"
#endif
#ifdef HAT_MAG
#else
#define HAT_MAG "Titan_AT:1"
#endif
#ifdef HAT_TRI_LO
#else
#define HAT_TRI_LO ""
#endif
#ifdef HAT_TRI_HI
#else
#define HAT_TRI_HI ""
#endif
// SAM
#ifdef SAM
#else
#define SAM "launch_O_Titan_F"
#endif
#ifdef SAM_MAG
#else
#define SAM_MAG "Titan_AA:2"
#endif
#ifdef SAM_MAG2
#else
#define SAM_MAG2 "Titan_AA:2"
#endif
#ifdef SAM_OPTIC
#else
#define SAM_OPTIC ""
#endif
// Sniper Rifle
#ifdef SNIPER
#else
#define SNIPER "srifle_DMR_01_DMS_BI_F"
#endif
#ifdef SNIPER_MAG
#else
#define SNIPER_MAG "10Rnd_762x54_Mag:20"
#endif
#ifdef SNIPER_ATTACHMENTS
#else
#define SNIPER_ATTACHMENTS "optic_dms", "bipod_02_F_blk"
#endif
// Spotter Rifle
#ifdef SPOTTER
#else
#define SPOTTER "arifle_Katiba_ARCO_pointer_F"
#endif
#ifdef SPOTTER_MAG
#else
#define SPOTTER_MAG "30Rnd_65x39_caseless_green:6","30Rnd_65x39_caseless_green_mag_Tracer:4"
#endif
#ifdef SPOTTER_ATTACHMENTS
#else
#define SPOTTER_ATTACHMENTS "acc_pointer_IR", "optic_Arco_blk_F"
#endif
// SMG
#ifdef SMG
#else
#define SMG "SMG_02_ACO_F"
#endif
#ifdef SMG_MAG
#else
#define SMG_MAG "30Rnd_9x21_Mag_SMG_02_Tracer_Green:10"
#endif
// Pistol
#ifdef PISTOL
#else
#define PISTOL "hgun_Rook40_F"
#endif
#ifdef PISTOL_MAG
#else
#define PISTOL_MAG "16Rnd_9x21_Mag:2"
#endif
// MTR
#ifdef MTR_TUBE
#else
#define MTR_TUBE "O_Mortar_01_weapon_F"
#endif
#ifdef MTR_PLATE
#else
#define MTR_PLATE "O_Mortar_01_support_F"
#endif
// Crew Headgear
#ifdef CREW_HEADGEAR
#else
#define CREW_HEADGEAR "H_HelmetCrew_O"
#endif
// Pilot Uniform
#ifdef PILOT_UNIFORM
#else
#define PILOT_UNIFORM "U_O_PilotCoveralls"
#endif
#ifdef PILOT_VEST
#else
#define PILOT_VEST "V_HarnessO_brn"
#endif
#ifdef PILOT_BACKPACK
#else
#define PILOT_BACKPACK "B_Battle_Belt_XL_F"
#endif
#ifdef PILOT_HEADGEAR
#else
#define PILOT_HEADGEAR "H_PilotHelmetFighter_O"
#endif
//Misc.
#ifdef GOG
#else
#define GOG 
#endif
#ifdef NODS
#else
#define NODS "NVGoggles_OPFOR"
#endif

// Grenades
#ifdef LEADER_GRENADES
#else
#define LEADER_GRENADES BASE_FRAG,LEADER_SMOKES,SIDE_CHEM_LIGHT
#endif
// Gear
#ifdef TOOLS
#else
#define TOOLS BASE_TOOLS
#endif

#ifdef LEADER_TOOLS
#else
#define LEADER_TOOLS BASE_LEADER_TOOLS,SIDE_KEY
#endif

#ifdef LINKED
#else
#define LINKED BASE_LINKED,NODS
#endif

#ifdef LEADER_LINKED
#else
#define LEADER_LINKED BASE_LEADER_LINKED
#endif

#ifdef CARRYALL
#else
#define CARRYALL CAMO_BACKPACK
#endif

#define SIDE_FACE 

#include "base.hpp" // includes the base defines


