/* 
Module allowing for the selection of optics / gear.
Some of the code in this module has been inspired by the "loadout selector" component of fnf framework 
*/

// Here we define what classnames belong to which class
HKMTK_INF_CLASSES = ["B_Soldier_TL_F","B_Soldier_SL_F","B_soldier_LAT_F","B_Soldier_GL_F","B_medic_F","B_spotter_F","O_Soldier_TL_F","O_Soldier_SL_F","O_Soldier_LAT_F","O_Soldier_GL_F","O_medic_F","O_Soldier_AAR_F","B_soldier_AAR_F","O_spotter_F"];
HKMTK_OFF_CLASSES = ["B_officer_F","O_officer_F"];
HKMTK_ENG_CLASSES = ["B_soldier_exp_F","O_soldier_exp_F"];
HKMTK_HAT_CLASSES = ["B_soldier_AT_F","O_Soldier_AT_F"];
HKMTK_MRK_CLASSES = ["B_soldier_M_F","O_soldier_M_F"];
HKMTK_MGS_CLASSES = ["B_soldier_AR_F","O_Soldier_AR_F"];
HKMTK_SNI_CLASSES = ["B_sniper_F","O_sniper_F"];

// We can define the scopes for each slot from here
// param 1 : class name
// param 2 : slots the scope is available to - refers to the arrays defined above
HKMTK_SCOPES_LIST = [
	// Bluefor
	["rhsusf_acc_g33_xps3", ["INF","OFF","HAT","ENG"]],
	["rhsusf_acc_g33_T1", ["INF","OFF","HAT","ENG"]],
	["rhsusf_acc_ACOG", ["INF","OFF","HAT","ENG"]],
	["optic_MRCO", ["INF","OFF","HAT","ENG"]],
	["optic_Hamr", ["INF","OFF","HAT","ENG"]],
	["rhsusf_acc_su230a_mrds", ["MGS"]],
	["UK3CB_BAF_TA31F", ["MGS"]],
	["rhsusf_acc_ELCAN_ard", ["MGS"]],
	["optic_Holosight", ["MGS"]],
	["BWA3_optic_PMII_shortdotCC", ["MRK"]],
	["Tier1_Shortdot_ADM_Black", ["MRK"]],
	["Tier1_ATACR18_ADM_Desert", ["MRK"]],
	["Tier1_LeupoldM3A_ADM_T2_Desert", ["MRK"]],
	["Tier1_LeupoldM3A_ADM_T2_Black", ["MRK"]],
	["optic_lrps", ["SNI"]],
	["BWA3_optic_PMII_DMR", ["SNI"]],
	["rhsusf_acc_LEUPOLDMK4_2_mrds", ["SNI"]],
	["BWA3_optic_M5XI_MSR", ["SNI"]]
];

// We can define some gear for each slot from here
// param 1 : class name
// param 2 : slots the gear item is available to
// param 3 : number of said item
HKMTK_GEAR_LIST = [
	// Bluefor
	["HandGrenade", ["INF","OFF"], 1],
	["MiniGrenade", ["INF","OFF"], 2],
	["rhs_mag_rgo", ["INF","OFF"], 1],
	["ACE_CTS9", ["INF","OFF"], 1],
	["ATMine_Range_Mag", ["ENG"], 3],
	["ACE_FlareTripMine_Mag", ["ENG"], 7],
	["SatchelCharge_Remote_Mag", ["ENG"], 2],
	["APERSTripMine_Wire_Mag", ["ENG"], 2],
	["rhsusf_mine_m14_mag", ["ENG"], 4]
];

