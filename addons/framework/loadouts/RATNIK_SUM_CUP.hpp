// Author: You
// Description: paste your loadout config from the arseanal exporter
// ------------------- PASTE BELOW THIS LINE
// Camo set
#ifdef CAMO_UNIFORM
#else
#define CAMO_UNIFORM "CUP_U_O_RUS_Ratnik_Summer"
#endif
#ifdef CAMO_VEST
#else
#define CAMO_VEST "CUP_Vest_RUS_6B45_Sh117","CUP_Vest_RUS_6B45_Sh117_VOG","CUP_Vest_RUS_6B45_Sh117_PKP"
#endif
#ifdef CAMO_BACKPACK
#else
#define CAMO_BACKPACK "CUP_O_RUS_Patrol_bag_Summer_Shovel_Engineer","CUP_O_RUS_Patrol_bag_Summer_AT"
#endif
#ifdef CAMO_HEADGEAR
#else
#define CAMO_HEADGEAR "CUP_H_RUS_6B47_v2_GogglesDown_Summer","CUP_H_RUS_6B47_v2_GogglesClosed_Summer","CUP_H_RUS_6B47_v2_Summer","CUP_H_RUS_6B47_v2_GogglesUp_Summer"
#endif
// Rifle
#ifdef RIFLE
#else
#define RIFLE "CUP_arifle_AK12_black_1P87"
#endif
#ifdef RIFLE_MAG
#else
#define RIFLE_MAG "CUP_30Rnd_545x39_AK12_M:6", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK74M_M:4"
#endif
#ifdef RIFLE_ATTACHMENTS
#else
#define RIFLE_ATTACHMENTS "CUP_acc_LLM_black", "CUP_optic_1P87_RIS", "CUP_bipod_VLTOR_Modpod_black"
#endif
#ifdef AR_ATTACHMENTS
#else
#define AR_ATTACHMENTS RIFLE_ATTACHMENTS, "CUP_optic_PechenegScope"
#endif
#ifdef ALT_OPTICS
#else
#define ALT_OPTICS "optic_Aco","CUP_optic_CompM2_Black","CUP_optic_TrijiconRx01_black","CUP_optic_MRad",STANAG_OPTICS,WARSAW_OPTICS
#endif
// GL Rifle
#ifdef GLRIFLE
#else
#define GLRIFLE "CUP_arifle_AK12_GP34_black_OKP7"
#endif
#ifdef GLRIFLE_MAG
#else
#define GLRIFLE_MAG RIFLE_MAG
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
#define CARBINE "CUP_arifle_AK12_black_1P87"
#endif
#ifdef CARBINE_MAG
#else
#define CARBINE_MAG RIFLE_MAG
#endif
// AR
#ifdef AR
#else
#define AR "CUP_arifle_RPK74M_1p78"
#endif
#ifdef AR_MAG
#else
#define AR_MAG "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M:10", "CUP_60Rnd_TE1_Green_Tracer_545x39_AK74M_M:2"
#endif
// AT
#ifdef AT
#else
#define AT "CUP_launch_RPG26_Loaded"
#endif
#ifdef AT_MAG
#else
#define AT_MAG "CUP_RPG26_M:1"
#endif
// MMG
#ifdef MMG
#else
#define MMG "CUP_lmg_Pecheneg_PScope"
#endif
#ifdef MMG_MAG
#else
#define MMG_MAG "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M:5"
#endif
#ifdef MMG_ATT
#else
#define MMG_ATT "CUP_optic_PechenegScope"
#endif
// MAT
#ifdef MAT
#else
#define MAT "CUP_launch_RPG7V_PGO7V3"
#endif
#ifdef MAT_MAG
#else
#define MAT_MAG "CUP_PG7VL_M:1", "CUP_PG7VR_M:1"
#endif
#ifdef MAT_MAG2
#else
#define MAT_MAG2 "CUP_PG7VL_M:1", "CUP_PG7VR_M:1"
#endif
#ifdef MAT_OPTIC
#else
#define MAT_OPTIC "CUP_optic_PGO7V3"
#endif
// HMG
#ifdef HMG
#else
#define HMG "CUP_KORD_carry"
#endif
#ifdef HMG_MAG
#else
#define HMG_MAG ""
#endif
#ifdef HMG_TRI_LO
#else
#define HMG_TRI_LO "ace_csw_kordCarryTripodLow"
#endif
#ifdef HMG_TRI_HI
#else
#define HMG_TRI_HI "ace_csw_kordCarryTripod"
#endif
// HAT
#ifdef HAT
#else
#define HAT "CUP_launch_Metis"
#endif
#ifdef HAT_MAG
#else
#define HAT_MAG "CUP_AT13_M:1"
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
#define SAM "CUP_launch_Igla"
#endif
#ifdef SAM_MAG
#else
#define SAM_MAG ""
#endif
#ifdef SAM_MAG2
#else
#define SAM_MAG2 ""
#endif
#ifdef SAM_OPTIC
#else
#define SAM_OPTIC ""
#endif
// Sniper Rifle
#ifdef SNIPER
#else
#define SNIPER "CUP_srifle_SVD_pso"
#endif
#ifdef SNIPER_MAG
#else
#define SNIPER_MAG "CUP_10Rnd_762x54_SVD_M:20"
#endif
#ifdef SNIPER_ATTACHMENTS
#else
#define SNIPER_ATTACHMENTS "CUP_optic_PSO_1"
#endif
// Spotter Rifle
#ifdef SPOTTER
#else
#define SPOTTER "CUP_arifle_AK12_black_1P901P87"
#endif
#ifdef SPOTTER_MAG
#else
#define SPOTTER_MAG "CUP_30Rnd_545x39_AK12_M:8", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK12_M:2"
#endif
#ifdef SPOTTER_ATTACHMENTS
#else
#define SPOTTER_ATTACHMENTS "CUP_acc_LLM_black", "CUP_optic_1P87_1P90_BLK", "CUP_bipod_VLTOR_Modpod_black"
#endif
// SMG
#ifdef SMG
#else
#define SMG "CUP_arifle_AKS74U"
#endif
#ifdef SMG_MAG
#else
#define SMG_MAG RIFLE_MAG
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
#define MTR_TUBE "CUP_B_Podnos_Gun_Bag"
#endif
#ifdef MTR_PLATE
#else
#define MTR_PLATE "CUP_B_Podnos_Bipod_Bag"
#endif
// Crew Headgear
#ifdef CREW_HEADGEAR
#else
#define CREW_HEADGEAR "H_Tank_black_F"
#endif
// Pilot Uniform
#ifdef PILOT_UNIFORM
#else
#define PILOT_UNIFORM "CUP_U_O_RUS_EMR_1"
#endif
#ifdef PILOT_VEST
#else
#define PILOT_VEST "CUP_Vest_RUS_6B45_Sh117"
#endif
#ifdef PILOT_BACKPACK
#else
#define PILOT_BACKPACK "B_Battle_Belt_XL_F"
#endif
#ifdef PILOT_HEADGEAR
#else
#define PILOT_HEADGEAR "CUP_H_RUS_ZSH_Shield_Up"
#endif
//Misc.
#ifdef GOG
#else
#define GOG "CUP_G_RUS_Balaclava_Ratnik_v2","CUP_G_RUS_Balaclava_Ratnik"
#endif
#ifdef NODS
#else
#define NODS "CUP_NVG_1PN138"
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


