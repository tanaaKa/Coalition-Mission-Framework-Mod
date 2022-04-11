/*
 * Author: tanaKa
 * Loads MM-chosen radio system
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call CMF_fnc_initRadios;
 *
 * Public: No
 *
 * Leader references:
 * BLU_COY,OPF_COY,IND_COY,BLU_COY_FS,OPF_COY_FS,IND_COY_FS
 * BLU_PL,OPF_PL,IND_PL,BLU_PLM,OPF_PLM,IND_PLM,BLU_PL2,OPF_PL2,IND_PL2,BLU_PLM2,OPF_PLM2,IND_PLM2
 * BLU_ASL,OPF_ASL,IND_ASL,BLU_BSL,OPF_BSL,IND_BSL,BLU_CSL,OPF_CSL,IND_CSL,BLU_DSL,OPF_DSL,IND_DSL
 * BLU_A1_FTL,OPF_A1_FTL,IND_A1_FTL
 * BLU_A2_FTL,OPF_A2_FTL,IND_A2_FTL
 * BLU_B1_FTL,OPF_B1_FTL,IND_B1_FTL
 * BLU_B2_FTL,OPF_B2_FTL,IND_B2_FTL
 * BLU_C1_FTL,OPF_C1_FTL,IND_C1_FTL
 * BLU_C2_FTL,OPF_C2_FTL,IND_C2_FTL
 * BLU_D1_FTL,OPF_D1_FTL,IND_D1_FTL
 * BLU_D2_FTL,OPF_D2_FTL,IND_D2_FTL
 */

_coyLeaders = 
[
	"potato_w_coy","potato_e_coy","potato_i_coy"
	,"potato_w_xo","potato_e_xo","potato_i_xo"
];

_pltLeaders =
[
	"potato_w_plt","potato_e_plt","potato_i_plt"
	,"potato_w_sgt","potato_e_sgt","potato_i_sgt"
];

_squadLeaders =
[
	"potato_w_sl","potato_e_sl","potato_i_sl"
	,"potato_w_sf_sl","potato_e_sf_sl","potato_i_sf_sl"
];

_ftLeaders = 
[
	"potato_w_ftl","potato_e_ftl","potato_i_ftl"
	,"potato_w_sf_ftl","potato_e_sf_ftl","potato_i_sf_ftl"
];

_medics =
[
	"potato_w_cm","potato_e_cm","potato_i_cm"
	,"potato_w_plm","potato_e_plm","potato_i_plm"
	,"potato_w_sm","potato_e_cm","potato_i_cm"
	,"potato_w_sf_sm","potato_e_sf_sm","potato_i_sf_sm"
];

_specialties =
[
	"potato_w_pilot","potato_e_pilot","potato_i_pilot"
	,"potato_w_cc","potato_e_cc","potato_i_cc"
	,"potato_w_engl","potato_e_engl","potato_i_engl"
	,"potato_w_demol","potato_e_demol","potato_i_demol"
	,"potato_w_vicl","potato_e_vicl","potato_i_vicl"
	,"potato_w_artl","potato_e_artl","potato_i_artl"
	,"potato_w_hatl","potato_e_hatl","potato_i_hatl"
	,"potato_w_hmgl","potato_e_hmgl","potato_i_hmgl"
	,"potato_w_matl","potato_e_matl","potato_i_matl"
	,"potato_w_mmgl","potato_e_mmgl","potato_i_mmgl"
	,"potato_w_mtrl","potato_e_mtrl","potato_i_mtrl"
	,"potato_w_msaml","potato_e_msaml","potato_i_msaml"
	,"potato_w_stl","potato_e_stl","potato_i_stl"
];

//Get radio value from potato settings menu
private _radioType = getMissionConfigValue "potato_missionTesting_radioSystem";

switch (_radioType) do {
	case 0:	//Squad nets
	{
		[_coyLeaders,_pltLeaders,_squadLeaders,_ftLeaders,_medics,_specialties] call CMF_fnc_sqdRadios;
	};
	case 1:	//FT nets
	{
		[_coyLeaders,_pltLeaders,_squadLeaders,_ftLeaders,_medics,_specialties] call CMF_fnc_ftRadios;
	};
	case 2:	//GI dont have radios
	{
		[_coyLeaders,_pltLeaders,_squadLeaders,_ftLeaders,_medics,_specialties] call CMF_fnc_ldrRadios;
	};
	default
	{
		[_coyLeaders,_pltLeaders,_squadLeaders,_ftLeaders,_medics,_specialties] call CMF_fnc_ftRadios;
	};
};