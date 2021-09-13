params ["_display"];

// If not admin, exit
if !(serverCommandAvailable "#kick") exitWith {};

/////////////////////////////////////////////////////////////////////
/* SIMULATION CONTROL */

// Picture of Simulation Control
simControlPic = _display ctrlCreate ["omtk_RscPicture", 1201];
simControlPic ctrlSetPosition [
	0.495 * safezoneW + safezoneX,
	0.25 * safezoneH + safezoneY,
	0.10 * safezoneW,
	0.03 * safezoneH
];
simControlPic ctrlCommit 0;
simControlPic ctrlSetText "omtk\admin_ui\img\sim_control.jpg";

// Disable all sim
buttonSimulation_Disable = _display ctrlCreate ["omtk_RscButton", 1201];
buttonSimulation_Disable ctrlSetPosition [
	0.495 * safezoneW + safezoneX,
	0.29 * safezoneH + safezoneY,
	0.06 * safezoneW,
	0.03 * safezoneH
];
buttonSimulation_Disable ctrlCommit 0;
buttonSimulation_Disable ctrlSetText "DISABLE ALL Sim";
buttonSimulation_Disable ctrlSetBackgroundColor [0.8, 0.2, 0.8, 1];
buttonSimulation_Disable ctrlAddEventHandler ["ButtonDown", {
	[] remoteExec['omtk_sim_disablePlayerSim', 0];
	[] remoteExec['omtk_sim_disableVehicleSim', 0];
}];

// Enable all sim
buttonSimulation_EnableAll = _display ctrlCreate ["omtk_RscButton", 1201];
buttonSimulation_EnableAll ctrlSetPosition [
	0.565 * safezoneW + safezoneX,
	0.29 * safezoneH + safezoneY,
	0.06 * safezoneW,
	0.03 * safezoneH
];
buttonSimulation_EnableAll ctrlCommit 0;
buttonSimulation_EnableAll ctrlSetText "Enable ALL Sim";
buttonSimulation_EnableAll ctrlAddEventHandler ["ButtonDown", {
	['all'] remoteExec['omtk_sim_enablePlayerSim', 0];
	[] remoteExec['omtk_sim_enableVehicleSim', 0];
}];

// Enable Blue sim
buttonSimulation_EnableBlue = _display ctrlCreate ["omtk_RscButton", 1201];
buttonSimulation_EnableBlue ctrlSetPosition [
	0.635 * safezoneW + safezoneX,
	0.29 * safezoneH + safezoneY,
	0.06 * safezoneW,
	0.03 * safezoneH
];
buttonSimulation_EnableBlue ctrlCommit 0;
buttonSimulation_EnableBlue ctrlSetText "Enable Blue Sim";
buttonSimulation_EnableBlue ctrlSetBackgroundColor [0.2, 0.2, 0.8, 1];
buttonSimulation_EnableBlue ctrlAddEventHandler ["ButtonDown", {
	['blu',blufor] remoteExec ['omtk_sim_enablePlayerSim', 0];
}];

// Enable Red sim
buttonSimulation_EnableRed = _display ctrlCreate ["omtk_RscButton", 1201];
buttonSimulation_EnableRed ctrlSetPosition [
	0.705 * safezoneW + safezoneX,
	0.29 * safezoneH + safezoneY,
	0.06 * safezoneW,
	0.03 * safezoneH
];
buttonSimulation_EnableRed ctrlCommit 0;
buttonSimulation_EnableRed ctrlSetText "Enable Red Sim";
buttonSimulation_EnableRed ctrlSetBackgroundColor [0.8, 0.2, 0.2, 1];
buttonSimulation_EnableRed ctrlAddEventHandler ["ButtonDown", {
	['red',opfor] remoteExec ['omtk_sim_enablePlayerSim', 0];
}];

// Enable Green sim
buttonSimulation_EnableGreen = _display ctrlCreate ["omtk_RscButton", 1201];
buttonSimulation_EnableGreen ctrlSetPosition [
	0.775 * safezoneW + safezoneX,
	0.29 * safezoneH + safezoneY,
	0.06 * safezoneW,
	0.03 * safezoneH
];
buttonSimulation_EnableGreen ctrlCommit 0;
buttonSimulation_EnableGreen ctrlSetText "Enable Green Sim";
buttonSimulation_EnableGreen ctrlSetBackgroundColor [0.2, 0.8, 0.2, 1];
buttonSimulation_EnableGreen ctrlAddEventHandler ["ButtonDown", {
	['green',independent] remoteExec ['omtk_sim_enablePlayerSim', 0];
}];

