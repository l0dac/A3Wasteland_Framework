/*
	File: fn_vehicleButton.sqf
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

_shopCfgName = _this select 0;

_dialog = findDisplay waste_storeVehicles_DIALOG;

_dialog_itemList = _dialog displayCtrl waste_storeVehicles_ITEM_LIST;
_dialog_itemPrice = _dialog displayCtrl waste_storeVehicles_ITEM_PRICE;
_dialog_itemDesc = _dialog displayCtrl waste_storeVehicles_ITEM_DESC;

//Clear the list
lbClear _dialog_itemList;
_dialog_itemList lbSetCurSel -1;
_dialog_itemPrice ctrlSetText "";
_dialog_itemDesc ctrlSetText "";

ctrlshow[waste_storeWeapons_BUY1X_BUTTON, false];
ctrlshow[waste_storeWeapons_BUY5X_BUTTON, false];

_itemClassArray = missionNamespace getvariable [format ["StoreCfg_%1_itemClassName", _shopCfgName], []];
_itemPriceArray = missionNamespace getvariable [format ["StoreCfg_%1_itemPrice", _shopCfgName], []];
_itemNameArray  = missionNamespace getvariable [format ["StoreCfg_%1_itemName", _shopCfgName], []];
_itemDescArray  = missionNamespace getvariable [format ["StoreCfg_%1_itemDesc", _shopCfgName], []];
_itemPicArray   = missionNamespace getvariable [format ["StoreCfg_%1_itemPic", _shopCfgName], []];


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
		if ((_itemPic != "") && (_itemPic != "pictureStaticObject") && (_itemPic != "picturething")) then
		{
			_dialog_itemList lbSetPicture [_index, _itemPic];
		};

		_data = str([_shopCfgName, _itemClass, _itemPrice, _itemDesc, _itemPic]);
		_dialog_itemList lbSetData [_index, _data];
	};
} forEach _itemClassArray;