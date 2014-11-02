/*
	File: fn_updatePlayerAll.sqf
	Author: Declan Ireland

	Description:
		Updates All Info for player
	Parameters:
		0: unit
		1: uid

*/


_unit = _this select 0;
_playerUID = _this select 1;

_playerPos = getPosWorld _unit;
_playerDir = direction _unit;

_playerCurrentWeapon = "";
_playerStance = "";
if (vehicle _unit == _unit) then
{
	// Player on foot
	_playerCurrentWeapon = format ["%1", currentMuzzle _unit];
	_playerStance = animationState _unit;
}
else
{
	// Player in Vehicle
	 // relog back in vehicle if was only afew minutes previous ???
	 // need to find a way to balance that idea so not exploitable
};

_hitPoints = [];
{
	_hitPoints pushBack [_x, _unit getHitPointDamage _x];
} forEach (_unit call server_fnc_getHitPoints);

_damage = damage _unit;

_hunger = 1; //TODO Hunger

_thirst = 1; //TODO Thirst

_money = 100; //TODO Money


_uniformContainer = uniformContainer _unit;
_uniformWeapons = [[],[]];
_uniformItems = [[],[]];
_uniformMagazines = [[],[]];
if (!(isNull _uniformContainer)) then
{
	_uniformWeapons = getWeaponCargo _uniformContainer;
	_uniformItems = getItemCargo _uniformContainer;
	_uniformMagazines = magazinesAmmoCargo _uniformContainer;
}
else
{
	_uniformContainer = "";
};


_vestContainer = vestContainer _unit;
_vestWeapons = [[],[]];
_vestItems = [[],[]];
_vestMagazines = [[],[]];
if (!(isNull _vestContainer)) then
{
	_vestWeapons = getWeaponCargo _vestContainer;
	_vestItems = getItemCargo _vestContainer;
	_vestMagazines = magazinesAmmoCargo _vestContainer;
}
else
{
	_vestContainer = "";
};

_backpackContainer = backpackContainer _unit;
_backpackWeapons = [[],[]];
_backpackItems = [[],[]];
_backpackMagazines = [[],[]];
if (!(isNull _backpackContainer)) then
{
	_backpackWeapons = getWeaponCargo _backpackContainer;
	_backpackItems = getItemCargo _backpackContainer;
	_backpackMagazines = magazinesAmmoCargo _backpackContainer;
}
else
{
	_backpackContainer = "";
};

_uniform = uniform _unit;
_vest = vest _unit;
_backpack = backpack _unit;
_goggles = goggles _unit;
_headgear = headgear _unit;

_primaryWeapon = primaryWeapon _unit;
_secondaryWeapon = secondaryWeapon _unit;
_handgunWeapon = handgunWeapon _unit;

_primaryWeaponItems = primaryWeaponItems _unit;
_secondaryWeaponItems = secondaryWeaponItems _unit;
_handgunItems = handgunItems _unit;

_assignedItems = assignedItems _unit;
_loadedMags = [];

{
	_loaded = _x select 2;
	if (_loaded) then
	{
		_mag = _x select 0;
		_ammo = _x select 1;
		_type = _x select 3;

		// if loaded in weapon, not empty, and not hand grenade
		if (_ammo > 0 && _type != 0) then
		{
			_loadedMags pushBack [_mag, _ammo];
		};

	};
} forEach magazinesAmmoFull _unit;

_wasteItems = []; //TODO


_query = "updatePlayerSaveAll:"
		// General
		+ str(call(waste_server_mapID)) + ":" + _playerUID

		// Player Position Info
		+ ":" + str(_playerPos) + ":" + str(_playerDir) + ":" +str(_playerCurrentWeapon) + ":" + str(_playerStance)

		// Player Data
		+ ":" + str(_damage) + ":" + str(_hitPoints) + ":" + str(_hunger) + ":" + str(_thirst) + ":" + str(_money)

		+ ":" + str(_uniformWeapons) + ":" + str(_uniformItems) + ":" + str(_uniformMagazines) + ":" + str(_vestWeapons) + ":" + str(_vestItems)
		+ ":" + str(_vestMagazines) + ":" + str(_backpackWeapons) + ":" + str(_backpackItems) + ":" + str(_backpackMagazines)

		// Player Gear
		+ ":" + _uniform + ":" + _vest + ":" + _backpack + ":" + _goggles + ":" + _headgear
		+ ":" + _primaryWeapon + ":" + _secondaryWeapon + ":" + _handgunWeapon
		+ ":" + str(_primaryWeaponItems) + ":" + str(_secondaryWeaponItems) + ":" + str(_handgunItems)
		+ ":" + str(_assignedItems) + ":" +  str(_loadedMags) + ":" + str(_wasteItems);

[_query] spawn extDB_fnc_async;