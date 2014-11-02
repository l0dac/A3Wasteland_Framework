/*
	File: fn_onSpawn.sqf
	Author: Declan Ireland

	Description:
		Trigger when client Spawns.
		Check Database for PlayerSave
			If Player is new/dead loads default loadout.
		Sends Player info via PV i.e [loadout, position]

	Parameters:
		0: Unit/Player

*/


private ["_player", "_clientID", "_playerUID", "_playerCharUID", "_playerExp", "_playerMoney", "_playerUnlocks"];

_player = _this select 0;

_clientID = owner _player;
_playerUID = getPlayerUID _player;

// PlayerInfo Exists
_result = [format["getPlayerSave:%1:%2", str(call(waste_server_mapID)), _playerUID], 2] call extDB_fnc_async;
_loadout = [];

_newPlayerPosition = true;

if ((count _result) == 0) then
{
	// New Player
	_loadout = call waste_playerLoadOut;
	[_player, _playerUID, _loadout] call extDB_fnc_newPlayer;
}
else
{
	if ((_result select 0) == 1) then
	{
		// Dead Player
		_loadout = call waste_playerLoadOut;
		[_player, _playerUID, _loadout] call extDB_fnc_newPlayer;
	}
	else
	{
		if ((count (_result select 2)) == 0) then
		{
			// Fresh Player Save, no position
			_loadout = _loadout + _result;
			_loadout deleteRange [0,4];
		}
		else
		{
			 // Old Player Data OK
			_loadout = _loadout + _result;
			_loadout deleteRange [0,4];
			_newPlayerPosition = false;
		};
	};
};

if (_newPlayerPosition) then
{
	// Broadcast Client their Loadout
	_varName = format ["newSpawn_%1", _clientID];
	_varData = [_loadout];

	missionNamespace setvariable [_varName, _varData];
	_clientId publicVariableClient _varName;
}
else
{
	_position = _result select 2;
	_dir = _result select 3;

	// Broadcast Client thier Loadout
	_varNameLoadout = format["oldSpawn_%1", _clientID];
	missionNamespace setvariable [_varNameLoadout, [_loadout, _position, _dir]];
	_clientId publicVariableClient _varNameLoadout;

	// Damage Client
	//_player setPosWorld (_result select 2);
	_player setDamage (_result select 0);
	{
		_player setHitPointDamage _x;
	} forEach (_result select 1);
};
