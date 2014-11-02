/*
	File: fn_deadPlayer.sqf
	Author: Declan Ireland

	Description:
		Updates All Info for player
	Parameters:
		0: _playerUID
*/

_playerUID = _this select 0;

_query = format ["updatePlayerSaveDeath:%1:%2", call(waste_server_mapID), _playerUID];

[_query, 2] call extDB_fnc_async;