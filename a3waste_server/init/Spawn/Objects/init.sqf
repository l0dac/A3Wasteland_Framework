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
_objCount = _this select 5;

_objMaxCount = (call waste_spawnObjects);

if (_objCount >= _objMaxCount) exitWith {};

_data = getArray (ConfigFile >> "cfgWasteObjects" >> (call waste_mapMode) >> "objects");


_obj_classnames = [];
_obj_chances = [];

// Work out max weigth value, so we can work out chances below
_max = 0;
{
	_max = _max + (_x select 1);
} forEach _data;

_chance = 0;
{
	_chance = _chance + ((_x select 1)/_max)*100;
	_obj_classnames pushBack (_x select 0);
	_obj_chances pushBack _chance;
} forEach _data;

_max = round random(_objMaxCount - _objCount);

for "_i" from 1 to _max do
{
	_rndNum = random 100;
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
				_classname = _obj_classnames select _forEachIndex;

				_position = (_array call BIS_fnc_selectRandom) modelToWorld [0,0,0];
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
					//diag_log format ["SPAWNING OBJ:%1 LOCATION:%2", _classname, _position];
					_obj = createVehicle [_classname, _position, [], 0, "CAN_COLLIDE"];
					_obj setpos _position;
					_obj setdir (random 360);

					_obj setVariable ["DB_ID", _dbID];
				};
			};
			if (_attempts >= 5) then
			{
				//diag_log "DEBUG: ABORTED OBJECT SPAWN";
			};
		};
	} forEach _obj_chances;
};