#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class coal_menu
	{
		requiredaddons[] = {"CBA_Main", "cwr3_core"};
		requiredversion = 1;
		units[] = {};
		weapons[] = {};
	};
};
class RscPicture;
class RscStructuredText;
class RscControlsGroup;
class RscActiveText;
class RscText;
class RscProgress;
class RscVignette;
class RscControlsGroupNoScrollbars;
class controls;
class CA_Vignette;
class RscControlsGroupNoHScrollbars;
class RscStandardDisplay;
class RscTitle;
class RscPictureKeepAspect;
class RscButtonMenu;
class RscButton;
class RscVideo: RscPicture
{
	autoplay = 1;
	loops = 1;
};
class HScrollbar;
class ScrollBar;
class Attributes;
class ctrlStaticPicture;
class RscActivePictureKeepAspect;
class RscButtonMenuMain;
class RscBackgroundLogo: RscPictureKeepAspect
{
	text = "\A3\Ui_f\data\Logos\arma3_splash_ca.paa";
	align = "top";
	background = 1;
	x = "safezoneX + safezoneW - (9 * 			(		((safezoneW / safezoneH) min 1.2) / 32))";
	y = "safezoneY - 2 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	w = "(8 * 			(		((safezoneW / safezoneH) min 1.2) / 32))";
	h = "(8 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20))";
};
class RscActivePicture: RscActiveText
{
	style = 48;
	color[] = {1,1,1,0.5};
	colorActive[] = {1,1,1,1};
};

class CfgMainMenuSpotlight // RscDisplayMain >> Spotlight works but is considered obsolete since SPOTREP #00064
{
	class SessionServer
	{
		text = "COALITION Session";
		textIsQuote = 0;
		picture = "x\cmf\addons\menu\data\image.paa";
		video = "x\cmf\addons\menu\data\video.ogv";
		action = "0 = [_this, '135.148.136.167', '2302', 'torch'] execVM 'x\cmf\addons\menu\scripts\joinServer.sqf';";
		actionText = "Connect to Session";
		condition = "true";
	};
};

