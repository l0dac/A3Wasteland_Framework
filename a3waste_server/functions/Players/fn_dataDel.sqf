/*
	File: fn_dataDel.sqf
	Author: Declan Ireland

	Description:
		Saves Player Info into a generated array etc.
	Parameters:
		0: ClientID
*/


private ["_clientID", "_varName"];

_clientID = _this select 0;

_varInfo = format["ClientInfo:%1", _clientID];
_varData = format["ClientData:%1", _clientID];

missionNamespace setvariable [_varInfo, nil];
missionNamespace setvariable [_varData, nil];
