/*
	File: fn_dataGet.sqf
	Author: Declan Ireland

	Description:
		Retrieves Player Info from an array.
		Returns nil if Key not found.
	Parameters:
		0: ClientID
		1: KEY
*/


private ["_clientID", "_key", "_varName", "_info", "_data", "_index", "_return"];

_clientID = _this select 0;
_key = _this select 1;

_varInfo = format["ClientInfo:%1", _clientID];
_varData = format["ClientData:%1", _clientID];


_info = missionNamespace getvariable [_varInfo, []];
_data = missionNamespace getvariable [_varData, []];

diag_log format ["Info:%1 Data:%2", _info, _data];

_index = _info find _key;
if (_index >= 0) then
{
	_return = _data select _index;
}
else
{
	_return = nil;
};

_return