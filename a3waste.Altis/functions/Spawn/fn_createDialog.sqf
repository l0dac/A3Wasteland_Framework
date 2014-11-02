/*
	File: fn_createDialog.sqf
	Author:

	Description:
		Loads Player Loadout, Stance + Direction.
			Rest is done by Server i.e position / damage etc
	Parameters:

*/


#define waste_spawn_DIALOG 				1000

#define waste_Town_Locations_LISTBOX	1001
#define waste_Beacons_Locations_LISTBOX	1002
#define waste_Players_LISTBOX			1003

#define waste_spawn_BUTTON				1010



_updateFriendlyStatus =
{
	_locationPos = _this select 0;
	_locationName = _this select 1;

	_friendlyPlayersNames = [];

	_friendlyPlayers = 0;
	_enemyPlayers = 0;

	{
		if (alive _x && {_x isKindOf "CAManBase"} && {_x distance _locationPos <= 250}) then
		{
			if (side _x == playerSide && {playerSide in [BLUFOR,OPFOR] || group _x == group player}) then
			{
				if (isPlayer _x) then
				{
					_friendlyPlayersNames pushBack (name _x);
					_friendlyPlayers = _friendlyPlayers + 1;
				};
			}
			else
			{
				if (isPlayer _x) then
				{
					_enemyPlayers = _enemyPlayers + 1;
				};
			};
		};
	} forEach allUnits;


	missionNamespace setVariable [format ["%1_friendlyPlayersNames", _locationName], _friendlyPlayersNames];

	(_friendlyPlayers - _enemyPlayers)
};


_getFriendlyNames =
{
	_locationName = _this select 0; // spawn beacon object or town marker name
	_isBeacon = (typeName _locationName == "OBJECT");

	_friendlyUnits = [];

	if (_isBeacon) then
	{
		_friendlyUnits = _location getVariable ["friendlyUnits", []];
	}
	else // town
	{
		_friendlyUnits = missionNamespace getVariable [format ["%1_friendlyPlayersNames", _locationName], []];
	};
	_friendlyUnits
};




// Start

disableSerialization;

9999 cutText ["", "BLACK"];
sleep 0.1;

createDialog "spawnSelection";
ctrlShow [waste_spawn_BUTTON, false];
ctrlShow [waste_Beacons_Locations_LISTBOX, false];
ctrlShow [waste_Town_Locations_LISTBOX, true];
spawnTypeSelection=0;
_display = (findDisplay waste_spawn_DIALOG);
_handleID = _display displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];


_previousLocations = [""];  // Just so arrays aren't equal in first run
_previousBeacons = [""];
_previousPlayers = [""];


while {dialog} do
{
	_changed = true;

	_locations = [];
	{
		_locationPos = position _x;
		_locationName = text _x;

		_friendlyStatus = [_locationPos, _locationName] call _updateFriendlyStatus;

		//if (_friendlyPlayers > 0) then
		if (true) then
		{
			_locations pushBack [_locationPos, _locationName];
		};
	} forEach (city_locations);

	// TODO Add code for beacons
	_beacons = [];

	_previousName = player getVariable ["waste_spawnName", ""];
	_previousPos = player getVariable ["waste_spawnPos", ""];

	_compare = _previousLocations isEqualTo _locations;
	if (!_compare) then
	{
		lbclear waste_Town_Locations_LISTBOX;
		{
			_locationPos = _x select 0;
			_locationName = _x select 1;
			lbAdd[waste_Town_Locations_LISTBOX, _locationName];
			lbSetData[waste_Town_Locations_LISTBOX, _forEachIndex, str(_locationPos)];
			if ((_locationName == _previousName) && (_locationPos isEqualto _previousPos)) then
			{
				//TODO OverRide onLBSelChanged = "_this call spawn_fnc_townChangeSel;";
				lbSetCurSel[waste_Town_Locations_LISTBOX, _forEachIndex];
				_changed = false;
			};
		} forEach _locations;

		if (count _locations == 0) exitWith
		{
//			ctrlShow [waste_spawn_BUTTON, false];
			// Remove All Town List + Player List
			//if (ctrlEnabled _townsButton) then { _townsButton ctrlEnable false };
		};

	};

	_compare = _previousBeacons isEqualTo _beacons;
	if (!_compare) then
	{
		lbclear waste_Beacons_Locations_LISTBOX;
		if (count _beacons == 0) exitWith
		{
//			ctrlShow [waste_spawn_BUTTON, false];
			// Remove all Beacon List + Player List
			//if (ctrlEnabled _beaconsButton) then { _beaconsButton ctrlEnable false };
		};
	};


	_locationName = player getVariable ["waste_spawnName", ""];
	_players = [_locationName] call _getFriendlyNames;
	if (_changed) then
	{
		// GET Player Info

		lbclear waste_Players_LISTBOX;
		{
			lbAdd[waste_Players_LISTBOX, _x];
		} forEach _players;
		_previousPlayers = _players;
	}
	else
	{
		// Update Player Info
		if (!(_previousPlayers isEqualto _players)) then
		{
			lbclear waste_Players_LISTBOX;
			{
				lbAdd[waste_Players_LISTBOX, _x];
			} forEach _players;
			_previousPlayers = _players;
		};
	};

	//
	_previousBeacons = [] + _beacons;
	_previousLocations = [] + _locations;

	sleep 1;
};

9999 cutText ["", "BLACK IN"];
_display displayRemoveEventHandler ["KeyDown", _handleID];