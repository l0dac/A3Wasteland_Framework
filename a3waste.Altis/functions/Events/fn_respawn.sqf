/*
	File: fn_respawn.sqf
	Author:

	Description:
		Sends PV to server to signal player killed
	Parameters:

*/

if (isDedicated) exitWith {};

//_unit = _this select 0;
//_corpse = _this select 1;

9999 cutText ["", "BLACK", 0.01];
client_onPlayerKilled = _this;
publicvariableServer "client_onPlayerKilled";
