class CfgCMFLoadouts {
	// Fast, Easy Settings to change loadouts without touching the arrays.  For TVT Balancing.
	// Allow Zoomed Optics (1 is true, 0 is false) <Anything like a HAMR (4x) optic won't be added, "red dot" would be fine>
	allowMagnifiedOptics = 1;

	// Allow changeable optics on a global level, note: optic options obey allowMagnifiedOptics rules
	allowChangeableOptics = 1;

	// Do Vehicle Loadouts
	// (1 will run normaly, 0 will leave them to vanilla defaults, -1 will clear and leave empty)
	setVehicleLoadouts = 1;

	// Fallback: use a basic soldiers loadout when the unit's classname isn't found (for Alive spawning random units)
	useFallback = 1;

	// prefixes to strip from the units classnames
	prefixes[] = {"potato_w_", "potato_e_", "potato_i_"};

	// Shared defines
	#include "loadouts\common.hpp" // DO NOT COMMENT OUT, WILL BREAK EVERYTHING

	// Desert USMC
	class USMC_MPD_RHS
	{
		#include "loadouts\undef.hpp"
		#include "loadouts\blu_gear.hpp"
		#include "loadouts\USMC_MPD_RHS.hpp"
	};

	// Woodland USMC
	class USMC_MPWD_RHS 
	{
		#include "loadouts\undef.hpp"
		#include "loadouts\blu_gear.hpp"
		#include "loadouts\USMC_MPWD_RHS.hpp"
	};
	
	// Chernarus Defense Ground Force 
	class CDF_RHS 
	{
		#include "loadouts\undef.hpp"
		#include "loadouts\ind_gear.hpp"
		#include "loadouts\CDF_RHS.hpp"
	};
	
	// Chernarus Defense Para Forces
	class CDF_PARA_RHS 
	{
		#include "loadouts\undef.hpp"
		#include "loadouts\ind_gear.hpp"
		#include "loadouts\CDF_PARA_RHS.hpp"
	};
	
	// NATO MTP/Sand
	class NATO_SAND
	{
		#include "loadouts\undef.hpp"
		#include "loadouts\blu_gear.hpp"
		#include "loadouts\NATO_SAND.hpp"
	};
	
	// NATO Tropical
	class NATO_TROPIC
	{
		#include "loadouts\undef.hpp"
		#include "loadouts\blu_gear.hpp"
		#include "loadouts\NATO_TROPIC.hpp"
	};
	
	// NATO Woodland
	class NATO_WD
	{
		#include "loadouts\undef.hpp"
		#include "loadouts\blu_gear.hpp"
		#include "loadouts\NATO_WD.hpp"
	};

	// CSAT 
	class CSAT 
	{
		#include "loadouts\undef.hpp"
		#include "loadouts\opf_gear.hpp"
		#include "loadouts\CSAT.hpp"
	};

	// CSAT Tropical
	class CSAT_TROPIC 
	{
		#include "loadouts\undef.hpp"
		#include "loadouts\opf_gear.hpp"
		#include "loadouts\CSAT_TROPIC.hpp"
	};

	// CSAT Urban
	class CSAT_URBAN
	{
		#include "loadouts\undef.hpp"
		#include "loadouts\opf_gear.hpp"
		#include "loadouts\CSAT_URBAN.hpp"
	};

	// KDF 
	class KDF_3CB 
	{
		#include "loadouts\undef.hpp"
		#include "loadouts\opf_gear.hpp"
		#include "loadouts\KDF_3CB.hpp"
	};

	// RUS MSV RHS
	class RUS_MSV_RHS 
	{
		#include "loadouts\undef.hpp"
		#include "loadouts\opf_gear.hpp"
		#include "loadouts\RUS_MSV_RHS.hpp"
	};
};
