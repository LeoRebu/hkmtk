// SET SCORES
sb_s = missionNamespace getVariable "sb_s";
sb_o = missionNamespace getVariable "sb_o";

_text = format["%1", sb_s select 0];
ctrlSetText [1290, _text];
_text = format["%1", sb_s select 1];
ctrlSetText [1291, _text];

_text = format["OBJECTIVES"];
ctrlSetText [1510, _text];

_index = 2;
{ 
	if ((_x select 0) != 0) then {
		_index = _index + 1;
		_res = 0;
		if (sb_s select _index) then {
			_res = _x select 0;
		};
		_line = format ["%1  (%3/%2 pts)", _x select 3, _x select 0, _res];
		_sideIdx = 1511;
		if (_x select 1 == east) then { _sideIdx = 1512; };
		lbAdd [_sideIdx, _line];
	};
} foreach sb_o;

_mvp = missionNamespace getVariable "omtk_sb_mvp";
//hint format["%1 - %2", _mvp select 0, _mvp select 1];
_text = format["MVP: %1", _mvp select 0];
ctrlSetText [1523, _text];
_text = format["%1 Kills", _mvp select 1];
ctrlSetText [1524, _text];

// SET SURVIVORS
_bluefor_survivors = missionNamespace getVariable "omtk_sb_bluefor_survivors";
_redfor_survivors  = missionNamespace getVariable "omtk_sb_redfor_survivors";
_text = format["%1            SURVIVORS           %2", count _bluefor_survivors, count _redfor_survivors];
ctrlSetText [1520, _text];

{ lbAdd [1521, _x]; } foreach (_bluefor_survivors call BIS_fnc_sortAlphabetically);
{ lbAdd [1522, _x]; } foreach (_redfor_survivors  call BIS_fnc_sortAlphabetically);
