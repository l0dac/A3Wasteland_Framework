/*
	File: fn_buyVehicle.sqf
	Author: Declan Ireland

	Description:

	Parameters:

*/


_quanity = _this select 0;
_shopCfgName = (player_store_data select 0);
_itemClassname = (player_store_data select 1);

_playerMoney = player getVariable ["cmoney", 0];

if (_itemPrice > _playerMoney) exitWith
{
	// ERROR Insufficent Cash
};

_status = true;
for "_i" from 1 to _quanity do
{
	switch (true) do
	{
		case (player canAddItemToUniform _itemClass): {};
		case (player canAddItemToVest _itemClass): {};
		case (player canAddItemToBackpack _itemClass): {};
		default
		{
			_status = false;
		}
	};
	if (!_status) exitWith {};
};

if (_status) then
{
	client_buyItem = [player, _shopCfgName, _itemClassname, _quanity];
	publicvariableserver "client_buyItem";
}
else
{
	[["Store", "NotEnoughRoom"], 10, "", 10, "", true, false, false, false] spawn BIS_fnc_advHint;
};

