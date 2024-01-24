class ScoreBoard {

	idd = 1666;
	movingenable = 0;
	enableSimulation = 0;
	enableDisplay = 1;
	duration = 9999;
	fadein=1;
	fadeout=1;
	name="ScoreBoard";
	onLoad = "with uiNameSpace do { ScoreBoard = _this select 0};ExecVM 'omtk\score_board\loadBoard.sqf';";
	
	class controls {
		
		class MainContainer: omtk_RscPicture {
			idc = 1800;
			text = "omtk\score_board\img\hk_sb.paa";
			//x = 0.25 * safezoneW + safezoneX;
			//y = 0.2 * safezoneH + safezoneY;
			x = 0.1 * safezoneW + safezoneX;
			y = -0.21111 * safezoneH + safezoneY;
			//w = 0.446875 * safezoneW; 0.0265625
			//w = 0.5 * safezoneW;
			w = 0.8 * safezoneW;
			//h = 0.527794 * safezoneH; 0.036103
			//h = 0.6 * safezoneH;
			h = 1.422226 * safezoneH;
		};		
		
		/* HEADER LOGOS */ /*
		class BlueforLogo: omtk_RscPicture
		{
			idc = 1200;
			text = "images\bluefor.jpg";
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.236103 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.0989614 * safezoneH;
		};
		class RedforLogo: omtk_RscPicture
		{
			idc = 1201;
			text = "images\redfor.jpg";
			x = 0.643229 * safezoneW + safezoneX;
			y = 0.236103 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.0989614 * safezoneH;
		};
		class Banner: omtk_RscPicture
		{
			idc = 1202;
			text = "omtk\score_board\img\banner.jpg";
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.236103 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.0989614 * safezoneH;
		};*/
		
		class BlueForFaction: omtk_RscText {
			idc = 1350;
			text = "BLUEFOR";
			x = 0.29 * safezoneW + safezoneX;
			y = 0.295 * safezoneH + safezoneY;
			w = 0.17 * safezoneW;
			h = 0.04 * safezoneH;
			shadow = 1;
			SizeEx = 0.08;
			colorText[] = {0.106,0.222,0.75,1};
			colorShadow[] = {0.106,0.122,0.09,1};
		};
		
		class RedForFaction: omtk_RscText {
			idc = 1351;
			text = "REDFOR";
			x = 0.54 * safezoneW + safezoneX;
			y = 0.295 * safezoneH + safezoneY;
			w = 0.17 * safezoneW;
			h = 0.04 * safezoneH;
			shadow = 1;
			SizeEx = 0.08;
			colorText[] = {0.5,0.122,0.09,1};
			colorShadow[] = {0.106,0.122,0.09,1};
		};
		
		class BluePointsBox: omtk_RscPicture {
			idc = 1352;
			text = "omtk\score_board\img\frame2.paa";
			x = 0.446 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.044 * safezoneW;
			h = 0.077 * safezoneH;
		};
		
		class RedPointsBox: omtk_RscPicture {
			idc = 1353;
			text = "omtk\score_board\img\frame2.paa";
			x = 0.51 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.044 * safezoneW;
			h = 0.077 * safezoneH;
		};
		
		class BluePointsTxt: omtk_RscText {
			idc = 1290;
			text = "..";
			x = 0.446 * safezoneW + safezoneX;
			y = 0.295 * safezoneH + safezoneY;
			w = 0.044 * safezoneW;
			h = 0.044 * safezoneH;
			shadow = 1;
			SizeEx = 0.08;
			colorText[] = {0.106,0.222,0.75,1};
			colorShadow[] = {0.106,0.122,0.09,1};
		};
		
		class RedPointsTxt: omtk_RscText {
			idc = 1291;
			text = "..";
			x = 0.51 * safezoneW + safezoneX;
			y = 0.295 * safezoneH + safezoneY;
			w = 0.044 * safezoneW;
			h = 0.044 * safezoneH;
			shadow = 1;
			SizeEx = 0.08;
			colorText[] = {0.5,0.122,0.09,1};
			colorShadow[] = {0.106,0.122,0.09,1};
		};

		class Objectives: omtk_RscText {
			idc = 1510;
			x = 0 * safezoneW + safezoneX;
			y = 0.317 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.1 * safezoneH;
		};
		
		class BlueForObjectifs: omtk_RscListbox {
			idc = 1511;
			x = 0.29 * safezoneW + safezoneX;
			y = 0.387 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.09 * safezoneH;
		};
		
		class RedForObjectifs: omtk_RscListbox {
			idc = 1512;
			x = 0.51 * safezoneW + safezoneX;
			y = 0.387 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.09 * safezoneH;
		};

		class Survivors: omtk_RscText {
			idc = 1520;
			x = 0 * safezoneW + safezoneX;
			y = 0.448 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.1 * safezoneH;
			access = 0;
		};

		class BlueforListSurvivors: omtk_RscListbox {
			idc = 1521;
			x = 0.29 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.23 * safezoneH;
		};
		
		class RedForSurvivors: omtk_RscListbox {
			idc = 1522;
			x = 0.51 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.23 * safezoneH;
		};

		class MvpName: omtk_RscText {
			idc = 1523;
			x = 0.29 * safezoneW + safezoneX;
			y = 0.77 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class MvpKills: omtk_RscText {
			idc = 1524;
			x = 0.51 * safezoneW + safezoneX;
			y = 0.77 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
		};
		
		class QuitButtonMenu: omtk_RscButton {
			idc = -1;
			x = 0.475 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.022 * safezoneH;
			text = "CLOSE";
			action="closeDialog 0;"; //['end1',true,2] call BIS_fnc_endMission;
		};

	};
};

// SCOREBOARD FOR MEXICAN STANDOFF

class ScoreBoard_MS {

	idd = 1666;
	movingenable = 0;
	enableSimulation = 0;
	enableDisplay = 1;
	duration = 9999;
	fadein=1;
	fadeout=1;
	name="ScoreBoard";
	onLoad = "with uiNameSpace do { ScoreBoard = _this select 0};ExecVM 'omtk\score_board\loadBoard_ms.sqf';";
	
	class controls {
		
		class MainContainer: omtk_BOX {
			idc = 1800;
			x = 0.196563 * safezoneW + safezoneX;
			y = 0.236103 * safezoneH + safezoneY;
			w = 0.606875 * safezoneW;
			h = 0.527794 * safezoneH;
		};		
		
		/* HEADER LOGOS */
		class BlueforLogo: omtk_RscPicture
		{
			idc = 1200;
			text = "images\bluefor.jpg";
			x = 0.196563 * safezoneW + safezoneX;
			y = 0.236103 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.0989614 * safezoneH;
		};
		class RedforLogo: omtk_RscPicture
		{
			idc = 1201;
			text = "images\redfor.jpg";
			x = 0.723229 * safezoneW + safezoneX;
			y = 0.236103 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.0989614 * safezoneH;
		};
		class Banner: omtk_RscPicture
		{
			idc = 1202;
			text = "omtk\score_board\img\banner_ms.jpg";
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.236103 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.0989614 * safezoneH;
		};
		class GreenforLogo: omtk_RscPicture
		{
			idc = 1203;
			text = "images\greenfor.jpg";
			x = 0.458 * safezoneW + safezoneX;
			y = 0.236103 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.0989614 * safezoneH;
		};


		class Objectives: omtk_RscText {
			idc = 1510;
			x = 0 * safezoneW + safezoneX;
			y = 0.30 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.1 * safezoneH;
		};
		
		class BlueForObjectifs: omtk_RscListbox {
			idc = 1511;
			x = 0.196563 * safezoneW + safezoneX;
			y = 0.37 * safezoneH + safezoneY;
			w = 0.19 * safezoneW;
			h = 0.09 * safezoneH;
		};
		class RedForObjectifs: omtk_RscListbox {
			idc = 1512;
			x = 0.613458 * safezoneW + safezoneX;
			y = 0.37 * safezoneH + safezoneY;
			w = 0.19 * safezoneW;
			h = 0.09 * safezoneH;
		};
		class GreenForObjectifs: omtk_RscListbox {
			idc = 1513;
			x = 0.405 * safezoneW + safezoneX;
			y = 0.37 * safezoneH + safezoneY;
			w = 0.19 * safezoneW;
			h = 0.09 * safezoneH;
		};
		
		class Survivors: omtk_RscText {
			idc = 1520;
			x = 0 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.1 * safezoneH;
			access = 0;
		};
				

		class BlueforListSurvivors: omtk_RscListbox {
			idc = 1521;
			x = 0.196563 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.19 * safezoneW;
			h = 0.23 * safezoneH;
		};
		class RedForSurvivors: omtk_RscListbox {
			idc = 1522;
			x = 0.613458 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.19 * safezoneW;
			h = 0.23 * safezoneH;
		};
		class GreenForSurvivors: omtk_RscListbox {
			idc = 1523;
			x = 0.405 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.19 * safezoneW;
			h = 0.23 * safezoneH;
		};
		
		class QuitButtonMenu: omtk_RscButton {
			idc = -1;
			x = 0.477080 * safezoneW + safezoneX;
			y = 0.741906 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219914 * safezoneH;
			text = "CLOSE";
			action="closeDialog 0;"; //['end1',true,2] call BIS_fnc_endMission;
		};

	};
};