// We can define the weapons (and ammo) for each slot from here
// param 1 : class name
// param 2 : slots the gun is available to - refers to the arrays defined above
// param 3 : array of attachments related to the gun
// param 4 : matrix of pairs of [ammunition class names , ammunition amount]
// param 5 : side
HKMTK_WEAPONS_LIST = [
	// Bluefor
	["rhs_weap_g36kv", ["INF","OFF","HAT","ENG"],["BWA3_acc_VarioRay_irlaser_black","rhsusf_acc_grip2"],[["rhssaf_30rnd_556x45_EPR_G36",8]], west ],
	["rhs_weap_g36c", ["INF","OFF","HAT","ENG"],["BWA3_acc_VarioRay_irlaser_black","rhsusf_acc_grip2"],[["rhssaf_30rnd_556x45_EPR_G36",8]], west ],
	["rhsusf_weap_MP7A2", ["INF","OFF","HAT","ENG"],["BWA3_acc_VarioRay_irlaser_black","rhsusf_acc_rvg_blk"],[["rhsusf_mag_40Rnd_46x30_AP",8]], west ],
    ["BWA3_MG5", ["MGS"],["BWA3_acc_VarioRay_irlaser_black"],[["BWA3_120Rnd_762x51",3],["BWA3_120Rnd_762x51_Tracer",3]], west ],
    ["BWA3_MG3", ["MGS"],["BWA3_bipod_mg3","BWA3_acc_VarioRay_irlaser_black"],[["BWA3_120Rnd_762x51",3],["BWA3_120Rnd_762x51_Tracer",3]], west ],
	["BWA3_G28", ["MRK"],[],[["BWA3_20Rnd_762x51_G28",6]], west ],
	["BWA3_G29", ["SNI"],["tier1_harris_bipod_black"],[["BWA3_10Rnd_86x70_G29",6]], west ],
	["UK3CB_BAF_L115A3_DE", ["SNI"],[],[["UK3CB_BAF_338_5Rnd",12]], west ],
	["rhs_weap_t5000", ["SNI"],["tier1_harris_bipod_black"],[["rhs_5Rnd_338lapua_t5000",12]], west ],

	// Redfor
	["rhsusf_weap_MP7A2_desert", ["INF","OFF","HAT","ENG"],["tier1_la5_top","rhsusf_acc_rvg_de"],[["rhsusf_mag_40Rnd_46x30_AP",8]], east ],
	["Tier1_HK416D145_SMR_IMOD_BlackDesert", ["INF","OFF","HAT","ENG"],["tier1_la5_top","rhsusf_acc_grip2"],[["rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger",8]], east ],
	["rhs_weap_mk18_d", ["INF","OFF","HAT","ENG"],["tier1_MK18_LA5_M603V_FL","rhsusf_acc_rvg_de"],[["rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger",8]], east ],
	["Tier1_MK48_Mod1_Desert", ["MGS"],["tier1_SAW_Bipod_2_Desert"],[["Tier1_100Rnd_762x51_Belt_M80",3],["Tier1_100Rnd_762x51_Belt_M62_Tracer",3]], east ],
	["rhs_weap_m240G", ["MGS"],[],[["Tier1_100Rnd_762x51_Belt_M80",3],["Tier1_100Rnd_762x51_Belt_M62_Tracer",3]], east ],
	["BWA3_G29", ["SNI"],["tier1_harris_bipod_black"],[["BWA3_10Rnd_86x70_G29",6]], east ],
	["Tier1_M110k5", ["MRK"],["Tier1_Harris_Bipod_MLOK_Tan"],[["Tier1_20Rnd_762x51_M993_SR25_Mag",6]], east ],
	["UK3CB_BAF_L115A3_DE", ["SNI"],[],[["UK3CB_BAF_338_5Rnd",12]], east ],
	["rhs_weap_t5000", ["SNI"],["tier1_harris_bipod_black"],[["rhs_5Rnd_338lapua_t5000",12]], east ]
];

// We can define the AT launchers (and ammo) for HAT classes from here
// param 1 : class name
// param 2 : array of attachments related to the gun
// param 3 : matrix of pairs of [ammunition class names , ammunition amount]
HKMTK_ANTITANK_LIST = [
	// WHEN CHANGING THIS LIST, NEED TO CHANGE THE SCRIPT TOO TO DIFFERENTIATE LAUNCHERS FROM BACKPACKS
	["rhs_weap_smaw_green", ["rhs_weap_optic_smaw"],["rhs_mag_smaw_HEAA",3] ],
	["rhs_weap_maaws", ["rhs_optic_maaws"],["rhs_mag_maaws_HEAT",3] ],
	["rhs_weap_fim92", [],["rhs_fim92_mag",2] ],
	["Redd_Milan_Static_Barrel", [],[] ],
	["Redd_Milan_Static_Tripod", [],[] ]
];


// We can define the vehicles for each side from here
// param 1 : side
// param 2 : array of class names
HKMTK_VEHICLES_LIST = [
	// Bluefor
	[west, [bv1_1, bv1_2, bv1_3], "Asset Selector One"],
	[west, [bv2_1, bv2_2], "Asset Selector Two"],
	[east, [rv1_1, rv1_2], "Asset Selector One"],
	[east, [rv2_1, rv2_2], "Asset Selector Two"]
	/*[west, [bv2-1, bv2-2], "Group 2"],

	// Redfor
	[east, [rv1-1, rv1-2], "Group A"],
	[east, [rv2-1, rv2-2], "Group B"],
	[east, [rv3-1, rv3-2], "Group C"]*/
];


_conditionMA = {
	!omtk_wu_is_completed
};

// Main (father) action, all other actions will be their child
_action = ["t_MA","Selector","",{},_conditionMA] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject; 

// Child actions, that will contain all the possible choices for each cathegory 
_action = ["t_MA_W","Weapon Selector","",{},_conditionMA] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","t_MA"], _action] call ace_interact_menu_fnc_addActionToObject; 

_action = ["t_MA_S","Scope Selector","",{},_conditionMA] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","t_MA"], _action] call ace_interact_menu_fnc_addActionToObject; 

_action = ["t_MA_G","Gear Selector","",{},_conditionMA] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","t_MA"], _action] call ace_interact_menu_fnc_addActionToObject; 

// Initialising a variable
prevScope = "";
prevWeapon = primaryWeapon player;
// Script where the choices are actually decided for each cathegory
execVM "omtk\warm_up_selector\sel_optics.sqf";
execVM "omtk\warm_up_selector\sel_weapons.sqf";
execVM "omtk\warm_up_selector\sel_gear.sqf";


if ((typeOf player) in HKMTK_OFF_CLASSES) then {
	_action = ["t_MA_V","Vehicle Selector","",{},_conditionMA] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions","t_MA"], _action] call ace_interact_menu_fnc_addActionToObject; 

	execVM "omtk\warm_up_selector\sel_vehicles.sqf";
};


if ((typeOf player) in HKMTK_HAT_CLASSES) then {
	_action = ["t_MA_A","Anti-Tank Selector","",{},_conditionMA] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions","t_MA"], _action] call ace_interact_menu_fnc_addActionToObject; 
	
	prevLauncher = secondaryWeapon player;
	startBackpack = backpack player;

	execVM "omtk\warm_up_selector\sel_antitank.sqf";
};