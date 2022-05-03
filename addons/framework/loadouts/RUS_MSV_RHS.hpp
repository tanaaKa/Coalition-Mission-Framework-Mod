// Author: You
// Description: paste your loadout config from the arseanal exporter
// ------------------- PASTE BELOW THIS LINE

// Camo set
#ifdef CAMO_UNIFORM
#else
#define CAMO_UNIFORM "rhs_uniform_vkpo_gloves_alt","rhs_uniform_vkpo_gloves","rhs_uniform_vkpo_alt","rhs_uniform_vkpo"
#endif
#ifdef CAMO_VEST
#else
#define CAMO_VEST "rhs_6b45_mg","rhs_6b45_grn","rhs_6b45_rifleman_2","rhs_6b45_rifleman"
#endif
#ifdef CAMO_BACKPACK
#else
#define CAMO_BACKPACK "rhs_rk_sht_30_emr","rhs_rk_sht_30_emr_engineer_empty"
#endif
#ifdef CAMO_HEADGEAR
#else
#define CAMO_HEADGEAR "rhs_6b47_emr","rhs_6b47_emr_2","rhs_6b47_emr_1","rhs_6b47_ess_bala","rhs_6b47_ess","rhs_6b47_6B50"
#endif
// Rifle
#ifdef RIFLE
#else
#define RIFLE "rhs_weap_ak74m_dtk"
#endif
#ifdef RIFLE_MAG
#else
#define RIFLE_MAG "rhs_30Rnd_545x39_7N10_AK:10"
#endif
#ifdef RIFLE_ATTACHMENTS
#else
#define RIFLE_ATTACHMENTS "rhs_acc_dtk"
#endif
#ifdef AR_ATTACHMENTS
#else
#define AR_ATTACHMENTS RIFLE_ATTACHMENTS
#endif
#ifdef ALT_OPTICS
#else
#define ALT_OPTICS "optic_Aco","CUP_optic_CompM2_Black","CUP_optic_TrijiconRx01_black","CUP_optic_MRad",STANAG_OPTICS,WARSAW_OPTICS
#endif
// GL Rifle
#ifdef GLRIFLE
#else
#define GLRIFLE "rhs_weap_ak74m_gp25_1p63"
#endif
#ifdef GLRIFLE_MAG
#else
#define GLRIFLE_MAG "rhs_30Rnd_545x39_7N10_AK:10"
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
#define CARBINE "rhs_weap_aks74n_2"
#endif
#ifdef CARBINE_MAG
#else
#define CARBINE_MAG "rhs_30Rnd_545x39_7N10_AK:10"
#endif
// AR
#ifdef AR
#else
#define AR "rhs_weap_rpk74m"
#endif
#ifdef AR_MAG
#else
#define AR_MAG "rhs_60Rnd_545X39_AK_Green:9"
#endif
// AT
#ifdef AT
#else
#define AT "rhs_weap_rpg26"
#endif
#ifdef AT_MAG
#else
#define AT_MAG "rhs_rpg26_mag:1"
#endif
// MMG
#ifdef MMG
#else
#define MMG "rhs_weap_pkp"
#endif
#ifdef MMG_MAG
#else
#define MMG_MAG "rhs_100Rnd_762x54mmR:5"
#endif
#ifdef MMG_ATT
#else
#define MMG_ATT ""
#endif
// MAT
#ifdef MAT
#else
#define MAT "rhs_weap_rpg7_pgo"
#endif
#ifdef MAT_MAG
#else
#define MAT_MAG "rhs_rpg7_PG7VL_mag:2", "rhs_rpg7_PG7VR_mag:1"
#endif
#ifdef MAT_MAG2
#else
#define MAT_MAG2 "rhs_rpg7_PG7VL_mag:2", "rhs_rpg7_PG7VR_mag:1"
#endif
#ifdef MAT_OPTIC
#else
#define MAT_OPTIC "rhs_acc_pgo7v3"
#endif

// HMG
#ifdef HMG
#else
#define HMG "ace_compat_rhs_afrf3_nsv_carry"
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
#define HAT "ace_compat_rhs_afrf3_kornet_carry"
#endif
#ifdef HAT_MAG
#else
#define HAT_MAG ""
#endif
#ifdef HAT_TRI_LO
#else
#define HAT_TRI_LO "ace_csw_kordCarryTripodLow"
#endif
#ifdef HAT_TRI_HI
#else
#define HAT_TRI_HI "ace_csw_kordCarryTripod"
#endif

// SAM
#ifdef SAM
#else
#define SAM "rhs_weap_igla"
#endif
#ifdef SAM_MAG
#else
#define SAM_MAG "rhs_mag_9k38_rocket:2"
#endif
#ifdef SAM_MAG2
#else
#define SAM_MAG2 "rhs_mag_9k38_rocket:2"
#endif
#ifdef SAM_OPTIC
#else
#define SAM_OPTIC ""
#endif

// Sniper Rifle
#ifdef SNIPER
#else
#define SNIPER "rhs_weap_svdp_pso1"
#endif
#ifdef SNIPER_MAG
#else
#define SNIPER_MAG "rhs_10Rnd_762x54mmR_7N1:20"
#endif
#ifdef SNIPER_ATTACHMENTS
#else
#define SNIPER_ATTACHMENTS "rhs_acc_pso1m2"
#endif

// Spotter Rifle
#ifdef SPOTTER
#else
#define SPOTTER "rhs_weap_ak74m"
#endif
#ifdef SPOTTER_MAG
#else
#define SPOTTER_MAG "rhs_30Rnd_545x39_7N10_AK:10"
#endif
#ifdef SPOTTER_ATTACHMENTS
#else
#define SPOTTER_ATTACHMENTS "rhs_acc_perst1ik", "rhs_acc_1p78"
#endif

// SMG
#ifdef SMG
#else
#define SMG "rhs_weap_aks74u"
#endif
#ifdef SMG_MAG
#else
#define SMG_MAG "rhs_30Rnd_545x39_7N10_AK:1"
#endif

// Pistol
#ifdef PISTOL
#else
#define PISTOL "rhs_weap_makarov_pm"
#endif
#ifdef PISTOL_MAG
#else
#define PISTOL_MAG "rhs_mag_9x18_8_57N181S:3"
#endif

// MTR
#ifdef MTR_TUBE
#else
#define MTR_TUBE "RHS_Podnos_Gun_Bag"
#endif
#ifdef MTR_PLATE
#else
#define MTR_PLATE "RHS_Podnos_Bipod_Bag"
#endif

// Crew Headgear
#ifdef CREW_HEADGEAR
#else
#define CREW_HEADGEAR "rhs_6b48"
#endif

// Pilot Uniform
#ifdef PILOT_UNIFORM
#else
#define PILOT_UNIFORM "rhs_uniform_df15"
#endif
#ifdef PILOT_VEST
#else
#define PILOT_VEST "rhs_6b45_off"
#endif
#ifdef PILOT_BACKPACK
#else
#define PILOT_BACKPACK "B_Battle_Belt_XL_F"
#endif
#ifdef PILOT_HEADGEAR
#else
#define PILOT_HEADGEAR "rhs_zsh7a_mike_green"
#endif

#ifdef GOG
#else
#define GOG ""
#endif

#ifdef NODS
#else
#define NODS "rhs_1PN138"
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

#define SIDE_FACE F_RUS
// Specialized Resupply Vehicle Loadouts
// Ammo Truck


#include "base.hpp" // includes the base defines

