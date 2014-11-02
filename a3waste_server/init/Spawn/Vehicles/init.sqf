/*
	File: init.sqf
	Authors: Declan Ireland

	Description:

	Parameters:

*/


_worldName = 	_this select 0;
_pos_center = 	_this select 1;
_map_size = 	_this select 2;
_buildings = 	_this select 3;
_roads = 		_this select 4;
_vehCount = _this select 5;

_vehMaxCount = (call waste_spawnObjects);

if (_vehCount >= _vehMaxCount) exitWith {};

_veh_spawnMaxLimit = round random(_vehMaxCount - _vehCount);


_vehType_configName = [];
_vehType_configChances = [];

_data = getArray (ConfigFile >> "cfgWasteVehicles" >> (call waste_mapMode) >> "land_all");

_upper = 0;
{
	_upper = _upper + (_x select 1);
} forEach _data;

_chance = 0;
{
	_chance = _chance + ((_x select 1)/_upper)*100;
	_vehType_configName pushBack (_x select 0);
	_vehType_configChances pushBack _chance;
} forEach _data;


_info = [];
_info_data = [];

{
	{
		_array_data = getArray (ConfigFile >> "cfgWasteVehicles" >> (call waste_mapMode) >> (_x select 0));

		if ((count _array_data) > 0) then
		{
			_tmp_classnames = [];
			_tmp_chances = [];

			// Work out max weigth value, so we can work out chances below
			_max = 0;
			{
				_max = _max + (_x select 1);
			} forEach _array_data;

			_chance = 0;
			{
				_chance = _chance + ((_x select 1)/_max)*100;
				_tmp_classnames pushBack (_x select 0);
				_tmp_chances pushBack _chance;
			} forEach _array_data;

			_info pushBack (_x select 0);
			_info_data pushBack [_tmp_classnames, _tmp_chances];
		};
	} forEach _data;

} forEach _vehType_configName;


for "_i" from 1 to _veh_spawnMaxLimit do
{
	{
		_rndNum = random 100;
		if (_x >= _rndNum) exitWith
		{
			_rndNum = random 100;
			_veh_classnames  = ((_info_data select _forEachIndex) select 0);
			_veh_chances  = ((_info_data select _forEachIndex) select 1);
			{
				if (_x >= _rndNum) exitWith
				{
					private ["_minDistance", "_maxDistance", "_minDistanceObj", "_array"];

					if ((random 100) > 70) then
					{
						_minDistance = 0;
						_maxDistance = 15;
						_minDistanceObj = 5;
						_array = _roads;
					}
					else
					{
						_minDistance = 5;
						_maxDistance = 50;
						_minDistanceObj = 5;
						_array = _buildings;
					};

					_attempts = 0;
					while {(_attempts < 5)} do
					{
						_attempts = _attempts + 1;
						_classname = _veh_classnames select _forEachIndex;

						_position = (_roads call BIS_fnc_selectRandom) modelToWorld [0,0,0];
						_position = [_position,
												_minDistance,		// Min Distance
												_maxDistance,		// Max Distance
												_minDistanceObj,	// Min Distance from object
												0,					// No Water
												2000,				// Terrain Gradient
												0					// Can be at shore
												] call BIS_fnc_findSafePos;
						if ((count _position) == 2) exitWith
						{

							//diag_log format ["SPAWNING VEHICLE:%1 LOCATION:%2", _classname, _position];

							_veh = createVehicle [_classname, _position, [], 0, "CAN_COLLIDE"];
							_veh setpos _position;
							_veh setdir (random 360);

							_veh disableTIEquipment true;

							clearMagazineCargoGlobal _veh;
							clearWeaponCargoGlobal _veh;
							clearItemCargoGlobal _veh;
							clearBackpackCargoGlobal _veh;

							[_veh] call vehicles_fnc_addDB;
						};
					};
					if (_attempts >= 5) then
					{
						diag_log "DEBUG: ABORTED VEHICLE SPAWN";
					};
				};
			} forEach _veh_chances;
		};

	} forEach _vehType_configChances;
};