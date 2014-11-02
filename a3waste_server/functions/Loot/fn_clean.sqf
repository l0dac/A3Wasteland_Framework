_fnc_check = {
	_arrayObjs = _this select 0;

	{
		_spawned = _x getVariable["spawned", 0];
		if (_spawned == 0) then {
			_x setVariable["spawned", _currTime];
		}
		else
		{
			if ((_currTime - _spawned) > 900) then
			{
				deleteVehicle _x;
			};
		};
	} forEach _arrayObjs
};


[(allMissionObjects "GroundWeaponHolder"), _currTime] call _fnc_check;

[(allMissionObjects "WeaponHolderSimulated"), _currTime] call _fnc_check;