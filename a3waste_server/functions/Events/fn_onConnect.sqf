/*
	File: fn_onConnect.sqf
	Author: Declan Ireland

	Description:
		Runs on Player Connect, checks if PlayerInfo exists in Database.
			Sends client its clientID in MPexec, used to generate client PVE.
	Parameters:
		0: Unit/Player
		1: BOOLEAN	JIP

*/


diag_log format ["DEBUG: onConnect: %1", _this];

private ["_player", "_clientID", "_playerUID", "_startTime", "_playerName"];

_player = _this select 0;
//_jip = _this select 1;

_playerUID = getPlayerUID _player;

//_player enableSimulationGlobal false;

// Paranoid Mode seen extDB log entries were Server sends it an empty GUID
// 		Happens @ first login... don't receive GUID till player clicks continue @ mission briefing
_startTime = diag_tickTime;
while {true} do
{
	sleep 0.1;
	_playerUID = getPlayerUID _player;
	if (_playerUID != "") exitWith {};
	if (diag_tickTime - _startTime >= 60) exitWith {};
};

if (_playerUID == "") exitWith
{
	// [[_clientID], "client_fnc_errorClient", _clientID ,false , false] call BIS_fnc_MP;
};

_clientID = owner _player;
_playerName = [(name _player)] call extDB_fnc_strip;

_result = ([format["existPlayerInfo:%1", _playerUID], 2] call extDB_fnc_async) select 0;
if (!_result) then
{
	// PlayerInfo Doesn't Exists
	[format["insertPlayerInfo+Save:%1:%2:%3", str(call(waste_server_mapID)), _playerUID, _playerName], 2] call extDB_fnc_async; // SYNC Method 2 to prevent any race problems with Updates / Inserts
};

[_clientID] call players_fnc_dataInit;
[_clientID, "NAME", _playerName] call players_fnc_dataSet;


[[_clientID], "client_fnc_updateClientID", _clientID ,false , false] call BIS_fnc_MP;
[[store_npcs], "client_fnc_updateStores", _clientID ,false , false] call BIS_fnc_MP;