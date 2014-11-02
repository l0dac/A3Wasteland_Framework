/*
	File: boughtItem.sqf
	Author: Declan Ireland

	Description:


	Parameters:

*/

_addToPlayerInventory =
{
	diag_log format["9:%1", _this];
	_container = _this select 0;
	_itemClass = _this select 1;
	_itemClassType = _this select 2;
	switch (_itemClassType) do
	{
		case "CfgWeapons": {_container addWeaponCargoGlobal [_itemClass, 1]};
		case "CfgMagazines": {_container addMagazineCargoGlobal [_itemClass, 1]};
		case "CfgVehicles": {};
		default {_container addItemCargoGlobal [_itemClass, 1]};
	};
};


_addToPlayer =
{
	_cmoney = _this select 0;

	_itemClass = _this select 1;
	_itemClassType = _this select 2;
	_itemPrice = _this select 3;
	_quanity = _this select 4;

	_uniformContainer = uniformContainer player;
	_vestContainer = vestContainer player;
	_backpackContainer = backpackContainer player;

	_loop = true;
	for "_i" from 1 to _quanity do
	{
		diag_log "4";
		switch (true) do
		{
			case (player canAddItemToUniform _itemClass):
			{
				diag_log "5";
				[_uniformContainer, _itemClass, _itemClassType] call _addToPlayerInventory;
				_cmoney = _cmoney - _itemPrice;
			};
			case (player canAddItemToVest _itemClass):
			{
				diag_log "6";
				[_vestContainer, _itemClass, _itemClassType] call _addToPlayerInventory;
				_cmoney = _cmoney - _itemPrice;
			};
			case (player canAddItemToBackpack _itemClass):
			{
				diag_log "7";
				[_backpackContainer, _itemClass, _itemClassType] call _addToPlayerInventory;
				_cmoney = _cmoney - _itemPrice;
			};
			default
			{
				diag_log "8";
				diag_log format["DEBUG 1:%1  2:%2", _itemClass, _itemClassType];
				_loop = false;
			}
		};
		if (!_loop) exitWith
		{
			// TODO Error Insufficent Room
		};
	};
};



diag_log format ["DEBUG fn_boughtItem: _this:%1", _this];

_shopCfgName = _this select 0;
_itemClass = _this select 1;
_quanity = _this select 2;

_cmoney = player getvariable ["cmoney", 0];


_itemClassArray = missionNamespace getvariable [format ["StoreCfg_%1_itemClassName", _shopCfgName], []];
_itemCfgTypeArray = missionNamespace getvariable [format ["StoreCfg_%1_itemCfgType", _shopCfgName], []];
_itemPriceArray = missionNamespace getvariable [format ["StoreCfg_%1_itemPrice", _shopCfgName], []];

_index = (_itemClassArray find _itemClass);
if (_index == -1 ) exitWith {}; // Quit if Class Type not found, shouldnt happen. Dont trust clients

_itemClassType = _itemCfgTypeArray select _index;
_itemPrice = _itemPriceArray select _index;

_clientID = owner player;


switch (_itemClassType) do
{
	case "Uniform":
	{
		if(uniform player != "") then
		{
			_uniformContainer = uniformContainer player;
			_uniformWeapons = getWeaponCargo _uniformContainer;
			_uniformItems = getItemCargo _uniformContainer;
			_uniformMagazines = magazinesAmmoCargo _uniformContainer;
			removeUniform player;
			player addUniform _itemClass;
			sleep 1;
			_uniformContainer = uniformContainer player;

			{
				_uniformContainer addWeaponCargoGlobal [_x, (_uniformWeapons select 1) select _forEachIndex];
			} forEach (_uniformWeapons select 0);
			{
				_uniformContainer addItemCargoGlobal [_x, (_uniformItems select 1) select _forEachIndex];
			} forEach (_uniformItems select 0);

			{
				if ((count _x) > 0) then
				{
					_uniformContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
				};
			} forEach _uniformMagazines;
		}
		else
		{
			player addUniform _itemClass;
		};
	};

	case "Vest":
	{
		if(vest player != "") then
		{
			_vestContainer = vestContainer player;
			_vestWeapons = getWeaponCargo _vestContainer;
			_vestItems = getItemCargo _vestContainer;
			_vestMagazines = magazinesAmmoCargo _vestContainer;
			removeVest player;
			player addVest _itemClass;
			sleep 1;
			_vestContainer = vestContainer player;

			{
				_vestContainer addWeaponCargoGlobal [_x, (_vestWeapons select 1) select _forEachIndex];
			} forEach (_vestWeapons select 0);
			{
				_vestContainer addItemCargoGlobal [_x, (_vestItems select 1) select _forEachIndex];
			} forEach (_vestItems select 0);
			{
				if ((count _x) > 0) then
				{
					_vestContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
				};
			} forEach _vestMagazines;
		}
		else
		{
			player addVest _itemClass;
		};
	};

	case "CfgVehicles":  // Backpack
	{
		if(backpack player != "") then
		{
			_backpackContainer = backpackContainer player;
			_backpackWeapons = getWeaponCargo _backpackContainer;
			_backpackItems = getItemCargo _backpackContainer;
			_backpackMagazines = magazinesAmmoCargo _backpackContainer;
			removeBackpackGlobal player;
			player addBackpackGlobal _itemClass;
			sleep 1;
			{
				player removeItemFromBackpack _x;
			} forEach backpackItems player;
			_backpackContainer = backpackContainer player;

			{
				_backpackContainer addWeaponCargoGlobal [_x, (_backpackWeapons select 1) select _forEachIndex];
			} forEach (_backpackWeapons select 0);
			{
				_backpackContainer addItemCargoGlobal [_x, (_backpackItems select 1) select _forEachIndex];
			} forEach (_backpackItems select 0);
			{
				if ((count _x) > 0) then
				{
					_backpackContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
				};
			} forEach _backpackMagazines;
		}
		else
		{
			player addBackpackGlobal _itemClass;
		};
	};



	case "Object": // Building Objects
	{
		diag_log "1";
	};

	case "CfgWeapons":
	{
		diag_log "2";
		// TODO Add code to add gun to slot if empty
		[_cmoney, _itemClass, _itemClassType, _itemPrice, _quanity] call _addToPlayer;
	};

	default // All other Items
	{
		diag_log "3";
		[_cmoney, _itemClass, _itemClassType, _itemPrice, _quanity] call _addToPlayer;
	};
};
