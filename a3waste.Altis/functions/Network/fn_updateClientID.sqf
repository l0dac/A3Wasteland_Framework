/*
	File: fn_updateClientID.sqf
	Author: Declan Ireland

	Description:
		Used to generate Unique PEV for client, based on ClientID.
			Avoids any race condition when assign value before it gets broadcasted to specfic client
	Parameters:
		0: ClientID
*/


private ["_clientID"];

_clientID = _this select 0;

[_clientID] call client_fnc_addEventHandlers;
0 cutText ["","BLACK IN"];