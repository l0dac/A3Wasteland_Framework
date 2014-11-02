/*
	File: fn_dataSet.sqf
	Author: Declan Ireland

	Description:
		Saves Player Info into a generated array etc.
	Parameters:
		0: ClientID
		1: KEY
		3: VALUE
*/


private ["_clientID", "_key", "_value", "_varName", "_info", "_data", "_index"];

_clientID = _this select 0;
_key = _this select 1;
_value = _this select 2;

_varInfo = format["ClientInfo:%1", _clientID];
_varData = format["ClientData:%1", _clientID];

_info = missionNamespace getvariable [_varInfo, []];
_data = missionNamespace getvariable [_varData, []];

_index = _info find _key;
if (_index >= 0) then
{
	_data set[_index, _value];
}
else
{
	_info pushBack _key;
	_data pushBack _value;
};

missionNamespace setvariable [_varInfo, _info];
missionNamespace setvariable [_varData, _data];