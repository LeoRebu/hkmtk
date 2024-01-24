_omtk_sb_objectives = [];
_omtk_sb_scores = [0,0];
_omtk_sb_flags = [];

{
	_points = _x select 0;
	_side = _x select 1;
	_type = _x select 2;
	_texteObj = _x select 3;
	_values = _x select 4;
	
	switch(_side) do {
		case "BLUEFOR":	{
			if(playerSide == west) then{
				objTest = player createSimpleTask[ _texteObj];
				objTest setSimpleTaskDescription[str(_points)+" points",  _texteObj , "Texte 3"];						
			}
		};
		case "REDFOR":	{
			if(playerSide == east) then{
				objTest = player createSimpleTask[ _texteObj];
				objTest setSimpleTaskDescription[str(_points)+" points",  _texteObj , "Texte 3"];						
			}
		};
		case "BLUEFOR+REDFOR":	{
				objTest = player createSimpleTask[ _texteObj];
				objTest setSimpleTaskDescription[str(_points)+" points",  _texteObj , "Texte 3"];						
		};
		default	{
			//["unknown side for objective creation","ERROR",true] call omtk_log;
		};
	};
} foreach OMTK_SB_LIST_OBJECTIFS;

_startTime = dayTime;
_sTimeString = [_startTime, "HH:MM"] call BIS_fnc_timeToString;

_endHour = 0;
_endMinute = 0;
_endSecond = 0;
_omtk_mission_duration = 0;

_mission_duration_override = missionNamespace getVariable ["OMTK_SB_MISSION_DURATION_OVERRIDE", nil];
if (!isNil "_mission_duration_override") then {
	_endHour   = OMTK_SB_MISSION_DURATION_OVERRIDE select 0;
	_endMinute = OMTK_SB_MISSION_DURATION_OVERRIDE select 1;
	_endSecond = OMTK_SB_MISSION_DURATION_OVERRIDE select 2;
	_omtk_mission_duration = 3600*_endHour + 60*_endMinute + _endSecond - 1;
} else {
	_mission_duration = ("OMTK_MODULE_SCORE_BOARD" call BIS_fnc_getParamValue);
	_omtk_mission_duration = _mission_duration - 1;
	_endHour   = floor (_mission_duration/3600);
	_endMinute = floor ((_mission_duration - (3600*_endHour)) / 60);
	_endSecond = _mission_duration - (3600*_endHour) - (60*_endMinute);
};


_endTime = _startTime + (_endHour + (_endMinute / 60));
_eTimeString = [_endTime, "HH:MM"] call BIS_fnc_timeToString;

player createDiaryRecord ["Diary", ["Credits", "Rigel for HKMTK, Wombat for chat limiter and Kremit for HK radios"]];

player createDiaryRecord ["Diary", ["Donations", "WE DONT WANT YOUR MONEY, go buy a gaming chair"]];

player createDiaryRecord ["Diary", ["Mission Timings", "<font color='#7FFF00' size='30'>Mission Start Time: " + _sTimeString + "<br/>Mission End Time: " + _eTimeString + "</font>" ]];

if (("OMTK_MODULE_MEXICAN_STANDOFF" call BIS_fnc_getParamValue) < 1) then {
	// Mexican Standoff DISABLED
	player createDiaryRecord ["Diary", ["Uniforms","Bluefor Uniforms<br/>
	<img image='images\blue.jpg' width='200'/><br/>
	Redfor Uniforms<br/>
	<img image='images\red.jpg' width='200'/>"]];
} else {
	// Mexican Standoff ENABLED
	player createDiaryRecord ["Diary", ["UNIFORMS","Bluefor Uniforms<br/>
	<img image='images\blue.jpg' width='200'/><br/>
	Redfor Uniforms<br/>
	<img image='images\red.jpg' width='200'/><br/>
	Greenfor Uniforms<br/>
	<img image='images\green.jpg' width='200'/>"]];
};


player createDiaryRecord ["Diary", ["Rules", "<font size='15'>
General rules of our games:<br/>
 - The stealing of radios is not allowed<br/>
 - It is not allowed to change your uniform, vest or headgear, this includes undressing<br/>
 - Metagaming is strictly forbidden<br/>
 - This includes any messages regarding current game events (i.e. mocking a teammate on steam chat because he missed a shot)<br/>
 - Terrain and object abuse is not allowed.<br/>
 - Intentionally running over players with vehicles is forbidden<br/>
 - Intentionally ramming other vehicles to cause a disadvantage for the enemy is forbidden (don’t try to flip vehicles by ramming)<br/>
 - Placing objects inside of vehicles to flip them is forbidden<br/>
 - Using helicopters to intentionally crash into enemies is forbidden<br/>
 - Using a helicopter to drop a sling loaded vehicle with the intent of hitting enemy players is forbidden<br/>
 - It is not allowed to permanently block the entrance of objectives<br/>
 - Leaving the designated playing area is forbidden<br/>
 - You are supposed to follow your commanders orders<br/>
 - Some missions may have specific rules which could deviate from this<br/>
 - Using any form of technical tool to alter your game experience (i.e. cheats/hacks) is strictly prohibited<br/>
 - Attempting to dupe the assets of the commander asset selector is forbidden – if there’s two possible options to choose from you’re only supposed to take one<br/>
 - It is not allowed to intentionally lower your gaming performance in order to negatively affect
your sides outcome<br/>
 - Anyone who is playing outside the spirit of the game is open to being acted upon by admins. 
</font>" ]];
