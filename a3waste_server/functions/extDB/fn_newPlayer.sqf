/*
	File: fn_newPlayer.sqf
	Author: Declan Ireland

	Description:
		Updates All Info for player
	Parameters:
		0: unit
		1: uid
		2: data
*/

diag_log format ["DEBUG newPlayer: _this: %1", _this];

_unit = _this select 0;
_playerUID = _this select 1;
_loadout = _this select 2;

// --------------------
_hunger = _loadout select 0;
_thirst = _loadout select 1;
_money = _loadout select 2;

_currentWeapon = _loadout select 3;
_stance = _loadout select 4;


_headgear = _loadout select 5;
_goggles = _loadout select 6;

_uniform = _loadout select 7;
_vest = _loadout select 8;
_backpack = _loadout select 9;

_uniformWeapons = _loadout select 10;
_uniformItems = _loadout select 11;
_uniformMagazines = _loadout select 12;

_vestWeapons = _loadout select 13;
_vestItems = _loadout select 14;
_vestMagazines = _loadout select 15;

_backpackWeapons = _loadout select 16;
_backpackItems = _loadout select 17;
_backpackMagazines = _loadout select 18;

_primaryWeapon = _loadout select 19;
_secondaryWeapon = _loadout select 20;
_handgunWeapon = _loadout select 21;

_primaryWeaponItems = _loadout select 22;
_secondaryWeaponItems = _loadout select 23;
_handgunItems = _loadout select 24;
_assignedItems = _loadout select 25;

_loadedMagazines = _loadout select 26;
_wasteItems = _loadout select 27;

// --------------------

_playerPos = [];
_playerDir = 0;

_playerCurrentWeapon = "";
_playerStance = "";


_hitPoints = [];

_damage = 0;

_hunger = 1;

_thirst = 1;

_money = 100;



_query = "replacePlayerSaveAll:"
		// General
		+ str(call(waste_server_mapID)) + ":" + _playerUID

		// Player Position Info
		+ ":" + str(_playerPos) + ":" + str(_playerDir) + ":" +str(_playerCurrentWeapon) + ":" + str(_playerStance)

		// Player Data
		+ ":" + str(_damage) + ":" + str(_hitPoints) + ":" + str(_hunger) + ":" + str(_thirst) + ":" + str(_money)

		+ ":" + str(_uniformWeapons) + ":" + str(_uniformItems) + ":" + str(_uniformMagazines)
		+ ":" + str(_vestWeapons) + ":" + str(_vestItems)	+ ":" + str(_vestMagazines)
		+ ":" + str(_backpackWeapons) + ":" + str(_backpackItems) + ":" + str(_backpackMagazines)

		// Player Gear
		+ ":" + _uniform + ":" + _vest + ":" + _backpack + ":" + _goggles + ":" + _headgear
		+ ":" + _primaryWeapon + ":" + _secondaryWeapon + ":" + _handgunWeapon
		+ ":" + str(_primaryWeaponItems) + ":" + str(_secondaryWeaponItems) + ":" + str(_handgunItems)
		+ ":" + str(_assignedItems) + ":" + str(_loadedMagazines) + ":" + str(_wasteItems);

[_query] spawn extDB_fnc_async;