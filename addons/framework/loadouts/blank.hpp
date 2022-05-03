// Author: You
// Description: paste your loadout config from the arseanal exporter
// ------------------- PASTE BELOW THIS LINE

// Camo set
#ifdef CAMO_UNIFORM
#else
#define CAMO_UNIFORM ""
#endif
#ifdef CAMO_VEST
#else
#define CAMO_VEST ""
#endif
#ifdef CAMO_BACKPACK
#else
#define CAMO_BACKPACK ""
#endif
#ifdef CAMO_HEADGEAR
#else
#define CAMO_HEADGEAR ""
#endif
// Rifle
#ifdef RIFLE
#else
#define RIFLE ""
#endif
#ifdef RIFLE_MAG
#else
#define RIFLE_MAG ""
#endif
#ifdef RIFLE_ATTACHMENTS
#else
#define RIFLE_ATTACHMENTS ""
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
#define GLRIFLE ""
#endif
#ifdef GLRIFLE_MAG
#else
#define GLRIFLE_MAG ""
#endif
// WARNING - Unknown GL Muzzle [->no2ndMuzzle]
#ifdef GLRIFLE_MAG_FLARE
#else
#define GLRIFLE_MAG_FLARE ""
#endif
#ifdef GLRIFLE_MAG_SMOKE
#else
#define GLRIFLE_MAG_SMOKE ""
#endif
#ifdef GLRIFLE_MAG_HE
#else
#define GLRIFLE_MAG_HE ""
#endif
// Carbine
#ifdef CARBINE
#else
#define CARBINE ""
#endif
#ifdef CARBINE_MAG
#else
#define CARBINE_MAG ""
#endif
// AR
#ifdef AR
#else
#define AR ""
#endif
#ifdef AR_MAG
#else
#define AR_MAG ""
#endif
// AT
#ifdef AT
#else
#define AT ""
#endif
#ifdef AT_MAG
#else
#define AT_MAG ""
#endif
// MMG
#ifdef MMG
#else
#define MMG ""
#endif
#ifdef MMG_MAG
#else
#define MMG_MAG ""
#endif
#ifdef MMG_ATT
#else
#define MMG_ATT ""
#endif
// MAT
#ifdef MAT
#else
#define MAT ""
#endif
#ifdef MAT_MAG
#else
#define MAT_MAG ""
#endif
#ifdef MAT_MAG2
#else
#define MAT_MAG2 ""
#endif
#ifdef MAT_OPTIC
#else
#define MAT_OPTIC ""
#endif
// HMG
#ifdef HMG
#else
#define HMG ""
#endif
#ifdef HMG_MAG
#else
#define HMG_MAG ""
#endif
#ifdef HMG_TRI_LO
#else
#define HMG_TRI_LO ""
#endif
#ifdef HMG_TRI_HI
#else
#define HMG_TRI_HI ""
#endif
// HAT
#ifdef HAT
#else
#define HAT ""
#endif
#ifdef HAT_MAG
#else
#define HAT_MAG ""
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
#define SAM ""
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
#define SNIPER ""
#endif
#ifdef SNIPER_MAG
#else
#define SNIPER_MAG ""
#endif
#ifdef SNIPER_ATTACHMENTS
#else
#define SNIPER_ATTACHMENTS ""
#endif
// Spotter Rifle
#ifdef SPOTTER
#else
#define SPOTTER ""
#endif
#ifdef SPOTTER_MAG
#else
#define SPOTTER_MAG ""
#endif
#ifdef SPOTTER_ATTACHMENTS
#else
#define SPOTTER_ATTACHMENTS ""
#endif
// SMG
#ifdef SMG
#else
#define SMG ""
#endif
#ifdef SMG_MAG
#else
#define SMG_MAG ""
#endif
// Pistol
#ifdef PISTOL
#else
#define PISTOL ""
#endif
#ifdef PISTOL_MAG
#else
#define PISTOL_MAG ""
#endif
// MTR
#ifdef MTR_TUBE
#else
#define MTR_TUBE ""
#endif
#ifdef MTR_PLATE
#else
#define MTR_PLATE ""
#endif
// Crew Headgear
#ifdef CREW_HEADGEAR
#else
#define CREW_HEADGEAR ""
#endif
// Pilot Uniform
#ifdef PILOT_UNIFORM
#else
#define PILOT_UNIFORM ""
#endif
#ifdef PILOT_VEST
#else
#define PILOT_VEST ""
#endif
#ifdef PILOT_BACKPACK
#else
#define PILOT_BACKPACK ""
#endif
#ifdef PILOT_HEADGEAR
#else
#define PILOT_HEADGEAR ""
#endif
//Misc.
#ifdef GOG
#else
#define GOG ""
#endif

#ifdef NODS
#else
#define NODS ""
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


