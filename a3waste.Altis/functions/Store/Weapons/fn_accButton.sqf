/*
	File: fn_accButton.sqf
	Author: Declan Ireland

	Description:

	Parameters:

*/


#define waste_storeWeapons_DIALOG				2400
#define waste_storeWeapons_MONEY_TEXT   		2401
#define waste_storeWeapons_ITEM_PRICE			2402
#define waste_storeWeapons_ITEM_DESC			2403
#define waste_storeWeapons_ITEM_LIST    		2404
#define waste_storeWeapons_ITEM_AMMO_LIST   	2405
#define waste_storeWeapons_ITEM_POINTER_LIST	2406
#define waste_storeWeapons_ITEM_MUZZLE_LIST 	2407
#define waste_storeWeapons_ITEM_SCOPE_LIST  	2408
#define waste_storeWeapons_ITEM_PIC				2409

#define waste_storeWeapons_AMMO_BUTTON  		2410
#define waste_storeWeapons_POINTER_BUTTON  		2411
#define waste_storeWeapons_MUZZLE_BUTTON   		2412
#define waste_storeWeapons_SCOPE_BUTTON   		2413

disableSerialization;

_accessType = _this select 0;

ctrlshow[waste_storeWeapons_ITEM_AMMO_LIST, false];
ctrlshow[waste_storeWeapons_ITEM_POINTER_LIST, false];
ctrlshow[waste_storeWeapons_ITEM_MUZZLE_LIST, false];
ctrlshow[waste_storeWeapons_ITEM_SCOPE_LIST, false];

switch (_accessType) do
{
	case "ammo":
	{
		ctrlshow[waste_storeWeapons_ITEM_AMMO_LIST, true];
	};
	case "pointer":
	{
		ctrlshow[waste_storeWeapons_ITEM_POINTER_LIST, true];
	};
	case "muzzle":
	{
		ctrlshow[waste_storeWeapons_ITEM_MUZZLE_LIST, true];
	};
	case "scope":
	{
		ctrlshow[waste_storeWeapons_ITEM_SCOPE_LIST, true];
	};
};
