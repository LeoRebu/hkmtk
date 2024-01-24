checkClass = {
	_ret = "INF";
	if ((typeOf player) in HKMTK_INF_CLASSES) then { _ret = "INF"; };
	if ((typeOf player) in HKMTK_MRK_CLASSES) then { _ret = "MRK"; };
	if ((typeOf player) in HKMTK_MGS_CLASSES) then { _ret = "MGS"; };
	if ((typeOf player) in HKMTK_OFF_CLASSES) then { _ret = "OFF"; };
	if ((typeOf player) in HKMTK_ENG_CLASSES) then { _ret = "ENG"; };
	if ((typeOf player) in HKMTK_HAT_CLASSES) then { _ret = "HAT"; };
	if ((typeOf player) in HKMTK_SNI_CLASSES) then { _ret = "SNI"; };
	
	_ret;
};

getMagazinesForGun = {
	_gun = _this select 0;
	_ret = nil;
	{
		if ( [_x select 0, _gun] call BIS_fnc_inString ) then { 
			_ret = (_x select 3); 
			break;
		};
	} forEach HKMTK_WEAPONS_LIST;
	_ret;
};

getTargetNumberOfMagazines = {
	_items = _this select 0;
	_ret = 0;
	{
		_ret = _ret + (_x select 1);
	} forEach _items;
	
	_ret;
};

getMagazinesClassnames = {
	_items = _this select 0;
	_ret = [];
	{
		_ret pushBack (_x select 0);
	} forEach _items;
	
	_ret;
};


// FOR EACH OPTION - WEAPON
{	
	// Get Parameters
	_weapon = _x select 0;
	_classes = _x select 1;
	_attachments = _x select 2;
	_ammo = _x select 3;
	_side = _x select 4;
	
	// Get classes the the option will be available to
	_allowedClasses = [];
	{
		switch (_x) do 
		{
			case "INF": { _allowedClasses append HKMTK_INF_CLASSES };
			case "MRK": { _allowedClasses append HKMTK_MRK_CLASSES };
			case "MGS": { _allowedClasses append HKMTK_MGS_CLASSES };
			case "OFF": { _allowedClasses append HKMTK_OFF_CLASSES };
			case "ENG": { _allowedClasses append HKMTK_ENG_CLASSES };
			case "HAT": { _allowedClasses append HKMTK_HAT_CLASSES };
			case "SNI": { _allowedClasses append HKMTK_SNI_CLASSES };
		};
	} forEach _classes;
	
	// Continue if the player is in the allowed classes for this option and is of the correct side
	if ((typeOf player) in _allowedClasses && side player == _side) then {
		
		_thisCfg = _weapon call CBA_fnc_getItemConfig;
		_dispName = [_thisCfg] call BIS_fnc_displayName;
		_picture = getText (_thisCfg >> "picture");
		
		// Code on action activation
		_codeCA = {
			params ["_target", "_player", "_params"];
			// The weapon classname, attachments, ammo classname and amount are passed as parameters
			_weapon = (_this select 2) select 0;
			_attachments = (_this select 2) select 1;
			_ammo = (_this select 2) select 2;	//_ammo select 0 = classname , _ammo select 1 = amount
			
			//systemChat format ["_weapon.... %1 ; _attachments.... %2 ; _ammo.... %3"
			//,_weapon,_attachments,_ammo];
			
			_primaryWpnPlayer = configname (inheritsFrom (configfile >> "cfgweapons" >> (primaryWeapon player)));
			_count = 0;
			_itemList = [primaryWeapon player] call getMagazinesForGun;
			_differentMags = [_itemList] call getMagazinesClassnames;
			_targetMagCount = [_itemList] call getTargetNumberOfMagazines;
			
			_loadoutList = uniformItems player;
			_loadoutList append (vestItems player);
			_loadoutList append (backpackitems player);
			_loadoutList append (primaryWeaponMagazine player);
			
			//systemChat format ["_differentMags.... %1 ; _targetMagCount.... %2 ; _itemList.... %3"
			,_differentMags,_targetMagCount,_itemList];
			
			// Count all mags in the player's inventory
			{
				if (_x in _differentMags) then { 
					_count = _count + 1; 
					//systemChat "count+1";
				};
			} forEach _loadoutList;
			
			_allOk = true;
			
			//systemChat format ["_count.... %1 ; _targetMagCount.... %2"
			,_count,_targetMagCount];
			
			if ( _count < _targetMagCount ) then {
				hint "You must have your complete complement of mags in your inventory before switching out your weapon";
				_allOk = false;
			};
			
			if (_primaryWpnPlayer == prevWeapon || [prevWeapon, primaryWeapon player] call BIS_fnc_inString) then {
				if (prevScope != "" && !([prevScope, primaryWeaponItems player select 2] call BIS_fnc_inString)) then {	
					hint "You must have your previously selected scope equipped before switching out your weapon";
					_allOk = false;
				};
			} else {
				hint format ["You must have your previously selected weapon equipped before getting a different one. /n prevWeapon: %1 /n primary weapon: %2", prevWeapon, _primaryWpnPlayer];
				_allOk = false;
			};
			
			if (_allOk) then {
				// Remove previous weapon & attachments & ammo
				player removePrimaryWeaponItem ((primaryWeaponItems player) select 2);
				player removeWeapon (primaryWeapon player);
				{
					//systemChat "removeMag";
					player removeMagazines (_x select 0);
				} forEach _itemList;
				
				// Add new weapon & attachments & ammo
				{
					//systemChat "addMag";
					player addMagazines [(_x select 0),(_x select 1)];
				} forEach _ammo;
				player addWeapon _weapon;
				{
					player addPrimaryWeaponItem _x;
				} forEach _attachments;
				
				player selectWeapon handgun;
				player selectWeapon _weapon;
				// Set new weapon as future previous weapon
				prevWeapon = _weapon;
				prevScope = "";
				execVM "omtk\warm_up_selector\sel_optics.sqf";
			};
			
		};
		
		_conditionCA = {
			params ["_target", "_player", "_params"];
			true;
		};
		
		// Adding the action
		_action = [_dispName,_dispName,_picture,_codeCA,_conditionCA, {},[_weapon,_attachments,_ammo]] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions","t_MA","t_MA_W"], _action] call ace_interact_menu_fnc_addActionToObject; 
	};
} forEach HKMTK_WEAPONS_LIST;