// FOR EACH OPTION - VEHICLE GROUP
{	
	// Get Parameters
	_side = _x select 0;
	_vehicles = _x select 1;
	_name = _x select 2;
		
	// Continue if the player is in the allowed classes and is of the correct side
	if ((typeOf player) in HKMTK_OFF_CLASSES && side player == _side) then {
		
		// Adding the action for the group
		_action = [_name,_name,"",{},{true}, {},[]] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions","t_MA","t_MA_V"], _action] call ace_interact_menu_fnc_addActionToObject; 
		_optionCount = 1;
		{	// forEach vehicles (in group)
		
			/*systemChat format ["_x.... %1 ; typeOf _x...%2; _ogVehicle...%3",_x,(typeOf _x),_ogVehicle];
			_thisCfg = (typeOf _x) call CBA_fnc_getItemConfig;
			_dispName = [_thisCfg] call BIS_fnc_displayName;
			_picture = getText (_thisCfg >> "picture");		this shit aint working*/
			_dispName = format ["Option %1",_optionCount];
			_optionCount = _optionCount + 1;
			
			
			// Code on action activation
			_codeCA = {
				params ["_target", "_player", "_params"];
				// The selected vehicle's classname is passed as a parameter
				_vehicle = (_this select 2) select 0;
				_groupVehicles = (_this select 2) select 1;
				//systemChat format ["_vehicle.... %1 ; _groupVehicles....%2",_vehicle,_groupVehicles];
				
				_distance = player distance2d _vehicle;
				_closestVehicle = _vehicle;
				_closestVehiclePos = getPosATL _vehicle;
				
				{
					if (player distance2d _x < _distance) then {
						_distance = player distance2d _x;
						_closestVehicle = _x;
						_closestVehiclePos = getPosATL _x;
					};
				} forEach _groupVehicles;
				
				if (_closestVehicle != _vehicle) then {
					{
						moveOut _x;
					} forEach crew _closestVehicle;
					_closestVehicle setPos [((getPos _vehicle) select 0), ((getPos _vehicle) select 1) + 15,0.5];
					_vehicle setPos [(_closestVehiclePos select 0),(_closestVehiclePos select 1),(_closestVehiclePos select 2) + 1];
					
				};			
			};
			
			_conditionCA = {
				params ["_target", "_player", "_params"];
				true;
			};
			
			_actionChild = [_dispName,_dispName,"",_codeCA,_conditionCA, {},[_x, _vehicles]] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions","t_MA","t_MA_V", _name], _actionChild] call ace_interact_menu_fnc_addActionToObject; 
		} forEach _vehicles;
		
	};
} forEach HKMTK_VEHICLES_LIST;