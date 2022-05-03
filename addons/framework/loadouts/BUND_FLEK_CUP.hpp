// Author: jkl25
// Description: paste your loadout config from the arseanal exporter
// ------------------- PASTE BELOW THIS LINE
// Camo set
#ifdef CAMO_UNIFORM
#else
#define CAMO_UNIFORM "CUP_U_B_GER_Flecktarn_6","CUP_U_B_GER_Flecktarn_5","CUP_U_B_GER_Flecktarn_2"
#endif
#ifdef CAMO_VEST
#else
#define CAMO_VEST "CUP_V_B_GER_PVest_Fleck_RFL_LT","CUP_V_B_GER_PVest_Fleck_RFL","CUP_V_B_GER_PVest_Fleck_MG_LT","CUP_V_B_GER_PVest_Fleck_TL","CUP_V_B_GER_PVest_Fleck_Gren_LT","CUP_V_B_GER_PVest_Fleck_Med_LT"
#endif
#ifdef CAMO_BACKPACK
#else
#define CAMO_BACKPACK "CUP_B_GER_Backpack_PZF_Fleck","CUP_B_GER_Backpack_AmmoBearer_Fleck","CUP_B_GER_Backpack_ATAssist_Fleck","CUP_B_GER_Backpack_AT_Fleck","CUP_B_GER_Backpack_Engineer_Fleck","CUP_B_GER_Backpack_MG3_Fleck","CUP_B_GER_Pack_Flecktarn","CUP_B_GER_Backpack_GL_Fleck"
#endif
#ifdef CAMO_HEADGEAR
#else
#define CAMO_HEADGEAR "CUP_H_Ger_M92_Cover_GG_CB","CUP_H_Ger_M92_Cover_GG","CUP_H_Ger_M92_Cover","CUP_H_Ger_M92_Cover_GG_CF"
#endif
// Rifle
#ifdef RIFLE
#else
#define RIFLE "CUP_arifle_G36KA3"
#endif
#ifdef RIFLE_MAG
#else
#define RIFLE_MAG "CUP_30Rnd_TE1_Red_Tracer_556x45_G36:10"
#endif
#ifdef RIFLE_ATTACHMENTS
#else
#define RIFLE_ATTACHMENTS "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", "CUP_Bipod_G36"
#endif
#ifdef AR_ATTACHMENTS
#else
#define AR_ATTACHMENTS RIFLE_ATTACHMENTS, "CUP_optic_HoloBlack"
#endif
#ifdef ALT_OPTICS
#else
#define ALT_OPTICS "optic_Aco","CUP_optic_CompM2_Black","CUP_optic_TrijiconRx01_black","CUP_optic_MRad",STANAG_OPTICS,WARSAW_OPTICS
#endif
// GL Rifle
#ifdef GLRIFLE
#else
#define GLRIFLE "CUP_arifle_G36K_RIS_AG36"
#endif
#ifdef GLRIFLE_MAG
#else
#define GLRIFLE_MAG "CUP_30Rnd_TE1_Red_Tracer_556x45_G36:10"
#endif
#ifdef GLRIFLE_MAG_FLARE
#else
#define GLRIFLE_MAG_FLARE "UGL_FlareYellow_F:4"
#endif
#ifdef GLRIFLE_MAG_SMOKE
#else
#define GLRIFLE_MAG_SMOKE "1Rnd_Smoke_Grenade_shell:6","1Rnd_SmokeRed_Grenade_shell:4","1Rnd_SmokePurple_Grenade_shell:4",GLRIFLE_MAG_FLARE
#endif
#ifdef GLRIFLE_MAG_HE
#else
#define GLRIFLE_MAG_HE "1Rnd_HE_Grenade_shell:4"
#endif
// Carbine
#ifdef CARBINE
#else
#define CARBINE "CUP_arifle_G36CA3_grip"
#endif
#ifdef CARBINE_MAG
#else
#define CARBINE_MAG "CUP_30Rnd_TE1_Red_Tracer_556x45_G36:10"
#endif
// AR
#ifdef AR
#else
#define AR "CUP_arifle_MG36_holo"
#endif
#ifdef AR_MAG
#else
#define AR_MAG "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag:5"
#endif
// AT
#ifdef AT
#else
#define AT "CUP_launch_HCPF3_Loaded"
#endif
#ifdef AT_MAG
#else
#define AT_MAG "CUP_PTFHC_M:1"
#endif
// MMG
#ifdef MMG
#else
#define MMG "CUP_lmg_MG3"
#endif
#ifdef MMG_MAG
#else
#define MMG_MAG "CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M:5"
#endif
#ifdef MMG_ATT
#else
#define MMG_ATT ""
#endif
// MAT
#ifdef MAT
#else
#define MAT "CUP_launch_MAAWS_Scope"
#endif
#ifdef MAT_MAG
#else
#define MAT_MAG "CUP_MAAWS_HEAT_M:1", "CUP_MAAWS_HEDP_M:1"
#endif
#ifdef MAT_MAG2
#else
#define MAT_MAG2 "CUP_MAAWS_HEAT_M:1", "CUP_MAAWS_HEDP_M:1"
#endif
#ifdef MAT_OPTIC
#else
#define MAT_OPTIC "CUP_optic_MAAWS_Scope"
#endif
// HMG
#ifdef HMG
#else
#define HMG "CUP_m2_carry"
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
#define HAT "CUP_launch_Javelin"
#endif
#ifdef HAT_MAG
#else
#define HAT_MAG "CUP_Javelin_M:1"
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
#define SAM "CUP_launch_FIM92Stinger"
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
#define SNIPER "CUP_arifle_HK417_20_Scope"
#endif
#ifdef SNIPER_MAG
#else
#define SNIPER_MAG "CUP_20Rnd_762x51_HK417:8", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_HK417:2"
#endif
#ifdef SNIPER_ATTACHMENTS
#else
#define SNIPER_ATTACHMENTS "CUP_optic_SB_11_4x20_PM"
#endif
// Spotter Rifle
#ifdef SPOTTER
#else
#define SPOTTER "CUP_arifle_G36A"
#endif
#ifdef SPOTTER_MAG
#else
#define SPOTTER_MAG "CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36:10"
#endif
#ifdef SPOTTER_ATTACHMENTS
#else
#define SPOTTER_ATTACHMENTS "CUP_acc_ANPEQ_15_Top_Flashlight_Black_L", "CUP_optic_G36DualOptics", "CUP_Bipod_G36"
#endif
// SMG
#ifdef SMG
#else
#define SMG "CUP_smg_MP7_zeiss"
#endif
#ifdef SMG_MAG
#else
#define SMG_MAG "CUP_40Rnd_46x30_MP7:8"
#endif
// Pistol
#ifdef PISTOL
#else
#define PISTOL "CUP_hgun_glock17_flashlight"
#endif
#ifdef PISTOL_MAG
#else
#define PISTOL_MAG "CUP_17Rnd_9x19_glock17:2"
#endif
// MTR
#ifdef MTR_TUBE
#else
#define MTR_TUBE "CUP_B_M252_Gun_Bag"
#endif
#ifdef MTR_PLATE
#else
#define MTR_PLATE "CUP_B_M252_Bipod_Bag"
#endif
// Crew Headgear
#ifdef CREW_HEADGEAR
#else
#define CREW_HEADGEAR "H_HelmetCrew_I"
#endif
// Pilot Uniform
#ifdef PILOT_UNIFORM
#else
#define PILOT_UNIFORM "CUP_U_B_GER_Fleck_Overalls_Pilot"
#endif
#ifdef PILOT_VEST
#else
#define PILOT_VEST "CUP_V_B_LBT_LBV_OD"
#endif
#ifdef PILOT_BACKPACK
#else
#define PILOT_BACKPACK "B_Battle_Belt_XL_F"
#endif
#ifdef PILOT_HEADGEAR
#else
#define PILOT_HEADGEAR "CUP_H_SPH4_grey"
#endif
//Misc.
#ifdef GOG
#else
#define GOG "CUP_G_PMC_Facewrap_Black_Glasses_Dark","CUP_G_Oakleys_Embr","CUP_G_PMC_Facewrap_Tropical_Glasses_Dark","CUP_PMC_Facewrap_Black","CUP_G_PMC_Facewrap_Black_Glasses_Ember","CUP_PMC_Facewrap_Tropical","CUP_G_Oakleys_Drk"
#endif
#ifdef NODS
#else
#define NODS "CUP_NVG_HMNVS"
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
