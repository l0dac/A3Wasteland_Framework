/*
	File: fn_inventoryOpened.sqf
	Author: Declan Ireland

	Description:
		Sets Player Unit Variable "inventoryOpen_Timestamp" to diag_tickTime.
		If ( diag_tickTime - oldTimestamp ) > 30, sets player variable "updateInventory" = true.
			Variables used for Soft Updates
	Parameters:
		0: Array [Player]
*/


private ["_player", "_clientID", "_playerUID", "_playerCharUID", "_playerExp", "_playerMoney", "_playerUnlocks"];

_player = _this select 0;

_diag_tickTime = diag_tickTime;
_oldTimestamp = _player getVariable ["inventoryOpen_Timestamp", -1];

if (_oldTimestamp < 0) then
{
	_player setVariable["inventoryOpen_Timestamp", _diag_tickTime];
}
else
{
	if ((_diag_tickTime - _oldTimestamp) > 30) then
	{
		_player setVariable ["updateInventory", true];
		//_player setVariable ["inventoryOpen_Timestamp", _diag_tickTime];
	};
};