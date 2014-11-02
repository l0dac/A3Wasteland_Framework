private ["_building_classname", "_config_building", "_tmp_classnames", "_tmp_types", "_tmp_chances", "_building_loot_info", "_max", "_chance"];

_building_classname = _this select 0;
_config_building = ConfigFile >> "CfgBuildingLoot" >> _building_classname ;

// Loot
loot_building pushBack _building_classname;

// Check Total Loot Chance == 100%
_tmp_classnames = [];
_tmp_types = [];
_tmp_chances = [];

_building_loot_info = getArray (_config_building >> "lootType");

if (count _building_loot_info > 0) then
{
	_max = 0;
	{
		_max = _max + (_x select 2);
	} forEach _building_loot_info;

	{
		_chance = ((_x select 2)/_max)*100;
		_tmp_classnames pushBack (_x select 0);
		_tmp_types pushBack (_x select 1);
		_tmp_chances pushBack _chance;
	} forEach _building_loot_info;

	loot_classnames pushBack _tmp_classnames;
	loot_types pushBack _tmp_types;
	loot_chances pushBack _tmp_chances;
	loot_pos pushBack (getArray (_config_building >> "lootPos") call server_fnc_arrayShuffle);
}
else
{
	loot_classnames pushBack [];
	loot_types pushBack [];
	loot_chances pushBack [];
	loot_pos pushBack [];
};

// Check Total Loot Chance == 100%
_tmp_classnames = [];
_tmp_types = [];
_tmp_chances = [];

_building_loot_info = getArray (_config_building  >> "lootTypeSmall");

if (count _building_loot_info > 0) then
{
	_max = 0;
	{
		_max = _max + (_x select 2);
	} forEach _building_loot_info;

	{
		_chance = ((_x select 2)/_max)*100;
		_tmp_classnames pushBack (_x select 0);
		_tmp_types pushBack (_x select 1);
		_tmp_chances pushBack _chance;
	} forEach _building_loot_info;

	loot_small_classnames pushBack _tmp_classnames;
	loot_small_types pushBack _tmp_types;
	loot_small_chances pushBack _tmp_chances;
	loot_small_pos pushBack getArray (_config_building >> "lootPosSmall") call server_fnc_arrayShuffle;
}
else
{
	loot_small_classnames pushBack [];
	loot_small_types pushBack [];
	loot_small_chances pushBack [];
	loot_small_pos pushBack [];
};