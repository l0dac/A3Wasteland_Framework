/*
	File: fn_accSel.sqf
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

_control = _this select 0;
_curIndex = _this select 1;

_dialog = findDisplay waste_storeWeapons_DIALOG;
_dialogPrice = _dialog displayCtrl waste_storeWeapons_ITEM_PRICE;
_dialogDesc = _dialog displayCtrl waste_storeWeapons_ITEM_DESC;

// Should already be visible, just added to be safe
ctrlshow[waste_storeWeapons_BUY1X_BUTTON, true];
ctrlshow[waste_storeWeapons_BUY5X_BUTTON, true];

if (_curIndex == -1) then
{
	_dialogPrice ctrlSetText "Price: $0";
	_dialogDesc ctrlSetStructuredText "";
}
else
{
	_itemName = _control lbText _curIndex;
	_itemData = call compile (_control lbData _curIndex);

	_shopCfgName = _itemData select 0;
	_itemClassname = _itemData select 1;
	_itemPrice = _itemData select 2;
	_itemDesc = _itemData select 3;
	_itemPic = _itemData select 4;

	player_store_data = [_shopCfgName, _itemClassname];

	_dialogPrice ctrlSetText format ["Price: $%1", [_itemPrice] call BIS_fnc_numberText];
	_dialogDesc ctrlSetStructuredText parseText _itemDesc;
	ctrlSetText [waste_storeWeapons_ITEM_PIC , _itemPic];
};