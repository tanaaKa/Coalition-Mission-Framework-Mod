// Author: You
// Description: paste your loadout config from the arseanal exporter
#include "undef.hpp" // Reset defines

// ------------------- PASTE BELOW THIS LINE
// Camo set
#define CAMO_UNIFORM "CUP_O_TKI_Khet_Jeans_04","CUP_O_TKI_Khet_Jeans_02","CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_06"
#define CAMO_VEST "CUP_V_OI_TKI_Jacket4_04","CUP_V_OI_TKI_Jacket4_05","CUP_V_OI_TKI_Jacket4_06","CUP_V_OI_TKI_Jacket3_04","CUP_V_OI_TKI_Jacket3_05","CUP_V_OI_TKI_Jacket3_06","CUP_V_OI_TKI_Jacket2_04","CUP_V_OI_TKI_Jacket2_05","CUP_V_I_Carrier_Belt","CUP_V_O_SLA_M23_1_OD"
#define CAMO_BACKPACK "B_Messenger_Black_F","B_Messenger_Gray_F","B_LegStrapBag_black_F"
// Rifle
#define RIFLE "CUP_arifle_FNFAL5061_wooden","CUP_arifle_IMI_Romat","CUP_arifle_Gewehr1","CUP_arifle_FNFAL5061"
#define RIFLE_MAG "CUP_20Rnd_762x51_FNFAL_M:10"
#define SKS "CUP_SKS"
#define SKS_MAG "CUP_10Rnd_762x39_SKS_M:20"
// GL Rifle
#define GLRIFLE "CUP_arifle_AKS74_GL_Early"
#define GLRIFLE_MAG "CUP_30Rnd_545x39_AK_M:10"
#define GLRIFLE_MAG_SMOKE "1Rnd_Smoke_Grenade_shell:3"
#define GLRIFLE_MAG_RED "1Rnd_SmokeRed_Grenade_shell:3"
#define GLRIFLE_MAG_HE "1Rnd_HE_Grenade_shell:2"
#define GLRIFLE_MAG_FLARE "UGL_FlareYellow_F:10"
// Carbine
#define CARBINE "CUP_arifle_AKS","CUP_arifle_AKM_Early","CUP_arifle_AK47_Early"
#define CARBINE_MAG "CUP_30Rnd_762x39_AK47_M:10"
#define KRINKOV "arifle_AKS_F"
#define KRINKOV_MAG "CUP_30Rnd_545x39_AK_M:10"
// AR
#define AR "rhs_weap_pkm"
#define AR_MAG "rhs_100Rnd_762x54mmR_green:5"
// AT
#define AT "CUP_Launch_RPG7V"
#define AT_MAG "CUP_PG7VM_M:2"
// MMG
#define MMG "CUP_lmg_PKM"
#define MMG_MAG "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M:5"
// MAT
#define MAT "CUP_Launch_RPG7V"
#define MAT_MAG "CUP_PG7VL_M:3"
#define MAT_MAG2 "CUP_PG7VL_M:4"
#define MAT_OPTIC "cup_optic_pgo7v"
// -------------------- PASTE ABOVE THIS LINE
//HMG
#define HMG "ace_cswCompatCUP_cup_m2"
#define HMG_TRI_HI "ace_csw_m3CarryTripod"
#define HMG_TRI_LO "ace_csw_m3CarryTripodLow"
#define HMG_MAG "ace_csw_100Rnd_127x99_mag:3"
//HAT
#define HAT "ace_compat_rhs_usf3_tow_carry"
#define HAT_TRI_HI "ace_csw_m220CarryTripod"
#define HAT_TRI_LO ""
#define HAT_MAG "ace_compat_rhs_usf3_mag_ITOW"
// SAM
#define SAM "rhs_weap_fim92"
#define SAM_MAG "rhs_fim92_mag:3"
#define SAM_MAG2 "rhs_fim92_mag:2"
// Sniper Rifle
#define SNIPER "CUP_srifle_SVD"
#define SNIPER_MAG "rhs_10Rnd_762x54mmR_7N1:10"
#define SNIPER_ATTACHMENTS "cup_optic_pso_1_1"
// Spotter Rifle
#define SPOTTER "CUP_arifle_AK74M_railed"
#define SPOTTER_MAG "CUP_30Rnd_545x39_AK74M_M:10"
#define SPOTTER_ATTACHMENTS "cup_optic_acog2"
// SMG
#define SMG CARBINE
#define SMG_MAG CARBINE_MAG
// Pistol
#define PISTOL "rhs_weap_pya"
#define PISTOL_MAG "rhs_mag_9x19_17:3"
// Grenades
#define LEADER_GRENADES BASE_FRAG,LEADER_SMOKES,SIDE_CHEM_LIGHT
// Gear
#define TOOLS BASE_TOOLS
#define LEADER_TOOLS BASE_LEADER_TOOLS,SIDE_KEY
#define LINKED BASE_LINKED
#define LEADER_LINKED BASE_LEADER_LINKED
#define CARRYALL "B_Carryall_mcamo"

