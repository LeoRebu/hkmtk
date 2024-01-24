// The code in this page has been corrupted by the czech (thank you ilbinek for fixing the bug but why did you have to rewrite other logic without writing a single comment)

// variable PLAYER_ACTIONS will contain all the scope selector actions
if (isNil "PLAYER_ACTIONS") then {
	PLAYER_ACTIONS = [];
};

// if there already are scope selector actions at the execution of this script, they get deleted and the variable reset to empty array
{
	[player,1,["ACE_SelfActions", "t_MA", "t_MA_S", _x#0]] call ace_interact_menu_fnc_removeActionFromObject;
}forEach PLAYER_ACTIONS;

PLAYER_ACTIONS = [];

private _compatible = [primaryWeapon player] call CBA_fnc_compatibleItems;
{
	private _allowed = false;
	
	{	// This foreach cycle matches classes of scopes with the allowed scopes for the player's class
		switch (_x) do 
		{
			case "INF": {
				if ((typeOf player) in HKMTK_INF_CLASSES) then {
					_allowed = true;
					break;
				};
			};
			case "MRK": {
				if ((typeOf player) in HKMTK_MRK_CLASSES) then {
					_allowed = true;
					break;
				};
			};
			case "MGS": {
				if ((typeOf player) in HKMTK_MGS_CLASSES) then {
					_allowed = true;
					break;
				};
			};
			case "OFF": {
				if ((typeOf player) in HKMTK_OFF_CLASSES) then {
					_allowed = true;
					break;
				};
			};
			case "ENG": {
				if ((typeOf player) in HKMTK_ENG_CLASSES) then {
					_allowed = true;
					break;
				};
			};
			case "HAT": {
				if ((typeOf player) in HKMTK_HAT_CLASSES) then {
					_allowed = true;
					break;
				};
			};
			case "SNI": {
				if ((typeOf player) in HKMTK_SNI_CLASSES) then {
					_allowed = true;
					break;
				};
			};
		};
	} forEach _x#1;

	// if the particular scope is allowed for the player's class AND it's compatible with the weapon -> action is created with appropriate code
	if (_allowed && _x#0 in _compatible) then {
		private _scope = _x#0;
		private _thisCfg = _scope call CBA_fnc_getItemConfig;
		private _dispName = [_thisCfg] call BIS_fnc_displayName;
		private _picture = getText (_thisCfg >> "picture");

		// Code on action activation
		_codeCA = {
			params ["_target", "_player", "_params"];
			// The scope className is passed as a parameter
			_scope = _this select 2 select 0;
			// If this isn't the first time the player selects a scope, it check that the player already has the previous on the weapon
			if (prevScope == "") then {
				player removePrimaryWeaponItem ((primaryWeaponItems player) select 2);
				player addPrimaryWeaponItem _scope;
				prevScope = _scope;
			} else {
				// if the previous recorded scope is a substring of the current scope on the weapon, then we allow the switch
				if (([prevScope, primaryWeaponItems player select 2] call BIS_fnc_inString)) then {
					player removePrimaryWeaponItem ((primaryWeaponItems player) select 2);
					player addPrimaryWeaponItem _scope;
					prevScope = _scope;
				} else {
					hint "You must have your previously selected scope equipped before getting a different one";
				};
			};
		};

		_conditionCA = {
			params ["_target", "_player", "_params"];
			true;
		};

		// Adding the action
		_action = [_dispName, _dispName, _picture, _codeCA, _conditionCA, {}, [_scope]] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "t_MA", "t_MA_S"], _action] call ace_interact_menu_fnc_addActionToObject;
		PLAYER_ACTIONS pushBack _action;
	};
} forEach HKMTK_SCOPES_LIST;
