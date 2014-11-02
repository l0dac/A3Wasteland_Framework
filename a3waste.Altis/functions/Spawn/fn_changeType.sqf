/*
	File: fn_changeType.sqf
	Author: Declan Ireland

	Description:

	Parameters:

*/


#define waste_Town_Locations_LISTBOX	1001
#define waste_Beacons_Locations_LISTBOX	1002

#define waste_spawn_BUTTON				1010

spawnTypeSelection = _this select 0;

switch (spawnTypeSelection) do
{
	case 0: // TOWN
	{
		ctrlShow [waste_Beacons_Locations_LISTBOX, false];
		ctrlShow [waste_Town_Locations_LISTBOX, true];

		ctrlShow [waste_spawn_BUTTON, false];
		// HIDE BEACON
		// SHOW TOWN LIST
	};

	case 1:
	{
		ctrlShow [waste_Town_Locations_LISTBOX, false];
		ctrlShow [waste_Beacons_Locations_LISTBOX, true];

		ctrlShow [waste_spawn_BUTTON, false];
		// HIDE TOWN LIST
		// SHOW BEACON LIST
	};
};

_index = lbCurSel waste_Town_Locations_LISTBOX;
_index2 = lbCurSel waste_Beacons_Locations_LISTBOX;

diag_log format ["DEBUG _index:%1 _index2:%2", _index, _index2];