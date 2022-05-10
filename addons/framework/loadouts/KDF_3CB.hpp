// Author: You
// Description: paste your loadout config from the arseanal exporter
// ------------------- PASTE BELOW THIS LINE
// Camo set
#ifdef CAMO_UNIFORM
#else
#define CAMO_UNIFORM "UK3CB_KDF_O_U_CombatUniform_01_VSR","UK3CB_KDF_B_U_CombatUniform_01_VSR","UK3CB_KDF_B_U_CombatUniform_02_VSR"
#endif

#ifdef CAMO_VEST
#else
#define CAMO_VEST "rhs_6b3_AK","rhs_6b3_AK_3","rhs_6b3_AK_2","rhs_6b3_VOG_2","rhs_6b3_VOG","rhs_6b3_RPK"
#endif

#ifdef CAMO_BACKPACK
#else
#define CAMO_BACKPACK "UK3CB_KDF_O_B_Sidor_RIF_OLI"
#endif

#ifdef CAMO_HEADGEAR
#else
#define CAMO_HEADGEAR "rhsgref_ssh68_vsr"
#endif

// Rifle

#ifdef RIFLE
#else
#define RIFLE "rhs_weap_aks74n_2"
#endif

#ifdef RIFLE_MAG
#else
#define RIFLE_MAG "rhs_30Rnd_545x39_7N6M_plum_AK:6","rhs_30Rnd_545x39_AK_plum_green:4"
#endif

#ifdef RIFLE_ATTACHMENTS
#else
#define RIFLE_ATTACHMENTS "rhs_acc_dtk1983"
#endif

#ifdef AR_ATTACHMENTS
#else
#define AR_ATTACHMENTS RIFLE_ATTACHMENTS
#endif
 
#ifdef ALT_OPTICS
#else
#define ALT_OPTICS STANAG_OPTICS,WARSAW_OPTICS
#endif
// GL Rifle

#ifdef GLRIFLE
#else
#define GLRIFLE "rhs_weap_ak74n_2_gp25"
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
#define GLRIFLE_MAG_SMOKE "1Rnd_Smoke_Grenade_shell:6","1Rnd_SmokeRed_Grenade_shell:4","1Rnd_SmokePurple_Grenade_shell:4",GLRIFLE_MAG_FLARE
#endif

#ifdef GLRIFLE_MAG_HE
#else
#define GLRIFLE_MAG_HE "1Rnd_HE_Grenade_shell:4"
#endif

// Carbine
#ifdef CARBINE
#else
#define CARBINE "rhs_weap_aks74_2"
#endif

#ifdef CARBINE_MAG
#else
#define CARBINE_MAG RIFLE_MAG
#endif
// AR
#ifdef AR
#else
#define AR "UK3CB_RPK_74N_PLUM"
#endif

#ifdef AR_MAG
#else
#define AR_MAG "UK3CB_RPK74_60rnd_545x39_GM:7"
#endif
// AT
#ifdef AT
#else
#define AT "rhs_weap_rpg26"
#endif

#ifdef AT_MAG
#else
#define AT_MAG 
#endif
// MMG
#ifdef MMG
#else
#define MMG "rhs_weap_pkm"
#endif

#ifdef MMG_MAG
#else
#define MMG_MAG "rhs_100Rnd_762x54mmR_green:5"
#endif

#ifdef MMG_ATT
#else
#define MMG_ATT ""
#endif

// MAT
#ifdef MAT
#else
#define MAT "rhs_weap_rpg7"
#endif

#ifdef MAT_MAG
#else
#define MAT_MAG "rhs_rpg7_PG7VL_mag:2","rhs_rpg7_OG7V_mag:1"
#endif

#ifdef MAT_MAG2
#else
#define MAT_MAG2 MAT_MAG2
#endif

#ifdef MAT_OPTIC
#else
#define MAT_OPTIC ""
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
#define SAM "rhs_weap_igla"
#endif

#ifdef SAM_MAG
#else
#define SAM_MAG "rhs_mag_9k38_rocket:3"
#endif

#ifdef SAM_MAG2
#else
#define SAM_MAG2 "rhs_mag_9k38_rocket:2"
#endif
// Sniper Rifle
#ifdef SNIPER
#else
#define SNIPER "UK3CB_SVD_OLD"
#endif

#ifdef SNIPER_MAG
#else
#define SNIPER_MAG "rhs_10Rnd_762x54mmR_7N1:10"
#endif

#ifdef SNIPER_ATTACHMENTS
#else
#define SNIPER_ATTACHMENTS "rhs_acc_pso1m2"
#endif
// Spotter Rifle
#ifdef SPOTTER
#else
#define SPOTTER "rhs_weap_ak74n_2"
#endif

#ifdef SPOTTER_MAG
#else
#define SPOTTER_MAG "rhs_30Rnd_545x39_7N6M_plum_AK:10"
#endif

#ifdef SPOTTER_ATTACHMENTS
#else
#define SPOTTER_ATTACHMENTS "rhs_acc_1p29"
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
#define PISTOL "rhs_weap_pya"
#endif

#ifdef PISTOL_MAG
#else
#define PISTOL_MAG "rhs_mag_9x19_17:3"
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
#define MTR_TUBE "RHS_Podnos_Gun_Bag"
#endif

#ifdef MTR_PLATE
#else
#define MTR_PLATE "RHS_Podnos_Bipod_Bag"
#endif

#define CREW_HEADGEAR "rhs_tsh4","rhs_tsh4_ess_bala","rhs_tsh4_ess","rhs_tsh4_bala"

#define PILOT_UNIFORM CAMO_UNIFORM
#define PILOT_BACKPACK "B_Battle_Belt_XL_F"
#define PILOT_VEST "rhs_6b5_officer_vsr"
#define PILOT_HEADGEAR "UK3CB_TKA_O_H_zsh7a_mike_Des_alt","UK3CB_TKA_O_H_zsh7a_mike_Des"

#define SIDE_FACE F_MED
// Specialized Resupply Vehicle Loadouts
// Ammo Truck
class RHS_Ural_Flat_MSV_01 {
	TransportWeapons[] = {AT,AT,AT};
	TransportMagazines[] = {RIFLE_MAG,RIFLE_MAG,RIFLE_MAG,RIFLE_MAG,CARBINE_MAG,CARBINE_MAG,GLRIFLE_MAG,GLRIFLE_MAG,AR_MAG,AR_MAG,AR_MAG,AR_MAG,MMG_MAG,MMG_MAG,GLRIFLE_MAG_HE,GLRIFLE_MAG_HE,GLRIFLE_MAG_SMOKE,GLRIFLE_MAG_SMOKE,MAT_MAG,BASE_GRENADES,BASE_GRENADES,BASE_GRENADES,BASE_GRENADES};
	TransportItems[] = {TOOLKIT};
};


#include "base.hpp" // includes the base defines

