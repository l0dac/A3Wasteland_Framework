private ["_pos", "_index", "_loot_chances", "_loot_types", "_loot_classnames", "_chance", "_rnd_num", "_loot_type", "_loot_class", "_pos2", "_item", "_mags", "_count_mags"];

_pos = _this select 0;
_index = _this select 1;
_loot_size = _this select 2;


switch (_loot_size) do {
	case 0:
	{
		_loot_chances = loot_chances select _index;
		_loot_types = loot_types select _index;
		_loot_classnames = loot_classnames select _index;
	};
	case 1:
	{
		_loot_chances = loot_small_chances select _index;
		_loot_types = loot_small_types select _index;
		_loot_classnames = loot_small_classnames select _index;
	};
};


_chance = 0;
_rnd_num = random 100;
_index = (count _loot_chances) - 1;
for "_i" from 0 to _index do
{
	_chance = _chance + (_loot_chances select _i);
	if (_chance > _rnd_num) exitWith {_index = _i};
};

_loot_type = _loot_types select _index;
_loot_class = _loot_classnames select _index;

switch (_loot_type) do {
	case "cfglootweapon":
	{
		_index = cfgloot_name find _loot_class;
		if (_index < 0) then {
			diag_log format ["Error with Class %1", _loot_class];
		};
		_loot_chances = cfgloot_chances select _index;
		_loot_classnames = cfgloot_classnames select _index;

		_index = count _loot_chances;
		_chance = 0;
		_rnd_num = random 100;
		for "_i" from 0 to _index do
		{
			_chance = _chance + (_loot_chances select _i);
			if (_chance > _rnd_num) exitWith {_index = _i};
		};

		_item = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
		//
		_pos2 = [_pos select 0, _pos select 1, ((_pos select 2) + 0.1)];
		createVehicle ["Sign_Arrow_Green_F", _pos2, [], 0, "CAN_COLLIDE"];
		//
		_loot_class = _loot_classnames select _index;
		_item addWeaponCargoGlobal [_loot_class, 1];
		_mags = [] + getArray (configFile >> "cfgWeapons" >> _loot_class >> "magazines");
		_count_mags = count _mags;
		if (_count_mags > 0) then
		{
			_item addMagazineCargoGlobal [(_mags select (floor random (_count_mags - 1))), (1 + (floor random 2))]
		};
	};

	case "weapon":
	{
		//
		_pos2 = [_pos select 0, _pos select 1, ((_pos select 2) + 0.1)];
		createVehicle ["Sign_Arrow_Blue_F", _pos2, [], 0, "CAN_COLLIDE"];
		//
		_item = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
		_item addWeaponCargoGlobal [_loot_class, 1];

		_mags = [] + getArray (configFile >> "cfgWeapons" >> _loot_class >> "magazines");
		_count_mags = count _mags;
		if (_count_mags > 0) then
		{
			_item addMagazineCargoGlobal [(_mags select (floor random (_count_mags - 1))), (ceil random 3)]
		};
	};

	case "magazine":
	{
		//
		_pos2 = [_pos select 0, _pos select 1, ((_pos select 2) + 0.1)];
		createVehicle ["Sign_Arrow_Pink_F", _pos2, [], 0, "CAN_COLLIDE"];
		//
		_item = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
		_item addMagazineCargoGlobal [_loot_class, 1];
	};

	case "object":
	{
		//
		_pos2 = [_pos select 0, _pos select 1, ((_pos select 2) + 0.1)];
		createVehicle ["Sign_Arrow_Yellow_F", _pos2, [], 0, "CAN_COLLIDE"];
		//
		_item = createVehicle [_loot_class, _pos, [], 0, "CAN_COLLIDE"];
	};

	case "backpack":
	{
		//
		_pos2 = [_pos select 0, _pos select 1, ((_pos select 2) + 0.1)];
		createVehicle ["Sign_Arrow_Pink_F", _pos2, [], 0, "CAN_COLLIDE"];
		//
		createVehicle [_loot_class, _pos, [], 0, "CAN_COLLIDE"];
	};

	case "item":
	{
		//
		_pos2 = [_pos select 0, _pos select 1, ((_pos select 2) + 0.1)];
		createVehicle ["Sign_Arrow_Pink_F", _pos2, [], 0, "CAN_COLLIDE"];
		//
		_item = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
		_item addItemCargoGlobal [_loot_class, 1];
	};

	default
	{
		_index = cfgloot_name find _loot_type;
		if (_index < 0) then {
			diag_log format ["Error with Type %1", _loot_type];
		};

		_loot_classnames = cfgloot_classnames select _index;
		_loot_chances = cfgloot_chances select _index;
		_loot_types = cfgloot_type select _index;

		_item = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
		//
		_pos2 = [_pos select 0, _pos select 1, ((_pos select 2) + 0.1)];
		createVehicle ["Sign_Arrow_F", _pos2, [], 0, "CAN_COLLIDE"];
		//
		_count_loot_chances = count _loot_chances;
		_rnd_qty = (ceil random 5);
		for "_i" from 0 to _rnd_qty do
		{
			_index = _count_loot_chances;

			_chance = 0;
			_rnd_num = random 100;
			for "_i" from 0 to _count_loot_chances do
			{
				_chance = _chance + (_loot_chances select _i);
				if (_chance > _rnd_num) exitWith {_index = _i};
			};

			_loot_class = _loot_classnames select _index;
			_loot_type = _loot_types select _index;

			switch (_loot_type) do {
				case "magazine":
				{
					_item addMagazineCargoGlobal [_loot_class, 1];
				};
				case "weapon":
				{
					_item addWeaponCargoGlobal [_loot_class, 1];
					_mags = [] + getArray (configFile >> "cfgWeapons" >> _loot_class >> "magazines");
					_count_mags = count _mags;
					if (_count_mags > 0) then
					{
						_item addMagazineCargoGlobal [(_mags select (floor random (_count_mags - 1))), (ceil random 3)]
					};
				};
				case "backpack":
				{
					createVehicle [_loot_class, _pos, [], 0, "CAN_COLLIDE"];
					_i = _rnd_qty;
				};
				case "object":
				{
					createVehicle [_loot_class, _pos, [], 0, "CAN_COLLIDE"];
					_i = _rnd_qty;
				};
				case "item":
				{
					_item addItemCargoGlobal [_loot_class, 1];
				};
				default {};
			};
		};
	};
};