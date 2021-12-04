/*
 * Author: tanaKa
 * Creates a welcome that explains a persons role
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call CMF_fnc_initWelcome;
 *
 * Public: False
 */
 
// Exit if a JIP
if (gameLive) exitWith {call CMF_fnc_initJIP;};

// Grab role and convert to readable role
_role = [typeOf player, 9] call BIS_fnc_trimString;
_roleT = "Undefined Entity";
_roleNotes = "Undefined and coming soon. Ask tanaKa how you can help.";
switch (_role) do {
	//Fireteams
	case "ftl":
	{
		_roleT = "Fireteam Leader";
		_brief = "";
		_roleNotes = "You are the leader of a five man team that's divided into two color teams.<br/><br/>
		
		It is your job to disseminate information delivered by your squad leader and turn it into team orders for both your color teams.";
	};
	case "ar":
	{
		_roleT = "Automatic Rifleman";
		_brief = "";
		_roleNotes = "You are the primary provider of sustained automatic fire and the leader of the BOF color team. Always return fire immediately in order to overwhelm any enemy contact and suppress them.<br/><br/>
		 
		 Work with your AAR to engage and indentify targets when stationary and give him orders when needed.";
	};
	case "aar":
	{
		_roleT = "Assistant Automatic Rifleman";
		_brief = "";
		_roleNotes = "You are the assistant to the automatic rifleman and carry extra ammunition for the weapon itself as well as binoculars for spotting.<br/><br/>
		
		Always stick with your color team member and always be spotting targets for him when engaging the enemy with the AR. Do not be afraid to adjust his fire when engaging.";
	};
	case "lat":
	{
		_role = "Rifleman (Anti-Tank)";
		_brief = "";
		_roleNotes = "You are the anti vehicle rifleman for your fireteam.<br/><br/>
		
		Always stick with your color team and engage any armor that is deemed a threat to your fireteam. Always remember to yell 'CLEAR BACKBLAST!' and 'ROCKET' prior to firing your launcher.";
	};
	case "rifleman_02":
	{
		_roleT = "Grenadier";
		_brief = "";
		_roleNotes = "You are a 40mm force multiplier for your fireteam with extra grenades to suppress the enemy or provide smoke for dangerous crossings.<br/><br/>
		
		Always stick with your color team and identify when your fireteam will need 40mm support in the form of smokes or HE.";
	};
	//Squads
	case "sl":
	{
		_roleT = "Squad Leader";
		_brief = "";
		_roleNotes = "You are the leader of a squad of 12-14 infantry. Your primary role is to disseminate orders given to you by your platoon leader so that it's relevant to your squads movement.<br/><br/>
		
		Remember to always feed information down to your fireteam leaders and request information from them when possible.";
	};
	case "sm":
	{
		_roleT = "Squad Medic";
		_brief = "";
		_roleNotes = "You are the sole provider of medical support for 12-14 infantry. Take care of their wounds and always assess them before providing treatment.<br/><br/>
		
		Always take control of situations by providing clear orders to infantry in order to recover and process casualties.";
	};
	//Platoons
	case "plt":
	{
		_roleT = "Platoon Leader";
		_brief = "";
		_roleNotes = "You are the direct leader in charge of at least two squads. If a commander is present, it is your responsibility to disseminate their orders into a plan related to your platoon. Otherwise, read the briefing and create a plan of action for your squad leaders under you.<br/><br/>
		
		Remember that it's not your job to tell squads HOW to do something, but instead WHERE and WHEN to do it. Let your squad leads do their job.";
	};
	case "plm":
	{
		_roleT = "Platoon Medical Officer";
		_brief = "";
		_roleNotes = "You are the medical officer in charge of all medics within the platoon.<br/><br/>
		
		Ensure they and their squads medical supply needs are met pre-plan when and where you want field hospitals or CCPs if they're in use.";
	};
	case "fac":
	{
		_roleT = "Forward Observer/Air Controller";
		_brief = "";
		//_roleNotes = "";
	};
	case "uav":
	{
		_roleT = "UAV Operator";
		_brief = "";
		//_roleNotes = "";
	};
	//Company
	case "coy":
	{
		_roleT = "Commanding Officer";
		_brief = "";
		//_roleNotes = "";
	};
	case "cm":
	{
		_roleT = "Company Medical Officer";
		_brief = "";
		//_roleNotes = "";
	};
	case "xo":
	{
		_roleT = "Company First Sergeant";
		_brief = "";
		//_roleNotes = "";
	};
	// Specialties
	case "demo":
	{
		_roleT = "Demolitions Specialist";
		_brief = "";
		//_roleNotes = "";
	};
	case "mine":
	{
		_roleT = "Mine Specialist";
		_brief = "";
		//_roleNotes = "";
	};
	case "demol":
	{
		_roleT = "Demolitions Leader";
		_brief = "";
		//_roleNotes = "";
	};
	case "sniper":
	{
		_roleT = "Sniper/Marksman";
		_brief = "";
		//_roleNotes = "";
	};
	case "spotter":
	{
		_roleT = "Spotter/Team Leader";
		_brief = "";
		//_roleNotes = "";
	};
	case "mmgl":
	{
		_roleT = "Medium Machine Gunner Leader";
		_brief = "";
		//_roleNotes = "";
	};
	case "mmgg":
	{
		_roleT = "Medium Machine Gunner";
		_brief = "";
		//_roleNotes = "";
	};
	case "mmgag":
	{
		_roleT = "Medium Machine Gunner Assistant";
		_brief = "";
		//_roleNotes = "";
	};
	case "matl":
	{
		_roleT = "Medium AT Leader";
		_brief = "";
		//_roleNotes = "";
	};
	case "matg":
	{
		_roleT = "Medium AT Gunner";
		_brief = "";
		//_roleNotes = "";
	};
	case "matag":
	{
		_roleT = "Medium AT Assistant";
		_brief = "";
		//_roleNotes = "";
	};
	case "hatl":
	{
		_roleT = "Heavt AT Leader";
		_brief = "";
		//_roleNotes = "";
	};
	case "hatg":
	{
		_roleT = "Heavy AT Gunner";
		_brief = "";
		//_roleNotes = "";
	};
	case "hatag":
	{
		_roleT = "Heavy AT Assistant";
		_brief = "";
		//_roleNotes = "";
	};
	case "mtrl":
	{
		_roleT = "Mortar Team Leader";
		_brief = "";
		//_roleNotes = "";
	};
	case "mtrg":
	{
		_roleT = "Mortar Gunner";
		_brief = "";
		//_roleNotes = "";
	};
	case "mtrg":
	{
		_roleT = "Mortar Assistant";
		_brief = "";
		//_roleNotes = "";
	};
	case "msamag":
	{
		_roleT = "SAM Assistant";
		_brief = "";
		//_roleNotes = "";
	};
	case "msamg":
	{
		_roleT = "SAM Gunner";
		_brief = "";
		//_roleNotes = "";
	};
	case "msaml":
	{
		_roleT = "SAM Leader";
		_brief = "";
		//_roleNotes = "";
	};
	// Ground Vehicles
	case "vicd":
	{
		_roleT = "Vehicle Driver";
		_brief = "";
		//_roleNotes = "";
	};
	case "vicc":
	{
		_roleT = "Vehicle Gunner";
		_brief = "";
		//_roleNotes = "";
	};
	case "vicl":
	{
		_roleT = "Vehicle Commander";
		_brief = "";
		//_roleNotes = "";
	};
	// Air vehicles
	case "pilot":
	{
		_roleT = "Pilot";
		_brief = "";
		//_roleNotes = "";
	};
	case "helicrew":
	{
		_roleT = "Helicopter Crew";
		_brief = "";
		//_roleNotes = "";
	};
	case "cc":
	{
		_roleT = "Helicopter Crew Chief";
		_brief = "";
		//_roleNotes = "";
	};
	default
	{
		_roleT = "Rifleman";
	};
};

