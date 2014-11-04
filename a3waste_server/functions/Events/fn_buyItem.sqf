/*
	File: buyItem.sqf
	Author: Declan Ireland

	Description:


	Parameters:

*/


diag_log format ["DEBUG fn_buyItem: _this:%1", _this];

_player = _this select 0;
_shopCfgName = _this select 1;
_itemClass = _this select 2;
_quanity = _this select 3;

_clientID = owner _player;

_itemClassArray = missionNamespace getvariable [format ["StoreCfg_%1_itemClassName", _shopCfgName], []];
_itemPriceArray = missionNamespace getvariable [format ["StoreCfg_%1_itemPrice", _shopCfgName], []];
_itemCfgTypeArray = missionNamespace getvariable [format ["StoreCfg_%1_itemCfgType", _shopCfgName], []];

_index = (_itemClassArray find _itemClass);
if (_index == -1 ) exitWith {
	diag_log format ["ERROR DETECTED: Store Buy Item Invalid Classname from %1  name:%2", _player, (name _player)];
};

_itemPrice = _itemPriceArray select _index;

_moneyLock = [_clientID, "MoneyLock"] call players_fnc_dataGet;

if (_moneyLock) exitWith {
	_varName = format["storeWait_%1", _clientID];
	missionNamespace setVariable [_varName, ""]; // TODO add purchase info that failed ?
	publicVariable _varName;
}; // Player will notice when nothing is both, to prevent spam purchases etc...

[_clientID, "MoneyLock", true] call players_fnc_dataSet;
_cmoney = ([_clientID, "cmoney"] call players_fnc_dataGet);

_totalCost = (_itemPrice * _quanity);
if (_cmoney < _totalCost) exitWith {

	_varName = format["insufficentMoney_%1", _clientID];
	missionNamespace setVariable [_varName, _cmoney];
	publicVariable _varName;

	[_clientID, "MoneyLock", false] call players_fnc_dataSet;
};
_cmoney = _cmoney - _totalCost;


switch (_shopCfgName) do
{
	case "objects":
	{
		// TODO setDir Player -> Object
		for "_i" from 1 to _quanity do
		{
			_obj = createVehicle [_itemClass, (position _player), [], 0, "NONE"];
			// TODO Object Persistence
		};
	};

	default
	{
		_data = [_shopCfgName, _itemClass, _quanity];
		_varName = format["boughtItem_%1", _clientID];
		missionNamespace setVariable [_varName, _data];
		publicVariable _varName;
	};
};

_varName = format["updateCMoney_%1", _clientID];
missionNamespace setVariable [_varName, _cmoney];
publicVariable _varName;

[_clientID, "cmoney", _cmoney] call players_fnc_dataSet;  // Don't trust clients
[_clientID, "MoneyLock", false] call players_fnc_dataSet;
