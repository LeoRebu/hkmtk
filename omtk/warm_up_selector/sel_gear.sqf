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

getItemsForClass = {
	_class = _this select 0;
	_ret = [];
	{
		if ( _class in (_x select 1)) then { 
			_ret pushBack (_x select 0); 
		};
	} forEach HKMTK_GEAR_LIST;
	
	_ret;
};

getPrevItemNumber = {
	_ret = 999;
	_item = _this select 0;
	{
		if ( _item == (_x select 0)) then { 
			_ret = (_x select 2);
			break;
		};
	} forEach HKMTK_GEAR_LIST;
	
	_ret;
};


// FOR EACH OPTION - GEAR
{	
	// Get Parameters
	_newItem = _x select 0;
	_classes = _x select 1;
	_number = _x select 2;
	
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
	if ((typeOf player) in _allowedClasses) then {
		
		_thisCfg = _newItem call CBA_fnc_getItemConfig;
		_dispName = [_thisCfg] call BIS_fnc_displayName;
		_picture = getText (_thisCfg >> "picture");
		
		// Code on action activation
		_codeCA = {
			params ["_target", "_player", "_params"];
			// The item classname and amount are passed as parameters
			_newItem = (_this select 2) select 0;
			_number = (_this select 2) select 1;
			_count = 0;
			_prevItem = "";
			_itemList = [[] call checkClass] call getItemsForClass;
			
			//systemChat format ["itemList.... %1",_itemList];
			
			_loadoutList = uniformItems player;
			_loadoutList append (vestItems player);
			_loadoutList append (backpackitems player);
			
			{
				if (_x in _itemList) then { 
					_count = _count + 1; 
					_prevItem = _x; 
					//systemChat format ["counting.... %1",_count];
				};
			} forEach _loadoutList;
			
			if ( _count >= [_prevItem] call getPrevItemNumber ) then {
				
				//systemChat format ["removeItem; _prevItem...%1 ;  _item...%2 ; _number...%3",_prevItem,_newItem,_number];
				player removeMagazines _prevItem;
				
				for "_i" from 1 to _number do {
					//systemChat "addItem";
					player addItem _newItem;
				};
			} else {
				//systemChat "whyNoHintPorkOdio";
				hint "Not enough items of the selectable kind have been found in your inventory";
			};
			
		};
		
		_conditionCA = {
			params ["_target", "_player", "_params"];
			true;
		};
		
		// Adding the action
		_action = [_dispName,_dispName,_picture,_codeCA,_conditionCA, {},[_newItem,_number]] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions","t_MA","t_MA_G"], _action] call ace_interact_menu_fnc_addActionToObject; 
	};
} forEach HKMTK_GEAR_LIST;