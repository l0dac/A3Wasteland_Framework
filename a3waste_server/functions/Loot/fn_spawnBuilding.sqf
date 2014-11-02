private ["_building", "_index", "_loot_chance", "_rnd_num", "_world_pos"];

_building = _this select 0;
_index = _this select 1;

_debug_array = [];
//Large Loot
_loot_chance = 4;
{
	_rnd_num = floor random 10;
	if (_rnd_num >= _loot_chance) then
	{
		_loot_chance = _loot_chance - 0.5;
		_world_pos = _building modelToWorld _x;
		[_world_pos, _index, 0] call loot_fnc_spawn;
		if (_world_pos in _debug_array) then {
			diag_log format ["ERROR Duplicate Position: %1  Building: %2", _x, _building];
		}
		else
		{
			_debug_array pushBack _world_pos;
		};
	};
} forEach (loot_pos select _index);

// Small Loot
_loot_chance = 4;
{
	_rnd_num = floor random 10;
	if (_rnd_num >= _loot_chance) then
	{
		_loot_chance = _loot_chance - 0.5;
		_world_pos = _building modelToWorld _x;
		[_world_pos, _index, 1] call loot_fnc_spawn;
		if (_world_pos in _debug_array) then {
			diag_log format ["ERROR Duplicate Position: %1  Building: %2", _x, _building];
		}
		else
		{
			_debug_array pushBack _world_pos;
		};
	};
} forEach (loot_small_pos select _index);