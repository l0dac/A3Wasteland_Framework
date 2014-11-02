/*
	File: fn_updateZones.sqf
	Author:

	Description:
		Checks Zone Counters, updates Marker Color depending on who is winning / tied
			Code is called from server.fsm

	Parameters:

*/

private ["_east_numbers", "_west_numbers", "_guer_numbers"];

{
	_east_numbers = (zone_counters select _forEachIndex) select 0;
	_west_numbers = (zone_counters select _forEachIndex) select 1;
	_guer_numbers = (zone_counters select _forEachIndex) select 2;

	if (_east_numbers > _west_numbers) then
	{
		if (_east_numbers > _guer_numbers) then
		{
			// EAST is Winnning
			_x setMarkerColor "ColorRed";
			(store_markers select _forEachIndex) setMarkerColor "ColorRed";
		}
		else
		{
			if (_east_numbers == _guer_numbers) then
			{
				// EAST && Guer Winning
				_x setMarkerColor "ColorBrown";
				(store_markers select _forEachIndex) setMarkerColor "ColorBrown";
			}
			else
			{
				// Guer is Winning
				_x setMarkerColor "ColorGreen";
				(store_markers select _forEachIndex) setMarkerColor "ColorGreen";
			}
		}
	}
	else
	{
		if (_west_numbers > _guer_numbers) then
		{
			// West Winning
			_x setMarkerColor "ColorBlue";
			(store_markers select _forEachIndex) setMarkerColor "ColorBlue";
		}
		else
		{
			if (_east_numbers ==  _west_numbers ) then
			{
				if (_east_numbers > _guer_numbers) then
				{
					// EAST && West Winning
					_x setMarkerColor "ColorPink";
					(store_markers select _forEachIndex) setMarkerColor "ColorPink";
				}
				else
				{
					if (_east_numbers == _guer_numbers) then
					{
						// EAST && West & Guer Winning
						_x setMarkerColor "ColorBlack";
						(store_markers select _forEachIndex) setMarkerColor "ColorBlack";
					}
				}
			}
			else
			{
				if (_west_numbers == _guer_numbers) then
				{
					// West && Guer  Winning
					_x setMarkerColor "ColorYellow";
					(store_markers select _forEachIndex) setMarkerColor "ColorYellow";
				}
			}
		}
	}
} forEach zone_markers;