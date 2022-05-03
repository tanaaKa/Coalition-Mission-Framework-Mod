// Author: You
// Description: paste your loadout config from the arseanal exporter
// ------------------- PASTE BELOW THIS LINE
// Camo set
#ifdef CAMO_UNIFORM
#else
#define CAMO_UNIFORM "rhs_uniform_FROG01_wd"
#endif

#ifdef CAMO_VEST
#else
#define CAMO_VEST "rhsusf_spc_iar","rhsusf_spc_mg","rhsusf_spc_light","rhsusf_spc_teamleader","rhsusf_spc_marksman","rhsusf_spc_rifleman"
#endif

#ifdef CAMO_BACKPACK
#else
#define CAMO_BACKPACK "rhsusf_assault_eagleaiii_coy"
#endif

#ifdef CAMO_HEADGEAR
#else
#define CAMO_HEADGEAR "rhsusf_lwh_helmet_marpatwd_ess","rhsusf_lwh_helmet_marpatwd_headset","rhsusf_lwh_helmet_marpatwd_headset_blk","rhsusf_lwh_helmet_marpatwd_headset_blk2","rhsusf_lwh_helmet_marpatwd_blk_ess","rhsusf_lwh_helmet_marpatwd"
#endif

// Rifle

#ifdef RIFLE
#else
#define RIFLE "rhs_weap_m27iar_grip"
#endif

#ifdef RIFLE_MAG
#else
#define RIFLE_MAG "rhs_mag_30Rnd_556x45_M855A1_PMAG:6","rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red:4"
#endif

#ifdef RIFLE_ATTACHMENTS
#else
#define RIFLE_ATTACHMENTS "rhsusf_acc_anpeq16a","rhsusf_acc_eotech_552"
#endif

#ifdef AR_ATTACHMENTS
#else
#define AR_ATTACHMENTS RIFLE_ATTACHMENTS,"rhsusf_acc_kac_grip_saw_bipod"
#endif
 
#ifdef ALT_OPTICS
#else
#define ALT_OPTICS STANAG_OPTICS,WARSAW_OPTICS
#endif
// GL Rifle

#ifdef GLRIFLE
#else
#define GLRIFLE "rhs_weap_m16a4_carryhandle_M203"
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
#define GLRIFLE_MAG_SMOKE "1Rnd_Smoke_Grenade_shell:6","1Rnd_SmokeRed_Grenade_shell:4","1Rnd_SmokeBlue_Grenade_shell:4",GLRIFLE_MAG_FLARE
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
#define AR "rhs_weap_m249_pip_L"
#endif

#ifdef AR_MAG
#else
#define AR_MAG "rhsusf_100Rnd_556x45_mixed_soft_pouch:4"
#endif
// AT
#ifdef AT
#else
#define AT "rhs_weap_m72a7"
#endif

#ifdef AT_MAG
#else
#define AT_MAG "rhs_m72a7_mag:1"
#endif
// MMG
#ifdef MMG
#else
#define MMG "rhs_weap_m240B"
#endif

#ifdef MMG_MAG
#else
#define MMG_MAG "rhsusf_100Rnd_762x51_m62_tracer:5"
#endif

#ifdef MMG_ATT
#else
#define MMG_ATT "rhsusf_acc_acog_mdo"
#endif

// MAT
#ifdef MAT
#else
#define MAT "rhs_weap_smaw_green"
#endif

#ifdef MAT_MAG
#else
#define MAT_MAG "rhs_mag_smaw_HEDP:2","rhs_mag_smaw_HEAA","rhs_mag_smaw_SR:3"
#endif

#ifdef MAT_MAG2
#else
#define MAT_MAG2 MAT_MAG2
#endif

#ifdef MAT_OPTIC
#else
#define MAT_OPTIC "rhs_weap_optic_smaw"
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
#define SAM "rhs_weap_fim92"
#endif

#ifdef SAM_MAG
#else
#define SAM_MAG "rhs_fim92_mag:2"
#endif

#ifdef SAM_MAG2
#else
#define SAM_MAG2 SAM_MAG
#endif
// Sniper Rifle
#ifdef SNIPER
#else
#define SNIPER "rhs_weap_m40a5_wd"
#endif

#ifdef SNIPER_MAG
#else
#define SNIPER_MAG "rhsusf_10Rnd_762x51_m118_special_Mag"
#endif

#ifdef SNIPER_ATTACHMENTS
#else
#define SNIPER_ATTACHMENTS "rhsusf_acc_m8541_low_wd","rhsusf_acc_harris_swivel"
#endif
// Spotter Rifle
#ifdef SPOTTER
#else
#define SPOTTER "rhs_weap_m16a4_carryhandle"
#endif

#ifdef SPOTTER_MAG
#else
#define SPOTTER_MAG "rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger:10"
#endif

#ifdef SPOTTER_ATTACHMENTS
#else
#define SPOTTER_ATTACHMENTS "rhsusf_acc_anpeq16a","rhsusf_acc_acog_usmc"
#endif
// SMG
#ifdef SMG
#else
#define SMG "rhs_weap_m4_carryhandle"
#endif

#ifdef SMG_MAG
#else
#define SMG_MAG CARBINE_MAG
#endif
// Pistol
#ifdef PISTOL
#else
#define PISTOL "rhsusf_weap_m9"
#endif

#ifdef PISTOL_MAG
#else
#define PISTOL_MAG "rhsusf_mag_15Rnd_9x19_FMJ:3"
#endif

#ifdef NODS
#else
#define NODS "rhsusf_ANPVS_15"
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

#ifdef GOG
#else
#define GOG ""
#endif

#ifdef MTR_TUBE
#else
#define MTR_TUBE "rhs_M252_Gun_Bag"
#endif

#ifdef MTR_PLATE
#else
#define MTR_PLATE "rhs_M252_Bipod_Bag"
#endif

#define CREW_HEADGEAR "rhsusf_cvc_green_helmet","rhsusf_cvc_green_ess","rhsusf_cvc_green_alt_helmet"

#define PILOT_UNIFORM CAMO_UNIFORM
#define PILOT_BACKPACK "B_Battle_Belt_XL_F"
#define PILOT_VEST "rhsusf_spc_crewman"
#define PILOT_HEADGEAR "rhsusf_hgu56p_visor_mask_skull","rhsusf_hgu56p_visor_mask","rhsusf_hgu56p_visor","rhsusf_hgu56p_mask_skull","rhsusf_hgu56p_mask","rhsusf_hgu56p"

#define SIDE_FACE F_USA
// Specialized Resupply Vehicle Loadouts
// Ammo Truck


#include "base.hpp" // includes the base defines

