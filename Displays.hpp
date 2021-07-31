class IGUIBack;
class RscButtonMenuCancel;
class RscButtonMenuOK;
class RscCheckBox;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscEdit;
class RscFrame;
class RscListbox;
class RscText;
class RscXSliderH;
class RscCombo;
class RscButton;

class RscDisplayCMFGMAD
{
	idd = 1024;
	class Controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by tanaKa-, v1.063, #Jihety)
		////////////////////////////////////////////////////////

		class tTitle: RscText
		{
			idc = 1000;

			text = "Attack and Defend Generator"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class tAttacker: RscText
		{
			idc = 1001;

			text = "Attacker:"; //--- ToDo: Localize;
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			tooltip = "Choose a side that must attack the sectors"; //--- ToDo: Localize;
		};
		class cbAttacker: RscCombo
		{
			idc = 2100;

			text = "BLUFOR"; //--- ToDo: Localize;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			class Items
			{
				class BLU
				{
					text = "BLUFOR";
					default = 1;
				};
				class OPF
				{
					text = "OPFOR";
				};
				class IND
				{
					text = "INDFOR";
				};
			};
		};
		class tDefender: RscText
		{
			idc = 1002;

			text = "Defender:"; //--- ToDo: Localize;
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			tooltip = "Choose a side to defend the sectors. Sectors will automatically be held by this side."; //--- ToDo: Localize;
		};
		class cbDefender: RscCombo
		{
			idc = 2101;

			text = "OPFOR"; //--- ToDo: Localize;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			class Items
			{
				class BLU
				{
					text = "BLUFOR";
				};
				class OPF
				{
					text = "OPFOR";
					default = 1;
				};
				class IND
				{
					text = "INDFOR";
				};
			};
		};
		class checkCaptureOrder: RscCheckBox
		{
			idc = 2800;

			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			checked = 0;
			tooltip = "If checked, sectors must be captured in numerical order like rush"; //--- ToDo: Localize;
		};
		class tCaptureOrder: RscText
		{
			idc = 1003;

			text = "Sectors must be captured in order"; //--- ToDo: Localize;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class tSectorCount: RscText
		{
			idc = 1004;

			text = "Sectors to spawn:"; //--- ToDo: Localize;
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			tooltip = "Choose how many sectors to spawn"; //--- ToDo: Localize;
		};
		class cbSectorCount: RscCombo
		{
			idc = 2102;

			text = "One Sector"; //--- ToDo: Localize;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			class Items
			{
				class oneSector
				{
					text = "1 Sector";
					default = 1;
				};
				class twoSector
				{
					text = "2 Sectors";
				};
				class threeSector
				{
					text = "3 Sectors";
				};
			};
		};
		class bCreate: RscButton
		{
			idc = 1600;
			text = "CREATE"; //--- ToDo: Localize;
			x = 0.420655 * safezoneW + safezoneX;
			y = 0.481192 * safezoneH + safezoneY;
			w = 0.0352643 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.7,0,0.6};
			tooltip = "Create the game mode"; //--- ToDo: Localize;
			onButtonClick = "call CMF_fnc_zeusInit; closeDialog 1;";
		};
		class tAuthor: RscText
		{
			idc = 1006;
			text = "By tanaKa"; //--- ToDo: Localize;
			x = 0.328087 * safezoneW + safezoneX;
			y = 0.293114 * safezoneH + safezoneY;
			w = 0.0352643 * safezoneW;
			h = 0.0188079 * safezoneH;
			tooltip = "This shit took so much workkkkkkkkkkk"; //--- ToDo: Localize;
		};
		class bCancel: RscButton
		{
			idc = 1601;
			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.482368 * safezoneW + safezoneX;
			y = 0.481192 * safezoneH + safezoneY;
			w = 0.0352643 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.7,0,0,0.6};
			tooltip = "Cancel creation of the game mode"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 1;"; // ctrlDelete 1024 / ctrlDelete (_this select 0);
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////


	};
};