// Specialized Resupply Vehicle Loadouts
// Ammo Truck
class RHS_Ural_Flat_MSV_01 {
	TransportWeapons[] = {AT,AT,AT};
	TransportMagazines[] = {RIFLE_MAG,RIFLE_MAG,RIFLE_MAG,RIFLE_MAG,CARBINE_MAG,CARBINE_MAG,AR_MAG,AR_MAG,AR_MAG,AR_MAG,MMG_MAG,MMG_MAG,GLRIFLE_MAG_HE,GLRIFLE_MAG_HE,GLRIFLE_MAG_SMOKE,MAT_MAG,BASE_GRENADES,BASE_GRENADES,BASE_GRENADES,BASE_GRENADES};
	TransportItems[] = {TOOLKIT};
};

class Car {
  TransportWeapons[] = {AT};
  TransportMagazines[] = {RIFLE_MAG,CARBINE_MAG,"SatchelCharge_Remote_Mag"};
  TransportItems[] = {BASE_MEDICAL,BASE_MEDICAL,BASE_MEDICAL,BASE_MEDICAL};
};
class Tank {
  TransportWeapons[] = {AT};
  TransportMagazines[] = {RIFLE_MAG,CARBINE_MAG,"SatchelCharge_Remote_Mag"};
  TransportItems[] = {BASE_MEDICAL,BASE_MEDICAL,BASE_MEDICAL,BASE_MEDICAL};
};
class Helicopter {
  TransportMagazines[] = {RIFLE_MAG,CARBINE_MAG,"SatchelCharge_Remote_Mag"};
  TransportItems[] = {BASE_MEDICAL,BASE_MEDICAL,BASE_MEDICAL,BASE_MEDICAL};
};
class Plane {};
class Ship_F {};