class RscDisplayMain: RscStandardDisplay
{
	idd = 0;
	scriptName = "RscDisplayMain";
	scriptPath = "GUI";
	onLoad = "[""onLoad"",_this,""RscDisplayMain"",'GUI'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload = "[""onUnload"",_this,""RscDisplayMain"",'GUI'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')";
	/* class Spotlight
	{
		class SessionServer {
			text = "COALITION Session";
			textIsQuote = 0;
			picture = "\coal_menu\data\logo.paa";
			video = "\coal_menu\data\video.ogv";
			action = "0 = [_this, '149.56.106.43', '2302', 'torch'] execVM '\coal_menu\scripts\fnc_joinServer.sqf';";
			actionText = "Connect to Session";
			condition = "true";
		};
	}; */
	class ControlsBackground
	{
		class MouseArea: RscText
		{
			idc = 999;
			style = 16;
			x = "safezoneXAbs";
			y = "safezoneY";
			w = "safezoneWAbs";
			h = "safezoneH";
		};
		class BackgroundLeft: RscText
		{
			colorBackground[] = {0.1,0.1,0.1,1};
			x = "- 10";
			y = "- 10";
			w = "safezoneX +  10";
			h = "2 *  10";
		};
		class BackgroundRight: BackgroundLeft
		{
			x = "safezoneX + safezoneW";
			w = 10;
		};
		class Picture: RscPicture
		{
			idc = 998;
			text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\backgroundGrey.jpg";
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneW";
		};
	};
	class Controls
	{
		class BackgroundSpotlight: RscPicture
		{
			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0,0,0,0.9};
			x = "0.5 - (1.5 *  10) *  (pixelW * pixelGridNoUIScale * 2) - 2 *  (2 * pixelW)";
			y = "0.5 - ( 10 / 2) *  (pixelH * pixelGridNoUIScale * 2) -  (2 * pixelH)";
			w = "3 *  10 *  (pixelW * pixelGridNoUIScale * 2) + 4 *  (2 * pixelW)";
			h = "( 10) *  (pixelH * pixelGridNoUIScale * 2) + 2 *  (2 * pixelH)";
		};
		class BackgroundSpotlightLeft: BackgroundSpotlight
		{
			text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\gradient_ca.paa";
			angle = 180;
			x = "safezoneX";
			w = "(safezoneW - (3 *  10 *  (pixelW * pixelGridNoUIScale * 2) + 4 *  (2 * pixelW))) / 2";
		};
		class BackgroundSpotlightRight: BackgroundSpotlightLeft
		{
			text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\gradient_ca.paa";
			angle = 0;
			x = "0.5 + (1.5 *  10) *  (pixelW * pixelGridNoUIScale * 2) + 2 *  (2 * pixelW)";
		};
		class SpotlightBase: RscControlsGroupNoScrollbars
		{
			show = 0;
			x = "0.5 - (1.5 *  10) *  (pixelW * pixelGridNoUIScale * 2) -  (2 * pixelW)";
			y = "0.5 - ( 10 / 2) *  (pixelH * pixelGridNoUIScale * 2)";
			w = "10 *  (pixelW * pixelGridNoUIScale * 2)";
			h = "10 *  (pixelH * pixelGridNoUIScale * 2)";
			class Controls
			{
				class GroupPicture: RscControlsGroupNoScrollbars
				{
					x = 0;
					y = 0;
					w = "10 *  (pixelW * pixelGridNoUIScale * 2)";
					h = "10 *  (pixelH * pixelGridNoUIScale * 2)";
					class Controls
					{
						class Picture: RscPictureKeepAspect
						{
							idc = 1023;
							text = "#(argb,8,8,3)color(1,0,1,1)";
							x = 0;
							y = 0;
							w = "10 *  (pixelW * pixelGridNoUIScale * 2)";
							h = "10 *  (pixelH * pixelGridNoUIScale * 2)";
						};
						class Video: RscVideo
						{
							idc = 1024;
							show = 0;
							x = 0;
							y = 0;
							w = "10 *  (pixelW * pixelGridNoUIScale * 2)";
							h = "10 *  (pixelH * pixelGridNoUIScale * 2)";
						};
					};
				};
				class GroupHover: RscControlsGroupNoScrollbars
				{
					idc = 1025;
					fade = 1;
					x = 0;
					y = 0;
					w = "10 *  (pixelW * pixelGridNoUIScale * 2)";
					h = "10 *  (pixelH * pixelGridNoUIScale * 2)";
					class Controls
					{
						class Overlay: RscPicture
						{
							text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\hover_ca.paa";
							colorText[] = {0,0,0,0.5};
							x = 0;
							y = 0;
							w = "10 *  (pixelW * pixelGridNoUIScale * 2)";
							h = "10 *  (pixelH * pixelGridNoUIScale * 2)";
						};
						class LineLeft: RscText
						{
							colorBackground[] = {1,1,1,1};
							x = 0;
							y = 0;
							w = "pixelW";
							h = "10 *  (pixelH * pixelGridNoUIScale * 2)";
						};
						class LineRight: LineLeft
						{
							x = "10 *  (pixelW * pixelGridNoUIScale * 2) - pixelW";
						};
						class LineTop: LineLeft
						{
							idc = 1027;
							x = 0;
							y = 0;
							w = "10 *  (pixelW * pixelGridNoUIScale * 2)";
							h = "(pixelH * pixelGrid * 2)";
							colorText[] = {0,0,0,1};
							shadow = 0;
							style = 0;
							sizeEx = "(pixelH * pixelGrid * 2)";
							font = "PuristaLight";
							onLoad = "(_this select 0) ctrlsettext toupper ctrltext (_this select 0);";
						};
						class LineBottom: LineTop
						{
							y = "10 *  (pixelH * pixelGridNoUIScale * 2) - pixelH";
							h = "pixelH";
						};
					};
				};
				class TextBackground: RscPicture
				{
					text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\spotlight_backgroundText_ca.paa";
					colorText[] = {0,0,0,0.5};
					x = 0;
					y = 0;
					w = "10 *  (pixelW * pixelGridNoUIScale * 2)";
					h = "10 *  (pixelH * pixelGridNoUIScale * 2)";
				};
				class Text: RscStructuredText
				{
					idc = 1028;
					size = "1.00 *  (pixelH * pixelGridNoUIScale * 2)";
					shadow = 2;
					x = 0;
					y = 0;
					w = "10 *  (pixelW * pixelGridNoUIScale * 2)";
					h = "10 *  (pixelH * pixelGridNoUIScale * 2)";
					class Attributes
					{
						align = "center";
						color = "#ffffff";
						font = "PuristaBold";
					};
				};
				class Button: RscButton
				{
					idc = 1026;
					colorBackground[] = {0,0,0,0};
					colorBackgroundActive[] = {0,0,0,0};
					colorFocused[] = {0,0,0,0};
					x = 0;
					y = 0;
					w = "10 *  (pixelW * pixelGridNoUIScale * 2)";
					h = "10 *  (pixelH * pixelGridNoUIScale * 2)";
				};
			};
		};
		class Spotlight1: SpotlightBase
		{
			idc = 1021;
			show = 1;
			x = "0.5 - (1.5 *  10) *  (pixelW * pixelGridNoUIScale * 2) -  (2 * pixelW)";
			class Controls: Controls
			{
				class GroupPicture: GroupPicture
				{
					class Controls: Controls
					{
						class Picture: Picture
						{
							text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\spotlight_2_ca.paa";
						};
						class Video: Video
						{
							text = "\a3\Ui_f\Video\spotlight_2.ogv";
						};
					};
				};
				class GroupHover: GroupHover
				{
					class Controls: Controls
					{
						class Overlay: Overlay{};
						class LineLeft: LineLeft{};
						class LineRight: LineRight{};
						class LineTop: LineTop
						{
							text = "$STR_A3_RscDisplayMain_Spotlight_Open";
						};
						class LineBottom: LineBottom{};
					};
				};
				class TextBackground: TextBackground{};
				class Text: Text
				{
					text = "$STR_A3_RscDisplayMain_GroupMultiplayer_QuickPlay_text";
				};
				class Button: Button{};
			};
		};
		class Spotlight2: SpotlightBase
		{
			idc = 1020;
			show = 1;
			x = "0.5 - (0.5 *  10) *  (pixelW * pixelGridNoUIScale * 2)";
			class Controls: Controls
			{
				class GroupPicture: GroupPicture
				{
					class Controls: Controls
					{
						class Picture: Picture{};
						class Video: Video{};
					};
				};
				class GroupHover: GroupHover
				{
					class Controls: Controls
					{
						class Overlay: Overlay{};
						class LineLeft: LineLeft{};
						class LineRight: LineRight{};
						class LineTop: LineTop{};
						class LineBottom: LineBottom{};
					};
				};
				class TextBackground: TextBackground{};
				class Text: Text{};
				class Button: Button{};
			};
		};
		class Spotlight3: SpotlightBase
		{
			idc = 1022;
			show = 1;
			x = "0.5 + (0.5 *  10) *  (pixelW * pixelGridNoUIScale * 2) +  (2 * pixelW)";
			class Controls: Controls
			{
				class GroupPicture: GroupPicture
				{
					class Controls: Controls
					{
						class Picture: Picture
						{
							text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\spotlight_3_ca.paa";
						};
						class Video: Video
						{
							text = "\a3\Ui_f\Video\spotlight3.ogv";
						};
					};
				};
				class GroupHover: GroupHover
				{
					class Controls: Controls
					{
						class Overlay: Overlay{};
						class LineLeft: LineLeft{};
						class LineRight: LineRight{};
						class LineTop: LineTop
						{
							text = "$STR_A3_RscDisplayMain_Spotlight_Create";
						};
						class LineBottom: LineBottom{};
					};
				};
				class TextBackground: TextBackground{};
				class Text: Text
				{
					text = "$STR_A3_RscDisplayMain_ButtonEditor";
				};
				class Button: Button{};
			};
		};
		class BackgroundBar: RscText
		{
			colorBackground[] = {0,0,0,0.75};
			x = "safezoneX";
			y = "safezoneY + 2 *  (pixelH * pixelGrid * 2)";
			w = "safezoneW";
			h = "2 *  (pixelH * pixelGrid * 2)";
		};
		class BackgroundCenter: BackgroundBar
		{
			colorBackground[] = {0,0,0,1};
			x = "0.5 - 2 *   2 *  (pixelW * pixelGrid * 2)";
			w = "4 *   2 *  (pixelW * pixelGrid * 2)";
		};
		class BackgroundBarLeft: RscPicture
		{
			text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\gradientMods_ca.paa";
			colorText[] = {0,0,0,1};
			angle = 180;
			x = "0.5 - 4 *   2 *  (pixelW * pixelGrid * 2)";
			y = "safezoneY + 2 *  (pixelH * pixelGrid * 2)";
			w = "2 *   2 *  (pixelW * pixelGrid * 2)";
			h = "2 *  (pixelH * pixelGrid * 2)";
		};
		class BackgroundBarRight: BackgroundBarLeft
		{
			angle = 0;
			x = "0.5 + 2 *   2 *  (pixelW * pixelGrid * 2)";
		};
		class CAALogo: RscPictureKeepAspect
		{
			idc = 1299;
			text = "\a3\Ui_f\data\Logos\arma3_shadow_ca.paa";
			tooltip = "ha";
			onButtonClick = "";
			action = "";
			x = "safezoneX + safezoneW -        2 *     (pixelW * pixelGrid * 2) -  (4 * pixelH)";
			y = "safezoneY + safezoneH - (4 *       2 +     1) *    (pixelH * pixelGrid * 2) - 4 *  (4 * pixelH)";
			w = "1.28 *             (           ((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.28 *             (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
		};
		class Logo: RscActivePicture
		{
			text = "x\cmf\addons\menu\data\logo.paa";
			tooltip = "http://www.coalitiongroup.net";
			color[] = {0.9,0.9,0.9,1};
			colorActive[] = {1,1,1,1};
			shadow = 0;
			x = "0.5 - 	5 * 	(pixelW * pixelGrid * 2)";
			y = "safezoneY + (3 - 0.5 * 	5) * 	(pixelH * pixelGrid * 2)";
			w = "2 * 	5 * 	(pixelW * pixelGrid * 2)";
			h = "1 * 	5 * 	(pixelH * pixelGrid * 2)";
			onButtonClick = "http://www.coalitiongroup.net/wiki";
			onSetFocus = "(_this select 0) ctrlsettextcolor [1,1,1,1];";
			onKillFocus = "(_this select 0) ctrlsettextcolor [0.9,0.9,0.9,1];";
			onLoad = "(_this select 0) ctrlshow !(395180 in getDLCs 1)";
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
		};
		class LogoApex: Logo
		{
			text = "x\cmf\addons\menu\data\logo.paa";
			x = "0.5 - 	6.25 * 	(pixelW * pixelGrid * 2)";
			y = "safezoneY + (3 - 0.37 * 	6.25) * 	(pixelH * pixelGrid * 2)";
			w = "2 * 	6.25 * 	(pixelW * pixelGrid * 2)";
			h = "1 * 	6.25 * 	(pixelH * pixelGrid * 2)";
			show = 1;
			onLoad = "(_this select 0) ctrlshow (395180 in getDLCs 1)";
		};
	};
	class IconPicture: RscPictureKeepAspect
	{
		spacing = "(4 * pixelH)";
		x = 0;
		y = 0;
		w = "2 *  (pixelW * pixelGrid * 2)";
		h = "2 *  (pixelH * pixelGrid * 2)";
	};
	class DlcOwnedIconPicture: RscPictureKeepAspect
	{
		spacing = "(4 * pixelH)";
		x = 0;
		y = 0;
		w = "2 *  (pixelW * pixelGrid * 2)";
		h = "2 *  (pixelH * pixelGrid * 2)";
	};
	class DlcIconPicture: RscPictureKeepAspect
	{
		spacing = "(4 * pixelH)";
		x = 0;
		y = 0;
		w = "2 *  (pixelW * pixelGrid * 2)";
		h = "2 *  (pixelH * pixelGrid * 2)";
		colorText[] = {1,1,1,0.5};
	};
};

