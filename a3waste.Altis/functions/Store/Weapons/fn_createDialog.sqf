/*
	File: fn_createDialog.sqf
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
#define waste_storeWeapons_BUY1X_BUTTON			2414
#define waste_storeWeapons_BUY5X_BUTTON			2415

disableSerialization;

createDialog "storeWeapons";
_dialog = findDisplay waste_storeWeapons_DIALOG;
_handleID = _dialog displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];

ctrlshow[waste_storeWeapons_ITEM_AMMO_LIST, false];
ctrlshow[waste_storeWeapons_ITEM_POINTER_LIST, false];
ctrlshow[waste_storeWeapons_ITEM_MUZZLE_LIST, false];
ctrlshow[waste_storeWeapons_ITEM_SCOPE_LIST, false];

ctrlshow[waste_storeWeapons_AMMO_BUTTON, false];
ctrlshow[waste_storeWeapons_POINTER_BUTTON, false];
ctrlshow[waste_storeWeapons_MUZZLE_BUTTON, false];
ctrlshow[waste_storeWeapons_SCOPE_BUTTON, false];

ctrlshow[waste_storeWeapons_BUY1X_BUTTON, false];
ctrlshow[waste_storeWeapons_BUY5X_BUTTON, false];

_playerMoney = _dialog displayCtrl waste_storeWeapons_MONEY_TEXT;
_playerMoney ctrlSetText format["Cash: $%1", [player getVariable ["cmoney", 0]] call BIS_fnc_numberText];
