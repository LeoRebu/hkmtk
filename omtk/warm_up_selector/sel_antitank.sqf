
getMagazineForGun = {
	_gun = _this select 0;
	_ret = nil;
	{
		if ( _gun == (_x select 0) ) then { 
			_ret = _x select 2; 
			break;
		};
	} forEach HKMTK_ANTITANK_LIST;
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



// FOR EACH OPTION - AT
{	
	// Get Parameters
	_weapon = _x select 0;
	_attachments = _x select 1;
	_ammo = _x select 2;
	
	// Continue if the player is in the allowed classes for this option 
	if ((typeOf player) in HKMTK_HAT_CLASSES ) then {
		
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
			
			_allOk = true;
			
			
			if (prevLauncher in ["rhs_weap_smaw_green","rhs_weap_maaws","rhs_weap_fim92"]) then {		// this NEEDS TO BE CHANGED IN HERE EVERY TIME A NEW LAUNCHER IS ADDED
				// Need to check that he's got all the ammo for it
				_count = 0;
				_atMag = [secondaryWeapon player] call getMagazineForGun;
				//_targetMagCount = [_atMag] call getTargetNumberOfMagazines;
				
				_loadoutList = uniformItems player;
				_loadoutList append (vestItems player);
				_loadoutList append (backpackitems player);
				_loadoutList append (secondaryWeaponMagazine player);
				
				
				{
					if (_x == (_atMag select 0)) then { 
						_count = _count + 1; 
					};
				} forEach _loadoutList;
				
				
				if ( _count < (_atMag select 1) ) then {
					hint "You must have your complete complement of mags in your inventory before switching out your launcher";
					_allOk = false;
				};
				
				if (secondaryWeapon player != prevLauncher) then {
					hint "You must have your previously selected launcher equipped before getting a different one";
					_allOk = false;
				};
				
				
				if (_allOk) then {
					player removeWeapon (secondaryWeapon player);
					//systemChat "removeMag";
					player removeMagazines (_atMag select 0);
				};
				
			} else {
				// Need to check that he's just got the backpack on
				if ( prevLauncher != backpack player ) then {
					hint "You must have your previously selected 'launcher' equipped before getting a different one";
					_allOk = false;
				};
				
				
				if (_allOk) then {
					removeBackpack player;
				};
			};
			
			
			if (_allOk) then {
				if (_weapon in ["rhs_weap_smaw_green","rhs_weap_maaws","rhs_weap_fim92"]) then {		// this NEEDS TO BE CHANGED IN HERE EVERY TIME A NEW LAUNCHER IS ADDED
					if (backpack player != startBackpack) then {
						player addBackpack startBackpack;
					};
					player addMagazine (_ammo select 0);
					player addWeapon _weapon;
					player addMagazines [(_ammo select 0),(_ammo select 1)-1];
					{
						player addSecondaryWeaponItem _x;
					} forEach _attachments;
				} else {
					player addBackpack _weapon;
				};
				prevLauncher = _weapon;
			};
			
		};
		
		_conditionCA = {
			params ["_target", "_player", "_params"];
			true;
		};
		
		// Adding the action
		_action = [_dispName,_dispName,_picture,_codeCA,_conditionCA, {},[_weapon,_attachments,_ammo]] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions","t_MA","t_MA_A"], _action] call ace_interact_menu_fnc_addActionToObject; 
	};
} forEach HKMTK_ANTITANK_LIST;