////////////////////////////////////////

/*class RscTitles
{
	class SplashBohemia
	{
		idd = -1;
		movingEnable = 0;
		duration = 3;
		fadein = 0;
		fadeout = 0;
		name = "Splash screen Bohemia Interactive";
		controls[] = {"Picture","TextPresents"};
		class Picture: RscPicture
		{
			idc = 1200;
			text = "\A3\Ui_f\data\IGUI\RscTitles\SplashBohemia\bi_logo_small_ca.paa";
			x = "SafeZoneX + SafeZoneW / 2 - (48 *    (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY +  SafeZoneH / 2 - (31.7 *     (0.025 * SafezoneH)) / 2";
			w = "48 *     (0.01875 * SafezoneH)";
			h = "24 *     (0.025 * SafezoneH)";
		};
		class TextPresents: RscText
		{
			idc = 1000;
			text = "PRESENTS";
			style = 2;
			sizeEx = "0.03*SafezoneH";
			shadow = 0;
			x = "SafeZoneX + SafeZoneW / 2 - (46.5 *    (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY +  SafeZoneH - (0.505 * SafezoneH)";
			w = "48 *     (0.01875 * SafezoneH)";
			h = "0.03 * SafezoneH";
		};
	};
	class SplashNoise
	{
		idd = -1;
		movingEnable = 0;
		duration = 11;
		fadein = 0;
		fadeout = 0;
		controls[] = {"BackgroundNoise"};
		class BackgroundNoise: RscPicture
		{
			text = "\A3\Ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
			colorText[] = {1,1,1,0.7};
			x = "safezoneXAbs";
			y = "safezoneY";
			w = "safezoneWAbs";
			h = "safezoneH";
		};
	};
	class SplashArma3
	{
		idd = -1;
		movingEnable = 0;
		duration = 3;
		fadein = 0;
		fadeout = 0;
		name = "Splash screen Arma 3";
		controls[] = {"Picture"};
		class Picture: RscPicture
		{
			idc = 1200;
			text = "TCW_Core\miscTextures\background2.paa";
			x = "0.5 - 10 *     (0.01875 * SafezoneH)";
			y = "0.5 - 6 *    (0.025 * SafezoneH)";
			w = "20 *     (0.01875 * SafezoneH)";
			h = "10 *     (0.025 * SafezoneH)";
		};
	};
	class SplashArma3Apex: SplashArma3
	{
		class Picture: Picture
		{
			text = "TCW_Core\miscTextures\background2.paa";
			y = 0;
			x = -0.03;
			w = "20 *   2*  (0.01875 * SafezoneH)";
			h = "10 *   2*  (0.025 * SafezoneH)";
		};
	};
	class SplashCopyright
	{
		idd = -1;
		movingEnable = 0;
		duration = 3;
		fadein = 0;
		fadeout = 0;
		name = "Splash screen Copyright";
		controls[] = {"PictureA3Logo","PictureBIlogo","PicturePhysXLogo","LegalText"};
		class PictureA3Logo: RscPicture
		{
			idc = 1200;
			text = "\A3\Ui_f\data\Logos\arma3_white_ca.paa";
			x = "SafeZoneX + SafeZoneW / 2 - (36 *    (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY +  SafeZoneH / 2 - (13.7 *     (0.025 * SafezoneH)) / 2";
			w = "8 *    (0.01875 * SafezoneH)";
			h = "4 *    (0.025 * SafezoneH)";
		};
		class PictureBIlogo: RscPicture
		{
			idc = 1201;
			text = "\A3\Ui_f\data\IGUI\RscTitles\SplashBohemia\bi_logo_small_ca.paa";
			x = "SafeZoneX + SafeZoneW / 2 - (33 *    (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY +  SafeZoneH / 2 - (25.7 *     (0.025 * SafezoneH)) / 2";
			w = "32 *     (0.01875 * SafezoneH)";
			h = "16 *     (0.025 * SafezoneH)";
		};
		class PicturePhysXLogo: RscPicture
		{
			idc = 1202;
			text = "\A3\Ui_f\data\Logos\GameWorks_white_ca.paa";
			x = "SafeZoneX + SafeZoneW / 2 + (16.5 *    (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY +  SafeZoneH / 2 - (13.6 *     (0.025 * SafezoneH)) / 2";
			w = "16 *     (0.01875 * SafezoneH)";
			h = "4 *    (0.025 * SafezoneH)";
		};
		class LegalText: RscStructuredText
		{
			idc = -1;
			text = "Â© 2013-2018 Bohemia Interactive a.s. ArmaÂ® and Bohemia InteractiveÂ® are registered trademarks of Bohemia Interactive a.s. All rights reserved.<br /><br /><br /><br />NVIDIA GameWorksâ„¢ Technology provided under license from NVIDIA Corporation. Copyright Â© 2002-2018 NVIDIA Corporation. All rights reserved.<br />NVIDIAÂ® and PhysXÂ® are trademarks of NVIDIA Corporation and are used under license.<br /><br />Portions of this software utilize Simul True Sky technology (Â© 2015 Simul Software Ltd, all rights reserved).<br /><br />This product includes copyrighted material of DigitalGlobe, Inc. All rights reserved.<br /><br />Arma 3 simulates real-world weapons, vehicles and other equipment. The product names, logos, brands and other trademarks<br />depicted or referred to in the game or in its ancillary materials are the property of their respective trademark owners.<br />These trademark owners, and the manufacturers of the weapons, vehicles and other equipment used in the game,<br />are not affiliated with the producer of Arma 3 and do not endorse or sponsor the game.";
			size = "0.02 * SafezoneH";
			shadow = 0;
			x = "SafeZoneX + SafeZoneW / 2 - (50 *    (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY +  SafeZoneH - (0.38 * SafezoneH)";
			w = "50 *     (0.01875 * SafezoneH)";
			h = "0.39 * SafezoneH";
			class Attributes
			{
				align = "center";
				shadow = 0;
			};
		};
	};
};*/