//systemchat format ["Role: %1\n\nRole Text: %2",_role,_roleT];

// Send message(s) - NOTE: these have to be in reverse order as they scroll up
// Purpose
[format["<t align='center'><t size='1.2'>Your role:</t><t size='1'><br/>%1</t>"
		,_roleNotes]
		,"success"
		,40
] call CMF_fnc_notify;

// Loadout
private _thisCfg = currentWeapon player call CBA_fnc_getItemConfig;
private _dispName = [_thisCfg] call BIS_fnc_displayName;
private _desc = getText(_thisCfg >> "descriptionShort");
private _pic = getText(_thisCfg >> "picture");
private _image = format["<img size='3' image='%1'/>",_pic];
hintStr = "<t align='center'><t size='1.2'>Loadout</t><br/><br/><t size='1'>%1<br/>%2</t><br/>%3";
pdispName = "";
pdesc = "";
pimage = "";

// Add handgun info
if !(handgunWeapon player == "") then {
	pCfg = handgunWeapon player call CBA_fnc_getItemConfig;
	pdispName = [pCfg] call BIS_fnc_displayName;
	pdesc = getText(pCfg >> "descriptionShort");
	ppic = getText(pCfg >> "picture");
	pimage = format["<img size='3' image='%1'/>",ppic];
	pHintStr = "<br/><br/>%4<br/>%5<br/>%6";
	hintStr = hintStr + pHintStr;
};

[format[hintStr
		,_dispName
		,_desc
		,_image
		,pdispName
		,pdesc
		,pimage]
		,"success"
		,20
] call CMF_fnc_notify;

// Role
[format["<t align='center'><t size='1.2'>You are a:<br/>%1</t>"
		,_roleT]
		,"success"
		,10
] call CMF_fnc_notify;