/*
	File: init.sqf
	Author: Declan Ireland

	Description:


	Parameters:

*/


//Disable Saving
enableSaving [false, false];

waitUntil {!isNil "bis_fnc_init"};

[] execVM "R3F_LOG\init.sqf";

[] execVM "init\stores\init.sqf";

[] spawn {
	// COMPILE FINAL BELOW VARIABLES
	city_locations = nearestLocations [(getMarkerPos "center"), ["NameCity","NameCityCapital"], 250000];
	all_locations = nearestLocations [(getMarkerPos "center"), ["NameVillage","NameCity","NameCityCapital"], 250000];
};