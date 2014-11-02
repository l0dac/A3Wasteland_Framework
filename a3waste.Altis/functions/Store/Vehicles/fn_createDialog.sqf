/*
	File: fn_createDialog.sqf
	Author: Declan Ireland

	Description:

	Parameters:

*/


#define waste_storeVehicles_DIALOG			2300
#define waste_storeVehicles_MONEY_TEXT 	 	2301
#define waste_storeVehicles_ITEM_PRICE		2302
#define waste_storeVehicles_ITEM_DESC		2303
#define waste_storeVehicles_ITEM_LIST   	2304
#define waste_storeVehicles_ITEM_PIC		2305
#define waste_storeVehicles_ITEM_HS_LIST	2306

#define waste_storeVehicles_BUY1X_BUTTON	2307
#define waste_storeVehicles_BUY5X_BUTTON	2308

disableSerialization;

createDialog "storeVehicles";
_dialog = findDisplay waste_storeVehicles_DIALOG;
_handleID = _dialog displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];

_playerMoney = _dialog displayCtrl waste_storeVehicles_MONEY_TEXT;
_playerMoney ctrlSetText format["Cash: $%1", [player getVariable ["cmoney", 0]] call BIS_fnc_numberText];


ctrlshow[waste_storeVehicles_BUY1X_BUTTON, false];
ctrlshow[waste_storeVehicles_BUY5X_BUTTON, false];