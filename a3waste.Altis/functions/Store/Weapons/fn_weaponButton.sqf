/*
	File: fn_weaponButton.sqf
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

_shopCfgName = _this select 0;

_dialog = findDisplay waste_storeWeapons_DIALOG;
_handleID = _dialog displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];

_dialog_itemList = _dialog displayCtrl waste_storeWeapons_ITEM_LIST;
_dialog_itemPrice = _dialog displayCtrl waste_storeWeapons_ITEM_PRICE;
_dialog_itemDesc = _dialog displayCtrl waste_storeWeapons_ITEM_DESC;

//Clear the lists
lbClear _dialog_itemList;
_dialog_itemList2 = _dialog displayCtrl waste_storeWeapons_ITEM_LIST2;
lbClear _dialog_itemList2;
_dialog_itemList3 = _dialog displayCtrl waste_storeWeapons_ITEM_LIST3;
lbClear _dialog_itemList3;

_dialog_itemList lbSetCurSel -1;
_dialog_itemPrice ctrlSetText "";
_dialog_itemDesc ctrlSetText "";

_itemClassArray = missionNamespace getvariable [format ["StoreCfg_%1_itemClassName", _shopCfgName], []];
_itemPriceArray = missionNamespace getvariable [format ["StoreCfg_%1_itemPrice", _shopCfgName], []];
_itemNameArray  = missionNamespace getvariable [format ["StoreCfg_%1_itemName", _shopCfgName], []];
_itemDescArray  = missionNamespace getvariable [format ["StoreCfg_%1_itemDesc", _shopCfgName], []];
_itemPicArray   = missionNamespace getvariable [format ["StoreCfg_%1_itemPic", _shopCfgName], []];


// Hide Crap
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

ctrlSetText [waste_storeWeapons_ITEM_PIC , ""];

{
	_skip = false;
	if (!(playerSide in [BLUFOR,OPFOR])) then
	{
		if (_x == "warchest") then
		{
			_skip = true;
		};
	};

	if (!_skip) then
	{
		_itemClass = _x;
		_itemPrice = _itemPriceArray select _forEachIndex;
		_itemName = _itemNameArray select _forEachIndex;
		_itemDesc = _itemDescArray select _forEachIndex;
		_itemPic = _itemPicArray select _forEachIndex;

		_index = _dialog_itemList lbAdd format ["%1", _itemName];

		if ((_itemPic == "pictureStaticObject") || (_itemPic == "picturething")) then
		{
			_itemPic = "";
		};

		_data = str([_shopCfgName, _itemClass, _itemPrice, _itemDesc, _itemPic]);
		_dialog_itemList lbSetData [_index, _data];
	};
} forEach _itemClassArray;