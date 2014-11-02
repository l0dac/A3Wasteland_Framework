/*
	File: fn_inventoryClosed.sqf
	Author: Declan Ireland

	Description:
		Sets Player Unit Variable "updateInventory" to true.
		Used to signal client update in Soft Updates.
			Also removes inventoryOpen_Timestamp
	Parameters:
		0: Array [Player]
*/


private ["_player", "_clientID", "_playerUID", "_playerCharUID", "_playerExp", "_playerMoney", "_playerUnlocks"];

_player = _this select 0;

_oldTimestamp = _player getVariable ["inventoryOpen_Timestamp", -1];

if (_oldTimestamp > 0) then
{
	_player setVariable["inventoryOpen_Timestamp", nil];
};

_player setVariable ["updateInventory", true];
