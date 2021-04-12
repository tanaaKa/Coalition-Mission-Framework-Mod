//=======================================================================================
//
//	wha_dp_CONFIG.sqf - Contains configurable values for WHA deploy.
//
//	Note:	Many of these settings may be altered by individual clients to their taste
//			via the CBA settings or briefing menu. If they are using the briefing menu,
//			and change their settings, they not be reminded of what is set here as default.
//
//	Contact: Whale #5963
//
//=======================================================================================

//---------------------------------------------------------------------------------------
//	Configuration Values. Feel free to modify.
//---------------------------------------------------------------------------------------

// Config Value					// Description							(Default Value)

WHA_DP_DEPLOY = true;			// Enable or disable the deploy system
								// completely. 									(true)

WHA_DP_DISPERSION = 15;			// How far groups will space out upon deployment(15)

								// TODO
//WHA_DP_SIDES = [west];			// Sides to auto-add deploy system to.			(west)
								// Options: west, east, independent

								// TODO
//WHA_DP_GAMEMODES = ["TDM"];		// Gamemodes ('game type') in which the deploy	(["TDM"])
								// system will automatically be added for group 
								// leaders. Make sure you use strings!
								// Popular Options:
								// - "Coop" (Cooperative PVE)
								// - "TDM" (Team Deathmatch, used for TVTs)
								// - "SC" (Sector Control, alt for TDM)
								// - "Zeus"
								
								// NOT DONE YET, BELOW
//WHA_DP_ASGROUP = true;		// Whether groups deploy together.				(true)
								// Will also give action only to group leader if true.

//WHA_DP_SHOWBRIEF = true;		// Whether to show a briefing describing		(true)
								// the features of WHA Deploy.

//	Text for addActions.
//WHA_DP_ACTION_TEXT = "<t color='#8ef724'>Insert Earplugs</t>";