// Enable Vic sim
buttonSimulation_EnableVic = _display ctrlCreate ["omtk_RscButton", 1201];
buttonSimulation_EnableVic ctrlSetPosition [
	0.845 * safezoneW + safezoneX,
	0.29 * safezoneH + safezoneY,
	0.06 * safezoneW,
	0.03 * safezoneH
];
buttonSimulation_EnableVic ctrlCommit 0;
buttonSimulation_EnableVic ctrlSetText "Enable Vics Sim";
buttonSimulation_EnableVic ctrlAddEventHandler ["ButtonDown", {
	[] remoteExec ['omtk_sim_enableVehicleSim', 0];
}];

////////////////////////////////////////////////////////////////////

/* VIEW DISTANCE CONTROL*/
vdControlPic = _display ctrlCreate ["omtk_RscPicture", 1202];
vdControlPic ctrlSetPosition [
	0.495 * safezoneW + safezoneX,
	0.33 * safezoneH + safezoneY,
	0.05 * safezoneW,
	0.03 * safezoneH
];
vdControlPic ctrlCommit 0;
vdControlPic ctrlSetText "omtk\admin_ui\img\view_distance.jpg";

// Set VD 200
buttonVD_200 = _display ctrlCreate ["omtk_RscButton", 1201];
buttonVD_200 ctrlSetPosition [
	0.495 * safezoneW + safezoneX,
	0.37 * safezoneH + safezoneY,
	0.05 * safezoneW,
	0.03 * safezoneH
];
buttonVD_200 ctrlCommit 0;
buttonVD_200 ctrlSetText "Set VD 200";
buttonVD_200 ctrlAddEventHandler ["ButtonDown", {
	['set',200] remoteExec ['omtk_viewdistance_change', 0];
}];

// Set VD 600
buttonVD_600 = _display ctrlCreate ["omtk_RscButton", 1201];
buttonVD_600 ctrlSetPosition [
	0.555 * safezoneW + safezoneX,
	0.37 * safezoneH + safezoneY,
	0.05 * safezoneW,
	0.03 * safezoneH
];
buttonVD_600 ctrlCommit 0;
buttonVD_600 ctrlSetText "Set VD 600";
buttonVD_600 ctrlAddEventHandler ["ButtonDown", {
	['set', 600] remoteExec ['omtk_viewdistance_change', 0];
}];

// Set VD 1000
buttonVD_1000 = _display ctrlCreate ["omtk_RscButton", 1201];
buttonVD_1000 ctrlSetPosition [
	0.615 * safezoneW + safezoneX,
	0.37 * safezoneH + safezoneY,
	0.05 * safezoneW,
	0.03 * safezoneH
];
buttonVD_1000 ctrlCommit 0;
buttonVD_1000 ctrlSetText "Set VD 1000";
buttonVD_1000 ctrlAddEventHandler ["ButtonDown", {
	['set', 1000] remoteExec ['omtk_viewdistance_change', 0];
}];

// Set VD 2000
buttonVD_2000 = _display ctrlCreate ["omtk_RscButton", 1201];
buttonVD_2000 ctrlSetPosition [
	0.675 * safezoneW + safezoneX,
	0.37 * safezoneH + safezoneY,
	0.05 * safezoneW,
	0.03 * safezoneH
];
buttonVD_2000 ctrlCommit 0;
buttonVD_2000 ctrlSetText "Set VD 2000";
buttonVD_2000 ctrlAddEventHandler ["ButtonDown", {
	['set', 2000] remoteExec ['omtk_viewdistance_change', 0];
}];

// Set VD 3000
buttonVD_3000 = _display ctrlCreate ["omtk_RscButton", 1201];
buttonVD_3000 ctrlSetPosition [
	0.735 * safezoneW + safezoneX,
	0.37 * safezoneH + safezoneY,
	0.05 * safezoneW,
	0.03 * safezoneH
];
buttonVD_3000 ctrlCommit 0;
buttonVD_3000 ctrlSetText "Set VD 3000";
buttonVD_3000 ctrlAddEventHandler ["ButtonDown", {
	['set', 3000] remoteExec ['omtk_viewdistance_change', 0];
}];

// Set VD 4000
buttonVD_4000 = _display ctrlCreate ["omtk_RscButton", 1201];
buttonVD_4000 ctrlSetPosition [
	0.795 * safezoneW + safezoneX,
	0.37 * safezoneH + safezoneY,
	0.05 * safezoneW,
	0.03 * safezoneH
];
buttonVD_4000 ctrlCommit 0;
buttonVD_4000 ctrlSetText "Set VD 4000";
buttonVD_4000 ctrlAddEventHandler ["ButtonDown", {
	['set', 4000] remoteExec ['omtk_viewdistance_change', 0];
}];

