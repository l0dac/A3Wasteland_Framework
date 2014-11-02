_currTime = _this select 0; // To save on CPU, may lag behind

{
	if (isPlayer _x) then
	{
		_near_buildings = (position _x) nearObjects ["building", 80];
		{
			_building_classname = toLower(typeOf _x);
			_index = loot_building find _building_classname;
			if (_index != -1) then {
				_loot_time = _x getVariable ["loot_time", -100000];
				_elapsed = _currTime - _loot_time;
				if (_elapsed > 600) then
				{
					_x setVariable ["loot_time", _currTime];
					if ((floor random 10) >= 4) then
					{
						[_x, _index] call loot_fnc_spawnBuilding;
					};
				};
			}
			else
			{
				[_building_classname] call loot_fnc_updateInfo;
			};
			sleep 0.001;
		} forEach _near_buildings;
		sleep 0.001;
	};
	sleep 0.001;
} forEach playableUnits;