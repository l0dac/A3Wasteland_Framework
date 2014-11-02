/*
	File: fn_mainSel.sqf
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

_curIndex = (_this select 1);

_dialog = findDisplay waste_storeGeneral_DIALOG;
_dialogPrice = _dialog displayCtrl waste_storeGeneral_ITEM_PRICE;
_dialogDesc = _dialog displayCtrl waste_storeGeneral_ITEM_DESC;

if (_curIndex == -1) then
{
	_dialogPrice ctrlSetText "";
	_dialogDesc ctrlSetStructuredText parseText "";

	ctrlshow[waste_storeVehicles_BUY1X_BUTTON, false];
	ctrlshow[waste_storeVehicles_BUY5X_BUTTON, false];
}
else
{
	_itemName = lbText[waste_storeGeneral_ITEM_LIST, _curIndex];
	_itemData = call compile (lbData[waste_storeGeneral_ITEM_LIST, _curIndex]);

	_shopCfgName = _itemData select 0;
	_itemClassname = _itemData select 1;
	_itemPrice = _itemData select 2;
	_itemDesc = _itemData select 3;
	_itemPic = _itemData select 4;

	_dialogPrice ctrlSetText format ["Price: $%1", [_itemPrice] call BIS_fnc_numberText];
	_dialogDesc ctrlSetStructuredText parseText _itemDesc;
	ctrlSetText [waste_storeGeneral_ITEM_PIC , _itemPic];

	player_store_data = [_shopCfgName, _itemClassname];

	ctrlshow[waste_storeGeneral_BUY1X_BUTTON, true];
	ctrlshow[waste_storeGeneral_BUY5X_BUTTON, true];
};
