class CfgFunctions
{
	class CMF
	{
		class GameModeAD
		{
			file = "\x\cmf\addons\framework\gamemodes\adsectors";
			class ADsectorInit{};
			//class zeusInit{};
		};
		class MapTimer
		{
			file = "\x\cmf\addons\framework\misc\maptimer";
			class clientTime{};
			class showTimeOnMap{};
		};
		class VehicleKill
		{
			file = "\x\cmf\addons\framework\misc\vehiclekill";
			class handleDamage{};
		};
		class notifications
		{
			file = "\x\cmf\addons\framework\misc\notifs";
			class notify{};
		};
		class webhooks
		{
			file = "\x\cmf\addons\framework\logging";
			class sessionLog{};
			class webhookBrief{};
			class webhookEnd{};
			class webhookStart{};
			class tkMsg{};
			class rpBrief{};
			class rpEnd{};
			class rpStart{};
			class playerGroupNames{};
		};
		class patches
		{
			file = "\x\cmf\addons\framework\patches";
			class patchInit{};
		};
		class garbageCleanup
		{
			file = "\x\cmf\addons\framework\cleanup";
			class garbageCleanup{};
		};
		class readyup
		{
			file = "\x\cmf\addons\framework\readyup";
			class readyUp{};
		};
		class mev
		{
			file = "\x\cmf\addons\framework\mev";
			class mevInit{};
		};
		class miniArsenal
		{
			file = "\x\cmf\addons\framework\miniarsenal";
			class addArsenal{};
			class removeArsenal{};
		};
		class EH
		{
			file = "\x\cmf\addons\framework\EH";
			class localEHs{};
			class serverEHs{};
		};
		class FDS
		{
			file = "\x\cmf\addons\framework\fds";
			class fdsInit{};
		};
		class vehiclespawner
		{
			file = "\x\cmf\addons\framework\vehiclespawner";
			class factoryaction{};
		};
		class vd
		{
			file = "\x\cmf\addons\framework\misc\vd"; 
			class limitVD{};
		};
		class radios
		{
			file = "\x\cmf\addons\framework\radios"; 
			class initRadios{};
			class ftRadios{};
			class sqdRadios{};
			class ldrRadios{};
		};
		class welcome
		{
			file = "\x\cmf\addons\framework\misc\welcome"; 
			class initWelcome{};
			class initJIP{};
		};
		class stamina
		{
			file = "\x\cmf\addons\framework\stamina"; 
			class staminaHandler{};
			class stamina{};
		};
		class statsTracking
		{
			file = "\x\cmf\addons\framework\statsTracking";
			class statsInitLocal{};
			class statsInitServer{};
			class updateStatArray {};
			class respawnStats {};
			class entityKilled {};
			class handleDisconnect {};
			class handleMissionEnd {};
		};
		/*
		// TODO: Implement these
		class GameModeCON
		{
			file = "\x\cmf\addons\framework\gamemodes\connection";
			class client_connection{};
			class server_connection{};
		};
		class GameModeCTF
		{
			file = "\x\cmf\addons\framework\gamemodes\ctf";
			class client_ctf{};
			class server_ctf{};
		};
		class GameModeSD
		{
			file = "\x\cmf\addons\framework\gamemodes\sd";
			class client_sd{};
			class server_sd{};
		};
		class GameModeNS
		{
			file = "\x\cmf\addons\framework\gamemodes\neutralsector";
			class neutralInit{};
		};
		class GameModeUL
		{
			file = "\x\cmf\addons\framework\gamemodes\uplink";
			class client_uplink{};
			class server_uplink{};
		}; 
		class GameModeRUSH
		{
			file = "\x\cmf\addons\framework\gamemodes\rush";
			class client_rush{};
			class server_rush{};
		}; */
	};
};