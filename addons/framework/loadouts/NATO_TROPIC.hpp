// Author: You
// Description: paste your loadout config from the arseanal exporter
// ------------------- PASTE BELOW THIS LINE
// Camo set
#ifdef CAMO_UNIFORM
#else
#define CAMO_UNIFORM "U_B_T_Soldier_AR_F","U_B_T_Soldier_F","U_B_T_Soldier_SL_F"
#endif
#ifdef CAMO_VEST
#else
#define CAMO_VEST "V_PlateCarrier2_tna_F","V_PlateCarrier1_tna_F","V_PlateCarrierGL_tna_F"
#endif
#ifdef CAMO_BACKPACK
#else
#define CAMO_BACKPACK "B_Kitbag_rgr_AAR","B_Kitbag_rgr_BTEng_F","B_Kitbag_rgr_BTExp_F","B_Kitbag_rgr_BTAA_F","B_Kitbag_rgr_BTAT_F"
#endif
#ifdef CAMO_HEADGEAR
#else
#define CAMO_HEADGEAR "H_HelmetB_tna_F","H_HelmetB_Light_tna_F","H_HelmetB_Enh_tna_F"
#endif
// Rifle
#ifdef RIFLE
#else
#define RIFLE "arifle_MX_khk_ACO_Pointer_F"
#endif
#ifdef RIFLE_MAG
#else
#define RIFLE_MAG "30Rnd_65x39_caseless_khaki_mag:6","30Rnd_65x39_caseless_khaki_mag_Tracer:4"
#endif
#ifdef RIFLE_ATTACHMENTS
#else
#define RIFLE_ATTACHMENTS "acc_pointer_IR", "optic_holosight_khk_f"
#endif
#ifdef AR_ATTACHMENTS
#else
#define AR_ATTACHMENTS RIFLE_ATTACHMENTS, "acc_pointer_IR", "bipod_01_F_khk"
#endif
#ifdef ALT_OPTICS
#else
#define ALT_OPTICS "optic_Aco","CUP_optic_CompM2_Black","CUP_optic_TrijiconRx01_black","CUP_optic_MRad",STANAG_OPTICS,WARSAW_OPTICS
#endif
// GL Rifle
#ifdef GLRIFLE
#else
#define GLRIFLE "arifle_MX_GL_khk_ACO_F"
#endif
#ifdef GLRIFLE_MAG
#else
#define GLRIFLE_MAG "30Rnd_65x39_caseless_khaki_mag:6","30Rnd_65x39_caseless_khaki_mag_Tracer:4"
#endif
#ifdef GLRIFLE_MAG_FLARE
#else
#define GLRIFLE_MAG_FLARE "UGL_FlareYellow_F:4"
#endif
#ifdef GLRIFLE_MAG_SMOKE
#else
#define GLRIFLE_MAG_SMOKE "1Rnd_Smoke_Grenade_shell:6","1Rnd_SmokeRed_Grenade_shell:4","1Rnd_SmokeBlue_Grenade_shell:4",GLRIFLE_MAG_FLARE
#endif
#ifdef GLRIFLE_MAG_HE
#else
#define GLRIFLE_MAG_HE "1Rnd_HE_Grenade_shell:4"
#endif
// Carbine
#ifdef CARBINE
#else
#define CARBINE "arifle_MXC_khk_Holo_Pointer_F"
#endif
#ifdef CARBINE_MAG
#else
#define CARBINE_MAG "30Rnd_65x39_caseless_khaki_mag:6","30Rnd_65x39_caseless_khaki_mag_Tracer:4"
#endif
// AR
#ifdef AR
#else
#define AR "arifle_MX_SW_khk_Pointer_F"
#endif
#ifdef AR_MAG
#else
#define AR_MAG "100Rnd_65x39_caseless_khaki_mag_tracer:5"
#endif
// AT
#ifdef AT
#else
#define AT "launch_MRAWS_olive_rail_F"
#endif
#ifdef AT_MAG
#else
#define AT_MAG "MRAWS_HEAT_F"
#endif
// MMG
#ifdef MMG
#else
#define MMG "MMG_02_black_F"
#endif
#ifdef MMG_MAG
#else
#define MMG_MAG "130Rnd_338_Mag:4"
#endif
#ifdef MMG_ATT
#else
#define MMG_ATT "acc_pointer_IR", "optic_Hamr", "bipod_01_F_blk"
#endif
// MAT
#ifdef MAT
#else
#define MAT "launch_MRAWS_green_F"
#endif
#ifdef MAT_MAG
#else
#define MAT_MAG "MRAWS_HEAT_F:1", "MRAWS_HE_F:1"
#endif
#ifdef MAT_MAG2
#else
#define MAT_MAG2 "MRAWS_HEAT_F:1", "MRAWS_HE_F:1"
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
#define HMG_MAG ""
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
#define HAT "launch_B_Titan_short_tna_F"
#endif
#ifdef HAT_MAG
#else
#define HAT_MAG "Titan_AT:1", "Titan_AP:1"
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
#define SAM "launch_B_Titan_tna_F"
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
#define SNIPER "arifle_MXM_khk_MOS_Pointer_Bipod_F"
#endif
#ifdef SNIPER_MAG
#else
#define SNIPER_MAG "30Rnd_65x39_caseless_khaki_mag_Tracer:7"
#endif
#ifdef SNIPER_ATTACHMENTS
#else
#define SNIPER_ATTACHMENTS "acc_pointer_IR", "optic_SOS_khk_F", "bipod_01_F_khk"
#endif
// Spotter Rifle
#ifdef SPOTTER
#else
#define SPOTTER "arifle_MX_khk_Hamr_Pointer_F"
#endif
#ifdef SPOTTER_MAG
#else
#define SPOTTER_MAG "30Rnd_65x39_caseless_khaki_mag_Tracer:10"
#endif
#ifdef SPOTTER_ATTACHMENTS
#else
#define SPOTTER_ATTACHMENTS "acc_pointer_IR", "optic_Hamr_khk_F", "bipod_01_F_khk"
#endif
// SMG
#ifdef SMG
#else
#define SMG "SMG_01_Holo_F"
#endif
#ifdef SMG_MAG
#else
#define SMG_MAG "30Rnd_45ACP_Mag_SMG_01:12"
#endif
// Pistol
#ifdef PISTOL
#else
#define PISTOL "hgun_P07_khk_F"
#endif
#ifdef PISTOL_MAG
#else
#define PISTOL_MAG "16Rnd_9x21_Mag:2"
#endif
// MTR
#ifdef MTR_TUBE
#else
#define MTR_TUBE "B_Mortar_01_Weapon_grn_F"
#endif
#ifdef MTR_PLATE
#else
#define MTR_PLATE "B_Mortar_01_support_grn_F"
#endif
// Crew Headgear
#ifdef CREW_HEADGEAR
#else
#define CREW_HEADGEAR "H_HelmetCrew_B"
#endif
// Pilot Uniform
#ifdef PILOT_UNIFORM
#else
#define PILOT_UNIFORM "U_B_HeliPilotCoveralls"
#endif
#ifdef PILOT_VEST
#else
#define PILOT_VEST "V_TacVest_blk"
#endif
#ifdef PILOT_BACKPACK
#else
#define PILOT_BACKPACK "B_Battle_Belt_XL_F"
#endif
#ifdef PILOT_HEADGEAR
#else
#define PILOT_HEADGEAR "H_PilotHelmetHeli_B"
#endif
//Misc.
#ifdef GOG
#else
#define GOG "rhs_googles_yellow","G_Combat","G_Tactical_Black"
#endif
#ifdef NODS
#else
#define NODS "NVGoggles_tna_F"
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


