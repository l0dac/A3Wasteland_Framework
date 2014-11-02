/*
	File: fn_vehicleSel.sqf
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

_curIndex = (_this select 1);

_dialog = findDisplay waste_storeVehicles_DIALOG;
_dialogPrice = _dialog displayCtrl waste_storeVehicles_ITEM_PRICE;
_dialogDesc = _dialog displayCtrl waste_storeVehicles_ITEM_DESC;

if (_curIndex == -1) then
{
	// Hide Crap

	_dialogPrice ctrlSetText "";
	_dialogDesc ctrlSetStructuredText parseText "";

	ctrlshow[waste_storeVehicles_BUY1X_BUTTON, false];
	ctrlshow[waste_storeVehicles_BUY5X_BUTTON, false];
}
else
{
	_itemName = lbText[waste_storeVehicles_ITEM_LIST, _curIndex];
	_itemData = call compile (lbData[waste_storeVehicles_ITEM_LIST, _curIndex]);

	_shopCfgName = _itemData select 0;
	_itemClassname = _itemData select 1;
	_itemPrice = _itemData select 2;
	_itemDesc = _itemData select 3;
	_itemPic = _itemData select 4;

	_dialogPrice ctrlSetText format ["Price: $%1", [_itemPrice] call BIS_fnc_numberText];
	_dialogDesc ctrlSetStructuredText parseText _itemName;
	ctrlSetText [waste_storeVehicles_ITEM_PIC , _itemPic];

	player_store_data = [_shopCfgName, _itemClassname];

	ctrlshow[waste_storeVehicles_BUY1X_BUTTON, true];
	ctrlshow[waste_storeVehicles_BUY5X_BUTTON, true];
};