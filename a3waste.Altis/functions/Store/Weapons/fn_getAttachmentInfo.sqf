/*
	File: fn_getAttachmentInfo.sqf
	Author: Declan Ireland

	Description:

	Parameters:

*/


_weaponClassname = _this select 0;
_weaponSlotType = _this select 1; // MuzzleSlot / CowsSlot / PointerSlot

_classnames = [];
_names = [];
_desc = [];
_pics = [];

_weaponSlotConfig = (configFile >> "CfgWeapons" >> _weaponClassname >> "WeaponSlotsInfo");

_weaponSlotsArray = (getArray (_weaponSlotConfig >> _weaponSlotType >> "compatibleitems"));

{
	_displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
	_displayDesc = getText(configFile >> "CfgWeapons" >> _x >> "descriptionShort");
	_displayPic = getText (configFile >> "CfgWeapons" >> _x >> "picture");

	_classnames pushBack _x;
	_names pushBack _displayName;
	_desc pushBack _displayDesc;
	_pics pushBack _displayPic;
} forEach _weaponSlotsArray;


[_classnames, _names, _desc, _pics]