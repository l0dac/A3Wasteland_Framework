/*
	File: fn_handleDisconnect.sqf
	Author: Declan Ireland

	Description:
		Updates Player Info in Database + removes serverside player info.

	Parameters:
		unit: Object - unit formerly occupied by player
		id: Number - same as _id in onPlayerDisconnected
		uid: String - same as _uid in onPlayerDisconnected
		name: String - same as _name in onPlayerDisconnected
*/


diag_log format ["DEBUG: handleDisconnect: %1", _this];

_unit = _this select 0;
_playerID = _this select 1;
_playerUID = _this select 2;
//_playerName = _this select 3;

[_unit, _playerUID] call extDB_fnc_updatePlayerAll;

_unit setvariable ["SAVE_ALLOWED", nil, true];

// Delete Server Stored Data for Player
[_playerID] call players_fnc_dataDel;

//true == ai left behind  Disconnect BOT :)
false