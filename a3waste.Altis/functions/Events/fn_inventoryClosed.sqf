/*
	File: fn_inventoryClosed.sqf
	Author:

	Description:
		Sends PV to Server to tell inventory window closed.
		Used to save player stats.
	Parameters:
	   0: ARRAY loadout
	   1: ARRAY heli info
*/

if (isDedicated) exitWith {};

//_unit = _this select 0;
//_container = _this select 1;

client_inventoryClosed = _this;
publicVariableServer "client_inventoryClosed";