class rifleman {// rifleman
  uniform[] = {CAMO_UNIFORM};
  vest[] = {CAMO_VEST};
  headgear[] = {CAMO_HEADGEAR};
  backpack[] = {CAMO_BACKPACK};
  backpackItems[] = {BASE_MEDICAL};
  weapons[] = {RIFLE};
  magazines[] = {RIFLE_MAG,BASE_GRENADES};
  items[] = {TOOLS};
  linkedItems[] = {LINKED};
  attachments[] = {RIFLE_ATTACHMENTS};
  opticChoices[] = {ALT_OPTICS};
//  goggles[] = {GOG};
  face[] = {F_RUS};
};
class Fic_Soldier_Carbine: rifleman {// carbine-man
  weapons[] = {CARBINE};
  magazines[] = {CARBINE_MAG,BASE_GRENADES};
};
class ftl: rifleman {// FTL
  weapons[] = {GLRIFLE};
  magazines[] = {GLRIFLE_MAG,GLRIFLE_MAG_HE,GLRIFLE_MAG_SMOKE,LEADER_GRENADES};
  items[] += {LEADER_TOOLS};
  linkedItems[] += {LEADER_LINKED,BINOS};
};
class sl: ftl {// SL
  handguns[] = {PISTOL};
  magazines[] += {PISTOL_MAG};
  linkedItems[] = {LINKED,LEADER_LINKED,RANGE_FINDER};
  items[] += {RADIO_MR};
};
class coy: sl {// CO and PL
  items[] += {RADIO_LR};
};
class uav: rifleman {
  backpack[] = {SIDE_UAV_BACKPACK};
  linkedItems[] += {SIDE_UAV_TERMINAL};
};
class ar: rifleman {// AR
  weapons[] = {AR};
  magazines[] = {AR_MAG,PISTOL_MAG,BASE_GRENADES};
  handguns[] = {PISTOL};
};
class aar: rifleman {// AAR
  backpackItems[] += {AR_MAG};
  linkedItems[] += {BINOS};
};
class lat: Fic_Soldier_Carbine {// RAT
  magazines[] += {AT_MAG};
  launchers[] = {AT};
};
class sm: Fic_Soldier_Carbine {// Medic
  magazines[] = {CARBINE_MAG,MEDIC_GRENADES};
  backpackItems[] = {MEDIC_MEDICAL};
};
class Fic_Spotter: rifleman {
  linkedItems[] += {RANGE_FINDER};
};
class mmgg: ar {// MMG
  weapons[] = {MMG};
  magazines[] = {MMG_MAG,PISTOL_MAG,BASE_GRENADES};
  attachments[] = {};
};
class mmgag: Fic_Spotter {// MMG Spotter/Ammo Bearer
  backpackItems[] += {MMG_MAG};
};
class matg: Fic_Soldier_Carbine {// MAT Gunner
  backpackItems[] = {};
  magazines[] += {MAT_MAG};
  items[] += {BASE_MEDICAL};
  launchers[] = {MAT};
  secondaryAttachments[] = {MAT_OPTIC};
};
class matag: Fic_Spotter {// MAT Spotter/Ammo Bearer
  backpackItems[] = {};
  magazines[] += {MAT_MAG};
  items[] += {BASE_MEDICAL};
};
class msamg: Fic_Soldier_Carbine {// SAM Gunner
  SAM_GEAR("B_Carryall_mcamo", SAM_MAG)
  launchers[] = {SAM};
};
class msamag: Fic_Spotter {// SAM Spotter/Ammo Bearer
  SAM_GEAR("B_Carryall_mcamo", SAM_MAG2)
};
class mtrg: Fic_Soldier_Carbine {// Mortar Gunner
  MORTAR_GEAR("B_Mortar_01_weapon_F")
};
class mtrag: Fic_Spotter {// Assistant Mortar
  MORTAR_GEAR("B_Mortar_01_support_F")
};
class spotter: Fic_Spotter {// Spotter
  weapons[] = {SPOTTER};
  magazines[] = {SPOTTER_MAG,BASE_GRENADES};
  items[] += {RADIO_MR,"ACE_ATragMX","ACE_Kestrel4500"};
  linkedItems[] += {LEADER_LINKED};
  attachments[] = {SPOTTER_ATTACHMENTS};
};
class sniper: spotter {// Sniper
  weapons[] = {SNIPER};
  magazines[] = {SNIPER_MAG,BASE_GRENADES};
  items[] = {TOOLS,"ACE_RangeCard"};
  linkedItems[] = {LINKED};
  attachments[] = {SNIPER_ATTACHMENTS};
};
class pilot {// Pilot
  uniform[] = {"U_B_HeliPilotCoveralls"};
  backpack[] = {"B_assaultpack_sgg"};
  vest[] = {"V_TacVest_blk"};
  headgear[] = {"H_PilotHelmetHeli_B"};
  weapons[] = {SMG};
  magazines[] = {SMG_MAG,CREW_GRENADES};
  backpackItems[] = {SIDE_KEY,RADIO_LR};
  items[] = {BASE_MEDICAL,TOOLS,LEADER_TOOLS,RADIO_MR};
  linkedItems[] = {LINKED,LEADER_LINKED};
};

