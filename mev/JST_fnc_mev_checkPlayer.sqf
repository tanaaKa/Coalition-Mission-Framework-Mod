// check side and give actions on med vics

switch (side player) do
{
	case WEST:
	{
		if ((JST_mevBluEnabled) and ((typeOf player isEqualTo "potato_w_plm") or (typeOf player isEqualTo "potato_w_sm"))) then
		{
			[JST_bluFH] execVM "cmf\mev\JST_mev_init.sqf";
			systemChat "[COA Medical] You have a mobile FH that unpacks from your MEV.";
		};
	};
	case INDEPENDENT:
	{
		if ((JST_mevIndEnabled) and ((typeOf player isEqualTo "potato_i_plm") or (typeOf player isEqualTo "potato_i_sm"))) then
		{
			[JST_indFH] execVM "cmf\mev\JST_mev_init.sqf";
			systemChat "[COA Medical] You have a mobile FH that unpacks from your MEV.";
		};
	};
	case EAST:
	{
		if ((JST_mevOpfEnabled) and ((typeOf player isEqualTo "potato_e_plm") or (typeOf player isEqualTo "potato_e_sm"))) then
		{
			[JST_opfFH] execVM "cmf\mev\JST_mev_init.sqf";
			systemChat "[COA Medical] You have a mobile FH that unpacks from your MEV.";
		};
	};
};