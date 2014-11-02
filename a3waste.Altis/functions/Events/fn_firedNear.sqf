/*
	File: fn_firedNear.sqf
	Author: Declan Ireland

	Description:

	Parameters:

*/


if (isDedicated) exitWith {};

/*
	unit: Object - Object the event handler is assigned to
	firer: Object - Object which fires a weapon near the unit
	distance: Number - Distance in meters between the unit and firer (max. distance ~69m)
	weapon: String - Fired weapon
	muzzle: String - Muzzle that was used
	mode: String - Current mode of the fired weapon
	ammo: String - Ammo used
*/