class vicc: Fic_Soldier_Carbine {// Crew
  magazines[] = {CARBINE_MAG,CREW_GRENADES};
  backpackItems[] = {SIDE_KEY,RADIO_LR};
  linkedItems[] = {LINKED,LEADER_LINKED,BINOS};
  items[] += {BASE_MEDICAL};
};
class vicd: vicc {// Repair Specialist
  backpackItems[] = {"Toolkit",RADIO_MR,SIDE_KEY};
  linkedItems[] = {LINKED,LEADER_LINKED};
};
class Fic_eng: vicd {
  items[] += {BASE_ENG};
  backpackItems[] = {};
};
class demo: Fic_eng {// Explosive Specialist
  magazines[] += {BASE_EXP};
};
class mine: Fic_eng {// Mine Specialist
  magazines[] += {BASE_MINE};
  handguns[] = {MINE_DETECTOR};
};
class demol: Fic_eng {// Demolitions Leader
  magazines[] += {BASE_EXP};
  backpackItems[] = {RADIO_MR,"Toolkit"};
};
class eng: fic_eng {// Logistics Engineer
  backpackItems[] = {"Toolkit","ACE_EntrenchingTool","ACE_Fortify","ACE_wirecutter"};
};
class fac: coy {// FAC
  magazines[] = {GLRIFLE_MAG,SIDE_FAC_GRENADES,"Laserbatteries",PISTOL_MAG};
  linkedItems[] = {LINKED,LEADER_LINKED,"CUP_LRTV"};
};
class rifleman_02: rifleman {// Grenadier
  weapons[] = {GLRIFLE};
  magazines[] = {GLRIFLE_MAG,GLRIFLE_MAG_HE,GLRIFLE_MAG_HE,GLRIFLE_MAG_SMOKE,BASE_GRENADES};
};
class artl: sl {// Artillery Leader
  backpack[] = {"B_Kitbag_mcamo"};
  backpackItems[] += {BASE_ARTILLERY,RADIO_LR};
};
class artg: rifleman {// Artillery Gunner
  backpackItems[] += {BASE_ARTILLERY};
};
class plm: sm {// Platoon Medic
};
class cm: sm {// Company Medic
};
class xo: coy {// XO
};
class plt: coy {// Platoon Leader
};
class sgt: plt {// Platoon Sergeant
};
class vicl: vicc {// Vehicle Commander
  items[] += {RADIO_MR};
  backpackItems[] = {SIDE_KEY,RADIO_LR};
};
class mmgl: sl {// MMG Lead
  backpack[] = {CARRYALL};
  magazines[] += {MMG_MAG};
};
class matl: sl {// MAT Lead
  backpack[] = {CARRYALL};
  magazines[] += {MAT_MAG};
};
class hmgl: sl {// HMG Lead
  weapons[] = {RIFLE};
  magazines[] = {RIFLE_MAG,LEADER_GRENADES,PISTOL_MAG,HMG_MAG};
  backpack[] = {CARRYALL};
  launchers[] = {HMG_TRI_LO};
  items[] += {BASE_BALLISTICS};
};
class hmgg: rifleman {// HMG Gunner
  backpack[] = {CARRYALL};
  magazines[] += {HMG_MAG};
  launchers[] = {HMG};
};
class hmgag: rifleman {// HMG Spotter
  backpack[] = {CARRYALL};
  magazines[] += {HMG_MAG};
  launchers[] = {HMG_TRI_HI};
  items[] += {BASE_BALLISTICS};
};
class hatl: sl {// HAT Lead
  weapons[] = {RIFLE};
  backpackItems[] = {};
  magazines[] = {RIFLE_MAG,LEADER_GRENADES,PISTOL_MAG,HAT_MAG};
  backpack[] = {CARRYALL};
  launchers[] = {HAT_TRI_LO};
  items[] += {BASE_MEDICAL};
};
class hatg: rifleman {// HAT Gunner
  backpack[] = {CARRYALL};
  magazines[] += {HAT_MAG};
  launchers[] = {HAT};
};
class hatag: rifleman {// HAT Spotter
  backpack[] = {CARRYALL};
  magazines[] += {HAT_MAG};
  launchers[] = {HAT_TRI_HI};
};
class msaml: sl {// MSAM Lead
  backpack[] = {CARRYALL};
  magazines[] += {SAM_MAG2};
};
class mtrl: sl {// Mortar Lead
  items[] += {BASE_ARTILLERY};
};
class helicrew: pilot {// Aircrew
  backpackItems[] = {"Toolkit",SIDE_KEY};
};
class cc: helicrew {// Crew Chief
  backpackItems[] += {RADIO_MR};
};
class engl: eng {// Logistics Leader
  weapons[] = {GLRIFLE};
  magazines[] = {GLRIFLE_MAG,GLRIFLE_MAG_HE,GLRIFLE_MAG_SMOKE,LEADER_GRENADES};
  items[] += {LEADER_TOOLS};
  linkedItems[] += {LEADER_LINKED,BINOS};
  backpackItems[] += {RADIO_MR};
};
class fallback: rifleman {}; // This means any faction member who doesn't match something will use this loadout
