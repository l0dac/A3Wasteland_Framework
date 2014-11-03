/*
	File: fn_playerSetup.sqf
	Author:

	Description:
		Loads Player Loadout, Stance + Direction.
			Rest is done by Server i.e position / damage etc
	Parameters:

*/

private ["_data"];


diag_log format ["DEBUG PLAYER SETUP: _this: %1", _this];
diag_log format ["DEBUG LENGTH: %1", (count _this)];

_data = _this select 0;

_hunger = _data select 0;
_thirst = _data select 1;
_money = _data select 2;

_currentWeapon = _data select 3;
_stance = _data select 4;

_headgear = _data select 5;
_goggles = _data select 6;

_uniform = _data select 7;
_vest = _data select 8;
_backpack = _data select 9;

_uniformWeapons = _data select 10;
_uniformItems = _data select 11;
_uniformMagazines = _data select 12;

_vestWeapons = _data select 13;
_vestItems = _data select 14;
_vestMagazines = _data select 15;

_backpackWeapons = _data select 16;
_backpackItems = _data select 17;
_backpackMagazines = _data select 18;

_primaryWeapon = _data select 19;
_secondaryWeapon = _data select 20;
_handgunWeapon = _data select 21;

_primaryWeaponItems = _data select 22;
_secondaryWeaponItems = _data select 23;
_handgunItems = _data select 24;
_assignedItems = _data select 25;

_loadedMagazines = _data select 26;
_wasteItems = _data select 27;

removeAllWeapons player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;

sleep 0.1;

player addHeadgear _headgear;
player addGoggles _goggles;

player addUniform _uniform;
player addVest _vest;
player addBackpack _backpack;

{
	player removeItemFromBackpack _x;
} forEach backpackItems player;


_uniformContainer = uniformContainer player;
_vestContainer = vestContainer player;
_backpackContainer = backpackContainer player;
if (_uniform != "") then
{
	{
		//player addMagazine _x;
		_uniformContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
	} forEach _loadedMagazines;
};


player addWeapon _primaryWeapon;
player addWeapon _secondaryWeapon;
player addWeapon _handgunWeapon;
removeAllPrimaryWeaponItems player;
removeAllHandgunItems player;


{
	if (_x != "") then
	{
		player addPrimaryWeaponItem _x;
	};
} forEach _primaryWeaponItems;
{
	if (_x != "") then
	{
		player addPrimaryWeaponItem _x;
	};
} forEach _secondaryWeaponItems;
{
	if (_x != "") then
	{
		player addHandgunItem _x;
	};
} forEach _handgunItems;
{
	if (_x != "") then
	{
		player linkItem _x;
	};
} forEach _assignedItems;


// Uniform Cargo
{
	diag_log format["UW :%1", _x];
	_uniformContainer addWeaponCargoGlobal [_x, (_uniformWeapons select 1) select _forEachIndex];
} forEach (_uniformWeapons select 0);
{
	diag_log format["UI :%1", _x];
	_uniformContainer addItemCargoGlobal [_x, (_uniformItems select 1) select _forEachIndex];
} forEach (_uniformItems select 0);

{
	diag_log format["UM :%1", _x];
	if ((count _x) > 0) then
	{
		_uniformContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
	};
} forEach _uniformMagazines;

// Vest Cargo

{
	diag_log format["VW :%1", _x];
	_vestContainer addWeaponCargoGlobal [_x, (_vestWeapons select 1) select _forEachIndex];
} forEach (_vestWeapons select 0);
{
	diag_log format["VI :%1", _x];
	_vestContainer addItemCargoGlobal [_x, (_vestItems select 1) select _forEachIndex];
} forEach (_vestItems select 0);
{
	diag_log format["VM :%1", _x];
	if ((count _x) > 0) then
	{
		_vestContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
	};
} forEach _vestMagazines;

// Backpack Cargo
{
	diag_log format["BW :%1", _x];
	_backpackContainer addWeaponCargoGlobal [_x, (_backpackWeapons select 1) select _forEachIndex];
} forEach (_backpackWeapons select 0);
{
	diag_log format["BI :%1", _x];
	_backpackContainer addItemCargoGlobal [_x, (_backpackItems select 1) select _forEachIndex];
} forEach (_backpackItems select 0);
{
	diag_log format["BM :%1", _x];
	if ((count _x) > 0) then
	{
		_backpackContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
	};
} forEach _backpackMagazines;

diag_log "---5";

{
	// TODO FINISH THIS
	systemChat format["TODO: CODE Incomplete, couldnt add %1 to player", _x];
} forEach _wasteItems;

// Addactions

diag_log "---6";


if (_stance != "") then
{
	player switchMove _stance;
};

if (_currentWeapon != "") then
{
	player selectWeapon _currentWeapon;
};




// FARR Revive

player setVariable ["FAR_isUnconscious", 0, true];
player setVariable ["FAR_isStabilized", 0, true];
player setVariable ["FAR_isDragged", 0, true];
player setVariable ["ace_sys_wounds_uncon", false];
player setCaptive false;

FAR_PlayerSide = side player;
FAR_isDragging = false;

call FAR_fnc_playerActions;

// Player Icons

[] execVM "scripts\a3wasteland_playerIcons.sqf";