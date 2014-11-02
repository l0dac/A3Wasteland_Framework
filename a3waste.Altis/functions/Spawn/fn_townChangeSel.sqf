/*
	File: fn_townChangeSel.sqf
	Author: Declan Ireland

	Description:

	Parameters:

*/


#define waste_spawn_DIALOG 				1000

#define waste_Town_Locations_LISTBOX	1001
#define waste_Beacons_Locations_LISTBOX	1002

#define waste_spawn_map                 1005

#define waste_spawn_BUTTON				1010


_curIndex = (_this select 1);

diag_log format ["TOWN SEL CHANGED: %1", _curIndex];

ctrlShow [waste_spawn_BUTTON, true];

_townName = lbText[waste_Town_Locations_LISTBOX, _curIndex];
_townPos = call compile (lbData[waste_Town_Locations_LISTBOX, _curIndex]);

_oldTownName = player getVariable ["waste_spawnName", ""];
_oldTownPos = player getVariable ["waste_spawnPos", []];

if (!(_oldTownPos isEqualto _townPos)) then {
	player setVariable ["waste_spawnName", _townName];
	player setVariable ["waste_spawnPos", _townPos];

	disableSerialization;

	_control = (findDisplay waste_spawn_DIALOG) displayCtrl waste_spawn_map;
	_control ctrlMapAnimAdd[1,0.5,_townPos];
	ctrlMapAnimCommit _control;
};