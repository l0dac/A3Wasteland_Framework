/*
	File: initPlayerServer.sqf
	Author: Declan Ireland

	Description:


	Parameters:

*/


waitUntil {sleep 0.01; (!(isNil "server_status"))};

if (server_status) then
{
	_this call serverEvents_fnc_onConnect;
};