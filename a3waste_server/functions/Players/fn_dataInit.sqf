/*
	File: fn_dataInit.sqf
	Author: Declan Ireland

	Description:
		Initialize Player Data, used on Player Connect
	Parameters:
		0: ClientID
		1: KEY
		3: VALUE
*/


private ["_clientID", "_playerName", "_varName"];

_clientID = _this select 0;
_playerName = _this select 1;

_varInfo = format["ClientInfo:%1", _clientID];
_varData = format["ClientData:%1", _clientID];

missionNamespace setvariable [_varInfo, ["MoneyLock", "cmoney"]];
missionNamespace setvariable [_varData, [false, 10000000]];