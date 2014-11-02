/*
	File: fn_onKilled.sqf
	Author: Declan Ireland

	Description:
		Trigger when client Dies.
		Updates Database
		Triggers Spawn code for client to Respawn

	Parameters:
		0: unit: Object - Object the event handler is assigned to
		1: killer: Object - Object that killed the unit
					Contains the unit itself in case of collisions.
*/


_unit = _this select 0;
_killer = _this select 1;

// TODO add code for TeamKillers

// TODO add check for Suicide/Respawn

[(getPlayerUID _unit)] call extDB_fnc_deadPlayer;

[_unit] call serverEvents_fnc_onSpawn;