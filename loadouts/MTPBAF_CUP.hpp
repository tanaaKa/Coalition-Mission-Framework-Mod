// Author: You
// Description: paste your loadout config from the arseanal exporter

// ------------------- PASTE BELOW THIS LINE
#ifdef CAMO_UNIFORM
#else
#define CAMO_UNIFORM "CUP_U_B_BAF_MTP_UBACSLONG","CUP_U_B_BAF_MTP_UBACSTSHIRTKNEE","CUP_U_B_BAF_MTP_UBACSTSHIRT_Gloves","CUP_U_B_BAF_MTP_UBACSTSHIRT","CUP_U_B_BAF_MTP_UBACSROLLEDKNEE","CUP_U_B_BAF_MTP_UBACSROLLED_Gloves","CUP_U_B_BAF_MTP_UBACSROLLED","CUP_U_B_BAF_MTP_UBACSLONGKNEE_Gloves","CUP_U_B_BAF_MTP_UBACSLONGKNEE","CUP_U_B_BAF_MTP_UBACSLONG_Gloves","CUP_U_B_BAF_MTP_UBACSSEAL"
#endif

#ifdef CAMO_VEST
#else
#define CAMO_VEST "CUP_V_B_BAF_MTP_Osprey_Mk4_Rifleman","CUP_V_B_BAF_MTP_Osprey_Mk4_AutomaticRifleman","CUP_V_B_BAF_MTP_Osprey_Mk4_Engineer","CUP_V_B_BAF_MTP_Osprey_Mk4_Grenadier","CUP_V_B_BAF_MTP_Osprey_Mk4_Scout"
#endif

#ifdef CAMO_BACKPACK
#else
#define CAMO_BACKPACK "CUP_B_Motherlode_MTP","CUP_B_Predator_Radio_MTP","CUP_B_Predator_MTP","CUP_B_Motherlode_Radio_MTP"
#endif

#ifdef CAMO_HEADGEAR
#else
#define CAMO_HEADGEAR "CUP_H_BAF_MTP_Mk7","CUP_H_BAF_MTP_Mk6_NETTING_PRR","CUP_H_BAF_MTP_Mk6_GOGGLES_PRR","CUP_H_BAF_MTP_Mk6_GLASS_PRR","CUP_H_BAF_MTP_Mk6_EMPTY_PRR","CUP_H_BAF_MTP_Mk7_PRR","CUP_H_BAF_MTP_Mk7_PRR_SCRIM_B","CUP_H_BAF_MTP_Mk7_PRR_SCRIM_A","CUP_H_BAF_MTP_Mk6_EMPTY"
#endif

// Rifle

#ifdef RIFLE
#else
#define RIFLE "CUP_arifle_L85A2"
#endif

#ifdef RIFLE_MAG
#else
#define RIFLE_MAG "potato_magazine_556x45_30rnd_tracer_Red:6","potato_magazine_556x45_30rnd_reload_tracer_Red:4"
#endif

#ifdef RIFLE_ATTACHMENTS
#else
#define RIFLE_ATTACHMENTS ""
#endif

#ifdef AR_ATTACHMENTS
#else
#define AR_ATTACHMENTS ""
#endif
 
#ifdef ALT_OPTICS
#else
#define ALT_OPTICS STANAG_OPTICS
#endif
// GL Rifle
#ifdef GLRIFLE
#else
#define GLRIFLE "CUP_arifle_L85A2_GL"
#endif

#ifdef GLRIFLE_MAG
#else
#define GLRIFLE_MAG RIFLE_MAG
#endif

#ifdef GLRIFLE_MAG_FLARE
#else
#define GLRIFLE_MAG_FLARE "UGL_FlareWhite_F:4"
#endif

#ifdef GLRIFLE_MAG_SMOKE
#else
#define GLRIFLE_MAG_SMOKE "1Rnd_Smoke_Grenade_shell:6","1Rnd_SmokeRed_Grenade_shell:4",GLRIFLE_MAG_FLARE
#endif

#ifdef GLRIFLE_MAG_HE
#else
#define GLRIFLE_MAG_HE "1Rnd_HE_Grenade_shell:4"
#endif
// Carbine
#ifdef CARBINE
#else
#define CARBINE RIFLE
#endif

#ifdef CARBINE_MAG
#else
#define CARBINE_MAG RIFLE_MAG
#endif
// AR
#ifdef AR
#else
#define AR "CUP_arifle_L86A2"
#endif

#ifdef AR_MAG
#else
#define AR_MAG "potato_magazine_556x45_100rnd_tracer_Red:4"
#endif
// AT
#ifdef AT
#else
#define AT "CUP_launch_M136"
#endif

