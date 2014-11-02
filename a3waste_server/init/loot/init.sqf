/*
	File: init.sqf
	Authors: Declan Ireland

	Description:

	Parameters:

*/


loot_building = [];

loot_classnames = [];
loot_types = [];
loot_chances = [];
loot_pos = [];

loot_small_classnames = [];
loot_small_types = [];
loot_small_chances = [];
loot_small_pos = [];

cfgloot_name = [];
cfgloot_type = [];
cfgloot_classnames = [];
cfgloot_chances = [];

_config = ConfigFile >> "cfgLoot";

for "_i" from 0 to ((count (_config)) - 1) do {
	_config_selected_name = _config select _i;
	_config_selected_array = getArray _config_selected_name;


	_tmp_classnames = [];
	_tmp_chances = [];
	_tmp_types = [];

	_max = 0;
	{
		_max = _max + (_x select 1);
	} forEach _config_selected_array;

	{
		_chance = ((_x select 1)/_max)*100;
		_classname = _x select 0;
		_tmp_classnames pushBack _classname;
		_tmp_chances pushBack _chance;

		switch (true) do
		{
			case (isClass (configfile >> "CfgMagazines" >> _classname)):
			{
				_tmp_types pushBack "magazine";
			};
			case (isClass (configfile >> "CfgWeapons" >> _classname)):
			{
				if ((count (configfile >> "magazines")) > 0) then
				{
					_tmp_types pushBack "weapon";
				} else {
					_tmp_types pushBack "item";
				};
			};
			case (isClass (configfile >> "CfgVehicles" >> _classname)):
			{
				if ((toLower(getText (configfile >> "CfgVehicles" >> "vehicleclass"))) == "Backpacks") then
				{
					_tmp_types pushBack "backpack";
				}
				else
				{
					_tmp_types pushBack "object";
				};
			};
			case (isClass (configfile >> "CfgGlasses" >> _classname)):
			{
				_tmp_types pushBack "item";
			};
			default
			{
				diag_log format ["Unknown Loot Type for %1", _classname];
				_tmp_types pushBack "item";
			};
		};
	} forEach _config_selected_array;

	cfgloot_name pushBack configName _config_selected_name;
	cfgloot_classnames pushBack _tmp_classnames;
	cfgloot_chances pushBack _tmp_chances;
	cfgloot_type pushBack _tmp_types;
};