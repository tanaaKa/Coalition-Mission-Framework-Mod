class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits;
        class ModuleDescription;
        class AttributesBase {
            class Edit;
            class Combo;
        };
    };

	//Editor module for attack and defend
    class cmfADModule: Module_F {
        author = "tanaKa";
        category = "CMF";
        scope = 2;
		scopeCurator = 1;
        displayName = "Game Mode: Attack and Defend";
        icon = "\a3\Modules_F\Data\iconTaskCreate_ca.paa";
        isGlobal = 0;
        isTriggerActivated = 0;
        function = "CMF_fnc_ADsectorInit";

        class Attributes {
            class SectorCount {
                displayName = "Sectors to Create:";
				toolTip = "How many sectors to create";
                control = "Combo";
                property = "cmf_ad_createSectors";
				expression = "_this setVariable ['cmf_ad_createSectors',_value, true];";
                typeName="NUMBER";
				defaultValue=0;
				class values
				{
					class OneSector
					{
						name="1 Sector";
						value=0;
					};
					class TwoSector
					{
						name="2 Sectors";
						value=1;
					};
					class ThreeSector
					{
						name="3 Sectors";
						value=2;
					};
				};
            };
			class RandomSectors {
                displayName = "Randomly place sectors:";
                control = "Checkbox";
				toolTip = "Place sectors randomly 1000m around the module. If false, you must place sector1, sector2, sector3, etc...";
                property = "cmf_ad_randomSectors";
				expression = "_this setVariable ['cmf_ad_randomSectors',_value, true];";
				defaultValue = "(false)";
            };
			class CapInOrder: RandomSectors {
                displayName = "Capture sectors in order:";
                property = "cmf_ad_capInOrder";
				expression = "_this setVariable ['cmf_ad_capInOrder',_value, true];";
				defaultValue = "(false)";
            };
            class AttackingSide: SectorCount {
                displayName = "Attacking Side:";
                property = "cmf_ad_attackingSide";
				expression = "_this setVariable ['cmf_ad_attackingSide',_value, true];";
				typeName="STRING";
				defaultValue="WEST";
				class values
				{
					class BLU
					{
						name="BLUFOR";
						value="WEST";
					};
					class OPF
					{
						name="OPFOR";
						value="EAST";
					};
					class IND
					{
						name="INDFOR";
						value="INDEPENDENT";
					};
				};
            };
            class DefendingSide: AttackingSide {
                displayName = "Defending Side:";
                property = "cmf_ad_defendingSide";
				expression = "_this setVariable ['cmf_ad_defendingSide',_value, true];";
				defaultValue="EAST";
            };
        };
    };
	//Zeus module for attack and defend
	//Not done yet
	/*
	class cmfADModuleZeus: Module_F {
        author = "tanaKa";
        category = "CMFGM";
        scope = 1;
		scopeCurator = 2;
        displayName = "Create Attack and Defend";
        icon = "\a3\Modules_F\Data\iconTaskCreate_ca.paa";
        isGlobal = 0;
        isTriggerActivated = 1;
		isDisposable = 1;
        function = "";
		curatorInfoType = "RscDisplayCMFGMAD";
    };

     class GVAR(zeus_missionHint): Module_F {
        author = QUOTE(PREFIX);
        category = QEGVAR(core,util);
        scope = 1;
        scopeCurator = 2;
        isTriggerActivated = 1;
        displayName = "Mission Hint";
        function = QFUNC(zeus_missionHint);
        curatorInfoType = QGVAR(RscDisplayAttributes_missionHint);
        curatorCost = 0;
        class Arguments {};
        class Attributes {};
    }; */
};
