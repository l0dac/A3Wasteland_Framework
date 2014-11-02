/*
	File: fn_createDialog.sqf
	Author: Declan Ireland

	Description:

	Parameters:

*/


#define waste_storeGeneral_DIALOG 		2200
#define waste_storeGeneral_MONEY_TEXT   2201
#define waste_storeGeneral_ITEM_PRICE	2202
#define waste_storeGeneral_ITEM_DESC	2203
#define waste_storeGeneral_ITEM_LIST    2204
#define waste_storeGeneral_ITEM_PIC		2205

#define waste_storeGeneral_BUY1X_BUTTON 2206
#define waste_storeGeneral_BUY5X_BUTTON 2207

disableSerialization;

createDialog "storeGeneral";
_dialog = findDisplay waste_storeGeneral_DIALOG;
_handleID = _dialog displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];

_playerMoney = _dialog displayCtrl waste_storeGeneral_MONEY_TEXT;
_playerMoney ctrlSetText format["Cash: $%1", [player getVariable ["cmoney", 0]] call BIS_fnc_numberText];

ctrlshow[waste_storeGeneral_BUY1X_BUTTON, false];
ctrlshow[waste_storeGeneral_BUY5X_BUTTON, false];