#ifdef AT_MAG
#else
#define AT_MAG ""
#endif
// MMG
#ifdef MMG
#else
#define MMG "CUP_lmg_L7A2"
#endif

#ifdef MMG_MAG
#else
#define MMG_MAG "potato_box_762x51_100rnd_tracer_Red:4"
#endif

#ifdef MMG_ATT
#else
#define MMG_ATT "rhsusf_acc_acog"
#endif
// MAT
#ifdef MAT
#else
#define MAT "CUP_launch_MAAWS"
#endif

#ifdef MAT_MAG
#else
#define MAT_MAG "CUP_MAAWS_HEAT_M:2","CUP_MAAWS_HEDP_M"
#endif

#ifdef MAT_MAG2
#else
#define MAT_MAG2 MAT_MAG
#endif

#ifdef MAT_OPTIC
#else
#define MAT_OPTIC "cup_optic_maaws_scope"
#endif
// -------------------- PASTE ABOVE THIS LINE
//HMG
#ifdef HMG
#else
#define HMG "ace_cswCompatCUP_cup_m2"
#endif

#ifdef HMG_TRI_HI
#else
#define HMG_TRI_HI "ace_csw_m3CarryTripod"
#endif

#ifdef HMG_TRI_LO
#else
#define HMG_TRI_LO "ace_csw_m3CarryTripodLow"
#endif


#ifdef HMG_MAG
#else
#define HMG_MAG "ace_csw_100Rnd_127x99_mag:3"
#endif
//HAT
#ifdef HAT
#else
#define HAT "ace_compat_rhs_usf3_tow_carry"
#endif

#ifdef HAT_TRI_HI
#else
#define HAT_TRI_HI "ace_csw_m220CarryTripod"
#endif

#ifdef HAT_TRI_LO
#else
#define HAT_TRI_LO ""
#endif

#ifdef HAT_MAG
#else
#define HAT_MAG "ace_compat_rhs_usf3_mag_ITOW"
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
// Sniper Rifle
#ifdef SNIPER
#else
#define SNIPER "CUP_srifle_L129A1_HG"
#endif

#ifdef SNIPER_MAG
#else
#define SNIPER_MAG "ACE_20Rnd_762x51_M993_AP_Mag:10"
#endif

#ifdef SNIPER_ATTACHMENTS
#else
#define SNIPER_ATTACHMENTS "optic_LRPS","cup_acc_llm_black","cup_bipod_vltor_modpod_black"
#endif
// Spotter Rifle
#ifdef SPOTTER
#else
#define SPOTTER "CUP_arifle_L85A2_G"
#endif

#ifdef SPOTTER_MAG
#else
#define SPOTTER_MAG RIFLE_MAG
#endif

#ifdef SPOTTER_ATTACHMENTS
#else
#define SPOTTER_ATTACHMENTS "cup_optic_acog","cup_acc_llm_black"
#endif
// SMG
#ifdef SMG
#else
#define SMG CARBINE
#endif

#ifdef SMG_MAG
#else
#define SMG_MAG CARBINE_MAG
#endif
// Pistol
#ifdef PISTOL
#else
#define PISTOL "CUP_hgun_Glock17_blk"
#endif

#ifdef PISTOL_MAG
#else
#define PISTOL_MAG "CUP_17Rnd_9x19_glock17:3"
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
#define LINKED BASE_LINKED
#endif

#ifdef LEADER_LINKED
#else
#define LEADER_LINKED BASE_LEADER_LINKED
#endif

#ifdef CARRYALL
#else
#define CARRYALL CAMO_BACKPACK
#endif

#ifdef GOG
#else
#define GOG ""
#endif

#ifdef MTR_TUBE
#else
#define MTR_TUBE "CUP_B_L16A2_Gun_Bag"
#endif

#ifdef MTR_PLATE
#else
#define MTR_PLATE "CUP_B_L16A2_Bipod_Bag"
#endif

#define CREW_HEADGEAR "CUP_H_BAF_MTP_Mk6_CREW_PRR"

#define PILOT_UNIFORM CAMO_UNIFORM
#define PILOT_BACKPACK "B_Battle_Belt_XL_F"
#define PILOT_VEST "CUP_V_B_BAF_MTP_Osprey_Mk4_Officer"
#define PILOT_HEADGEAR "CUP_H_SPH4","CUP_H_SPH4_visor"

#define SIDE_FACE F_GBR
// Specialized Resupply Vehicle Loadouts
// Ammo Truck

#include "base.hpp" // includes the base defines