// Set VD reset
buttonVD_reset = _display ctrlCreate ["omtk_RscButton", 1201];
buttonVD_reset ctrlSetPosition [
	0.855 * safezoneW + safezoneX,
	0.37 * safezoneH + safezoneY,
	0.05 * safezoneW,
	0.03 * safezoneH
];
buttonVD_reset ctrlCommit 0;
buttonVD_reset ctrlSetText "Reset VD";
buttonVD_reset ctrlAddEventHandler ["ButtonDown", {
	['reset',1] remoteExec ['omtk_viewdistance_change', 0];
}];

////////////////////////////////////////////////////////////////////

/* OMT CONTROL*/

// Picture of OMTK control
simControlPic = _display ctrlCreate ["omtk_RscPicture", 1201];
simControlPic ctrlSetPosition [
	0.495 * safezoneW + safezoneX,
	0.41 * safezoneH + safezoneY,
	0.10 * safezoneW,
	0.03 * safezoneH
];
simControlPic ctrlCommit 0;
simControlPic ctrlSetText "omtk\admin_ui\img\omtk_btns.jpg";

// End warmup
button_endWarmup = _display ctrlCreate ["omtk_RscButton", 1201];
button_endWarmup ctrlSetPosition [
	0.495 * safezoneW + safezoneX,
	0.45 * safezoneH + safezoneY,
	0.06 * safezoneW,
	0.03 * safezoneH
];
button_endWarmup ctrlCommit 0;
button_endWarmup ctrlSetText "End wamrup";
button_endWarmup ctrlAddEventHandler ["ButtonDown", {
	[] remoteExec ['omtk_wu_fn_launch_game', 0];
}];

// Show Scoreboard
button_showScoreboard = _display ctrlCreate ["omtk_RscButton", 1201];
button_showScoreboard ctrlSetPosition [
	0.565 * safezoneW + safezoneX,
	0.45 * safezoneH + safezoneY,
	0.06 * safezoneW,
	0.03 * safezoneH
];
button_showScoreboard ctrlCommit 0;
button_showScoreboard ctrlSetText "Show Scoreboard";
button_showScoreboard ctrlAddEventHandler ["ButtonDown", {
	[] remoteExec ['omtk_sb_compute_scoreboard', 0];
	[] remoteExec ['omtk_sb_start_mission_end', 0];
}];

// Export Ocap
button_exportOcap = _display ctrlCreate ["omtk_RscButton", 1201];
button_exportOcap ctrlSetPosition [
	0.635 * safezoneW + safezoneX,
	0.45 * safezoneH + safezoneY,
	0.06 * safezoneW,
	0.03 * safezoneH
];
button_exportOcap ctrlCommit 0;
button_exportOcap ctrlSetText "Export Ocap";
button_exportOcap ctrlAddEventHandler ["ButtonDown", {
	[] remoteExec ['ocap_fnc_exportData', 0];
}];

// Remove AIs
button_removeAI = _display ctrlCreate ["omtk_RscButton", 1201];
button_removeAI ctrlSetPosition [
	0.705 * safezoneW + safezoneX,
	0.45 * safezoneH + safezoneY,
	0.06 * safezoneW,
	0.03 * safezoneH
];
button_removeAI ctrlCommit 0;
button_removeAI ctrlSetText "Remove AIs";
button_removeAI ctrlAddEventHandler ["ButtonDown", {
	[] remoteExec ['omtk_delete_playableAiUnits', 0];
}];

// Freeze AIs
button_freezeAI = _display ctrlCreate ["omtk_RscButton", 1201];
button_freezeAI ctrlSetPosition [
	0.775 * safezoneW + safezoneX,
	0.45 * safezoneH + safezoneY,
	0.06 * safezoneW,
	0.03 * safezoneH
];
button_freezeAI ctrlCommit 0;
button_freezeAI ctrlSetText "Freeze AIs";
button_freezeAI ctrlAddEventHandler ["ButtonDown", {
	[] remoteExec ['omtk_disable_aiBehaviour', 0];
}];

// Enable Dmg Playres
button_freezeAI = _display ctrlCreate ["omtk_RscButton", 1201];
button_freezeAI ctrlSetPosition [
	0.845 * safezoneW + safezoneX,
	0.45 * safezoneH + safezoneY,
	0.06 * safezoneW,
	0.03 * safezoneH
];
button_freezeAI ctrlCommit 0;
button_freezeAI ctrlSetText "Enable Dmg Players";
button_freezeAI ctrlAddEventHandler ["ButtonDown", {
	[] remoteExec ['omtk_enable_playerDamage', 0];
}];