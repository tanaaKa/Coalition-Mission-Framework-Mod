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
		_roleNotes = "You are A forward observer or forward air controller in charge of spotting for and ajusting fire of Artillery or Air assets.<br/><br/>

		You are responsible for coordinating and planning with artillery or pilot assets to setup Reference points or preplanned strikes. You will be talking fire onto the target and choosing the correct munition for the strike. For artillery you must know how to call for ajustment of fire. For air assets you may need to visually mark the target with a laser or smoke to provide a point of refrence.";
	};
	case "uav":
	{
		_roleT = "UAV Operator";
		_brief = "";
		_roleNotes = "You are an UAV operator in charge of a drone for gathering intel and potentally providing CAS.<br/><br/>

		If equipped with an unarmed drone your role is to observe and relay intel about enemy positions. You may also be able to lase targets for other assets.<br/><br/>
		
		If you have an armed drone you may also be responsible for close air support along with the above intel role";
	};
	//Company
	case "coy":
	{
		_roleT = "Commanding Officer";
		_brief = "";
		_roleNotes = "You are the Company Commander directly in charge of at least two platoons and multiple force multipling assets<br/><br/>
		
		Ensure your Platoons each have a defined objective so they can plan accordingly. You are also responsible for delegating the use of force mutipliers and positioning them such that they can support the mission effectively.<br/><br/>
		
		Remeber that you should give general orders and let leaders below you refine the plan to fit their elements<br/><br/>

		Your First sergeant is a useful tool to delegate task to. For example coordinating resupply between logi and another unit. Or setting up and managing a convoy order.";
	};
	case "cm":
	{
		_roleT = "Company Medical Officer";
		_brief = "";
		_roleNotes = "You are the Company Medical Officer in charge of at least 2 platoon medical officers.<br/><br/>
		
		Gather the medics during briefing and ensure they have any and all supplies they may need. Plan potential Hospital and CCP locations or resupply points.";
	};
	case "xo":
	{
		_roleT = "Company First Sergeant";
		_brief = "";
		_roleNotes = "You are the First Sergeant the right hand of COY.<br/><br/>
		
		Your entire job is to take some of the burden of leadership off of COY. You should help coordinate things such as resupply points. Make sure convoys have formations.Or even oversee fortifications. Whatever task COY cannot do himself but shouldnt be put directly onto a platoon leaders burden if possible ";
	};
	// Specialties
	case "demo":
	{
		_roleT = "Demolitions Specialist";
		_brief = "";
		_roleNotes = "You are a demolitions specilist in charge of placing or disposal of explosives.<br/><br/>
		
		You are directly responsible for safely handling explosives. You should ensure there is no collateral damage of any sort";
	};
	case "mine":
	{
		_roleT = "Mine Specialist";
		_brief = "";
		_roleNotes = "You are a mine specialist/sapper. You are in charge of placing or disposing of mines or IEDs.<br/><br/>
		
		You are directly responsible for safely placing and documenting minefields. You may also be responsible for setting up ambush areas. You should also attempt to avoid collateral damage.  ";
	};
	case "demol":
	{
		_roleT = "Demolitions Leader";
		_brief = "";
		_roleNotes = "You are in chage of a sapper/demolitions team. You are directly in control of how and when explosives are used.<br/><br/>
		
		You should ensure all explosives are safely dealt with. Communicate any detonations. Make sure mines are marked and clearly communicated so friendlies dont stray into a minefield. <br/><br/>
		
		Occasionally you may be responsible for explosives disposal and or route clearance. ";
	};
	case "sniper":
	{
		_roleT = "Sniper/Marksman";
		_brief = "";
		//_roleNotes = "You are in charge of a precision rifle and magnified optic.<br/><br/>
		
        You will work with your spotter to engage high value targets or targets of oppertunity. You should also provide overwatch and intel for friendlies. <br/><br/>";
	};
	case "spotter":
	{
		_roleT = "Spotter/Team Leader";
		_brief = "";
		//_roleNotes = "You are in charge of planning for and positioning your sniper team effectively<br/><br/>
		
		You are responisble for observation and recon of the enemy. And or providing overwatch security over an area. <br/><br/>

		You should call targets for your sniper and direct his fire when needed. Prioritizing the highest value target available. ";
	};
	case "mmgl":
	{
		_roleT = "Medium Machine Gunner Leader";
		_brief = "";
		//_roleNotes = "You are in charge of positioning and utilizing a 3 man Medium machine gun team<br/><br/>
		
		Your Asset is great for providing overwatch or flank security. You can also control a lane of fire like a road or valley. You may be used as a base of fire to cover troop movement You should always be looking for targets while your gunner and his assistant are engaging.";
	};
	case "mmgg":
	{
		_roleT = "Medium Machine Gunner";
		_brief = "";
		//_roleNotes = "You carry and use a medium machine gun to provide fire supiority and suppression<br/><br/>
		
		You will work with your Assistant to engage and spot targets.";
    };
	case "mmgag":
	{
		_roleT = "Medium Machine Gunner Assistant";
		_brief = "";
		//_roleNotes = "You will support the MMG gunner by spotting targets and keeping his ammo topped off<br/><br/>
		
		You should provide adjustment callouts for your gunners fire. Communicate range and bearing to targets. As well as link his belts to keep him from running dry on ammo in sustained engagements. Repacking belts in your spare time.";
	};
	case "matl":
	{
		_roleT = "Medium AT Leader";
		_brief = "";
		//_roleNotes = "You are in charge of a 3 man MAT team responsible for positioning and manuevering to engage enemy armored targets<br/><br/>
		
		You will be responding to armor threats that squads cannot deal with themselves. Or positioned to deny an area. When in doubt position yourself to control a road or field that may provide armored vehicles an approach. You are also very manueverable and should consider using hunter killer tactics";
	};
	case "matg":
	{
		_roleT = "Medium AT Gunner";
		_brief = "";
		//_roleNotes = "You carry and utilize a Medium Anti tank launcher which packs more of a punch than what a RAT carries.<br/><br/>
		
		You will work with your AT assistant to spot and engage enemy armored assets. You may be expected to do so at long ranges.";
	};
	case "matag":
	{
		_roleT = "Medium AT Assistant";
		_brief = "";
		//_roleNotes = "You are responsible for spotting and loading for your MAT gunner<br/><br/>
		
		You will use your rangefinder to scan for and spot targets for your gunner. You should provide range data and if need be ajustment of fire. You may also load his launcher for him as you carry some of his extra ammo.";
	};
	case "hatl":
	{
		_roleT = "Heavy AT Leader";
		_brief = "";
		//_roleNotes = "You are in charge of a 3 man HAT team which is responsible for planning and positioning of your launcher system.<br/><br/>
		
		HAT teams have the most effective launcher for eliminating enemy medium or heavy armor like IFVs or MBTs. You are not as mobile or low profile compared to other forms of AT. Your range capability means you can control and deny a large area if positioned well enough";
	};
	case "hatg":
	{
		_roleT = "Heavy AT Gunner";
		_brief = "";
		//_roleNotes = " You are in charge of carrying and utilizing a HAT launcher system.<br/><br/>
		
		You will work with your Assistant to setup and man the launcher to engage enemy armor assets";
	};
	case "hatag":
	{
		_roleT = "Heavy AT Assistant";
		_brief = "";
		//_roleNotes = "You are in charge of carrying the ammo and or tripod for your HAT launcher system.<br/><br/>
		
		You will help setup and position the launcher. You are also responible for spotting targets and loading the launcher. ";
	};
	case "mtrl":
	{
		_roleT = "Mortar Team Leader";
		_brief = "";
		//_roleNotes = "You are in charge of a Mortar tube or Artillery piece<br/><br/>
		
		You will be cooridinating with the Forward observer to provide fire support for the front line. You are responsible for feeding the fire mission information to the gunner and communicating flight times back to the frontline. in the case of direct line of sight fire. You are observing and ajusting for your gunner";
	};
	case "mtrg":
	{
		_roleT = "Mortar Gunner";
		_brief = "";
		//_roleNotes = "As a Mortar/Artillery gunner you are responsible for laying the gun on target utilizing data from the Team leader. <br/><br/>
		
		You should readback all data as the leader feeds it to you to ensure the azimuth, elevation, and charge are correct before firing.";
	};
	case "mtrg":
	{
		_roleT = "Mortar Assistant";
		_brief = "";
		//_roleNotes = "You are a Mortar/Arillery Assistant gunner in charge of setting up the weapon system and managing its ammunition.<br/><br/>
		
		You will be loading the weapon and counting off rounds as they are fired to ensure the correct round count has been fired for the strike. You may also be needed to double check fire calculations on the fly.";
	};
	case "msamag":
	{
		_roleT = "SAM Assistant";
		_brief = "";
		//_roleNotes = "You are a Surface to Air Missile gunners assistant and ammo bearer.<br/><br/>
		
		Help spot targets and direct your gunner to them. Load for him so he does not need to reaquire targets";
	};
	case "msamg":
	{
		_roleT = "SAM Gunner";
		_brief = "";
		//_roleNotes = "You are a Surface to Air Missile gunner in charge of carrying and utilizing the launcher<br/><br/>
		
		Coordinate with your assistant to spot and engage enemy aircraft. If possible coordinate your fire with another SAM gunner for best effect against countermeasures";
	};
	case "msaml":
	{
		_roleT = "SAM Leader";
		_brief = "";
		//_roleNotes = "You are in charge of a 3 man Surface to Air Missile team<br/><br/>
		
		When positioned properly you provide security against enemy air assets. Hanging out near Edges of fields and treelines or being near a rooftop where you can quickly fire and forget is your best bet.";
	};
	// Ground Vehicles
	case "vicd":
	{
		_roleT = "Vehicle Driver";
		_brief = "";
		_roleNotes = "You are in charge of safely positioning and manuevering your vehicle.<br/><br/>
		
		As the driver you should coordinate with the vehicle commander to ensure his intentions are met as safely as possible. You should also coordinate with the gunner to ensure they can properly engage targets. Remember to position your vehicles armor toward the most likely threat when possible.";
	};
	case "vicc":
	{
		_roleT = "Vehicle Gunner";
		_brief = "";
		_roleNotes = "You are a vehicle gunner in charge of the main weapon system aboard the vehicle.<br/><br/>
		
		Ensure you coordinate with the driver to properly position your weapon such that it is effective. When you are trying to engage something you are directly in command of the drivers movements";
	};
	case "vicl":
	{
		_roleT = "Vehicle Commander";
		_brief = "";
		_roleNotes = "You are a Vehicle Commander in charge of coordinating with other Commanders/leaders and your crew<br/><br/>
		
		You will be issuing movement and engagement orders for your crew. As well as spotting targets for the gunner. As the vehicle commander you are the eyes and ears for your crew. ";
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