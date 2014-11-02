/*
	File: fn_buyVehicle.sqf
	Author: Declan Ireland

	Description:

	Parameters:

*/


_quanity = _this select 0;

_playerMoney = player getVariable ["cmoney", 0];

if (_itemPrice > _playerMoney) exitWith
{
	// ERROR Insufficent Cash
};

client_buyItem = [player, (player_store_data select 0), (player_store_data select 1), _quanity];
publicvariableserver "client_buyItem";
